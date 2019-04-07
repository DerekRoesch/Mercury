; Auto-generated. Do not edit!


(cl:in-package hw_interface_plugin_dynamixel-msg)


;//! \htmlinclude servoUpdate.msg.html

(cl:defclass <servoUpdate> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (abilityRequested
    :reader abilityRequested
    :initarg :abilityRequested
    :type cl:integer
    :initform 0)
   (mode
    :reader mode
    :initarg :mode
    :type cl:fixnum
    :initform 0)
   (isDataSigned
    :reader isDataSigned
    :initarg :isDataSigned
    :type cl:boolean
    :initform cl:nil)
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

(cl:defclass servoUpdate (<servoUpdate>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <servoUpdate>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'servoUpdate)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hw_interface_plugin_dynamixel-msg:<servoUpdate> is deprecated: use hw_interface_plugin_dynamixel-msg:servoUpdate instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <servoUpdate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw_interface_plugin_dynamixel-msg:id-val is deprecated.  Use hw_interface_plugin_dynamixel-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'abilityRequested-val :lambda-list '(m))
(cl:defmethod abilityRequested-val ((m <servoUpdate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw_interface_plugin_dynamixel-msg:abilityRequested-val is deprecated.  Use hw_interface_plugin_dynamixel-msg:abilityRequested instead.")
  (abilityRequested m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <servoUpdate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw_interface_plugin_dynamixel-msg:mode-val is deprecated.  Use hw_interface_plugin_dynamixel-msg:mode instead.")
  (mode m))

(cl:ensure-generic-function 'isDataSigned-val :lambda-list '(m))
(cl:defmethod isDataSigned-val ((m <servoUpdate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw_interface_plugin_dynamixel-msg:isDataSigned-val is deprecated.  Use hw_interface_plugin_dynamixel-msg:isDataSigned instead.")
  (isDataSigned m))

(cl:ensure-generic-function 'uDATA-val :lambda-list '(m))
(cl:defmethod uDATA-val ((m <servoUpdate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw_interface_plugin_dynamixel-msg:uDATA-val is deprecated.  Use hw_interface_plugin_dynamixel-msg:uDATA instead.")
  (uDATA m))

(cl:ensure-generic-function 'sDATA-val :lambda-list '(m))
(cl:defmethod sDATA-val ((m <servoUpdate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw_interface_plugin_dynamixel-msg:sDATA-val is deprecated.  Use hw_interface_plugin_dynamixel-msg:sDATA instead.")
  (sDATA m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<servoUpdate>)))
    "Constants for message type '<servoUpdate>"
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
    (:ABILITY_OPERATING_MODE . 8192)
    (:ABILITY_TORQUE . 16384)
    (:ABILITY_PRESENT_CURRENT . 32768)
    (:ABILITY_TORQUE_LIMIT . 65536)
    (:ABILITY_GOAL_TORQUE . 131072)
    (:MODE_NOP . 0)
    (:MODE_GET . 1)
    (:MODE_SET . 2)
    (:MODE_QUERY . 4))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'servoUpdate)))
    "Constants for message type 'servoUpdate"
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
    (:ABILITY_OPERATING_MODE . 8192)
    (:ABILITY_TORQUE . 16384)
    (:ABILITY_PRESENT_CURRENT . 32768)
    (:ABILITY_TORQUE_LIMIT . 65536)
    (:ABILITY_GOAL_TORQUE . 131072)
    (:MODE_NOP . 0)
    (:MODE_GET . 1)
    (:MODE_SET . 2)
    (:MODE_QUERY . 4))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <servoUpdate>) ostream)
  "Serializes a message object of type '<servoUpdate>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'abilityRequested)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'abilityRequested)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'abilityRequested)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'abilityRequested)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'abilityRequested)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'abilityRequested)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'abilityRequested)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'abilityRequested)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'isDataSigned) 1 0)) ostream)
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <servoUpdate>) istream)
  "Deserializes a message object of type '<servoUpdate>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'abilityRequested)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'abilityRequested)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'abilityRequested)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'abilityRequested)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'abilityRequested)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'abilityRequested)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'abilityRequested)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'abilityRequested)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'isDataSigned) (cl:not (cl:zerop (cl:read-byte istream))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<servoUpdate>)))
  "Returns string type for a message object of type '<servoUpdate>"
  "hw_interface_plugin_dynamixel/servoUpdate")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'servoUpdate)))
  "Returns string type for a message object of type 'servoUpdate"
  "hw_interface_plugin_dynamixel/servoUpdate")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<servoUpdate>)))
  "Returns md5sum for a message object of type '<servoUpdate>"
  "aec93516bd00d77b6c5579d881a6bf44")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'servoUpdate)))
  "Returns md5sum for a message object of type 'servoUpdate"
  "aec93516bd00d77b6c5579d881a6bf44")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<servoUpdate>)))
  "Returns full string definition for message of type '<servoUpdate>"
  (cl:format cl:nil "uint64 ABILITY_NOP = 0~%uint64 ABILITY_ANGLE_UNITS=1~%uint64 ABILITY_SPEED_UNITS=2~%uint64 ABILITY_RESOLUTION_DIVIDER=4~%uint64 ABILITY_WHEEL_MODE=8~%uint64 ABILITY_JOINT_MODE=16~%uint64 ABILITY_CCW_LIMIT=32~%uint64 ABILITY_CW_LIMIT=64~%uint64 ABILITY_INIT=128~%uint64 ABILITY_MOVING_SPEED=256~%uint64 ABILITY_GOAL_POSITION=512~%uint64 ABILITY_PRESENT_SPEED=1024~%uint64 ABILITY_PRESENT_POSITION=2048~%uint64 ABILITY_STATUS_RETURN_LEVEL=4096~%uint64 ABILITY_OPERATING_MODE=8192~%uint64 ABILITY_TORQUE=16384~%uint64 ABILITY_PRESENT_CURRENT=32768~%uint64 ABILITY_TORQUE_LIMIT=65536~%uint64 ABILITY_GOAL_TORQUE=131072~%uint8  MODE_NOP=0~%uint8  MODE_GET=1~%uint8  MODE_SET=2~%uint8  MODE_QUERY=4~%~%~%~%uint8   id~%uint64  abilityRequested~%uint8   mode~%~%bool    isDataSigned~%~%uint32  uDATA~%int32   sDATA~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'servoUpdate)))
  "Returns full string definition for message of type 'servoUpdate"
  (cl:format cl:nil "uint64 ABILITY_NOP = 0~%uint64 ABILITY_ANGLE_UNITS=1~%uint64 ABILITY_SPEED_UNITS=2~%uint64 ABILITY_RESOLUTION_DIVIDER=4~%uint64 ABILITY_WHEEL_MODE=8~%uint64 ABILITY_JOINT_MODE=16~%uint64 ABILITY_CCW_LIMIT=32~%uint64 ABILITY_CW_LIMIT=64~%uint64 ABILITY_INIT=128~%uint64 ABILITY_MOVING_SPEED=256~%uint64 ABILITY_GOAL_POSITION=512~%uint64 ABILITY_PRESENT_SPEED=1024~%uint64 ABILITY_PRESENT_POSITION=2048~%uint64 ABILITY_STATUS_RETURN_LEVEL=4096~%uint64 ABILITY_OPERATING_MODE=8192~%uint64 ABILITY_TORQUE=16384~%uint64 ABILITY_PRESENT_CURRENT=32768~%uint64 ABILITY_TORQUE_LIMIT=65536~%uint64 ABILITY_GOAL_TORQUE=131072~%uint8  MODE_NOP=0~%uint8  MODE_GET=1~%uint8  MODE_SET=2~%uint8  MODE_QUERY=4~%~%~%~%uint8   id~%uint64  abilityRequested~%uint8   mode~%~%bool    isDataSigned~%~%uint32  uDATA~%int32   sDATA~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <servoUpdate>))
  (cl:+ 0
     1
     8
     1
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <servoUpdate>))
  "Converts a ROS message object to a list"
  (cl:list 'servoUpdate
    (cl:cons ':id (id msg))
    (cl:cons ':abilityRequested (abilityRequested msg))
    (cl:cons ':mode (mode msg))
    (cl:cons ':isDataSigned (isDataSigned msg))
    (cl:cons ':uDATA (uDATA msg))
    (cl:cons ':sDATA (sDATA msg))
))
