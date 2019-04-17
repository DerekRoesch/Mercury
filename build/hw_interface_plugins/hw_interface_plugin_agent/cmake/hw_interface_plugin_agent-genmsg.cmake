# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "hw_interface_plugin_agent: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ihw_interface_plugin_agent:/home/derekroesch/catkin_ws/src/hw_interface_plugins/hw_interface_plugin_agent/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(hw_interface_plugin_agent_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/derekroesch/catkin_ws/src/hw_interface_plugins/hw_interface_plugin_agent/msg/LOS.msg" NAME_WE)
add_custom_target(_hw_interface_plugin_agent_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hw_interface_plugin_agent" "/home/derekroesch/catkin_ws/src/hw_interface_plugins/hw_interface_plugin_agent/msg/LOS.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(hw_interface_plugin_agent
  "/home/derekroesch/catkin_ws/src/hw_interface_plugins/hw_interface_plugin_agent/msg/LOS.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hw_interface_plugin_agent
)

### Generating Services

### Generating Module File
_generate_module_cpp(hw_interface_plugin_agent
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hw_interface_plugin_agent
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(hw_interface_plugin_agent_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(hw_interface_plugin_agent_generate_messages hw_interface_plugin_agent_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/derekroesch/catkin_ws/src/hw_interface_plugins/hw_interface_plugin_agent/msg/LOS.msg" NAME_WE)
add_dependencies(hw_interface_plugin_agent_generate_messages_cpp _hw_interface_plugin_agent_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hw_interface_plugin_agent_gencpp)
add_dependencies(hw_interface_plugin_agent_gencpp hw_interface_plugin_agent_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hw_interface_plugin_agent_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(hw_interface_plugin_agent
  "/home/derekroesch/catkin_ws/src/hw_interface_plugins/hw_interface_plugin_agent/msg/LOS.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hw_interface_plugin_agent
)

### Generating Services

### Generating Module File
_generate_module_eus(hw_interface_plugin_agent
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hw_interface_plugin_agent
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(hw_interface_plugin_agent_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(hw_interface_plugin_agent_generate_messages hw_interface_plugin_agent_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/derekroesch/catkin_ws/src/hw_interface_plugins/hw_interface_plugin_agent/msg/LOS.msg" NAME_WE)
add_dependencies(hw_interface_plugin_agent_generate_messages_eus _hw_interface_plugin_agent_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hw_interface_plugin_agent_geneus)
add_dependencies(hw_interface_plugin_agent_geneus hw_interface_plugin_agent_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hw_interface_plugin_agent_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(hw_interface_plugin_agent
  "/home/derekroesch/catkin_ws/src/hw_interface_plugins/hw_interface_plugin_agent/msg/LOS.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hw_interface_plugin_agent
)

### Generating Services

### Generating Module File
_generate_module_lisp(hw_interface_plugin_agent
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hw_interface_plugin_agent
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(hw_interface_plugin_agent_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(hw_interface_plugin_agent_generate_messages hw_interface_plugin_agent_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/derekroesch/catkin_ws/src/hw_interface_plugins/hw_interface_plugin_agent/msg/LOS.msg" NAME_WE)
add_dependencies(hw_interface_plugin_agent_generate_messages_lisp _hw_interface_plugin_agent_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hw_interface_plugin_agent_genlisp)
add_dependencies(hw_interface_plugin_agent_genlisp hw_interface_plugin_agent_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hw_interface_plugin_agent_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(hw_interface_plugin_agent
  "/home/derekroesch/catkin_ws/src/hw_interface_plugins/hw_interface_plugin_agent/msg/LOS.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hw_interface_plugin_agent
)

### Generating Services

### Generating Module File
_generate_module_nodejs(hw_interface_plugin_agent
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hw_interface_plugin_agent
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(hw_interface_plugin_agent_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(hw_interface_plugin_agent_generate_messages hw_interface_plugin_agent_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/derekroesch/catkin_ws/src/hw_interface_plugins/hw_interface_plugin_agent/msg/LOS.msg" NAME_WE)
add_dependencies(hw_interface_plugin_agent_generate_messages_nodejs _hw_interface_plugin_agent_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hw_interface_plugin_agent_gennodejs)
add_dependencies(hw_interface_plugin_agent_gennodejs hw_interface_plugin_agent_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hw_interface_plugin_agent_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(hw_interface_plugin_agent
  "/home/derekroesch/catkin_ws/src/hw_interface_plugins/hw_interface_plugin_agent/msg/LOS.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hw_interface_plugin_agent
)

### Generating Services

### Generating Module File
_generate_module_py(hw_interface_plugin_agent
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hw_interface_plugin_agent
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(hw_interface_plugin_agent_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(hw_interface_plugin_agent_generate_messages hw_interface_plugin_agent_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/derekroesch/catkin_ws/src/hw_interface_plugins/hw_interface_plugin_agent/msg/LOS.msg" NAME_WE)
add_dependencies(hw_interface_plugin_agent_generate_messages_py _hw_interface_plugin_agent_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hw_interface_plugin_agent_genpy)
add_dependencies(hw_interface_plugin_agent_genpy hw_interface_plugin_agent_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hw_interface_plugin_agent_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hw_interface_plugin_agent)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hw_interface_plugin_agent
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hw_interface_plugin_agent)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hw_interface_plugin_agent
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hw_interface_plugin_agent)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hw_interface_plugin_agent
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hw_interface_plugin_agent)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hw_interface_plugin_agent
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hw_interface_plugin_agent)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hw_interface_plugin_agent\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hw_interface_plugin_agent
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
