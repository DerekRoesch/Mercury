#include <hw_interface_plugin_arm/hw_interface_plugin_arm_serial.hpp>

//class constructor, do required instatiation only here
    //do not setup other things as they my not have been setup by the parent classes yet
hw_interface_plugin_arm::arm_serial::arm_serial()
{
    //A debug message
    ROS_INFO("A Wild arm Plugin Appeared!");

    //force the ROS Console level to Debug Level
    if( ros::console::set_logger_level(ROSCONSOLE_DEFAULT_NAME, ros::console::levels::Debug) ) {
           ros::console::notifyLoggerLevelsChanged();
        }

    //enable automatic class metric collection.
    enableMetrics();
    armTimeout = 20;
    lastPos.pos.at(0) = 0;
    lastPos.pos.at(1) = 138;
    lastPos.pos.at(2) = 138;
    lastPos.pos.at(3) = 106;
    lastPos.pos.at(4) = 0;
    counter=0;
}

//this is called each time the plugin is enabled, before anything else of the plugin is called
bool hw_interface_plugin_arm::arm_serial::subPluginInit(ros::NodeHandlePtr nhPtr)
{
    ROS_DEBUG_EXTRA("%s Plugin Init", pluginName.c_str());

    /*for Serial interfaces, 'deviceName' is an inherited member and must be defined.
        failing to define this variable will disable the plugin.
        opening of the device port is handled automatically */

    const unsigned char head[] = {0xa5,0xa5,0x00};
    headerString = std::string((const char *)head);


    deviceName = "";
    ros::param::get(pluginName+"/deviceName", deviceName);

    //retrieve string from the ROS Parameter Server
        //of the format '<plugin_name>/<parameter>
    std::string tempString = "";

    //place that wants to write data to the device
    if(ros::param::get(pluginName+"/subscribeToLOSTopic", tempString))
    {
        LOSDataSub = nhPtr->subscribe(tempString, 1, &arm_serial::LOSMsgCallback, this);
    }
    else
    {
        ROS_ERROR("%s:: Could not find LOS topic subscription name", pluginName.c_str());
    }
    if(ros::param::get(pluginName+"/subscribeToPosTopic", tempString))
    {
        posDataSub = nhPtr->subscribe(tempString, 1, &arm_serial::positionMsgCallback, this);
    }
    else
    {
        ROS_ERROR("%s:: Could not find pos topic subscription name", pluginName.c_str());
    }

    //place to publish the data after reading from device
    if(ros::param::get(pluginName+"/publishToTopic", tempString))
    {
        //rosDataPub = nhPtr->advertise<hw_interface_plugin_arm::RCM_Range_Info>(tempString, 1, false);
    }
    else
    {
        ROS_ERROR("%s:: Could not find topic advertisment name", pluginName.c_str());
    }

    if(ros::param::get(pluginName+"/armUpdate_ms", armTimeout))
    {
        //rosDataPub = nhPtr->advertise<hw_interface_plugin_arm::RCM_Range_Info>(tempString, 1, false);
    }
    else
    {
        armTimeout = 20;
        ROS_ERROR("%s:: Could not find update rate advertisment name", pluginName.c_str());

    }

    //setupStreamMatcherDelimAndLength(ranging_radio_types::SEND_RANGE_CONFIRM_SIZE,headerString.c_str(),"");

    return true;
}


bool hw_interface_plugin_arm::arm_serial::pluginStart()
{
    updateTimer.reset(new boost::asio::deadline_timer(interfacePort->get_io_service(),
                                                                boost::posix_time::milliseconds(armTimeout)));
    updateTimer->expires_from_now(boost::posix_time::milliseconds(armTimeout));
    updateTimer->async_wait(boost::bind(&hw_interface_plugin_arm::arm_serial::updateArmTimerCallback, this, boost::asio::placeholders::error()));
}

/*this function is called to setup the port
    typical serial port setup uses 115200 baud rate, 8 bit character size, no flow control,
      no parity, 1 stop bit. This is typical, but no all encompassing. Change this if
      the port requires different. */
void hw_interface_plugin_arm::arm_serial::setInterfaceOptions()
{
	int tempBaudRate = 0;
    ros::param::get(pluginName+"/baudrate", tempBaudRate);
    setOption<boost::asio::serial_port_base::baud_rate>(
                new boost::asio::serial_port_base::baud_rate(tempBaudRate));
    //8 bits per character
    setOption<boost::asio::serial_port_base::character_size>(
    			new boost::asio::serial_port_base::character_size( 8 ));

    //flow control
    setOption<boost::asio::serial_port_base::flow_control>(
    			new boost::asio::serial_port_base::flow_control(
    										boost::asio::serial_port_base::flow_control::type::none));

    //parity
    setOption<boost::asio::serial_port_base::parity>(
    			new boost::asio::serial_port_base::parity(
    										boost::asio::serial_port_base::parity::type::none));

    //stop-bits
    setOption<boost::asio::serial_port_base::stop_bits>(
    			new boost::asio::serial_port_base::stop_bits(
    										boost::asio::serial_port_base::stop_bits::type::one));

    ROS_INFO("%s :: Device: %s :: Baudrate %d", pluginName.c_str(), deviceName.c_str(), tempBaudRate);
}

void hw_interface_plugin_arm::arm_serial::positionMsgCallback(const hw_interface_plugin_arm::armPosition::ConstPtr &msg)
{
    ROS_INFO("arm callback");
    boost::lock_guard<boost::mutex> guard(mtx_);
    lastPos = *msg;
}

void hw_interface_plugin_arm::arm_serial::LOSMsgCallback(const hw_interface_plugin_agent::LOS::ConstPtr &msg)
{
    ROS_INFO("LOS callback");
    boost::lock_guard<boost::mutex> guard(mtx_);
    areWeLOS = msg->LOS;
}

void hw_interface_plugin_arm::arm_serial::updateArmTimerCallback(const boost::system::error_code& error)
{
    updateTimer->cancel();
    if(error!=boost::asio::error::operation_aborted)
    {
        boost::lock_guard<boost::mutex> guard(mtx_);
        counter++;
        postInterfaceWriteRequest(const_shared_buf_arm(lastPos,areWeLOS,counter));
    }
    updateTimer->expires_from_now(boost::posix_time::milliseconds(armTimeout));
    updateTimer->async_wait(boost::bind(&hw_interface_plugin_arm::arm_serial::updateArmTimerCallback, this, boost::asio::placeholders::error()));
}

//this is called automatically when data that passes the streamMatcher is okay
    //this function is called with a data length and a position in an inherited array member
        //named 'receivedData'
bool hw_interface_plugin_arm::arm_serial::interfaceReadHandler(const size_t &bufferSize, int arrayStartPos, const boost::system::error_code &ec)
{
    ROS_INFO("arm Plugin Data Handler, %lu, %d", bufferSize, arrayStartPos);

    return true;
}

//automatically called to check the checksum of the packet.
    //If un-wanted/un-needed, return true.
bool hw_interface_plugin_arm::arm_serial::verifyChecksum()
{
    return true;
}
