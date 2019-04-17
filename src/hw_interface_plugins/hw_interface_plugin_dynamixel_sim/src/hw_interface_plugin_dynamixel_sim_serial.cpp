#include <hw_interface_plugin_dynamixel_sim/hw_interface_plugin_dynamixel_sim_serial.hpp>

int shit = 5;
hw_interface_plugin_dynamixel_sim::dynamixel_serial_sim::dynamixel_serial_sim()
{
    //A debug message
    ROS_INFO("val ptr %p", &shit);
    ROS_INFO_EXTRA_NAME("A Wild Dynamixel Plugin Appeared!%s"," ");

    //force the ROS Console level to Debug Level
    if( ros::console::set_logger_level(ROSCONSOLE_DEFAULT_NAME, ros::console::levels::Info) ) {
           ros::console::notifyLoggerLevelsChanged();
        }

    //enable automatic class metric collection.
    enableMetrics();

}



bool hw_interface_plugin_dynamixel_sim::dynamixel_serial_sim::subPluginInit(ros::NodeHandlePtr nhPtr)
{
    ROS_DEBUG_EXTRA_NAME("%s Plugin Init", pluginName.c_str());

    /*for Serial interfaces, 'deviceName' is an inherited member and must be defined.
        failing to define this variable will disable the plugin.
        opening of the device port is handled automatically */

    deviceName = "";
    ros::param::get(pluginName+"/deviceName", deviceName);

    //retrieve string from the ROS Parameter Server
        //of the format '<plugin_name>/<parameter>

    //the char buffer which contains the header must be valid for every call of the stream matcher
        //so we store the header string in the inherited member and its guarenteed to be valid until
        //destruction
    headerString = std::string({(char)0xff,(char)0xff,(char)0xfd,(char)0x00});

    //bind a functor to the streamCompletionChecker inherited member
    streamCompletionChecker = boost::bind(&hw_interface_plugin_dynamixel_sim::dynamixel_serial_sim::dynamixelStreamMatcher,
                                            this, _1, _2, headerString.c_str(), 3);
    //enable the completion functor if the bind succeeded
    enableCompletionFunctor = !streamCompletionChecker.empty();


    return true;
}

void hw_interface_plugin_dynamixel_sim::dynamixel_serial_sim::setInterfaceOptions()
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

    ROS_INFO_EXTRA_NAME("%s :: Device: %s :: Baudrate %d", pluginName.c_str(), deviceName.c_str(), tempBaudRate);
}

bool hw_interface_plugin_dynamixel_sim::dynamixel_serial_sim::interfaceReadHandler(const size_t &length, int arrayStartPos,
                                                                                const boost::system::error_code &ec)
{
    bool ret = false;
    //cancel the timeout

    ROS_DEBUG_EXTRA_NAME("Cancelling pending timers %lu",servoResponseTimer->cancel());



    return ret;
}

bool hw_interface_plugin_dynamixel_sim::dynamixel_serial_sim::verifyChecksum()
{
    return true;
}

bool hw_interface_plugin_dynamixel_sim::dynamixel_serial_sim::pluginStart()
{

    return true;
}

bool hw_interface_plugin_dynamixel_sim::dynamixel_serial_sim::pluginStop()
{
    return true;
}



std::size_t hw_interface_plugin_dynamixel_sim::dynamixel_serial_sim::dynamixelStreamMatcher(
                        const boost::system::error_code &error, long totalBytesInBuffer,
                        const char *header, int headerLength)
{
    ROS_DEBUG_EXTRA_NAME("Entered Stream Matcher %ld",totalBytesInBuffer);
    long headerCounter=0;
    dataArrayStart=0;
    if(error != boost::asio::error::operation_aborted)
    {
        if(totalBytesInBuffer < 4)
        {
            ROS_DEBUG_EXTRA_NAME("Returning Early, %ld", 4-totalBytesInBuffer);
            return 4-totalBytesInBuffer;
        }
        for(long i = 0; i<totalBytesInBuffer; i++)
        {
            if(headerCounter!=2) //change this
            {
                if((receivedData[i]&0xff) == (header[headerCounter]&0xff))
                {
                    headerCounter++;
                    if(headerCounter==2) //change this
                    {
                        dataArrayStart= i - (2 - 1); // change 2 to headerLength
                        ROS_DEBUG_EXTRA_NAME("Continuing %ld", i);
                        continue;
                    }
                }
                else
                {
                    ROS_DEBUG_EXTRA_NAME("Didn't match header %ld", i);
                    headerCounter=0;
                }
            }
            else
            {
                if((totalBytesInBuffer - dataArrayStart) >= 4) //if we have enough data to get length
                {
                    ROS_DEBUG_EXTRA_NAME("Returning , %ld , %d , %u , %ld", totalBytesInBuffer, dataArrayStart, receivedData[dataArrayStart+3], (totalBytesInBuffer - dataArrayStart - receivedData[dataArrayStart+3] - 4));
                    return (dataArrayStart + receivedData[dataArrayStart+3] + 4 - totalBytesInBuffer);
                }
                else
                {
                    //ROS_DEBUG_EXTRA_NAME("Not Enough Data, Returning , %ld , %d , %ld", totalBytesInBuffer, dataArrayStart, (totalBytesInBuffer-dataArrayStart));
                    return 2;
                }
            }
        }
        ROS_WARN_EXTRA_NAME("Stream Matching Fell Through! Read Length = %ld", totalBytesInBuffer);
        for(long i = 0; i < totalBytesInBuffer; i++)
        {
            std::printf("%x %c || ",receivedData[i],receivedData[i]);
        }
        std::printf("\r\n");
        return 2;
    }
    else
    {
        ROS_DEBUG_EXTRA_NAME("Stream Matching Op Aborted.%s"," ");
        return 0; //operation aborted
    }
}
