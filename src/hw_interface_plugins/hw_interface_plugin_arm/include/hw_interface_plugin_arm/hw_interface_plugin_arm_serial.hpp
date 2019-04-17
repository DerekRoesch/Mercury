#ifndef HW_INTERFACE_PLUGIN_arm_HPP__
#define HW_INTERFACE_PLUGIN_arm_HPP__

//always inlclude these
#include <ros/ros.h>
#include <pluginlib/class_list_macros.h>
#include <hw_interface/base_interface.hpp>

//include the header of the base type you want, Serial or UDP
#include <hw_interface/base_serial_interface.hpp>

#include <hw_interface_plugin_agent/LOS.h>
#include <hw_interface_plugin_arm/armPosition.h>

#include <boost/thread/mutex.hpp>


namespace hw_interface_plugin_arm {

    inline static uint8_t calcChecksum(uint8_t* data, std::size_t length)
    {
        uint8_t ret = 0;
        for(size_t i = 0; i < length; i++)
        {
            ret+=data[i];
        }
        return ~ret;
    }

    class const_shared_buf_arm : public hw_interface_support_types::shared_const_buffer
    {
    public :
        const_shared_buf_arm(const hw_interface_plugin_arm::armPosition &msg, uint8_t LOS, uint8_t counter)
        {
            init(msg, LOS, counter);
        }

    private:
        void init(const hw_interface_plugin_arm::armPosition &msg, uint8_t LOS, uint8_t counter)
        {
            //ROS_INFO("vector size %lu", msg.pos.size());
            data_.reset(new std::vector<char>());
            data_->push_back('A');
            data_->push_back('z');
            data_->push_back(counter);
            data_->insert(data_->end(), msg.pos.begin(), msg.pos.end());
            data_->push_back(LOS);
            data_->push_back(calcChecksum((uint8_t*)data_->data(), data_->size()));
           // ROS_INFO("Msg size %lu", data_->size());
            data_->shrink_to_fit();
            //ROS_INFO("Msg size shrink %lu", data_->size());
            buffer_.reset(new boost::asio::const_buffer(boost::asio::buffer(*data_)));
        }
    };

    class arm_serial : public base_classes::base_serial_interface
    {
    public:
        arm_serial();
        virtual ~arm_serial() {}


    protected:

        //these methods are abstract as defined by the base_Serial_interface
            //they must be defined
        bool subPluginInit(ros::NodeHandlePtr nhPtr);
        void setInterfaceOptions();
        bool interfaceReadHandler(const size_t &bufferSize, int arrayStartPos, const boost::system::error_code &ec);
        bool verifyChecksum();
        bool pluginStart();
        bool pluginStop(){return true;}

        void updateArmTimerCallback(const boost::system::error_code& error);

        void positionMsgCallback(const hw_interface_plugin_arm::armPosition::ConstPtr &msg);
        void LOSMsgCallback(const hw_interface_plugin_agent::LOS::ConstPtr &msg);

        ros::Subscriber LOSDataSub;
        ros::Subscriber posDataSub;

        int armTimeout;
        uint8_t counter;

        uint8_t areWeLOS;
        hw_interface_plugin_arm::armPosition lastPos;
        boost::shared_ptr<boost::asio::deadline_timer> updateTimer;

        boost::mutex mtx_;
    };

}

//put the fully qualified type including its namespace here
PLUGINLIB_EXPORT_CLASS(hw_interface_plugin_arm::arm_serial, base_classes::base_interface)



#endif //HW_INTERFACE_PLUGIN_arm_HPP__
