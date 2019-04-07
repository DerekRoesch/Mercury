cmake_minimum_required(VERSION 2.8.3)
project(lidar)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  msgs_and_srvs
)

## Generate messages in the 'msg' folder
# add_message_files(
#   FILES
#   Message1.msg
#   Message2.msg
# )

 generate_messages(
   DEPENDENCIES
   std_msgs
   msgs_and_srvs
 )



catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES lidar
  CATKIN_DEPENDS roscpp rospy std_msgs msgs_and_srvs
#  DEPENDS system_lib
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

add_executable(lidar_node src/lidar_node.cpp)
target_link_libraries(lidar_node ${catkin_LIBRARIES})
