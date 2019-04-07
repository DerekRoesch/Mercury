# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(WARNING "Invoking generate_messages() without having added any message or service file before.
You should either add add_message_files() and/or add_service_files() calls or remove the invocation of generate_messages().")
message(STATUS "lidar: 0 messages, 0 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Imsgs_and_srvs:/home/derekroesch/catkin_ws/Compilable Mercury Mar26/src/msgs_and_srvs/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(lidar_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_cpp(lidar
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lidar
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(lidar_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(lidar_generate_messages lidar_generate_messages_cpp)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(lidar_gencpp)
add_dependencies(lidar_gencpp lidar_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lidar_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_eus(lidar
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lidar
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(lidar_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(lidar_generate_messages lidar_generate_messages_eus)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(lidar_geneus)
add_dependencies(lidar_geneus lidar_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lidar_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_lisp(lidar
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lidar
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(lidar_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(lidar_generate_messages lidar_generate_messages_lisp)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(lidar_genlisp)
add_dependencies(lidar_genlisp lidar_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lidar_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_nodejs(lidar
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lidar
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(lidar_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(lidar_generate_messages lidar_generate_messages_nodejs)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(lidar_gennodejs)
add_dependencies(lidar_gennodejs lidar_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lidar_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_py(lidar
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lidar
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(lidar_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(lidar_generate_messages lidar_generate_messages_py)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(lidar_genpy)
add_dependencies(lidar_genpy lidar_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lidar_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lidar)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lidar
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(lidar_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET msgs_and_srvs_generate_messages_cpp)
  add_dependencies(lidar_generate_messages_cpp msgs_and_srvs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lidar)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lidar
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(lidar_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET msgs_and_srvs_generate_messages_eus)
  add_dependencies(lidar_generate_messages_eus msgs_and_srvs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lidar)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lidar
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(lidar_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET msgs_and_srvs_generate_messages_lisp)
  add_dependencies(lidar_generate_messages_lisp msgs_and_srvs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lidar)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lidar
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(lidar_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET msgs_and_srvs_generate_messages_nodejs)
  add_dependencies(lidar_generate_messages_nodejs msgs_and_srvs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lidar)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lidar\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lidar
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(lidar_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET msgs_and_srvs_generate_messages_py)
  add_dependencies(lidar_generate_messages_py msgs_and_srvs_generate_messages_py)
endif()