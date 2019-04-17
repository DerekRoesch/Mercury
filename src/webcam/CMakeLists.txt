cmake_minimum_required(VERSION 2.8.3)
project(webcam)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  msgs_and_srvs
  image_transport
  cv_bridge
)

find_package( OpenCV REQUIRED )

## Generate messages in the 'msg' folder
# add_message_files(
#   FILES
#   Message1.msg
#   Message2.msg
# )

 generate_messages(
   DEPENDENCIES
 )



catkin_package(
  INCLUDE_DIRS include
#  LIBRARIES lidar
  CATKIN_DEPENDS roscpp rospy 
#  DEPENDS system_lib
)

include_directories(
	include
  ${catkin_INCLUDE_DIRS}
)

# add_executable(lidar_node src/lidar_node.cpp)
# target_link_libraries(lidar_node ${catkin_LIBRARIES})

add_executable( client_node src/client_node.cpp src/PracticalSocket.cpp )
target_link_libraries( client_node ${OpenCV_LIBS} ${catkin_LIBRARIES})
add_executable( server_node src/server_node.cpp src/PracticalSocket.cpp )
target_link_libraries( server_node ${OpenCV_LIBS} ${catkin_LIBRARIES})
add_executable( publish_images_node src/publish_images_node.cpp )
target_link_libraries( publish_images_node ${OpenCV_LIBS} ${catkin_LIBRARIES})

# add_executable( server Server.cpp PracticalSocket.cpp )
# target_link_libraries( server ${OpenCV_LIBS} )
# add_executable( client Client.cpp PracticalSocket.cpp )
# target_link_libraries( client ${OpenCV_LIBS} )