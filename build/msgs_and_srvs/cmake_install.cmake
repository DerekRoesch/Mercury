# Install script for directory: /home/derekroesch/catkin_ws/src/msgs_and_srvs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/derekroesch/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/msgs_and_srvs/msg" TYPE FILE FILES
    "/home/derekroesch/catkin_ws/src/msgs_and_srvs/msg/DriveVector.msg"
    "/home/derekroesch/catkin_ws/src/msgs_and_srvs/msg/VirtualBumperParams.msg"
    "/home/derekroesch/catkin_ws/src/msgs_and_srvs/msg/VirtualBumperStatus.msg"
    "/home/derekroesch/catkin_ws/src/msgs_and_srvs/msg/ServoCommands.msg"
    "/home/derekroesch/catkin_ws/src/msgs_and_srvs/msg/ServoFeedback.msg"
    "/home/derekroesch/catkin_ws/src/msgs_and_srvs/msg/NavStates.msg"
    "/home/derekroesch/catkin_ws/src/msgs_and_srvs/msg/DriveCommands.msg"
    "/home/derekroesch/catkin_ws/src/msgs_and_srvs/msg/WebcamCommands.msg"
    "/home/derekroesch/catkin_ws/src/msgs_and_srvs/msg/ArmManualMode.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/msgs_and_srvs/cmake" TYPE FILE FILES "/home/derekroesch/catkin_ws/build/msgs_and_srvs/catkin_generated/installspace/msgs_and_srvs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/derekroesch/catkin_ws/devel/include/msgs_and_srvs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/derekroesch/catkin_ws/devel/share/roseus/ros/msgs_and_srvs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/derekroesch/catkin_ws/devel/share/common-lisp/ros/msgs_and_srvs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/derekroesch/catkin_ws/devel/share/gennodejs/ros/msgs_and_srvs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/derekroesch/catkin_ws/devel/lib/python2.7/dist-packages/msgs_and_srvs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/derekroesch/catkin_ws/devel/lib/python2.7/dist-packages/msgs_and_srvs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/derekroesch/catkin_ws/build/msgs_and_srvs/catkin_generated/installspace/msgs_and_srvs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/msgs_and_srvs/cmake" TYPE FILE FILES "/home/derekroesch/catkin_ws/build/msgs_and_srvs/catkin_generated/installspace/msgs_and_srvs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/msgs_and_srvs/cmake" TYPE FILE FILES
    "/home/derekroesch/catkin_ws/build/msgs_and_srvs/catkin_generated/installspace/msgs_and_srvsConfig.cmake"
    "/home/derekroesch/catkin_ws/build/msgs_and_srvs/catkin_generated/installspace/msgs_and_srvsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/msgs_and_srvs" TYPE FILE FILES "/home/derekroesch/catkin_ws/src/msgs_and_srvs/package.xml")
endif()

