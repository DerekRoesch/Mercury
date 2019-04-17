#ifndef DRIVE_HPP
#define DRIVE_HPP
#include <ros/ros.h>
#include <armadillo>
#include <sensor_msgs/Joy.h>

#include <hw_interface_plugin_dynamixel/groupServoUpdate.h>
#include <hw_interface_plugin_dynamixel/servoStateResponse.h>
#include <msgs_and_srvs/DriveVector.h>
#include <msgs_and_srvs/ServoCommands.h>
#include <msgs_and_srvs/ServoFeedback.h>
#include <msgs_and_srvs/VirtualBumperParams.h>
#include <msgs_and_srvs/VirtualBumperStatus.h>
#include <msgs_and_srvs/NavStates.h>
#include <msgs_and_srvs/DriveCommands.h>

#define PI 3.14159265359
#define DEG2RAD PI/180.0
#define RAD2DEG 180.0/PI

#define TURNING_RANGE 4095.0
#define SPEED_RANGE 1024.0
#define TURN_MAX_RANGE 360.0
#define ROBOT_MAX_SPEED 0.34 // m/s
#define ROBOT_MAX_ANG_SPEED 100.0 // deg/s
#define ROBOT_WHEEL_R 0.065 // m
#define WHEEL_MAX_ANG_SPEED 5.23598775 // rad/s

#define FL_TURN_OFFSET 2048.0
#define BL_TURN_OFFSET 2048.0
#define BR_TURN_OFFSET 2048.0
#define FR_TURN_OFFSET 2048.0

#define NUM_SERVOS 8

#define FL_TURN_ID 2
#define BL_TURN_ID 3
#define BR_TURN_ID 4
#define FR_TURN_ID 1
#define FL_DRIVE_ID 6
#define BL_DRIVE_ID 7
#define BR_DRIVE_ID 8
#define FR_DRIVE_ID 5

enum SERVO_INDEX_T {_flTurn, _blTurn, _brTurn, _frTurn, _flDrive, _blDrive, _brDrive, _frDrive};

class Drive
{
public:
    // Members
    ros::NodeHandle nh;
    ros::Publisher servoCmdPub;
	ros::Subscriber joystickSub;
    ros::Subscriber virtualBumperParamsSub;
    ros::Subscriber virtualBumperStatusSub;
    ros::Subscriber driveCommandsSub;
    ros::Subscriber servoFeedbackSubFLTurn;
    ros::Subscriber servoFeedbackSubBLTurn;
    ros::Subscriber servoFeedbackSubBRTurn;
    ros::Subscriber servoFeedbackSubFRTurn;
    ros::Subscriber servoFeedbackSubFLDrive;
    ros::Subscriber servoFeedbackSubBLDrive;
    ros::Subscriber servoFeedbackSubBRDrive;
    ros::Subscriber servoFeedbackSubFRDrive;
    msgs_and_srvs::ServoCommands servoCommands;
	msgs_and_srvs::DriveVector commandedDriveVector;
    msgs_and_srvs::VirtualBumperParams virtualBumperParams;
    msgs_and_srvs::VirtualBumperStatus virtualBumperStatus;
    msgs_and_srvs::NavStates navStates;
    msgs_and_srvs::ServoFeedback servoFeedback;
	msgs_and_srvs::DriveVector bumperReactiveDriveVector;
    hw_interface_plugin_dynamixel::groupServoUpdate groupServoQuerySetCmd;
    hw_interface_plugin_dynamixel::groupServoUpdate groupServoCmd;
    bool fastMode;
    float robotSpeedAlongClosestPointDirection;
	float commandedSpeedAlongClosestPointDirection;
    float outputDriveVelX;
    float outputDriveVelY;
    float outputDriveAngVel;
    const float joystickDeadband = 0.2;
    float joystickCombinedMagnitude;
    float joystickStickMagnitude;
    float outputDriveVectorMagnitude;
	msgs_and_srvs::DriveVector outputDriveVector;
    float servoOutputSpeed[4]; // in/sec {front-left, back-left, back-right, front-right}
    float servoOutputDirection[4]; // 1 or -1 {front-left, back-left, back-right, front-right}
    float servoTurnAngleCandidates[4][2]; // deg {front-left, back-left, back-right, front-right}
    float servoTurnAngleCandidatesPrev[4][2]; // deg {front-left, back-left, back-right, front-right}
    bool servoFirstCandidateTurnAngleInRange[4]; // {front-left, back-left, back-right, front-right}
    bool servoSecondCandidateTurnAngleInRange[4]; // {front-left, back-left, back-right, front-right}
    float servoFeedbackAngles[4]; // {front-left, back-left, back-right, front-right}
	float servoFeedbackSpeed[4]; // {front-left, back-left, back-right, front-right}
    float servoChosenTurnAngle[4]; // deg {front-left, back-left, back-right, front-right}
    const float servoTurnAngleLimits[4][2]; // deg {front-left, back-left, back-right, front-right}
    float servoOutputProjectionX[4]; // in/sec {front-left, back-left, back-right, front-right}
    float servoOutputProjectionY[4]; // in/sec {front-left, back-left, back-right, front-right}
    const float motorGeometryDistance[4]; // in {front-left, back-left, back-right, front-right}
    const float motorGeometryAngle[4]; // deg {front-left, back-left, back-right, front-right}
    float motorGeometryProjectionX[4]; // in {front-left, back-left, back-right, front-right}
    float motorGeometryProjectionY[4]; // in {front-left, back-left, back-right, front-right}
    bool turnAnglesInRange;
    const float rate = 20.0;
    float virtualBumperSpringConstant = 2.0; // (m/sec)/m
    float virtualBumperDamperConstant = 0.0; // 0.2 (m/sec)/(m/sec)
    const float turnAngleTolerance = 6.0; // deg
    const float outputSpeedDeadband = 0.06; // m/s
	arma::mat A;
	arma::vec b;
	arma::vec xHat;
	arma::mat A_pseudoInverse;
    // Methods
    Drive(); // Constructor
    void run();
    void outputDriveVectorToServoCommands();
    void pubServoCommands();
	void estimateRobotVelocity();
	void joystickCallback(const sensor_msgs::Joy::ConstPtr& msg);
    void virtualBumperParamsCallback(const msgs_and_srvs::VirtualBumperParams::ConstPtr& msg);
    void virtualBumperStatusCallback(const msgs_and_srvs::VirtualBumperStatus::ConstPtr& msg);
    void driveCommandsCallback(const msgs_and_srvs::DriveCommands::ConstPtr& msg);
    void servoFeedbackCallbackFLTurn(const hw_interface_plugin_dynamixel::servoStateResponse::ConstPtr& msg);
    void servoFeedbackCallbackBLTurn(const hw_interface_plugin_dynamixel::servoStateResponse::ConstPtr& msg);
    void servoFeedbackCallbackBRTurn(const hw_interface_plugin_dynamixel::servoStateResponse::ConstPtr& msg);
    void servoFeedbackCallbackFRTurn(const hw_interface_plugin_dynamixel::servoStateResponse::ConstPtr& msg);
    void servoFeedbackCallbackFLDrive(const hw_interface_plugin_dynamixel::servoStateResponse::ConstPtr& msg);
    void servoFeedbackCallbackBLDrive(const hw_interface_plugin_dynamixel::servoStateResponse::ConstPtr& msg);
    void servoFeedbackCallbackBRDrive(const hw_interface_plugin_dynamixel::servoStateResponse::ConstPtr& msg);
    void servoFeedbackCallbackFRDrive(const hw_interface_plugin_dynamixel::servoStateResponse::ConstPtr& msg);
};

#endif // DRIVE_HPP
