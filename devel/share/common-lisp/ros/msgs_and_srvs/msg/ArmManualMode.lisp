; Auto-generated. Do not edit!


(cl:in-package msgs_and_srvs-msg)


;//! \htmlinclude ArmManualMode.msg.html

(cl:defclass <ArmManualMode> (roslisp-msg-protocol:ros-message)
  ((manualMode
    :reader manualMode
    :initarg :manualMode
    :type cl:boolean
    :initform cl:nil)
   (selectedJoint
    :reader selectedJoint
    :initarg :selectedJoint
    :type cl:string
    :initform ""))
)

(cl:defclass ArmManualMode (<ArmManualMode>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ArmManualMode>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ArmManualMode)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name msgs_and_srvs-msg:<ArmManualMode> is deprecated: use msgs_and_srvs-msg:ArmManualMode instead.")))

(cl:ensure-generic-function 'manualMode-val :lambda-list '(m))
(cl:defmethod manualMode-val ((m <ArmManualMode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:manualMode-val is deprecated.  Use msgs_and_srvs-msg:manualMode instead.")
  (manualMode m))

(cl:ensure-generic-function 'selectedJoint-val :lambda-list '(m))
(cl:defmethod selectedJoint-val ((m <ArmManualMode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:selectedJoint-val is deprecated.  Use msgs_and_srvs-msg:selectedJoint instead.")
  (selectedJoint m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ArmManualMode>) ostream)
  "Serializes a message object of type '<ArmManualMode>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'manualMode) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'selectedJoint))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'selectedJoint))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ArmManualMode>) istream)
  "Deserializes a message object of type '<ArmManualMode>"
    (cl:setf (cl:slot-value msg 'manualMode) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'selectedJoint) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'selectedJoint) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ArmManualMode>)))
  "Returns string type for a message object of type '<ArmManualMode>"
  "msgs_and_srvs/ArmManualMode")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ArmManualMode)))
  "Returns string type for a message object of type 'ArmManualMode"
  "msgs_and_srvs/ArmManualMode")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ArmManualMode>)))
  "Returns md5sum for a message object of type '<ArmManualMode>"
  "5e2c37a64ce17164b802f9f6014495cb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ArmManualMode)))
  "Returns md5sum for a message object of type 'ArmManualMode"
  "5e2c37a64ce17164b802f9f6014495cb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ArmManualMode>)))
  "Returns full string definition for message of type '<ArmManualMode>"
  (cl:format cl:nil "bool manualMode~%string selectedJoint~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ArmManualMode)))
  "Returns full string definition for message of type 'ArmManualMode"
  (cl:format cl:nil "bool manualMode~%string selectedJoint~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ArmManualMode>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'selectedJoint))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ArmManualMode>))
  "Converts a ROS message object to a list"
  (cl:list 'ArmManualMode
    (cl:cons ':manualMode (manualMode msg))
    (cl:cons ':selectedJoint (selectedJoint msg))
))
