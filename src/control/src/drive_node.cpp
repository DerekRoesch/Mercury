#include <control/drive.hpp>

int main(int argc, char **argv)
{
    ros::init(argc,argv,"drive_node");
    Drive drive;
    ros::spinOnce();
    ros::Rate loopRate(drive.rate);
    while(ros::ok())
    {
        ROS_INFO_THROTTLE(3,"Drive Node Running");
        drive.run();
        ros::spinOnce();
        loopRate.sleep();
    }
    return 0;
}
