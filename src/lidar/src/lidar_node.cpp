#include <ros/ros.h>
#include <sensor_msgs/LaserScan.h>
#include <msgs_and_srvs/VirtualBumperParams.h>
#include <msgs_and_srvs/VirtualBumperStatus.h>
#include <vector>
#include <cmath>

class Scan
{
    private:
        ros::Subscriber sub_scan;
        ros::NodeHandle node;
        void getScanCallback(const sensor_msgs::LaserScan::ConstPtr &msg)
        {
            this->scan_time = msg->scan_time;
            this->angle_min = msg->angle_min;
            this->angle_max = msg->angle_max;
            this->range_min = msg->range_min;
            this->range_max = msg->range_max;
            this->angle_increment = msg->angle_increment;
            this->time_increment = msg->time_increment;
            this->scan_size = msg->ranges.size();
            this->int_size = msg->intensities.size();

            scan.clear();
            for (int i=0; i<msg->ranges.size(); i++)
            {
                this->scan.push_back(msg->ranges[i]);
            }

            intensities.clear();
            for (int i=0; i<msg->intensities.size(); i++)
            {
                this->intensities.push_back(msg->intensities[i]);
            }
        }
    public:
        float scan_time, range_min, range_max, angle_increment, time_increment, scan_size, int_size, angle_min, angle_max;
        std::vector<float> scan;
        std::vector<float> intensities;
        Scan();
};

Scan::Scan()
{
    scan_time=0;
    range_min=0;
    range_max=0;
    angle_increment=0;
    time_increment=0;
    //scan_size=0;
    //int_size=0;
    sub_scan = node.subscribe("/scan", 1, &Scan::getScanCallback, this);
}

class VirtualBumperParams
{
    private:
        ros::Subscriber sub_virt;
        ros::NodeHandle node;
        void getVirtualBumperParamsCallback(const msgs_and_srvs::VirtualBumperParams::ConstPtr &msg)
        {
            this->active = msg->active;
            this->radius = msg->radius;
        }
    public:
        bool active;
        float radius;
        VirtualBumperParams();
};

VirtualBumperParams::VirtualBumperParams()
{
    active=false;
    radius=0;
    sub_virt = node.subscribe("/command/interface/virtualbumperparams", 1, &VirtualBumperParams::getVirtualBumperParamsCallback, this);
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "bar_detection_test_node");
    ROS_INFO("lidar_node running...");

    ros::NodeHandle nh;
    ros::Publisher pub = nh.advertise<msgs_and_srvs::VirtualBumperStatus>("lidar/lidar/virtualbumperstatus",1);
	
	Scan scan_data;
    VirtualBumperParams virtual_bumper_params;

    msgs_and_srvs::VirtualBumperStatus msg_virtual_bumper_status;

    while(scan_data.scan_time==0 && ros::ok()) 
    {
        ROS_INFO("Waiting for first measurement...");
        ros::spinOnce();
        ros::Duration(1).sleep();
    }

    ROS_INFO("Laser Scanner Parameters: ");
    ROS_INFO("Minimum Range = %f", scan_data.range_min);
    ROS_INFO("Maximum Range = %f", scan_data.range_max);
    ROS_INFO("Minimum Angle = %f", scan_data.angle_min);
    ROS_INFO("Maximum Angle = %f", scan_data.angle_max);
    ROS_INFO("Angle Increments = %f", scan_data.angle_increment);
    ROS_INFO("Number of Scans = %f", scan_data.scan_size);

    const float minimum_threshold = 0.20;
    const float angle_offset = 47.5*3.14159265/180;

	while(ros::ok()) 
	{
	    /*
	    //prints point val closest to specified angle
	    int angle_idx = ((0.0+angle_offset)/scan_data.angle_increment);
	    if(angle_idx<0)
	    {
	        angle_idx = 360+angle_idx;
	    }
	    float angle_val = scan_data.scan[angle_idx];
	    ROS_INFO("idx at 0.0 deg = %i",angle_idx);
	    ROS_INFO("val at 0.0 deg = %f",angle_val);
        */
        
        //converts from polar to cartesian
        // std::vector<float> x_points(scan_data.scan_size);
        // std::vector<float> y_points(scan_data.scan_size);
        // x_points.clear();
        // y_points.clear(); 
        // for(int i=0; i<scan_data.scan_size; i++)
        // {   
        //     x_points.push_back( scan_data.scan[i]*cos(i*scan_data.angle_increment) );
        //     y_points.push_back( scan_data.scan[i]*sin(i*scan_data.angle_increment) );
        // }

        float min_range = scan_data.range_max;
        float min_index = -1;
        float direction = 0;
        int points_inside_bumper = 0;
        for(int i=0; i<scan_data.scan_size; i++)
        {   
            if(scan_data.scan[i] < min_range && scan_data.scan[i] > minimum_threshold)
            {
                min_range = scan_data.scan[i];
                min_index = i;
                direction = min_index*scan_data.angle_increment+angle_offset;
                if(direction < 0)
                {
                    direction = 2*3.14159265 + direction;
                }
                if(direction > 3.14159265)
                {
                    direction = direction - 2*3.14159265;
                }
            }
            
            if(scan_data.scan[i] < virtual_bumper_params.radius)
            {
                points_inside_bumper++;
            }
        }

        if(min_range < virtual_bumper_params.radius)
        {
            msg_virtual_bumper_status.pointInsideBumper = true;
        }
        else
        {
            msg_virtual_bumper_status.pointInsideBumper = false;
        }

        msg_virtual_bumper_status.closestPointDistance = min_range;
        msg_virtual_bumper_status.closestPointDirection = -1*direction*180/3.14159265;

        pub.publish(msg_virtual_bumper_status);

        ros::spinOnce();
        ros::Duration(0.02).sleep();
	}

	return 0;	
}
