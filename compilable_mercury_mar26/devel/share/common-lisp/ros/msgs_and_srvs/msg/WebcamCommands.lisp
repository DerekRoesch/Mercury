; Auto-generated. Do not edit!


(cl:in-package msgs_and_srvs-msg)


;//! \htmlinclude WebcamCommands.msg.html

(cl:defclass <WebcamCommands> (roslisp-msg-protocol:ros-message)
  ((start
    :reader start
    :initarg :start
    :type cl:boolean
    :initform cl:nil)
   (serverAddress
    :reader serverAddress
    :initarg :serverAddress
    :type cl:string
    :initform "")
   (serverPort
    :reader serverPort
    :initarg :serverPort
    :type cl:integer
    :initform 0))
)

(cl:defclass WebcamCommands (<WebcamCommands>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WebcamCommands>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WebcamCommands)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name msgs_and_srvs-msg:<WebcamCommands> is deprecated: use msgs_and_srvs-msg:WebcamCommands instead.")))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <WebcamCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:start-val is deprecated.  Use msgs_and_srvs-msg:start instead.")
  (start m))

(cl:ensure-generic-function 'serverAddress-val :lambda-list '(m))
(cl:defmethod serverAddress-val ((m <WebcamCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:serverAddress-val is deprecated.  Use msgs_and_srvs-msg:serverAddress instead.")
  (serverAddress m))

(cl:ensure-generic-function 'serverPort-val :lambda-list '(m))
(cl:defmethod serverPort-val ((m <WebcamCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader msgs_and_srvs-msg:serverPort-val is deprecated.  Use msgs_and_srvs-msg:serverPort instead.")
  (serverPort m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WebcamCommands>) ostream)
  "Serializes a message object of type '<WebcamCommands>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'start) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'serverAddress))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'serverAddress))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'serverPort)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'serverPort)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'serverPort)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'serverPort)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WebcamCommands>) istream)
  "Deserializes a message object of type '<WebcamCommands>"
    (cl:setf (cl:slot-value msg 'start) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'serverAddress) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'serverAddress) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'serverPort)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'serverPort)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'serverPort)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'serverPort)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WebcamCommands>)))
  "Returns string type for a message object of type '<WebcamCommands>"
  "msgs_and_srvs/WebcamCommands")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WebcamCommands)))
  "Returns string type for a message object of type 'WebcamCommands"
  "msgs_and_srvs/WebcamCommands")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WebcamCommands>)))
  "Returns md5sum for a message object of type '<WebcamCommands>"
  "cf8209a39d7dbfef347c708799d329fe")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WebcamCommands)))
  "Returns md5sum for a message object of type 'WebcamCommands"
  "cf8209a39d7dbfef347c708799d329fe")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WebcamCommands>)))
  "Returns full string definition for message of type '<WebcamCommands>"
  (cl:format cl:nil "bool start~%string serverAddress~%uint32 serverPort~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WebcamCommands)))
  "Returns full string definition for message of type 'WebcamCommands"
  (cl:format cl:nil "bool start~%string serverAddress~%uint32 serverPort~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WebcamCommands>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'serverAddress))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WebcamCommands>))
  "Converts a ROS message object to a list"
  (cl:list 'WebcamCommands
    (cl:cons ':start (start msg))
    (cl:cons ':serverAddress (serverAddress msg))
    (cl:cons ':serverPort (serverPort msg))
))
