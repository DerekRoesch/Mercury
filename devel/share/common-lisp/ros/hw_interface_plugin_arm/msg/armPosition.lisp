; Auto-generated. Do not edit!


(cl:in-package hw_interface_plugin_arm-msg)


;//! \htmlinclude armPosition.msg.html

(cl:defclass <armPosition> (roslisp-msg-protocol:ros-message)
  ((pos
    :reader pos
    :initarg :pos
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 5 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass armPosition (<armPosition>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <armPosition>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'armPosition)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hw_interface_plugin_arm-msg:<armPosition> is deprecated: use hw_interface_plugin_arm-msg:armPosition instead.")))

(cl:ensure-generic-function 'pos-val :lambda-list '(m))
(cl:defmethod pos-val ((m <armPosition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hw_interface_plugin_arm-msg:pos-val is deprecated.  Use hw_interface_plugin_arm-msg:pos instead.")
  (pos m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <armPosition>) ostream)
  "Serializes a message object of type '<armPosition>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'pos))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <armPosition>) istream)
  "Deserializes a message object of type '<armPosition>"
  (cl:setf (cl:slot-value msg 'pos) (cl:make-array 5))
  (cl:let ((vals (cl:slot-value msg 'pos)))
    (cl:dotimes (i 5)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<armPosition>)))
  "Returns string type for a message object of type '<armPosition>"
  "hw_interface_plugin_arm/armPosition")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'armPosition)))
  "Returns string type for a message object of type 'armPosition"
  "hw_interface_plugin_arm/armPosition")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<armPosition>)))
  "Returns md5sum for a message object of type '<armPosition>"
  "d87336f0d14ef5164ad497c9edcf53e0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'armPosition)))
  "Returns md5sum for a message object of type 'armPosition"
  "d87336f0d14ef5164ad497c9edcf53e0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<armPosition>)))
  "Returns full string definition for message of type '<armPosition>"
  (cl:format cl:nil "uint8[5] pos~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'armPosition)))
  "Returns full string definition for message of type 'armPosition"
  (cl:format cl:nil "uint8[5] pos~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <armPosition>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'pos) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <armPosition>))
  "Converts a ROS message object to a list"
  (cl:list 'armPosition
    (cl:cons ':pos (pos msg))
))
