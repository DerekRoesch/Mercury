; Auto-generated. Do not edit!


(cl:in-package msgs_and_srvs-msg)


;//! \htmlinclude VirtualBumperParams.msg.html

(cl:defclass <VirtualBumperParams> (roslisp-msg-protocol:ros-message)
  ((active
    :reader active
    :initarg :active
    :type cl:boolean
    :initform cl:nil)
   (radius
    :reader radius
    :initarg :radius
    :type cl:float
    :initform 0.0)
   (springConstant
    :reader springConstant
    :initarg :springConstant
    :type cl:float
    :initform 0.0))
)

(cl:defclass VirtualBumperParams (<VirtualBumperParams>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VirtualBumperParams>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VirtualBumperParams)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name msgs_and_srvs-msg:<VirtualBumperParams> is deprecated: use msgs_and_srvs-msg:VirtualBumperParams instead.")))

(cl:ensure-generic-function 'active-val :lambda-list '(m))
(cl:defmethod active-val ((m <VirtualBumperParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:active-val is deprecated.  Use msgs_and_srvs-msg:active instead.")
  (active m))

(cl:ensure-generic-function 'radius-val :lambda-list '(m))
(cl:defmethod radius-val ((m <VirtualBumperParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:radius-val is deprecated.  Use msgs_and_srvs-msg:radius instead.")
  (radius m))

(cl:ensure-generic-function 'springConstant-val :lambda-list '(m))
(cl:defmethod springConstant-val ((m <VirtualBumperParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:springConstant-val is deprecated.  Use msgs_and_srvs-msg:springConstant instead.")
  (springConstant m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VirtualBumperParams>) ostream)
  "Serializes a message object of type '<VirtualBumperParams>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'active) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'radius))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'springConstant))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VirtualBumperParams>) istream)
  "Deserializes a message object of type '<VirtualBumperParams>"
    (cl:setf (cl:slot-value msg 'active) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'radius) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'springConstant) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VirtualBumperParams>)))
  "Returns string type for a message object of type '<VirtualBumperParams>"
  "msgs_and_srvs/VirtualBumperParams")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VirtualBumperParams)))
  "Returns string type for a message object of type 'VirtualBumperParams"
  "msgs_and_srvs/VirtualBumperParams")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VirtualBumperParams>)))
  "Returns md5sum for a message object of type '<VirtualBumperParams>"
  "7f390f4d392b83cae602d14c4638fb17")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VirtualBumperParams)))
  "Returns md5sum for a message object of type 'VirtualBumperParams"
  "7f390f4d392b83cae602d14c4638fb17")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VirtualBumperParams>)))
  "Returns full string definition for message of type '<VirtualBumperParams>"
  (cl:format cl:nil "bool active~%float32 radius~%float32 springConstant~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VirtualBumperParams)))
  "Returns full string definition for message of type 'VirtualBumperParams"
  (cl:format cl:nil "bool active~%float32 radius~%float32 springConstant~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VirtualBumperParams>))
  (cl:+ 0
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VirtualBumperParams>))
  "Converts a ROS message object to a list"
  (cl:list 'VirtualBumperParams
    (cl:cons ':active (active msg))
    (cl:cons ':radius (radius msg))
    (cl:cons ':springConstant (springConstant msg))
))
