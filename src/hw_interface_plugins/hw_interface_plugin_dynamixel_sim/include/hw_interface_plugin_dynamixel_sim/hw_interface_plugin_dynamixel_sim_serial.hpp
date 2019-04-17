#ifndef HW_INTERFACE_PLUGIN_EXAMPLE_HPP__
#define HW_INTERFACE_PLUGIN_EXAMPLE_HPP__

//always inlclude these
#include <ros/ros.h>
#include <pluginlib/class_list_macros.h>
#include <hw_interface/base_interface.hpp>
#include <hw_interface/base_serial_interface.hpp>


#include <boost/bind.hpp>
#include <boost/thread/mutex.hpp>
#include <queue>

#include <hw_interface_plugins/hw_interface_plugin_dynamixel/include/hw_interface_plugin_dynamixel/dynamixel_forwards.hpp>

#include "std_msgs/String.h"

#define RESPONSE_TIMEOUT_MILLI 500

#define INIT_READ_SIZE 8


namespace hw_interface_plugin_dynamixel_sim {


    enum interfaceState_t {DISCOVERY, EXECUTION, ARBITRATION_LOSS} ;


    class dynamixel_serial_sim : public base_classes::base_serial_interface
    {
        public:

            dynamixel_serial_sim();
            ~dynamixel_serial_sim() {
                //may need destructors for held pointers
//                for(std::size_t i = 0; i < servoDirectory.size(); i++)
//                {

//                }
            }

            interfaceState_t getInterfaceState() { return currentState; }

        protected:

            //these methods are abstract as defined by the base_serial_interface
                //they must be defined
            bool subPluginInit(ros::NodeHandlePtr nhPtr);
            void setInterfaceOptions();
            bool interfaceReadHandler(const size_t &length, int arrayStartPos, const boost::system::error_code &ec);
            bool verifyChecksum();

            bool pluginStart();
            bool pluginStop();

            std::size_t dynamixelStreamMatcher(const boost::system::error_code &error, long totalBytesInBuffer,
                                               const char *header, int headerLength);



    };

}

//put the fully qualified type including its namespace here
//for more info: http://wiki.ros.org/pluginlib#pluginlib.2BAC8-pluginlib_groovy.Registering.2BAC8-Exporting_a_Plugin
PLUGINLIB_EXPORT_CLASS(hw_interface_plugin_dynamixel_sim::dynamixel_serial_sim, base_classes::base_interface)



#endif //HW_INTERFACE_PLUGIN_EXAMPLE_HPP__

