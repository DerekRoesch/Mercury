/*
 *   C++ UDP socket server for live image upstreaming
 *   Modified from http://cs.ecs.baylor.edu/~donahoo/practical/CSockets/practical/
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 * To view compressed images run:
 * rosrun image_view image_view image:=/webcam/publishimages/image _image_transport:=compressed
 */
#include <ros/ros.h>     
#include <iostream>               
#include <cstdlib>  
#include "opencv2/opencv.hpp"
#include <webcam/config.h>
#include <msgs_and_srvs/WebcamCommands.h>
#include <string>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>

using namespace std;        
using namespace cv;

int main(int argc, char **argv)
{
	ros::init(argc, argv, "publish_image_node");
    ROS_INFO("publish_image_node running...");

	ros::NodeHandle nh;
	image_transport::ImageTransport it(nh);
	image_transport::Publisher pub = it.advertise("webcam/publishimages/image", 1);
	sensor_msgs::ImagePtr msg_image;

    VideoCapture cap(0); // Grab the camera
    namedWindow("sending", CV_WINDOW_NORMAL);
    if (!cap.isOpened()) 
    {
        cerr << "OpenCV Failed to open camera";
        exit(1);
    }

    clock_t last_cycle = clock();

    Mat frame, grey, send;
    //Mat temp = imread("/home/jared/Desktop/allrgb.png");
    while(ros::ok())
    {
        cap >> frame;
        //frame = temp.clone();
        

        if(frame.size().width==0) 
        {
            continue; //simple integrity check; skip erroneous data...
        }


        cv::cvtColor(frame, grey, cv::COLOR_BGR2GRAY);
        resize(grey, send, Size(1280/4, 720/4), 0, 0, INTER_LINEAR);
        
        imshow("sending", send);
        waitKey(FRAME_INTERVAL);

        clock_t next_cycle = clock();
        double duration = (next_cycle - last_cycle) / (double) CLOCKS_PER_SEC;
        cout << "\teffective FPS:" << (1 / duration) << endl;

        cout << next_cycle - last_cycle;
        last_cycle = next_cycle;
        
        msg_image = cv_bridge::CvImage(std_msgs::Header(), "bgr8", send).toImageMsg();
        pub.publish(msg_image);

        ros::spinOnce();
        ros::Duration(0.083).sleep();
	}

	return 0;	
}
