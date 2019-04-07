#ifndef COMMAND_INTERFACE_HPP
#define COMMAND_INTERFACE_HPP
#include <ros/ros.h>
#include "bit_utils.h"
#include <sensor_msgs/Joy.h>
#include <msgs_and_srvs/VirtualBumperParams.h>
#include <msgs_and_srvs/DriveCommands.h>
#include <msgs_and_srvs/WebcamCommands.h>
#include <hw_interface_plugin_arm/armPosition.h>
#include <hw_interface_plugin_agent/LOS.h>
#include <msgs_and_srvs/ArmManualMode.h>

#define ARM_LEFT_RAISED 0
#define ARM_RIGHT_RAISED 138
#define ARM_LEFT_LOWERED 202
#define ARM_RIGHT_LOWERED 240
#define ARM_LEFT_DEPOSIT 0
#define ARM_RIGHT_DEPOSIT 50

#define ARM_CLAW_OPEN 138
#define ARM_CLAW_CLOSED 250

#define ARM_WRIST_STRAIGHT 82
#define ARM_WRIST_DEPOSIT 138

#define ARM_MANUAL_INCREMENT 5

enum ARM_JOINTS_T {_left, _right, _claw, _wrist};

class CommandInterface
{
public:
    // Members
    ros::NodeHandle nh;
    ros::Publisher virtualBumperParamsPub;
    ros::Publisher driveCommandsPub;
    ros::Publisher armPub;
    ros::Publisher webcamPub;
    ros::Publisher armManualModePub;
    ros::Subscriber joystickSub;
    ros::Subscriber driverStationIPSub;
    ros::Subscriber losSub;
    msgs_and_srvs::VirtualBumperParams virtualBumperParams;
    msgs_and_srvs::DriveCommands driveCommands;
    msgs_and_srvs::WebcamCommands webcamCommands;
    hw_interface_plugin_arm::armPosition armPositionCommands;
    msgs_and_srvs::ArmManualMode armManualModeMsg;
    sensor_msgs::Joy joystickData;
    Toggle allStopToggle;
    Toggle virtualBumperActiveToggle;
    Leading_Edge_Latch armManualJointSelectLatch;
    ARM_JOINTS_T armSelectedManualJoint;
    Toggle armClawToggle;
    Toggle webcamToggle;
    uint8_t armJointOffsets[4];
    Toggle manualArmModeToggle;
    bool LOS;
    const float rate = 20.0;
    const float virtualBumperIncrementSize = 0.01; // m
    const float springConstantIncrementSize = 0.1;
    // Methods
    CommandInterface();
    void run();
    void joystickCallback(const sensor_msgs::Joy::ConstPtr& msg);
    void driverStationIPCallback(const msgs_and_srvs::WebcamCommands::ConstPtr& msg);
    void losCallback(const hw_interface_plugin_agent::LOS::ConstPtr& msg);
};

#endif // COMMAND_INTERFACE_HPP
