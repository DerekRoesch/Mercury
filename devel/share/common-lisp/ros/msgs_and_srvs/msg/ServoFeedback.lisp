; Auto-generated. Do not edit!


(cl:in-package msgs_and_srvs-msg)


;//! \htmlinclude ServoFeedback.msg.html

(cl:defclass <ServoFeedback> (roslisp-msg-protocol:ros-message)
  ((flSpeed
    :reader flSpeed
    :initarg :flSpeed
    :type cl:float
    :initform 0.0)
   (blSpeed
    :reader blSpeed
    :initarg :blSpeed
    :type cl:float
    :initform 0.0)
   (frSpeed
    :reader frSpeed
    :initarg :frSpeed
    :type cl:float
    :initform 0.0)
   (brSpeed
    :reader brSpeed
    :initarg :brSpeed
    :type cl:float
    :initform 0.0)
   (flTurnAngle
    :reader flTurnAngle
    :initarg :flTurnAngle
    :type cl:float
    :initform 0.0)
   (blTurnAngle
    :reader blTurnAngle
    :initarg :blTurnAngle
    :type cl:float
    :initform 0.0)
   (frTurnAngle
    :reader frTurnAngle
    :initarg :frTurnAngle
    :type cl:float
    :initform 0.0)
   (brTurnAngle
    :reader brTurnAngle
    :initarg :brTurnAngle
    :type cl:float
    :initform 0.0))
)

(cl:defclass ServoFeedback (<ServoFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ServoFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ServoFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name msgs_and_srvs-msg:<ServoFeedback> is deprecated: use msgs_and_srvs-msg:ServoFeedback instead.")))

(cl:ensure-generic-function 'flSpeed-val :lambda-list '(m))
(cl:defmethod flSpeed-val ((m <ServoFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:flSpeed-val is deprecated.  Use msgs_and_srvs-msg:flSpeed instead.")
  (flSpeed m))

(cl:ensure-generic-function 'blSpeed-val :lambda-list '(m))
(cl:defmethod blSpeed-val ((m <ServoFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:blSpeed-val is deprecated.  Use msgs_and_srvs-msg:blSpeed instead.")
  (blSpeed m))

(cl:ensure-generic-function 'frSpeed-val :lambda-list '(m))
(cl:defmethod frSpeed-val ((m <ServoFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:frSpeed-val is deprecated.  Use msgs_and_srvs-msg:frSpeed instead.")
  (frSpeed m))

(cl:ensure-generic-function 'brSpeed-val :lambda-list '(m))
(cl:defmethod brSpeed-val ((m <ServoFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:brSpeed-val is deprecated.  Use msgs_and_srvs-msg:brSpeed instead.")
  (brSpeed m))

(cl:ensure-generic-function 'flTurnAngle-val :lambda-list '(m))
(cl:defmethod flTurnAngle-val ((m <ServoFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:flTurnAngle-val is deprecated.  Use msgs_and_srvs-msg:flTurnAngle instead.")
  (flTurnAngle m))

(cl:ensure-generic-function 'blTurnAngle-val :lambda-list '(m))
(cl:defmethod blTurnAngle-val ((m <ServoFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:blTurnAngle-val is deprecated.  Use msgs_and_srvs-msg:blTurnAngle instead.")
  (blTurnAngle m))

(cl:ensure-generic-function 'frTurnAngle-val :lambda-list '(m))
(cl:defmethod frTurnAngle-val ((m <ServoFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:frTurnAngle-val is deprecated.  Use msgs_and_srvs-msg:frTurnAngle instead.")
  (frTurnAngle m))

(cl:ensure-generic-function 'brTurnAngle-val :lambda-list '(m))
(cl:defmethod brTurnAngle-val ((m <ServoFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:brTurnAngle-val is deprecated.  Use msgs_and_srvs-msg:brTurnAngle instead.")
  (brTurnAngle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ServoFeedback>) ostream)
  "Serializes a message object of type '<ServoFeedback>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'flSpeed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'blSpeed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'frSpeed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'brSpeed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'flTurnAngle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'blTurnAngle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'frTurnAngle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'brTurnAngle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ServoFeedback>) istream)
  "Deserializes a message object of type '<ServoFeedback>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'flSpeed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'blSpeed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'frSpeed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'brSpeed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'flTurnAngle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'blTurnAngle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'frTurnAngle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'brTurnAngle) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ServoFeedback>)))
  "Returns string type for a message object of type '<ServoFeedback>"
  "msgs_and_srvs/ServoFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ServoFeedback)))
  "Returns string type for a message object of type 'ServoFeedback"
  "msgs_and_srvs/ServoFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ServoFeedback>)))
  "Returns md5sum for a message object of type '<ServoFeedback>"
  "ad381411873b60f8ac0ce1b85ac7dbd2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ServoFeedback)))
  "Returns md5sum for a message object of type 'ServoFeedback"
  "ad381411873b60f8ac0ce1b85ac7dbd2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ServoFeedback>)))
  "Returns full string definition for message of type '<ServoFeedback>"
  (cl:format cl:nil "float32 flSpeed~%float32 blSpeed~%float32 frSpeed~%float32 brSpeed~%float32 flTurnAngle~%float32 blTurnAngle~%float32 frTurnAngle~%float32 brTurnAngle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ServoFeedback)))
  "Returns full string definition for message of type 'ServoFeedback"
  (cl:format cl:nil "float32 flSpeed~%float32 blSpeed~%float32 frSpeed~%float32 brSpeed~%float32 flTurnAngle~%float32 blTurnAngle~%float32 frTurnAngle~%float32 brTurnAngle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ServoFeedback>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ServoFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'ServoFeedback
    (cl:cons ':flSpeed (flSpeed msg))
    (cl:cons ':blSpeed (blSpeed msg))
    (cl:cons ':frSpeed (frSpeed msg))
    (cl:cons ':brSpeed (brSpeed msg))
    (cl:cons ':flTurnAngle (flTurnAngle msg))
    (cl:cons ':blTurnAngle (blTurnAngle msg))
    (cl:cons ':frTurnAngle (frTurnAngle msg))
    (cl:cons ':brTurnAngle (brTurnAngle msg))
))
