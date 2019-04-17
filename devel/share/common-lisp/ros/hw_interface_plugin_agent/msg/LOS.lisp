; Auto-generated. Do not edit!


(cl:in-package hw_interface_plugin_agent-msg)


;//! \htmlinclude LOS.msg.html

(cl:defclass <LOS> (roslisp-msg-protocol:ros-message)
  ((LOS
    :reader LOS
    :initarg :LOS
    :type cl:fixnum
    :initform 0))
)

(cl:defclass LOS (<LOS>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LOS>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LOS)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hw_interface_plugin_agent-msg:<LOS> is deprecated: use hw_interface_plugin_agent-msg:LOS instead.")))

(cl:ensure-generic-function 'LOS-val :lambda-list '(m))
(cl:defmethod LOS-val ((m <LOS>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw_interface_plugin_agent-msg:LOS-val is deprecated.  Use hw_interface_plugin_agent-msg:LOS instead.")
  (LOS m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LOS>) ostream)
  "Serializes a message object of type '<LOS>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LOS)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LOS>) istream)
  "Deserializes a message object of type '<LOS>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LOS)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LOS>)))
  "Returns string type for a message object of type '<LOS>"
  "hw_interface_plugin_agent/LOS")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LOS)))
  "Returns string type for a message object of type 'LOS"
  "hw_interface_plugin_agent/LOS")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LOS>)))
  "Returns md5sum for a message object of type '<LOS>"
  "3e0c4070d76fb968c478473a13650bdd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LOS)))
  "Returns md5sum for a message object of type 'LOS"
  "3e0c4070d76fb968c478473a13650bdd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LOS>)))
  "Returns full string definition for message of type '<LOS>"
  (cl:format cl:nil "uint8 LOS~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LOS)))
  "Returns full string definition for message of type 'LOS"
  (cl:format cl:nil "uint8 LOS~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LOS>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LOS>))
  "Converts a ROS message object to a list"
  (cl:list 'LOS
    (cl:cons ':LOS (LOS msg))
))
