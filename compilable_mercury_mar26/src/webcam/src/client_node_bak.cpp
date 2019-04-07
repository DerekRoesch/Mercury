/*
 *   C++ UDP socket server for live image upstreaming
 *   Modified from http://cs.ecs.baylor.edu/~donahoo/practical/CSockets/practical/
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 */
#include <ros/ros.h>     
#include <iostream>               
#include <cstdlib>  
#include "opencv2/opencv.hpp"
#include <webcam/PracticalSocket.h>
#include <webcam/config.h>
#include <msgs_and_srvs/WebcamCommands.h>
#include <string>

using namespace std;        
using namespace cv;

class Command
{
private:
	ros::Subscriber sub_command;
	ros::NodeHandle node;
	void getCommandCallback(const msgs_and_srvs::WebcamCommands::ConstPtr &msg)
	{
		this->start = msg->start;
		this->serverAddress = msg->serverAddress;
		this->serverPort = msg->serverPort;
	}
public:
	bool start;
	string serverAddress;
	unsigned int serverPort;
	Command();
};

Command::Command()
{
	start = false;
	serverAddress = "0.0.0.0";
	serverPort = 0;
	sub_command = node.subscribe("packagename/nodename/webcamcommands", 1, &Command::getCommandCallback, this);
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "server_node");
    ROS_INFO("server_node running...");

    Command command;

    // if ((argc < 3) || (argc > 3)) 
    // { // Test for correct number of arguments
    //     cerr << "Usage: " << argv[0] << " <Server> <Server Port>\n";
    //     exit(1);
    // }

    // string servAddress = argv[1]; // First arg: server address
    // unsigned short servPort = Socket::resolveService(argv[2], "udp");

	try 
	{
	    UDPSocket sock;
	    int jpegqual =  ENCODE_QUALITY; // Compression Parameter

	    Mat frame, send;
	    vector < uchar > encoded;
	    VideoCapture cap(0); // Grab the camera
	    namedWindow("sending", CV_WINDOW_NORMAL);
	    if (!cap.isOpened()) 
	    {
	        cerr << "OpenCV Failed to open camera";
	        exit(1);
	    }

	    clock_t last_cycle = clock();

	    while(ros::ok())
	    {

	        if (command.start==true) 
	        {
	            cap >> frame;

	            if(frame.size().width==0) 
	            {
	                continue; //simple integrity check; skip erroneous data...
	            }
	            resize(frame, send, Size(FRAME_WIDTH, FRAME_HEIGHT), 0, 0, INTER_LINEAR);
	            vector < int > compression_params;
	            compression_params.push_back(CV_IMWRITE_JPEG_QUALITY);
	            compression_params.push_back(jpegqual);

	            imencode(".jpg", send, encoded, compression_params);
	            imshow("sending", send);
	            int total_pack = 1 + (encoded.size() - 1) / PACK_SIZE;

	            int ibuf[1];
	            ibuf[0] = total_pack;
	            sock.sendTo(ibuf, sizeof(int), command.serverAddress, command.serverPort);

	            for (int i = 0; i < total_pack; i++)
	            {
	                sock.sendTo( & encoded[i * PACK_SIZE], PACK_SIZE, command.serverAddress, command.serverPort);
	            }

	            waitKey(FRAME_INTERVAL);

	            clock_t next_cycle = clock();
	            double duration = (next_cycle - last_cycle) / (double) CLOCKS_PER_SEC;
	            cout << "\teffective FPS:" << (1 / duration) << " \tkbps:" << (PACK_SIZE * total_pack / duration / 1024 * 8) << endl;

	            cout << next_cycle - last_cycle;
	            last_cycle = next_cycle;
	        } // Destructor closes the socket
	        
	        ros::spinOnce();
	        ros::Duration(0.005).sleep();
		}
	}
	catch (SocketException & e) 
	{
	    cerr << e.what() << endl;
	    //exit(1);
	}

	return 0;	
}
