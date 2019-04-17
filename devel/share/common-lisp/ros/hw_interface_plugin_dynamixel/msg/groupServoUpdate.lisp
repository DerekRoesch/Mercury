; Auto-generated. Do not edit!


(cl:in-package hw_interface_plugin_dynamixel-msg)


;//! \htmlinclude groupServoUpdate.msg.html

(cl:defclass <groupServoUpdate> (roslisp-msg-protocol:ros-message)
  ((updateVector
    :reader updateVector
    :initarg :updateVector
    :type (cl:vector hw_interface_plugin_dynamixel-msg:servoUpdate)
   :initform (cl:make-array 0 :element-type 'hw_interface_plugin_dynamixel-msg:servoUpdate :initial-element (cl:make-instance 'hw_interface_plugin_dynamixel-msg:servoUpdate))))
)

(cl:defclass groupServoUpdate (<groupServoUpdate>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <groupServoUpdate>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'groupServoUpdate)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hw_interface_plugin_dynamixel-msg:<groupServoUpdate> is deprecated: use hw_interface_plugin_dynamixel-msg:groupServoUpdate instead.")))

(cl:ensure-generic-function 'updateVector-val :lambda-list '(m))
(cl:defmethod updateVector-val ((m <groupServoUpdate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw_interface_plugin_dynamixel-msg:updateVector-val is deprecated.  Use hw_interface_plugin_dynamixel-msg:updateVector instead.")
  (updateVector m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <groupServoUpdate>) ostream)
  "Serializes a message object of type '<groupServoUpdate>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'updateVector))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'updateVector))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <groupServoUpdate>) istream)
  "Deserializes a message object of type '<groupServoUpdate>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'updateVector) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'updateVector)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'hw_interface_plugin_dynamixel-msg:servoUpdate))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<groupServoUpdate>)))
  "Returns string type for a message object of type '<groupServoUpdate>"
  "hw_interface_plugin_dynamixel/groupServoUpdate")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'groupServoUpdate)))
  "Returns string type for a message object of type 'groupServoUpdate"
  "hw_interface_plugin_dynamixel/groupServoUpdate")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<groupServoUpdate>)))
  "Returns md5sum for a message object of type '<groupServoUpdate>"
  "e6ee49bcc6a9ac8d662236a4935e5ee8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'groupServoUpdate)))
  "Returns md5sum for a message object of type 'groupServoUpdate"
  "e6ee49bcc6a9ac8d662236a4935e5ee8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<groupServoUpdate>)))
  "Returns full string definition for message of type '<groupServoUpdate>"
  (cl:format cl:nil "servoUpdate[] updateVector~%~%================================================================================~%MSG: hw_interface_plugin_dynamixel/servoUpdate~%uint64 ABILITY_NOP = 0~%uint64 ABILITY_ANGLE_UNITS=1~%uint64 ABILITY_SPEED_UNITS=2~%uint64 ABILITY_RESOLUTION_DIVIDER=4~%uint64 ABILITY_WHEEL_MODE=8~%uint64 ABILITY_JOINT_MODE=16~%uint64 ABILITY_CCW_LIMIT=32~%uint64 ABILITY_CW_LIMIT=64~%uint64 ABILITY_INIT=128~%uint64 ABILITY_MOVING_SPEED=256~%uint64 ABILITY_GOAL_POSITION=512~%uint64 ABILITY_PRESENT_SPEED=1024~%uint64 ABILITY_PRESENT_POSITION=2048~%uint64 ABILITY_STATUS_RETURN_LEVEL=4096~%uint64 ABILITY_OPERATING_MODE=8192~%uint64 ABILITY_TORQUE_ENABLE=16384~%uint64 ABILITY_PRESENT_CURRENT=32768~%uint64 ABILITY_TORQUE_LIMIT=65536~%uint64 ABILITY_GOAL_TORQUE=131072~%uint64 ABILITY_BAUD_RATE=262144~%uint8  MODE_NOP=0~%uint8  MODE_GET=1~%uint8  MODE_SET=2~%uint8  MODE_QUERY=4~%~%~%~%uint8   id~%uint64  abilityRequested~%uint8   mode~%~%bool    isDataSigned~%~%uint32  uDATA~%int32   sDATA~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'groupServoUpdate)))
  "Returns full string definition for message of type 'groupServoUpdate"
  (cl:format cl:nil "servoUpdate[] updateVector~%~%================================================================================~%MSG: hw_interface_plugin_dynamixel/servoUpdate~%uint64 ABILITY_NOP = 0~%uint64 ABILITY_ANGLE_UNITS=1~%uint64 ABILITY_SPEED_UNITS=2~%uint64 ABILITY_RESOLUTION_DIVIDER=4~%uint64 ABILITY_WHEEL_MODE=8~%uint64 ABILITY_JOINT_MODE=16~%uint64 ABILITY_CCW_LIMIT=32~%uint64 ABILITY_CW_LIMIT=64~%uint64 ABILITY_INIT=128~%uint64 ABILITY_MOVING_SPEED=256~%uint64 ABILITY_GOAL_POSITION=512~%uint64 ABILITY_PRESENT_SPEED=1024~%uint64 ABILITY_PRESENT_POSITION=2048~%uint64 ABILITY_STATUS_RETURN_LEVEL=4096~%uint64 ABILITY_OPERATING_MODE=8192~%uint64 ABILITY_TORQUE_ENABLE=16384~%uint64 ABILITY_PRESENT_CURRENT=32768~%uint64 ABILITY_TORQUE_LIMIT=65536~%uint64 ABILITY_GOAL_TORQUE=131072~%uint64 ABILITY_BAUD_RATE=262144~%uint8  MODE_NOP=0~%uint8  MODE_GET=1~%uint8  MODE_SET=2~%uint8  MODE_QUERY=4~%~%~%~%uint8   id~%uint64  abilityRequested~%uint8   mode~%~%bool    isDataSigned~%~%uint32  uDATA~%int32   sDATA~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <groupServoUpdate>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'updateVector) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <groupServoUpdate>))
  "Converts a ROS message object to a list"
  (cl:list 'groupServoUpdate
    (cl:cons ':updateVector (updateVector msg))
))
