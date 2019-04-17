#include<command/command_interface.hpp>

CommandInterface::CommandInterface()
{
    virtualBumperParamsPub = nh.advertise<msgs_and_srvs::VirtualBumperParams>("/command/interface/virtualbumperparams", 1);
    driveCommandsPub = nh.advertise<msgs_and_srvs::DriveCommands>("/command/interface/drivecommands", 1);
    armPub = nh.advertise<hw_interface_plugin_arm::armPosition>("/arm/position", 1);
    webcamPub = nh.advertise<msgs_and_srvs::WebcamCommands>("/command/interface/webcam", 1);
    armManualModePub = nh.advertise<msgs_and_srvs::ArmManualMode>("/command/interface/armmanualmode", 1);
    joystickSub = nh.subscribe<sensor_msgs::Joy>("/joy", 1, &CommandInterface::joystickCallback, this);
    driverStationIPSub = nh.subscribe<msgs_and_srvs::WebcamCommands>("/agent/operatorIP", 1, &CommandInterface::driverStationIPCallback, this);
    losSub = nh.subscribe<hw_interface_plugin_agent::LOS>("/agent/LOS", 1, &CommandInterface::losCallback, this);
    virtualBumperParams.radius = 0.24; // m
    allStopToggle.toggle(0);
    driveCommands.allStop = allStopToggle.toggle(1);
    driveCommands.fastMode = false;
    virtualBumperActiveToggle.toggle(0);
    virtualBumperParams.active = virtualBumperActiveToggle.toggle(1);
    virtualBumperParams.springConstant = 2.0;
    webcamToggle.toggle(0);
    webcamCommands.start = false;
    armPositionCommands.pos[_left] = ARM_LEFT_RAISED;
    armPositionCommands.pos[_right] = ARM_RIGHT_RAISED;
    armPositionCommands.pos[_claw] = ARM_CLAW_OPEN;
    armPositionCommands.pos[_wrist] = ARM_WRIST_STRAIGHT;
    armPositionCommands.pos[4] = 0;
    armJointOffsets[_left] = 0;
    armJointOffsets[_right] = 0;
    armJointOffsets[_claw] = 0;
    armJointOffsets[_wrist] = 0;
    armManualJointSelectLatch.LE_Latch(0);
    manualArmModeToggle.toggle(0);
    armManualModeMsg.manualMode = false;
    armManualModeMsg.selectedJoint = "left";
    LOS = true;
}

void CommandInterface::run()
{
    driveCommands.allStop = allStopToggle.get_val() || LOS;
    virtualBumperParamsPub.publish(virtualBumperParams);
    driveCommandsPub.publish(driveCommands);
    armPub.publish(armPositionCommands);
    webcamPub.publish(webcamCommands);
    armManualModePub.publish(armManualModeMsg);
}

void CommandInterface::joystickCallback(const sensor_msgs::Joy::ConstPtr &msg)
{
    allStopToggle.toggle(msg->buttons.at(0));
    if(msg->buttons.at(5)) driveCommands.fastMode = true;
    else driveCommands.fastMode = false;
    virtualBumperParams.active = virtualBumperActiveToggle.toggle(msg->buttons.at(6));
    if(msg->axes.at(7)!=0.0)
    {
        virtualBumperParams.radius += virtualBumperIncrementSize*msg->axes.at(7);
        if(virtualBumperParams.radius<0.0) virtualBumperParams.radius = 0.0;
        else if(virtualBumperParams.radius>1.0) virtualBumperParams.radius = 1.0;
    }
    if(msg->axes.at(6)!=0.0)
    {
        virtualBumperParams.springConstant -= springConstantIncrementSize*msg->axes.at(6);
        if(virtualBumperParams.springConstant<0.0) virtualBumperParams.springConstant = 0.0;
        else if(virtualBumperParams.springConstant>50.0) virtualBumperParams.springConstant = 50.0;
    }
    if(manualArmModeToggle.toggle(msg->buttons.at(7)))
    {
        armManualModeMsg.manualMode = true;
        if(armManualJointSelectLatch.LE_Latch(msg->buttons.at(1)))
        {
            armSelectedManualJoint = static_cast<ARM_JOINTS_T>(static_cast<int>(armSelectedManualJoint) + 1);
            if(armSelectedManualJoint > (ARM_JOINTS_T)3) armSelectedManualJoint = (ARM_JOINTS_T)0;
        }
        if(msg->buttons.at(2))
        {
            if((int)armPositionCommands.pos[armSelectedManualJoint]+ARM_MANUAL_INCREMENT>255) armPositionCommands.pos[armSelectedManualJoint] = 255;
            else armPositionCommands.pos[armSelectedManualJoint]+=ARM_MANUAL_INCREMENT;
        }
        if(msg->buttons.at(3))
        {
            if((int)armPositionCommands.pos[armSelectedManualJoint]-ARM_MANUAL_INCREMENT<0) armPositionCommands.pos[armSelectedManualJoint] = 0;
            else armPositionCommands.pos[armSelectedManualJoint]-=ARM_MANUAL_INCREMENT;
        }
    }
    else
    {
        armManualModeMsg.manualMode = false;
        armSelectedManualJoint = _left;
        if(msg->buttons.at(2))
        {
            armPositionCommands.pos[_left] = ARM_LEFT_LOWERED;
            armPositionCommands.pos[_right] = ARM_RIGHT_LOWERED;
            armPositionCommands.pos[_wrist] = ARM_WRIST_STRAIGHT;
        }
        if(msg->buttons.at(3))
        {
            armPositionCommands.pos[_left] = ARM_LEFT_RAISED;
            armPositionCommands.pos[_right] = ARM_RIGHT_RAISED;
            armPositionCommands.pos[_wrist] = ARM_WRIST_STRAIGHT;
        }
        if(msg->buttons.at(1))
        {
            armPositionCommands.pos[_left] = ARM_LEFT_DEPOSIT;
            armPositionCommands.pos[_right] = ARM_RIGHT_DEPOSIT;
            armPositionCommands.pos[_wrist] = ARM_WRIST_DEPOSIT;
        }
        if(armClawToggle.toggle(msg->axes.at(5)<-0.5))
        {
            armPositionCommands.pos[_claw] = ARM_CLAW_CLOSED;
        }
        else
        {
            armPositionCommands.pos[_claw] = ARM_CLAW_OPEN;
        }
    }
    if(webcamToggle.toggle(msg->buttons.at(4)) && !LOS)
    {
        webcamCommands.start = true;
    }
    else
    {
        webcamCommands.start = false;
    }
    switch(armSelectedManualJoint)
    {
    case _left:
        armManualModeMsg.selectedJoint = "left";
        break;
    case _right:
        armManualModeMsg.selectedJoint = "right";
        break;
    case _claw:
        armManualModeMsg.selectedJoint = "claw";
        break;
    case _wrist:
        armManualModeMsg.selectedJoint = "wrist";
        break;
    default:
        armManualModeMsg.selectedJoint = "unknown!";
        break;
    }
}

void CommandInterface::driverStationIPCallback(const msgs_and_srvs::WebcamCommands::ConstPtr &msg)
{
    webcamCommands.serverAddress = msg->serverAddress;
    webcamCommands.serverPort = msg->serverPort;
}

void CommandInterface::losCallback(const hw_interface_plugin_agent::LOS::ConstPtr &msg)
{
    LOS = msg->LOS;
}
