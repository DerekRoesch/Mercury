# Install script for directory: /home/derekroesch/catkin_ws/Compilable Mercury Mar26/src/hw_interface_plugins/hw_interface_plugin_arm

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/derekroesch/catkin_ws/Compilable Mercury Mar26/install")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hw_interface_plugin_arm/msg" TYPE FILE FILES "/home/derekroesch/catkin_ws/Compilable Mercury Mar26/src/hw_interface_plugins/hw_interface_plugin_arm/msg/armPosition.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hw_interface_plugin_arm/cmake" TYPE FILE FILES "/home/derekroesch/catkin_ws/Compilable Mercury Mar26/build/hw_interface_plugins/hw_interface_plugin_arm/catkin_generated/installspace/hw_interface_plugin_arm-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/derekroesch/catkin_ws/Compilable Mercury Mar26/devel/include/hw_interface_plugin_arm")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/derekroesch/catkin_ws/Compilable Mercury Mar26/devel/share/roseus/ros/hw_interface_plugin_arm")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/derekroesch/catkin_ws/Compilable Mercury Mar26/devel/share/common-lisp/ros/hw_interface_plugin_arm")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/derekroesch/catkin_ws/Compilable Mercury Mar26/devel/share/gennodejs/ros/hw_interface_plugin_arm")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/derekroesch/catkin_ws/Compilable Mercury Mar26/devel/lib/python2.7/dist-packages/hw_interface_plugin_arm")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/derekroesch/catkin_ws/Compilable Mercury Mar26/devel/lib/python2.7/dist-packages/hw_interface_plugin_arm")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/derekroesch/catkin_ws/Compilable Mercury Mar26/build/hw_interface_plugins/hw_interface_plugin_arm/catkin_generated/installspace/hw_interface_plugin_arm.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hw_interface_plugin_arm/cmake" TYPE FILE FILES "/home/derekroesch/catkin_ws/Compilable Mercury Mar26/build/hw_interface_plugins/hw_interface_plugin_arm/catkin_generated/installspace/hw_interface_plugin_arm-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hw_interface_plugin_arm/cmake" TYPE FILE FILES
    "/home/derekroesch/catkin_ws/Compilable Mercury Mar26/build/hw_interface_plugins/hw_interface_plugin_arm/catkin_generated/installspace/hw_interface_plugin_armConfig.cmake"
    "/home/derekroesch/catkin_ws/Compilable Mercury Mar26/build/hw_interface_plugins/hw_interface_plugin_arm/catkin_generated/installspace/hw_interface_plugin_armConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hw_interface_plugin_arm" TYPE FILE FILES "/home/derekroesch/catkin_ws/Compilable Mercury Mar26/src/hw_interface_plugins/hw_interface_plugin_arm/package.xml")
endif()

