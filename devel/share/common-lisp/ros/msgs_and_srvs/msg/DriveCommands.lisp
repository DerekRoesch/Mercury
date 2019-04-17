; Auto-generated. Do not edit!


(cl:in-package msgs_and_srvs-msg)


;//! \htmlinclude DriveCommands.msg.html

(cl:defclass <DriveCommands> (roslisp-msg-protocol:ros-message)
  ((allStop
    :reader allStop
    :initarg :allStop
    :type cl:boolean
    :initform cl:nil)
   (fastMode
    :reader fastMode
    :initarg :fastMode
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass DriveCommands (<DriveCommands>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DriveCommands>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DriveCommands)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name msgs_and_srvs-msg:<DriveCommands> is deprecated: use msgs_and_srvs-msg:DriveCommands instead.")))

(cl:ensure-generic-function 'allStop-val :lambda-list '(m))
(cl:defmethod allStop-val ((m <DriveCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:allStop-val is deprecated.  Use msgs_and_srvs-msg:allStop instead.")
  (allStop m))

(cl:ensure-generic-function 'fastMode-val :lambda-list '(m))
(cl:defmethod fastMode-val ((m <DriveCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:fastMode-val is deprecated.  Use msgs_and_srvs-msg:fastMode instead.")
  (fastMode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DriveCommands>) ostream)
  "Serializes a message object of type '<DriveCommands>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'allStop) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'fastMode) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DriveCommands>) istream)
  "Deserializes a message object of type '<DriveCommands>"
    (cl:setf (cl:slot-value msg 'allStop) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'fastMode) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DriveCommands>)))
  "Returns string type for a message object of type '<DriveCommands>"
  "msgs_and_srvs/DriveCommands")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DriveCommands)))
  "Returns string type for a message object of type 'DriveCommands"
  "msgs_and_srvs/DriveCommands")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DriveCommands>)))
  "Returns md5sum for a message object of type '<DriveCommands>"
  "e4865336e17f16193eb66cf5414820f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DriveCommands)))
  "Returns md5sum for a message object of type 'DriveCommands"
  "e4865336e17f16193eb66cf5414820f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DriveCommands>)))
  "Returns full string definition for message of type '<DriveCommands>"
  (cl:format cl:nil "bool allStop~%bool fastMode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DriveCommands)))
  "Returns full string definition for message of type 'DriveCommands"
  (cl:format cl:nil "bool allStop~%bool fastMode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DriveCommands>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DriveCommands>))
  "Converts a ROS message object to a list"
  (cl:list 'DriveCommands
    (cl:cons ':allStop (allStop msg))
    (cl:cons ':fastMode (fastMode msg))
))
