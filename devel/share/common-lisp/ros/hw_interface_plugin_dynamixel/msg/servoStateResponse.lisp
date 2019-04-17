; Auto-generated. Do not edit!


(cl:in-package hw_interface_plugin_dynamixel-msg)


;//! \htmlinclude servoStateResponse.msg.html

(cl:defclass <servoStateResponse> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (queryAbility
    :reader queryAbility
    :initarg :queryAbility
    :type cl:integer
    :initform 0)
   (uDATA
    :reader uDATA
    :initarg :uDATA
    :type cl:integer
    :initform 0)
   (sDATA
    :reader sDATA
    :initarg :sDATA
    :type cl:integer
    :initform 0))
)

(cl:defclass servoStateResponse (<servoStateResponse>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <servoStateResponse>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'servoStateResponse)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hw_interface_plugin_dynamixel-msg:<servoStateResponse> is deprecated: use hw_interface_plugin_dynamixel-msg:servoStateResponse instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <servoStateResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw_interface_plugin_dynamixel-msg:id-val is deprecated.  Use hw_interface_plugin_dynamixel-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'queryAbility-val :lambda-list '(m))
(cl:defmethod queryAbility-val ((m <servoStateResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw_interface_plugin_dynamixel-msg:queryAbility-val is deprecated.  Use hw_interface_plugin_dynamixel-msg:queryAbility instead.")
  (queryAbility m))

(cl:ensure-generic-function 'uDATA-val :lambda-list '(m))
(cl:defmethod uDATA-val ((m <servoStateResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw_interface_plugin_dynamixel-msg:uDATA-val is deprecated.  Use hw_interface_plugin_dynamixel-msg:uDATA instead.")
  (uDATA m))

(cl:ensure-generic-function 'sDATA-val :lambda-list '(m))
(cl:defmethod sDATA-val ((m <servoStateResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw_interface_plugin_dynamixel-msg:sDATA-val is deprecated.  Use hw_interface_plugin_dynamixel-msg:sDATA instead.")
  (sDATA m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<servoStateResponse>)))
    "Constants for message type '<servoStateResponse>"
  '((:ABILITY_NOP . 0)
    (:ABILITY_ANGLE_UNITS . 1)
    (:ABILITY_SPEED_UNITS . 2)
    (:ABILITY_RESOLUTION_DIVIDER . 4)
    (:ABILITY_WHEEL_MODE . 8)
    (:ABILITY_JOINT_MODE . 16)
    (:ABILITY_CCW_LIMIT . 32)
    (:ABILITY_CW_LIMIT . 64)
    (:ABILITY_INIT . 128)
    (:ABILITY_MOVING_SPEED . 256)
    (:ABILITY_GOAL_POSITION . 512)
    (:ABILITY_PRESENT_SPEED . 1024)
    (:ABILITY_PRESENT_POSITION . 2048)
    (:ABILITY_STATUS_RETURN_LEVEL . 4096)
    (:MODE_NOP . 0)
    (:MODE_GET . 1)
    (:MODE_SET . 2)
    (:MODE_QUERY . 4))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'servoStateResponse)))
    "Constants for message type 'servoStateResponse"
  '((:ABILITY_NOP . 0)
    (:ABILITY_ANGLE_UNITS . 1)
    (:ABILITY_SPEED_UNITS . 2)
    (:ABILITY_RESOLUTION_DIVIDER . 4)
    (:ABILITY_WHEEL_MODE . 8)
    (:ABILITY_JOINT_MODE . 16)
    (:ABILITY_CCW_LIMIT . 32)
    (:ABILITY_CW_LIMIT . 64)
    (:ABILITY_INIT . 128)
    (:ABILITY_MOVING_SPEED . 256)
    (:ABILITY_GOAL_POSITION . 512)
    (:ABILITY_PRESENT_SPEED . 1024)
    (:ABILITY_PRESENT_POSITION . 2048)
    (:ABILITY_STATUS_RETURN_LEVEL . 4096)
    (:MODE_NOP . 0)
    (:MODE_GET . 1)
    (:MODE_SET . 2)
    (:MODE_QUERY . 4))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <servoStateResponse>) ostream)
  "Serializes a message object of type '<servoStateResponse>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'queryAbility)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'queryAbility)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'queryAbility)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'queryAbility)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'queryAbility)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'queryAbility)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'queryAbility)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'queryAbility)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uDATA)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uDATA)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'uDATA)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'uDATA)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'sDATA)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <servoStateResponse>) istream)
  "Deserializes a message object of type '<servoStateResponse>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'queryAbility)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'queryAbility)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'queryAbility)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'queryAbility)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'queryAbility)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'queryAbility)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'queryAbility)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'queryAbility)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uDATA)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uDATA)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'uDATA)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'uDATA)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sDATA) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<servoStateResponse>)))
  "Returns string type for a message object of type '<servoStateResponse>"
  "hw_interface_plugin_dynamixel/servoStateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'servoStateResponse)))
  "Returns string type for a message object of type 'servoStateResponse"
  "hw_interface_plugin_dynamixel/servoStateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<servoStateResponse>)))
  "Returns md5sum for a message object of type '<servoStateResponse>"
  "9c96febecb04b5e21700ffa78c48387a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'servoStateResponse)))
  "Returns md5sum for a message object of type 'servoStateResponse"
  "9c96febecb04b5e21700ffa78c48387a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<servoStateResponse>)))
  "Returns full string definition for message of type '<servoStateResponse>"
  (cl:format cl:nil "uint64 ABILITY_NOP = 0~%uint64 ABILITY_ANGLE_UNITS=1~%uint64 ABILITY_SPEED_UNITS=2~%uint64 ABILITY_RESOLUTION_DIVIDER=4~%uint64 ABILITY_WHEEL_MODE=8~%uint64 ABILITY_JOINT_MODE=16~%uint64 ABILITY_CCW_LIMIT=32~%uint64 ABILITY_CW_LIMIT=64~%uint64 ABILITY_INIT=128~%uint64 ABILITY_MOVING_SPEED=256~%uint64 ABILITY_GOAL_POSITION=512~%uint64 ABILITY_PRESENT_SPEED=1024~%uint64 ABILITY_PRESENT_POSITION=2048~%uint64 ABILITY_STATUS_RETURN_LEVEL=4096~%uint8  MODE_NOP=0~%uint8  MODE_GET=1~%uint8  MODE_SET=2~%uint8  MODE_QUERY=4~%~%uint8   id~%uint64  queryAbility~%~%uint32  uDATA~%int32  sDATA~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'servoStateResponse)))
  "Returns full string definition for message of type 'servoStateResponse"
  (cl:format cl:nil "uint64 ABILITY_NOP = 0~%uint64 ABILITY_ANGLE_UNITS=1~%uint64 ABILITY_SPEED_UNITS=2~%uint64 ABILITY_RESOLUTION_DIVIDER=4~%uint64 ABILITY_WHEEL_MODE=8~%uint64 ABILITY_JOINT_MODE=16~%uint64 ABILITY_CCW_LIMIT=32~%uint64 ABILITY_CW_LIMIT=64~%uint64 ABILITY_INIT=128~%uint64 ABILITY_MOVING_SPEED=256~%uint64 ABILITY_GOAL_POSITION=512~%uint64 ABILITY_PRESENT_SPEED=1024~%uint64 ABILITY_PRESENT_POSITION=2048~%uint64 ABILITY_STATUS_RETURN_LEVEL=4096~%uint8  MODE_NOP=0~%uint8  MODE_GET=1~%uint8  MODE_SET=2~%uint8  MODE_QUERY=4~%~%uint8   id~%uint64  queryAbility~%~%uint32  uDATA~%int32  sDATA~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <servoStateResponse>))
  (cl:+ 0
     1
     8
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <servoStateResponse>))
  "Converts a ROS message object to a list"
  (cl:list 'servoStateResponse
    (cl:cons ':id (id msg))
    (cl:cons ':queryAbility (queryAbility msg))
    (cl:cons ':uDATA (uDATA msg))
    (cl:cons ':sDATA (sDATA msg))
))
