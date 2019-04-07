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

#define BUF_LEN 65540

using namespace std;        
using namespace cv;

int main(int argc, char **argv)
{
	ros::init(argc, argv, "client_node");
    ROS_INFO("client_node running...");

	if (argc != 2) 
	{ // Test for correct number of arguments
	    cerr << "Usage: " << argv[0] << " <Server Port>" << endl;
	    exit(1);
	}

    unsigned short servPort = atoi(argv[1]); // First arg:  local port

    namedWindow("receiving", CV_WINDOW_NORMAL);
    try 
    {
        UDPSocket sock(servPort);

        char buffer[BUF_LEN]; // Buffer for echo string
        int recvMsgSize; // Size of received message
        string sourceAddress; // Address of datagram source
        unsigned short sourcePort; // Port of datagram source

        clock_t last_cycle = clock();

        while (1) 
        {
            // Block until receive message from a client
            do 
            {
				recvMsgSize = sock.recvFrom(buffer, BUF_LEN, sourceAddress, sourcePort);
            } while (recvMsgSize > sizeof(int));

            int total_pack = ((int * ) buffer)[0];

            cout << "expecting length of packs:" << total_pack << endl;
            char * longbuf = new char[PACK_SIZE * total_pack];
            for (int i = 0; i < total_pack; i++) 
            {
                recvMsgSize = sock.recvFrom(buffer, BUF_LEN, sourceAddress, sourcePort);
                if (recvMsgSize != PACK_SIZE) 
                {
                    cerr << "Received unexpected size pack:" << recvMsgSize << endl;
                    continue;
                }
                memcpy( & longbuf[i * PACK_SIZE], buffer, PACK_SIZE);
            }

            cout << "Received packet from " << sourceAddress << ":" << sourcePort << endl;
 
            Mat rawData = Mat(1, PACK_SIZE * total_pack, CV_8UC1, longbuf);
            Mat frame = imdecode(rawData, CV_LOAD_IMAGE_COLOR);
            if (frame.size().width == 0) 
            {
                cerr << "decode failure!" << endl;
                continue;
            }
            cv::transpose(frame, frame);
            cv::flip(frame, frame, 1);
            imshow("receiving", frame);
            free(longbuf);

            waitKey(1);
            clock_t next_cycle = clock();
            double duration = (next_cycle - last_cycle) / (double) CLOCKS_PER_SEC;
            cout << "\teffective FPS:" << (1 / duration) << " \tkbps:" << (PACK_SIZE * total_pack / duration / 1024 * 8) << endl;

            cout << next_cycle - last_cycle;
            last_cycle = next_cycle;
        }
    } 
    catch (SocketException & e) 
    {
        cerr << e.what() << endl;
        exit(1);
    }

    return 0;
}
