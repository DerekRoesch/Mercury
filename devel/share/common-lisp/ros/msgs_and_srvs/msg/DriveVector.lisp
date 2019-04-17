; Auto-generated. Do not edit!


(cl:in-package msgs_and_srvs-msg)


;//! \htmlinclude DriveVector.msg.html

(cl:defclass <DriveVector> (roslisp-msg-protocol:ros-message)
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
    :initform 0.0)
   (allStop
    :reader allStop
    :initarg :allStop
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass DriveVector (<DriveVector>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DriveVector>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DriveVector)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name msgs_and_srvs-msg:<DriveVector> is deprecated: use msgs_and_srvs-msg:DriveVector instead.")))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <DriveVector>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:speed-val is deprecated.  Use msgs_and_srvs-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <DriveVector>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:direction-val is deprecated.  Use msgs_and_srvs-msg:direction instead.")
  (direction m))

(cl:ensure-generic-function 'angularSpeed-val :lambda-list '(m))
(cl:defmethod angularSpeed-val ((m <DriveVector>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:angularSpeed-val is deprecated.  Use msgs_and_srvs-msg:angularSpeed instead.")
  (angularSpeed m))

(cl:ensure-generic-function 'allStop-val :lambda-list '(m))
(cl:defmethod allStop-val ((m <DriveVector>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:allStop-val is deprecated.  Use msgs_and_srvs-msg:allStop instead.")
  (allStop m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DriveVector>) ostream)
  "Serializes a message object of type '<DriveVector>"
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'allStop) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DriveVector>) istream)
  "Deserializes a message object of type '<DriveVector>"
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
    (cl:setf (cl:slot-value msg 'allStop) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DriveVector>)))
  "Returns string type for a message object of type '<DriveVector>"
  "msgs_and_srvs/DriveVector")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DriveVector)))
  "Returns string type for a message object of type 'DriveVector"
  "msgs_and_srvs/DriveVector")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DriveVector>)))
  "Returns md5sum for a message object of type '<DriveVector>"
  "37ae2201b8c904c2c7b9f43b7439cdbe")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DriveVector)))
  "Returns md5sum for a message object of type 'DriveVector"
  "37ae2201b8c904c2c7b9f43b7439cdbe")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DriveVector>)))
  "Returns full string definition for message of type '<DriveVector>"
  (cl:format cl:nil "float32 speed~%float32 direction~%float32 angularSpeed~%bool allStop~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DriveVector)))
  "Returns full string definition for message of type 'DriveVector"
  (cl:format cl:nil "float32 speed~%float32 direction~%float32 angularSpeed~%bool allStop~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DriveVector>))
  (cl:+ 0
     4
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DriveVector>))
  "Converts a ROS message object to a list"
  (cl:list 'DriveVector
    (cl:cons ':speed (speed msg))
    (cl:cons ':direction (direction msg))
    (cl:cons ':angularSpeed (angularSpeed msg))
    (cl:cons ':allStop (allStop msg))
))
