; Auto-generated. Do not edit!


(cl:in-package msgs_and_srvs-msg)


;//! \htmlinclude VirtualBumperStatus.msg.html

(cl:defclass <VirtualBumperStatus> (roslisp-msg-protocol:ros-message)
  ((pointInsideBumper
    :reader pointInsideBumper
    :initarg :pointInsideBumper
    :type cl:boolean
    :initform cl:nil)
   (closestPointDistance
    :reader closestPointDistance
    :initarg :closestPointDistance
    :type cl:float
    :initform 0.0)
   (closestPointDirection
    :reader closestPointDirection
    :initarg :closestPointDirection
    :type cl:float
    :initform 0.0))
)

(cl:defclass VirtualBumperStatus (<VirtualBumperStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VirtualBumperStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VirtualBumperStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name msgs_and_srvs-msg:<VirtualBumperStatus> is deprecated: use msgs_and_srvs-msg:VirtualBumperStatus instead.")))

(cl:ensure-generic-function 'pointInsideBumper-val :lambda-list '(m))
(cl:defmethod pointInsideBumper-val ((m <VirtualBumperStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:pointInsideBumper-val is deprecated.  Use msgs_and_srvs-msg:pointInsideBumper instead.")
  (pointInsideBumper m))

(cl:ensure-generic-function 'closestPointDistance-val :lambda-list '(m))
(cl:defmethod closestPointDistance-val ((m <VirtualBumperStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:closestPointDistance-val is deprecated.  Use msgs_and_srvs-msg:closestPointDistance instead.")
  (closestPointDistance m))

(cl:ensure-generic-function 'closestPointDirection-val :lambda-list '(m))
(cl:defmethod closestPointDirection-val ((m <VirtualBumperStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:closestPointDirection-val is deprecated.  Use msgs_and_srvs-msg:closestPointDirection instead.")
  (closestPointDirection m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VirtualBumperStatus>) ostream)
  "Serializes a message object of type '<VirtualBumperStatus>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'pointInsideBumper) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'closestPointDistance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'closestPointDirection))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VirtualBumperStatus>) istream)
  "Deserializes a message object of type '<VirtualBumperStatus>"
    (cl:setf (cl:slot-value msg 'pointInsideBumper) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'closestPointDistance) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'closestPointDirection) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VirtualBumperStatus>)))
  "Returns string type for a message object of type '<VirtualBumperStatus>"
  "msgs_and_srvs/VirtualBumperStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VirtualBumperStatus)))
  "Returns string type for a message object of type 'VirtualBumperStatus"
  "msgs_and_srvs/VirtualBumperStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VirtualBumperStatus>)))
  "Returns md5sum for a message object of type '<VirtualBumperStatus>"
  "04d921a3fed1e194d4292fdcb5f3f0a3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VirtualBumperStatus)))
  "Returns md5sum for a message object of type 'VirtualBumperStatus"
  "04d921a3fed1e194d4292fdcb5f3f0a3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VirtualBumperStatus>)))
  "Returns full string definition for message of type '<VirtualBumperStatus>"
  (cl:format cl:nil "bool pointInsideBumper~%float32 closestPointDistance~%float32 closestPointDirection~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VirtualBumperStatus)))
  "Returns full string definition for message of type 'VirtualBumperStatus"
  (cl:format cl:nil "bool pointInsideBumper~%float32 closestPointDistance~%float32 closestPointDirection~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VirtualBumperStatus>))
  (cl:+ 0
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VirtualBumperStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'VirtualBumperStatus
    (cl:cons ':pointInsideBumper (pointInsideBumper msg))
    (cl:cons ':closestPointDistance (closestPointDistance msg))
    (cl:cons ':closestPointDirection (closestPointDirection msg))
))
