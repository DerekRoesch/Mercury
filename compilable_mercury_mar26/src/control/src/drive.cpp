#include <control/drive.hpp>

Drive::Drive()
    : motorGeometryDistance{0.1574,0.1581,0.1581,0.1574} /* m */,
      motorGeometryAngle{43.84,135.9,-135.9,-43.84}, /* deg */
      servoTurnAngleLimits{{-121.0,61.0},{119.0,301.0},{59.0,241.0},{-61.0,121.0}} /* deg */
{
    servoCmdPub = nh.advertise<hw_interface_plugin_dynamixel::groupServoUpdate>("/servo/updateGroupRequest",1);
    joystickSub = nh.subscribe<sensor_msgs::Joy>("/joy",1,&Drive::joystickCallback,this);
    virtualBumperParamsSub = nh.subscribe<msgs_and_srvs::VirtualBumperParams>("/command/interface/virtualbumperparams",1,&Drive::virtualBumperParamsCallback,this);
    virtualBumperStatusSub = nh.subscribe<msgs_and_srvs::VirtualBumperStatus>("/lidar/lidar/virtualbumperstatus",1,&Drive::virtualBumperStatusCallback,this);
    driveCommandsSub = nh.subscribe<msgs_and_srvs::DriveCommands>("/command/interface/drivecommands", 1, &Drive::driveCommandsCallback, this);
    servoFeedbackSubFLTurn = nh.subscribe<hw_interface_plugin_dynamixel::servoStateResponse>("/servo/state/2",1,&Drive::servoFeedbackCallbackFLTurn,this);
    servoFeedbackSubBLTurn = nh.subscribe<hw_interface_plugin_dynamixel::servoStateResponse>("/servo/state/3",1,&Drive::servoFeedbackCallbackBLTurn,this);
    servoFeedbackSubBRTurn = nh.subscribe<hw_interface_plugin_dynamixel::servoStateResponse>("/servo/state/4",1,&Drive::servoFeedbackCallbackBRTurn,this);
    servoFeedbackSubFRTurn = nh.subscribe<hw_interface_plugin_dynamixel::servoStateResponse>("/servo/state/1",1,&Drive::servoFeedbackCallbackFRTurn,this);
    servoFeedbackSubFLDrive = nh.subscribe<hw_interface_plugin_dynamixel::servoStateResponse>("/servo/state/6",1,&Drive::servoFeedbackCallbackFLDrive,this);
    servoFeedbackSubBLDrive = nh.subscribe<hw_interface_plugin_dynamixel::servoStateResponse>("/servo/state/7",1,&Drive::servoFeedbackCallbackBLDrive,this);
    servoFeedbackSubBRDrive = nh.subscribe<hw_interface_plugin_dynamixel::servoStateResponse>("/servo/state/8",1,&Drive::servoFeedbackCallbackBRDrive,this);
    servoFeedbackSubFRDrive = nh.subscribe<hw_interface_plugin_dynamixel::servoStateResponse>("/servo/state/5",1,&Drive::servoFeedbackCallbackFRDrive,this);
    fastMode = false;
    A.set_size(8,3);
    b.set_size(8);
    xHat.set_size(3);
    A_pseudoInverse.set_size(3,8);
    for(int i=0; i<4; i++)
    {
        motorGeometryProjectionX[i] = motorGeometryDistance[i]*cos(DEG2RAD*motorGeometryAngle[i]);
        motorGeometryProjectionY[i] = motorGeometryDistance[i]*sin(DEG2RAD*motorGeometryAngle[i]);
        A(i*2,0) = 1.0;
        A(i*2,1) = 0.0;
        A(i*2,2) = -motorGeometryProjectionY[i];
        A(i*2+1,0) = 0.0;
        A(i*2+1,1) = 1.0;
        A(i*2+1,2) = motorGeometryProjectionX[i];
    }
    A_pseudoInverse = arma::pinv(A);
    turnAnglesInRange = false;
    commandedDriveVector.direction = 0.0; // deg;
    servoTurnAngleCandidatesPrev[0][0] = 0.0;
    servoTurnAngleCandidatesPrev[0][1] = 180.0;
    servoTurnAngleCandidatesPrev[1][0] = 0.0;
    servoTurnAngleCandidatesPrev[1][1] = 180.0;
    servoTurnAngleCandidatesPrev[2][0] = 0.0;
    servoTurnAngleCandidatesPrev[2][1] = 180.0;
    servoTurnAngleCandidatesPrev[3][0] = 0.0;
    servoTurnAngleCandidatesPrev[3][1] = 180.0;
    servoFeedback.flTurnAngle = 0.0;
    servoFeedback.blTurnAngle = 180.0;
    servoFeedback.brTurnAngle = 180.0;
    servoFeedback.frTurnAngle = 0.0;
    servoFeedbackAngles[0] = 0.0;
    servoFeedbackAngles[1] = 180.0;
    servoFeedbackAngles[2] = 180.0;
    servoFeedbackAngles[3] = 0.0;
    servoFeedbackSpeed[0] = 0.0;
    servoFeedbackSpeed[1] = 0.0;
    servoFeedbackSpeed[2] = 0.0;
    servoFeedbackSpeed[3] = 0.0;
    groupServoQuerySetCmd.updateVector.resize(NUM_SERVOS);
    groupServoQuerySetCmd.updateVector.at(_flTurn).id = FL_TURN_ID;
    groupServoQuerySetCmd.updateVector.at(_flTurn).mode = hw_interface_plugin_dynamixel::servoUpdate::MODE_QUERY;
    groupServoQuerySetCmd.updateVector.at(_flTurn).abilityRequested = hw_interface_plugin_dynamixel::servoUpdate::ABILITY_PRESENT_POSITION;
    groupServoQuerySetCmd.updateVector.at(_blTurn).id = BL_TURN_ID;
    groupServoQuerySetCmd.updateVector.at(_blTurn).mode = hw_interface_plugin_dynamixel::servoUpdate::MODE_QUERY;
    groupServoQuerySetCmd.updateVector.at(_blTurn).abilityRequested = hw_interface_plugin_dynamixel::servoUpdate::ABILITY_PRESENT_POSITION;
    groupServoQuerySetCmd.updateVector.at(_brTurn).id = BR_TURN_ID;
    groupServoQuerySetCmd.updateVector.at(_brTurn).mode = hw_interface_plugin_dynamixel::servoUpdate::MODE_QUERY;
    groupServoQuerySetCmd.updateVector.at(_brTurn).abilityRequested = hw_interface_plugin_dynamixel::servoUpdate::ABILITY_PRESENT_POSITION;
    groupServoQuerySetCmd.updateVector.at(_frTurn).id = FR_TURN_ID;
    groupServoQuerySetCmd.updateVector.at(_frTurn).mode = hw_interface_plugin_dynamixel::servoUpdate::MODE_QUERY;
    groupServoQuerySetCmd.updateVector.at(_frTurn).abilityRequested = hw_interface_plugin_dynamixel::servoUpdate::ABILITY_PRESENT_POSITION;
    groupServoQuerySetCmd.updateVector.at(_flDrive).id = FL_DRIVE_ID;
    groupServoQuerySetCmd.updateVector.at(_flDrive).mode = hw_interface_plugin_dynamixel::servoUpdate::MODE_QUERY;
    groupServoQuerySetCmd.updateVector.at(_flDrive).abilityRequested = hw_interface_plugin_dynamixel::servoUpdate::ABILITY_PRESENT_SPEED;
    groupServoQuerySetCmd.updateVector.at(_blDrive).id = BL_DRIVE_ID;
    groupServoQuerySetCmd.updateVector.at(_blDrive).mode = hw_interface_plugin_dynamixel::servoUpdate::MODE_QUERY;
    groupServoQuerySetCmd.updateVector.at(_blDrive).abilityRequested = hw_interface_plugin_dynamixel::servoUpdate::ABILITY_PRESENT_SPEED;
    groupServoQuerySetCmd.updateVector.at(_brDrive).id = BR_DRIVE_ID;
    groupServoQuerySetCmd.updateVector.at(_brDrive).mode = hw_interface_plugin_dynamixel::servoUpdate::MODE_QUERY;
    groupServoQuerySetCmd.updateVector.at(_brDrive).abilityRequested = hw_interface_plugin_dynamixel::servoUpdate::ABILITY_PRESENT_SPEED;
    groupServoQuerySetCmd.updateVector.at(_frDrive).id = FR_DRIVE_ID;
    groupServoQuerySetCmd.updateVector.at(_frDrive).mode = hw_interface_plugin_dynamixel::servoUpdate::MODE_QUERY;
    groupServoQuerySetCmd.updateVector.at(_frDrive).abilityRequested = hw_interface_plugin_dynamixel::servoUpdate::ABILITY_PRESENT_SPEED;
    groupServoCmd.updateVector.resize(NUM_SERVOS);
    groupServoCmd.updateVector.at(_flTurn).id = FL_TURN_ID;
    groupServoCmd.updateVector.at(_flTurn).mode = hw_interface_plugin_dynamixel::servoUpdate::MODE_SET;
    groupServoCmd.updateVector.at(_flTurn).abilityRequested = hw_interface_plugin_dynamixel::servoUpdate::ABILITY_GOAL_POSITION;
    groupServoCmd.updateVector.at(_blTurn).id = BL_TURN_ID;
    groupServoCmd.updateVector.at(_blTurn).mode = hw_interface_plugin_dynamixel::servoUpdate::MODE_SET;
    groupServoCmd.updateVector.at(_blTurn).abilityRequested = hw_interface_plugin_dynamixel::servoUpdate::ABILITY_GOAL_POSITION;
    groupServoCmd.updateVector.at(_brTurn).id = BR_TURN_ID;
    groupServoCmd.updateVector.at(_brTurn).mode = hw_interface_plugin_dynamixel::servoUpdate::MODE_SET;
    groupServoCmd.updateVector.at(_brTurn).abilityRequested = hw_interface_plugin_dynamixel::servoUpdate::ABILITY_GOAL_POSITION;
    groupServoCmd.updateVector.at(_frTurn).id = FR_TURN_ID;
    groupServoCmd.updateVector.at(_frTurn).mode = hw_interface_plugin_dynamixel::servoUpdate::MODE_SET;
    groupServoCmd.updateVector.at(_frTurn).abilityRequested = hw_interface_plugin_dynamixel::servoUpdate::ABILITY_GOAL_POSITION;
    groupServoCmd.updateVector.at(_flDrive).id = FL_DRIVE_ID;
    groupServoCmd.updateVector.at(_flDrive).mode = hw_interface_plugin_dynamixel::servoUpdate::MODE_SET;
    groupServoCmd.updateVector.at(_flDrive).abilityRequested = hw_interface_plugin_dynamixel::servoUpdate::ABILITY_MOVING_SPEED;
    groupServoCmd.updateVector.at(_blDrive).id = BL_DRIVE_ID;
    groupServoCmd.updateVector.at(_blDrive).mode = hw_interface_plugin_dynamixel::servoUpdate::MODE_SET;
    groupServoCmd.updateVector.at(_blDrive).abilityRequested = hw_interface_plugin_dynamixel::servoUpdate::ABILITY_MOVING_SPEED;
    groupServoCmd.updateVector.at(_brDrive).id = BR_DRIVE_ID;
    groupServoCmd.updateVector.at(_brDrive).mode = hw_interface_plugin_dynamixel::servoUpdate::MODE_SET;
    groupServoCmd.updateVector.at(_brDrive).abilityRequested = hw_interface_plugin_dynamixel::servoUpdate::ABILITY_MOVING_SPEED;
    groupServoCmd.updateVector.at(_frDrive).id = FR_DRIVE_ID;
    groupServoCmd.updateVector.at(_frDrive).mode = hw_interface_plugin_dynamixel::servoUpdate::MODE_SET;
    groupServoCmd.updateVector.at(_frDrive).abilityRequested = hw_interface_plugin_dynamixel::servoUpdate::ABILITY_MOVING_SPEED;
    ros::Duration(2).sleep();
    servoCmdPub.publish(groupServoQuerySetCmd);
}

void Drive::run()
{
    estimateRobotVelocity();
    if(commandedDriveVector.allStop)
    {
        outputDriveVelX = 0.0;
        outputDriveVelY = 0.0;
        outputDriveAngVel = 0.0;
    }
    else if(virtualBumperParams.active && virtualBumperStatus.pointInsideBumper && !commandedDriveVector.allStop)
    {
        //ROS_WARN("point inside bumper");
        virtualBumperStatus.closestPointDirection = fmod(virtualBumperStatus.closestPointDirection + 360.0, 360.0);
        robotSpeedAlongClosestPointDirection = navStates.speed*cos(DEG2RAD*(virtualBumperStatus.closestPointDirection - navStates.direction));
        commandedSpeedAlongClosestPointDirection = commandedDriveVector.speed*cos(DEG2RAD*(virtualBumperStatus.closestPointDirection - commandedDriveVector.direction));
        ROS_INFO("speed along drive direction = %f",commandedSpeedAlongClosestPointDirection);
        if(robotSpeedAlongClosestPointDirection>0.0)
        {
            bumperReactiveDriveVector.speed = virtualBumperSpringConstant*(virtualBumperParams.radius - virtualBumperStatus.closestPointDistance) -
                    virtualBumperDamperConstant*robotSpeedAlongClosestPointDirection + commandedSpeedAlongClosestPointDirection;
        }
        else
        {
            bumperReactiveDriveVector.speed = virtualBumperSpringConstant*(virtualBumperParams.radius - virtualBumperStatus.closestPointDistance) -
                    virtualBumperDamperConstant*robotSpeedAlongClosestPointDirection;
        }
        if(bumperReactiveDriveVector.speed < outputSpeedDeadband) bumperReactiveDriveVector.speed = outputSpeedDeadband;
        bumperReactiveDriveVector.direction = fmod(virtualBumperStatus.closestPointDirection + 180.0, 360.0);
        //ROS_ERROR("bumperReactiveSpeed = %f",bumperReactiveDriveVector.speed);
        //ROS_ERROR("bumperReactiveDirection = %f",bumperReactiveDriveVector.direction);
        outputDriveVelX = commandedDriveVector.speed*cos(DEG2RAD*commandedDriveVector.direction) +
                bumperReactiveDriveVector.speed*cos(DEG2RAD*bumperReactiveDriveVector.direction);
        outputDriveVelY = commandedDriveVector.speed*sin(DEG2RAD*commandedDriveVector.direction) +
                bumperReactiveDriveVector.speed*sin(DEG2RAD*bumperReactiveDriveVector.direction);
        outputDriveAngVel = commandedDriveVector.angularSpeed;
        //outputDriveVector.speed = hypot(outputDriveVelX,outputDriveVelY);
        //outputDriveVector.direction = RAD2DEG*atan2(outputDriveVelY,outputDriveVelX);
        //outputDriveVector.angularSpeed = commandedDriveVector.angularSpeed;
    }
    else
    {
        outputDriveVelX = commandedDriveVector.speed*cos(DEG2RAD*commandedDriveVector.direction);
        outputDriveVelY = commandedDriveVector.speed*sin(DEG2RAD*commandedDriveVector.direction);
        outputDriveAngVel = commandedDriveVector.angularSpeed;
    }
    ROS_INFO("commandedDriveVector.speed = %f",commandedDriveVector.speed);
    ROS_INFO("commandedDriveAngVel = %f", commandedDriveVector.angularSpeed);
    outputDriveVectorToServoCommands();
}

void Drive::outputDriveVectorToServoCommands()
{
    outputDriveVectorMagnitude = hypot(outputDriveVelX,outputDriveVelY);
    for(int i=0; i<4; i++)
    {
        servoOutputProjectionX[i] = outputDriveVelX - DEG2RAD*outputDriveAngVel*motorGeometryProjectionY[i];
        servoOutputProjectionY[i] = outputDriveVelY + DEG2RAD*outputDriveAngVel*motorGeometryProjectionX[i];
        if(outputDriveVectorMagnitude<outputSpeedDeadband && joystickCombinedMagnitude<joystickDeadband)
        {
            servoOutputSpeed[i] = 0.0;
            servoTurnAngleCandidates[i][0] = servoTurnAngleCandidatesPrev[i][0];
        }
        else
        {
            servoOutputSpeed[i] = hypot(servoOutputProjectionX[i],servoOutputProjectionY[i]);
            if(servoOutputSpeed[i]>ROBOT_MAX_SPEED) servoOutputSpeed[i] = ROBOT_MAX_SPEED;
            servoTurnAngleCandidates[i][0] = RAD2DEG*atan2(servoOutputProjectionY[i],servoOutputProjectionX[i]);
            servoTurnAngleCandidatesPrev[i][0] = servoTurnAngleCandidates[i][0];

        }
        //ROS_INFO("servoOutputSpeed[%i] = %f",i,servoOutputSpeed[i]);
        if(i==0 || i==3)
        {
            if(servoTurnAngleCandidates[i][0]>=0.0) servoTurnAngleCandidates[i][1] = servoTurnAngleCandidates[i][0] - 180.0;
            else servoTurnAngleCandidates[i][1] = servoTurnAngleCandidates[i][0] + 180.0;
            if(servoFeedbackAngles[i]>180.0) servoFeedbackAngles[i] -= 360.0;
        }
        else servoTurnAngleCandidates[i][1] = servoTurnAngleCandidates[i][0] + 180.0;
        //ROS_INFO("servoTurnAngleCandidates[%i] = [%f,%f]",i,servoTurnAngleCandidates[i][0],servoTurnAngleCandidates[i][1]);
        if(i==1 || i==2)
        {
            servoTurnAngleCandidates[i][0] = fmod(servoTurnAngleCandidates[i][0] + 360.0, 360.0);
            servoTurnAngleCandidates[i][1] = fmod(servoTurnAngleCandidates[i][1] + 360.0, 360.0);
        }
        if(servoTurnAngleCandidates[i][0] >= servoTurnAngleLimits[i][0] && servoTurnAngleCandidates[i][0] <= servoTurnAngleLimits[i][1])
            servoFirstCandidateTurnAngleInRange[i] = true;
        else servoFirstCandidateTurnAngleInRange[i] = false;
        if(servoTurnAngleCandidates[i][1] >= servoTurnAngleLimits[i][0] && servoTurnAngleCandidates[i][1] <= servoTurnAngleLimits[i][1])
            servoSecondCandidateTurnAngleInRange[i] = true;
        else servoSecondCandidateTurnAngleInRange[i] = false;
        if(i!=1 || i!=2)
        {
            servoTurnAngleCandidates[i][0] = fmod(servoTurnAngleCandidates[i][0] + 360.0, 360.0);
            servoTurnAngleCandidates[i][1] = fmod(servoTurnAngleCandidates[i][1] + 360.0, 360.0);
        }

        if(servoFirstCandidateTurnAngleInRange[i] && servoSecondCandidateTurnAngleInRange[i])
        {
            if(fabs(servoTurnAngleCandidates[i][0] - servoFeedbackAngles[i]) < fabs(servoTurnAngleCandidates[i][1] - servoFeedbackAngles[i]))
            {
                servoChosenTurnAngle[i] = servoTurnAngleCandidates[i][0];
                servoOutputDirection[i] = 1.0;
            }
            else
            {
                servoChosenTurnAngle[i] = servoTurnAngleCandidates[i][1];
                servoOutputDirection[i] = -1.0;
            }
        }
        else if(servoFirstCandidateTurnAngleInRange[i] && !servoSecondCandidateTurnAngleInRange[i])
        {
            servoChosenTurnAngle[i] = servoTurnAngleCandidates[i][0];
            servoOutputDirection[i] = 1.0;
        }
        else if(!servoFirstCandidateTurnAngleInRange[i] && servoSecondCandidateTurnAngleInRange[i])
        {
            servoChosenTurnAngle[i] = servoTurnAngleCandidates[i][1];
            servoOutputDirection[i] = -1.0;
        }
        else ROS_ERROR("no valid turning solution for wheel %i",i);
        if(i==0 || i==2)
        {
            servoOutputDirection[i] *= -1.0;
        }
    }


    servoCommands.flTurnAngle = servoChosenTurnAngle[0];
    servoCommands.blTurnAngle = servoChosenTurnAngle[1];
    servoCommands.brTurnAngle = servoChosenTurnAngle[2];
    servoCommands.frTurnAngle = servoChosenTurnAngle[3];
    //ROS_INFO("flTurnAngle = %f",servoCommands.flTurnAngle);
    //ROS_INFO("blTurnAngle = %f",servoCommands.blTurnAngle);
    //ROS_INFO("brTurnAngle = %f",servoCommands.brTurnAngle);
    //ROS_INFO("frTurnAngle = %f",servoCommands.frTurnAngle);
    //ROS_INFO("flFeedbackAngle = %f",servoFeedbackAngles[0]);
    //ROS_INFO("blFeedbackAngle = %f",servoFeedbackAngles[1]);
    //ROS_INFO("brFeedbackAngle = %f",servoFeedbackAngles[2]);
    //ROS_INFO("frFeedbackAngle = %f",servoFeedbackAngles[3]);
    ROS_INFO("flFeedbackSpeed = %f",servoFeedback.flSpeed);
    ROS_INFO("blFeedbackSpeed = %f",servoFeedback.blSpeed);
    ROS_INFO("brFeedbackSpeed = %f",servoFeedback.brSpeed);
    ROS_INFO("frFeedbackSpeed = %f",servoFeedback.frSpeed);
    ROS_INFO("flSpeed = %f",servoOutputSpeed[0]*servoOutputDirection[0]);
    ROS_INFO("blSpeed = %f",servoOutputSpeed[1]*servoOutputDirection[1]);
    ROS_INFO("brSpeed = %f",servoOutputSpeed[2]*servoOutputDirection[2]);
    ROS_INFO("frSpeed = %f",servoOutputSpeed[3]*servoOutputDirection[3]);
    if(servoCommands.flTurnAngle<180.0 && servoFeedback.flTurnAngle>=180.0) servoFeedback.flTurnAngle -= 360.0;
    if(servoCommands.frTurnAngle<180.0 && servoFeedback.frTurnAngle>=180.0) servoFeedback.frTurnAngle -= 360.0;
    /*(if(fabs(servoCommands.flTurnAngle - servoFeedback.flTurnAngle)<turnAngleTolerance &&
       fabs(servoCommands.blTurnAngle - servoFeedback.blTurnAngle)<turnAngleTolerance &&
       fabs(servoCommands.brTurnAngle - servoFeedback.brTurnAngle)<turnAngleTolerance &&
       fabs(servoCommands.frTurnAngle - servoFeedback.frTurnAngle)<turnAngleTolerance)
    {
        servoCommands.flSpeed = servoOutputDirection[0]*servoOutputSpeed[0];
        servoCommands.blSpeed = servoOutputDirection[1]*servoOutputSpeed[1];
        servoCommands.brSpeed = servoOutputDirection[2]*servoOutputSpeed[2];
        servoCommands.frSpeed = servoOutputDirection[3]*servoOutputSpeed[3];
    }
    else
    {
        servoCommands.flSpeed = 0.0;
        servoCommands.blSpeed = 0.0;
        servoCommands.brSpeed = 0.0;
        servoCommands.frSpeed = 0.0;
    }*/
    servoCommands.flSpeed = servoOutputDirection[0]*servoOutputSpeed[0];
    servoCommands.blSpeed = servoOutputDirection[1]*servoOutputSpeed[1];
    servoCommands.brSpeed = servoOutputDirection[2]*servoOutputSpeed[2];
    servoCommands.frSpeed = servoOutputDirection[3]*servoOutputSpeed[3];
    pubServoCommands();
    std::printf("\n");
}

void Drive::pubServoCommands()
{
    if(servoCommands.flTurnAngle < 180.0)
    {
        groupServoCmd.updateVector.at(_flTurn).uDATA = (uint16_t)(-(servoCommands.flTurnAngle)*TURNING_RANGE/TURN_MAX_RANGE + FL_TURN_OFFSET);
    }
    else
    {
        groupServoCmd.updateVector.at(_flTurn).uDATA = (uint16_t)(-(servoCommands.flTurnAngle)*TURNING_RANGE/TURN_MAX_RANGE + 3.0*FL_TURN_OFFSET - 1);
    }
    groupServoCmd.updateVector.at(_blTurn).uDATA = (uint16_t)(-(servoCommands.blTurnAngle-TURN_MAX_RANGE/2.0)*TURNING_RANGE/TURN_MAX_RANGE + BL_TURN_OFFSET);
    groupServoCmd.updateVector.at(_brTurn).uDATA = (uint16_t)(-(servoCommands.brTurnAngle-TURN_MAX_RANGE/2.0)*TURNING_RANGE/TURN_MAX_RANGE + BR_TURN_OFFSET);
    if(servoCommands.frTurnAngle < 180.0)
    {
        groupServoCmd.updateVector.at(_frTurn).uDATA = (uint16_t)(-(servoCommands.frTurnAngle)*TURNING_RANGE/TURN_MAX_RANGE + FR_TURN_OFFSET);
    }
    else
    {
        groupServoCmd.updateVector.at(_frTurn).uDATA = (uint16_t)(-(servoCommands.frTurnAngle)*TURNING_RANGE/TURN_MAX_RANGE + 3.0*FR_TURN_OFFSET - 1);
    }
    if(groupServoCmd.updateVector.at(_flTurn).uDATA>TURNING_RANGE) groupServoCmd.updateVector.at(_flTurn).uDATA = TURNING_RANGE;
    else if(((int16_t)groupServoCmd.updateVector.at(_flTurn).uDATA)<0) groupServoCmd.updateVector.at(_flTurn).uDATA = 0;
    if(groupServoCmd.updateVector.at(_blTurn).uDATA>TURNING_RANGE) groupServoCmd.updateVector.at(_blTurn).uDATA = TURNING_RANGE;
    else if(((int16_t)groupServoCmd.updateVector.at(_blTurn).uDATA)<0) groupServoCmd.updateVector.at(_blTurn).uDATA = 0;
    if(groupServoCmd.updateVector.at(_brTurn).uDATA>TURNING_RANGE) groupServoCmd.updateVector.at(_brTurn).uDATA = TURNING_RANGE;
    else if(((int16_t)groupServoCmd.updateVector.at(_brTurn).uDATA)<0) groupServoCmd.updateVector.at(_brTurn).uDATA = 0;
    if(groupServoCmd.updateVector.at(_frTurn).uDATA>TURNING_RANGE) groupServoCmd.updateVector.at(_frTurn).uDATA = TURNING_RANGE;
    else if(((int16_t)groupServoCmd.updateVector.at(_frTurn).uDATA)<0) groupServoCmd.updateVector.at(_frTurn).uDATA = 0;
    if(servoCommands.flSpeed>SPEED_RANGE) servoCommands.flSpeed = SPEED_RANGE;
    else if(servoCommands.flSpeed<-SPEED_RANGE) servoCommands.flSpeed = -SPEED_RANGE;
    if(servoCommands.blSpeed>SPEED_RANGE) servoCommands.blSpeed = SPEED_RANGE;
    else if(servoCommands.blSpeed<-SPEED_RANGE) servoCommands.blSpeed = -SPEED_RANGE;
    if(servoCommands.brSpeed>SPEED_RANGE) servoCommands.brSpeed = SPEED_RANGE;
    else if(servoCommands.brSpeed<-SPEED_RANGE) servoCommands.brSpeed = -SPEED_RANGE;
    if(servoCommands.frSpeed>SPEED_RANGE) servoCommands.frSpeed = SPEED_RANGE;
    else if(servoCommands.frSpeed<-SPEED_RANGE) servoCommands.frSpeed = -SPEED_RANGE;
    if(servoCommands.flSpeed>=0.0)
    {
        groupServoCmd.updateVector.at(_flDrive).uDATA = (uint16_t)(servoCommands.flSpeed*(SPEED_RANGE-1.0)/ROBOT_MAX_SPEED + SPEED_RANGE);
        //ROS_WARN("FlSpeed >=0 || %f || Output: %u", servoCommands.flSpeed, groupServoCmd.updateVector.at(_flDrive).uDATA);
    }
    else
    {
        groupServoCmd.updateVector.at(_flDrive).uDATA = (uint16_t)(fabs(servoCommands.flSpeed)*(SPEED_RANGE-1.0)/ROBOT_MAX_SPEED);
        //ROS_WARN("FlSpeed <0 || %f || Output: %u", servoCommands.flSpeed, groupServoCmd.updateVector.at(_flDrive).uDATA);
    }
    if(servoCommands.blSpeed>=0.0)
    {
        groupServoCmd.updateVector.at(_blDrive).uDATA = (uint16_t)(servoCommands.blSpeed*(SPEED_RANGE-1.0)/ROBOT_MAX_SPEED + SPEED_RANGE);
        //ROS_WARN("blSpeed >=0 || %f || Output: %u", servoCommands.blSpeed, groupServoCmd.updateVector.at(_blDrive).uDATA);
    }
    else
    {
        groupServoCmd.updateVector.at(_blDrive).uDATA = (uint16_t)(fabs(servoCommands.blSpeed)*(SPEED_RANGE-1.0)/ROBOT_MAX_SPEED);
        //ROS_WARN("blSpeed <0 || %f || Output: %u", servoCommands.blSpeed, groupServoCmd.updateVector.at(_blDrive).uDATA);
    }
    if(servoCommands.brSpeed>=0.0)
    {
        groupServoCmd.updateVector.at(_brDrive).uDATA = (uint16_t)(servoCommands.brSpeed*(SPEED_RANGE-1.0)/ROBOT_MAX_SPEED + SPEED_RANGE);
        //ROS_WARN("brSpeed >=0 || %f || Output: %u", servoCommands.brSpeed, groupServoCmd.updateVector.at(_brDrive).uDATA);
    }
    else
    {
        groupServoCmd.updateVector.at(_brDrive).uDATA = (uint16_t)(fabs(servoCommands.flSpeed)*(SPEED_RANGE-1.0)/ROBOT_MAX_SPEED);
        //ROS_WARN("brSpeed <0 || %f || Output: %u", servoCommands.brSpeed, groupServoCmd.updateVector.at(_brDrive).uDATA);
    }
    if(servoCommands.frSpeed>=0.0)
    {
        groupServoCmd.updateVector.at(_frDrive).uDATA = (uint16_t)(servoCommands.frSpeed*(SPEED_RANGE-1.0)/ROBOT_MAX_SPEED + SPEED_RANGE);
        //ROS_WARN("frSpeed >=0 || %f || Output: %u", servoCommands.frSpeed, groupServoCmd.updateVector.at(_frDrive).uDATA);
    }
    else
    {
        groupServoCmd.updateVector.at(_frDrive).uDATA = (uint16_t)(fabs(servoCommands.frSpeed)*(SPEED_RANGE-1.0)/ROBOT_MAX_SPEED);
        //ROS_WARN("frSpeed <0 || %f || Output: %u", servoCommands.frSpeed, groupServoCmd.updateVector.at(_frDrive).uDATA);
    }
    if(groupServoCmd.updateVector.at(_flDrive).uDATA>(uint16_t)(SPEED_RANGE*2.0-1)) 
    {
        groupServoCmd.updateVector.at(_flDrive).uDATA = (uint16_t)(SPEED_RANGE*2.0-1);
    }
    else if(groupServoCmd.updateVector.at(_flDrive).uDATA<1) 
    {
        groupServoCmd.updateVector.at(_flDrive).uDATA = 1;
    }
    if(groupServoCmd.updateVector.at(_blDrive).uDATA>(uint16_t)(SPEED_RANGE*2.0-1)) 
    {
        groupServoCmd.updateVector.at(_blDrive).uDATA = (uint16_t)(SPEED_RANGE*2.0-1);
    }
    else if(groupServoCmd.updateVector.at(_blDrive).uDATA<1) 
    {
        groupServoCmd.updateVector.at(_blDrive).uDATA = 1;
    }
    if(groupServoCmd.updateVector.at(_brDrive).uDATA>(uint16_t)(SPEED_RANGE*2.0-1)) 
    {
        groupServoCmd.updateVector.at(_brDrive).uDATA = (uint16_t)(SPEED_RANGE*2.0-1);
    }
    else if(groupServoCmd.updateVector.at(_brDrive).uDATA<1) 
    {
        groupServoCmd.updateVector.at(_brDrive).uDATA = 1;
    }
    if(groupServoCmd.updateVector.at(_frDrive).uDATA>(uint16_t)(SPEED_RANGE*2.0-1)) 
    {
        groupServoCmd.updateVector.at(_frDrive).uDATA = (uint16_t)(SPEED_RANGE*2.0-1);
    }
    else if(groupServoCmd.updateVector.at(_frDrive).uDATA<1) 
    {
        groupServoCmd.updateVector.at(_frDrive).uDATA = 1;
    }
    
    servoCmdPub.publish(groupServoCmd);
}

void Drive::estimateRobotVelocity()
{
    for(int i=0; i<4; i++)
    {
        b(i*2) = servoFeedbackSpeed[i]*cos(DEG2RAD*motorGeometryAngle[i]);
        b(i*2+1) = servoFeedbackSpeed[i]*sin(DEG2RAD*motorGeometryAngle[i]);
    }
    xHat = A_pseudoInverse*b;
    navStates.speed = hypot(xHat(0), xHat(1));
    navStates.direction = fmod(RAD2DEG*atan2(xHat(1), xHat(0)) + 360.0, 360.0);
    navStates.angularSpeed = xHat(2)*RAD2DEG;
    ROS_INFO("estimated speed = %f",navStates.speed);
    ROS_INFO("estimated direction = %f",navStates.direction);
    ROS_INFO("estimated angular speed = %f",navStates.angularSpeed);
}

void Drive::joystickCallback(const sensor_msgs::Joy::ConstPtr &msg)
{
    joystickStickMagnitude = hypot(msg->axes.at(0),msg->axes.at(1));
    if(joystickStickMagnitude>1.0) joystickStickMagnitude = 1.0;
    joystickCombinedMagnitude = sqrt(pow(msg->axes.at(0),2) + pow(msg->axes.at(1),2) + pow(msg->axes.at(3),2));
    if(joystickCombinedMagnitude>1.0) joystickCombinedMagnitude = 1.0;
    if(joystickStickMagnitude<joystickDeadband)
    {
        commandedDriveVector.speed = 0.0;
    }
    else
    {
        if(fastMode) commandedDriveVector.speed = ROBOT_MAX_SPEED*pow(joystickStickMagnitude, 3.0);
        else commandedDriveVector.speed = ROBOT_MAX_SPEED/4.0*pow(joystickStickMagnitude, 3.0);
    }
    commandedDriveVector.direction = fmod(RAD2DEG*atan2(msg->axes.at(0), msg->axes.at(1)) + 360.0, 360.0);
    if(fabs(msg->axes.at(3))<joystickDeadband)
    {
        commandedDriveVector.angularSpeed = 0.0;
    }
    else
    {
        if(fastMode) commandedDriveVector.angularSpeed = ROBOT_MAX_ANG_SPEED*pow(msg->axes.at(3), 3.0);
        else commandedDriveVector.angularSpeed = ROBOT_MAX_ANG_SPEED/4.0*pow(msg->axes.at(3), 3.0);
    }
}

void Drive::virtualBumperParamsCallback(const msgs_and_srvs::VirtualBumperParams::ConstPtr &msg)
{
    virtualBumperParams = *msg;
    virtualBumperSpringConstant = msg->springConstant;
}

void Drive::virtualBumperStatusCallback(const msgs_and_srvs::VirtualBumperStatus::ConstPtr &msg)
{
    virtualBumperStatus = *msg;
}

void Drive::driveCommandsCallback(const msgs_and_srvs::DriveCommands::ConstPtr& msg)
{
    commandedDriveVector.allStop = msg->allStop;
    fastMode = msg->fastMode;
}

void Drive::servoFeedbackCallbackFLTurn(const hw_interface_plugin_dynamixel::servoStateResponse::ConstPtr& msg)
{
    if((float)(msg->uDATA)<FL_TURN_OFFSET)
    {
        servoFeedback.flTurnAngle = ((FL_TURN_OFFSET - (float)(msg->uDATA)))*TURN_MAX_RANGE/TURNING_RANGE;
    }
    else
    {
        servoFeedback.flTurnAngle = ((3.0*FL_TURN_OFFSET - 1.0 - (float)(msg->uDATA)))*TURN_MAX_RANGE/TURNING_RANGE;
    }
    servoFeedbackAngles[0] = servoFeedback.flTurnAngle;
}

void Drive::servoFeedbackCallbackBLTurn(const hw_interface_plugin_dynamixel::servoStateResponse::ConstPtr& msg)
{
    servoFeedback.blTurnAngle = ((TURNING_RANGE - (float)(msg->uDATA)))*TURN_MAX_RANGE/TURNING_RANGE;
    servoFeedbackAngles[1] = servoFeedback.blTurnAngle;
}

void Drive::servoFeedbackCallbackBRTurn(const hw_interface_plugin_dynamixel::servoStateResponse::ConstPtr& msg)
{
    servoFeedback.brTurnAngle = ((TURNING_RANGE - (float)(msg->uDATA)))*TURN_MAX_RANGE/TURNING_RANGE;
    servoFeedbackAngles[2] = servoFeedback.brTurnAngle;
}

void Drive::servoFeedbackCallbackFRTurn(const hw_interface_plugin_dynamixel::servoStateResponse::ConstPtr& msg)
{
    if((float)(msg->uDATA)<FR_TURN_OFFSET)
    {
        servoFeedback.frTurnAngle = ((FR_TURN_OFFSET - (float)(msg->uDATA)))*TURN_MAX_RANGE/TURNING_RANGE;
    }
    else
    {
        servoFeedback.frTurnAngle = ((3.0*FR_TURN_OFFSET - 1.0 - (float)(msg->uDATA)))*TURN_MAX_RANGE/TURNING_RANGE;
    }
    servoFeedbackAngles[3] = servoFeedback.frTurnAngle;
}

void Drive::servoFeedbackCallbackFLDrive(const hw_interface_plugin_dynamixel::servoStateResponse::ConstPtr& msg)
{
    if(msg->uDATA>=1024) servoFeedback.flSpeed = ((float)(msg->uDATA) - SPEED_RANGE)*ROBOT_MAX_SPEED/SPEED_RANGE;
    else servoFeedback.flSpeed = -(float)(msg->uDATA)*ROBOT_MAX_SPEED/SPEED_RANGE;
    servoFeedbackSpeed[0] = servoFeedback.flSpeed;
}

void Drive::servoFeedbackCallbackBLDrive(const hw_interface_plugin_dynamixel::servoStateResponse::ConstPtr& msg)
{
    if(msg->uDATA>=1024) servoFeedback.blSpeed = ((float)(msg->uDATA) - SPEED_RANGE)*ROBOT_MAX_SPEED/SPEED_RANGE;
    else servoFeedback.blSpeed = -(float)(msg->uDATA)*ROBOT_MAX_SPEED/SPEED_RANGE;
    servoFeedbackSpeed[1] = servoFeedback.blSpeed;
}

void Drive::servoFeedbackCallbackBRDrive(const hw_interface_plugin_dynamixel::servoStateResponse::ConstPtr& msg)
{
    if(msg->uDATA>=1024) servoFeedback.brSpeed = -((float)(msg->uDATA) - SPEED_RANGE)*ROBOT_MAX_SPEED/SPEED_RANGE;
    else servoFeedback.brSpeed = (float)(msg->uDATA)*ROBOT_MAX_SPEED/SPEED_RANGE;
    servoFeedbackSpeed[2] = servoFeedback.brSpeed;
}

void Drive::servoFeedbackCallbackFRDrive(const hw_interface_plugin_dynamixel::servoStateResponse::ConstPtr& msg)
{
    if(msg->uDATA>=1024) servoFeedback.frSpeed = -((float)(msg->uDATA) - SPEED_RANGE)*ROBOT_MAX_SPEED/SPEED_RANGE;
    else servoFeedback.frSpeed = (float)(msg->uDATA)*ROBOT_MAX_SPEED/SPEED_RANGE;
    servoFeedbackSpeed[3] = servoFeedback.frSpeed;
}
