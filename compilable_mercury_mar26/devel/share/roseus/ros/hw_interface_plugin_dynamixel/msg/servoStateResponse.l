;; Auto-generated. Do not edit!


(when (boundp 'hw_interface_plugin_dynamixel::servoStateResponse)
  (if (not (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL"))
    (make-package "HW_INTERFACE_PLUGIN_DYNAMIXEL"))
  (shadow 'servoStateResponse (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL")))
(unless (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE")
  (make-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))

(in-package "ROS")
;;//! \htmlinclude servoStateResponse.msg.html


(intern "*ABILITY_NOP*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(shadow '*ABILITY_NOP* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(defconstant hw_interface_plugin_dynamixel::servoStateResponse::*ABILITY_NOP* 0)
(intern "*ABILITY_ANGLE_UNITS*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(shadow '*ABILITY_ANGLE_UNITS* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(defconstant hw_interface_plugin_dynamixel::servoStateResponse::*ABILITY_ANGLE_UNITS* 1)
(intern "*ABILITY_SPEED_UNITS*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(shadow '*ABILITY_SPEED_UNITS* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(defconstant hw_interface_plugin_dynamixel::servoStateResponse::*ABILITY_SPEED_UNITS* 2)
(intern "*ABILITY_RESOLUTION_DIVIDER*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(shadow '*ABILITY_RESOLUTION_DIVIDER* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(defconstant hw_interface_plugin_dynamixel::servoStateResponse::*ABILITY_RESOLUTION_DIVIDER* 4)
(intern "*ABILITY_WHEEL_MODE*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(shadow '*ABILITY_WHEEL_MODE* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(defconstant hw_interface_plugin_dynamixel::servoStateResponse::*ABILITY_WHEEL_MODE* 8)
(intern "*ABILITY_JOINT_MODE*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(shadow '*ABILITY_JOINT_MODE* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(defconstant hw_interface_plugin_dynamixel::servoStateResponse::*ABILITY_JOINT_MODE* 16)
(intern "*ABILITY_CCW_LIMIT*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(shadow '*ABILITY_CCW_LIMIT* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(defconstant hw_interface_plugin_dynamixel::servoStateResponse::*ABILITY_CCW_LIMIT* 32)
(intern "*ABILITY_CW_LIMIT*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(shadow '*ABILITY_CW_LIMIT* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(defconstant hw_interface_plugin_dynamixel::servoStateResponse::*ABILITY_CW_LIMIT* 64)
(intern "*ABILITY_INIT*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(shadow '*ABILITY_INIT* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(defconstant hw_interface_plugin_dynamixel::servoStateResponse::*ABILITY_INIT* 128)
(intern "*ABILITY_MOVING_SPEED*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(shadow '*ABILITY_MOVING_SPEED* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(defconstant hw_interface_plugin_dynamixel::servoStateResponse::*ABILITY_MOVING_SPEED* 256)
(intern "*ABILITY_GOAL_POSITION*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(shadow '*ABILITY_GOAL_POSITION* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(defconstant hw_interface_plugin_dynamixel::servoStateResponse::*ABILITY_GOAL_POSITION* 512)
(intern "*ABILITY_PRESENT_SPEED*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(shadow '*ABILITY_PRESENT_SPEED* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(defconstant hw_interface_plugin_dynamixel::servoStateResponse::*ABILITY_PRESENT_SPEED* 1024)
(intern "*ABILITY_PRESENT_POSITION*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(shadow '*ABILITY_PRESENT_POSITION* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(defconstant hw_interface_plugin_dynamixel::servoStateResponse::*ABILITY_PRESENT_POSITION* 2048)
(intern "*ABILITY_STATUS_RETURN_LEVEL*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(shadow '*ABILITY_STATUS_RETURN_LEVEL* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(defconstant hw_interface_plugin_dynamixel::servoStateResponse::*ABILITY_STATUS_RETURN_LEVEL* 4096)
(intern "*MODE_NOP*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(shadow '*MODE_NOP* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(defconstant hw_interface_plugin_dynamixel::servoStateResponse::*MODE_NOP* 0)
(intern "*MODE_GET*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(shadow '*MODE_GET* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(defconstant hw_interface_plugin_dynamixel::servoStateResponse::*MODE_GET* 1)
(intern "*MODE_SET*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(shadow '*MODE_SET* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(defconstant hw_interface_plugin_dynamixel::servoStateResponse::*MODE_SET* 2)
(intern "*MODE_QUERY*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(shadow '*MODE_QUERY* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOSTATERESPONSE"))
(defconstant hw_interface_plugin_dynamixel::servoStateResponse::*MODE_QUERY* 4)
(defclass hw_interface_plugin_dynamixel::servoStateResponse
  :super ros::object
  :slots (_id _queryAbility _uDATA _sDATA ))

(defmethod hw_interface_plugin_dynamixel::servoStateResponse
  (:init
   (&key
    ((:id __id) 0)
    ((:queryAbility __queryAbility) 0)
    ((:uDATA __uDATA) 0)
    ((:sDATA __sDATA) 0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _queryAbility (round __queryAbility))
   (setq _uDATA (round __uDATA))
   (setq _sDATA (round __sDATA))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:queryAbility
   (&optional __queryAbility)
   (if __queryAbility (setq _queryAbility __queryAbility)) _queryAbility)
  (:uDATA
   (&optional __uDATA)
   (if __uDATA (setq _uDATA __uDATA)) _uDATA)
  (:sDATA
   (&optional __sDATA)
   (if __sDATA (setq _sDATA __sDATA)) _sDATA)
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ;; uint64 _queryAbility
    8
    ;; uint32 _uDATA
    4
    ;; int32 _sDATA
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _id
       (write-byte _id s)
     ;; uint64 _queryAbility
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _queryAbility (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _queryAbility) (= (length (_queryAbility . bv)) 2)) ;; bignum
              (write-long (ash (elt (_queryAbility . bv) 0) 0) s)
              (write-long (ash (elt (_queryAbility . bv) 1) -1) s))
             ((and (class _queryAbility) (= (length (_queryAbility . bv)) 1)) ;; big1
              (write-long (elt (_queryAbility . bv) 0) s)
              (write-long (if (>= _queryAbility 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _queryAbility s)(write-long (if (>= _queryAbility 0) 0 #xffffffff) s)))
     ;; uint32 _uDATA
       (write-long _uDATA s)
     ;; int32 _sDATA
       (write-long _sDATA s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint64 _queryAbility
     
#+(or :alpha :irix6 :x86_64)
      (setf _queryAbility (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _queryAbility (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; uint32 _uDATA
     (setq _uDATA (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _sDATA
     (setq _sDATA (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get hw_interface_plugin_dynamixel::servoStateResponse :md5sum-) "9c96febecb04b5e21700ffa78c48387a")
(setf (get hw_interface_plugin_dynamixel::servoStateResponse :datatype-) "hw_interface_plugin_dynamixel/servoStateResponse")
(setf (get hw_interface_plugin_dynamixel::servoStateResponse :definition-)
      "uint64 ABILITY_NOP = 0
uint64 ABILITY_ANGLE_UNITS=1
uint64 ABILITY_SPEED_UNITS=2
uint64 ABILITY_RESOLUTION_DIVIDER=4
uint64 ABILITY_WHEEL_MODE=8
uint64 ABILITY_JOINT_MODE=16
uint64 ABILITY_CCW_LIMIT=32
uint64 ABILITY_CW_LIMIT=64
uint64 ABILITY_INIT=128
uint64 ABILITY_MOVING_SPEED=256
uint64 ABILITY_GOAL_POSITION=512
uint64 ABILITY_PRESENT_SPEED=1024
uint64 ABILITY_PRESENT_POSITION=2048
uint64 ABILITY_STATUS_RETURN_LEVEL=4096
uint8  MODE_NOP=0
uint8  MODE_GET=1
uint8  MODE_SET=2
uint8  MODE_QUERY=4

uint8   id
uint64  queryAbility

uint32  uDATA
int32  sDATA

")



(provide :hw_interface_plugin_dynamixel/servoStateResponse "9c96febecb04b5e21700ffa78c48387a")


