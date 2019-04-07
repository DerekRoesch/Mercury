; Auto-generated. Do not edit!


(cl:in-package msgs_and_srvs-msg)


;//! \htmlinclude NavStates.msg.html

(cl:defclass <NavStates> (roslisp-msg-protocol:ros-message)
  ((speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0)
   (direction
    :reader direction
    :initarg :direction
    :type cl:float
    :initform 0.0)
   (angularSpeed
    :reader angularSpeed
    :initarg :angularSpeed
    :type cl:float
    :initform 0.0))
)

(cl:defclass NavStates (<NavStates>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NavStates>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NavStates)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name msgs_and_srvs-msg:<NavStates> is deprecated: use msgs_and_srvs-msg:NavStates instead.")))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <NavStates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:speed-val is deprecated.  Use msgs_and_srvs-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <NavStates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:direction-val is deprecated.  Use msgs_and_srvs-msg:direction instead.")
  (direction m))

(cl:ensure-generic-function 'angularSpeed-val :lambda-list '(m))
(cl:defmethod angularSpeed-val ((m <NavStates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:angularSpeed-val is deprecated.  Use msgs_and_srvs-msg:angularSpeed instead.")
  (angularSpeed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NavStates>) ostream)
  "Serializes a message object of type '<NavStates>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'direction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angularSpeed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NavStates>) istream)
  "Deserializes a message object of type '<NavStates>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'direction) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angularSpeed) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NavStates>)))
  "Returns string type for a message object of type '<NavStates>"
  "msgs_and_srvs/NavStates")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NavStates)))
  "Returns string type for a message object of type 'NavStates"
  "msgs_and_srvs/NavStates")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NavStates>)))
  "Returns md5sum for a message object of type '<NavStates>"
  "9caa5a4893d2cb6d4b1fa5b1dce8f2a3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NavStates)))
  "Returns md5sum for a message object of type 'NavStates"
  "9caa5a4893d2cb6d4b1fa5b1dce8f2a3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NavStates>)))
  "Returns full string definition for message of type '<NavStates>"
  (cl:format cl:nil "float32 speed~%float32 direction~%float32 angularSpeed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NavStates)))
  "Returns full string definition for message of type 'NavStates"
  (cl:format cl:nil "float32 speed~%float32 direction~%float32 angularSpeed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NavStates>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NavStates>))
  "Converts a ROS message object to a list"
  (cl:list 'NavStates
    (cl:cons ':speed (speed msg))
    (cl:cons ':direction (direction msg))
    (cl:cons ':angularSpeed (angularSpeed msg))
))
