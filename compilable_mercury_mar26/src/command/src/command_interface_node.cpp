#include <command/command_interface.hpp>

int main(int argc, char **argv)
{
    ros::init(argc,argv,"command_interface_node");
    CommandInterface commandInterface;
    ros::spinOnce();
    ros::Rate loopRate(commandInterface.rate);
    while(ros::ok())
    {
        ROS_INFO_THROTTLE(3,"Command Interface Node Running");
        commandInterface.run();
        ros::spinOnce();
        loopRate.sleep();
    }
    return 0;
}
