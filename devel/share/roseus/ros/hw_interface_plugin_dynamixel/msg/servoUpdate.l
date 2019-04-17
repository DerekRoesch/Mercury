;; Auto-generated. Do not edit!


(when (boundp 'hw_interface_plugin_dynamixel::servoUpdate)
  (if (not (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL"))
    (make-package "HW_INTERFACE_PLUGIN_DYNAMIXEL"))
  (shadow 'servoUpdate (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL")))
(unless (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE")
  (make-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))

(in-package "ROS")
;;//! \htmlinclude servoUpdate.msg.html


(intern "*ABILITY_NOP*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*ABILITY_NOP* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*ABILITY_NOP* 0)
(intern "*ABILITY_ANGLE_UNITS*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*ABILITY_ANGLE_UNITS* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*ABILITY_ANGLE_UNITS* 1)
(intern "*ABILITY_SPEED_UNITS*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*ABILITY_SPEED_UNITS* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*ABILITY_SPEED_UNITS* 2)
(intern "*ABILITY_RESOLUTION_DIVIDER*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*ABILITY_RESOLUTION_DIVIDER* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*ABILITY_RESOLUTION_DIVIDER* 4)
(intern "*ABILITY_WHEEL_MODE*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*ABILITY_WHEEL_MODE* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*ABILITY_WHEEL_MODE* 8)
(intern "*ABILITY_JOINT_MODE*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*ABILITY_JOINT_MODE* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*ABILITY_JOINT_MODE* 16)
(intern "*ABILITY_CCW_LIMIT*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*ABILITY_CCW_LIMIT* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*ABILITY_CCW_LIMIT* 32)
(intern "*ABILITY_CW_LIMIT*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*ABILITY_CW_LIMIT* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*ABILITY_CW_LIMIT* 64)
(intern "*ABILITY_INIT*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*ABILITY_INIT* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*ABILITY_INIT* 128)
(intern "*ABILITY_MOVING_SPEED*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*ABILITY_MOVING_SPEED* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*ABILITY_MOVING_SPEED* 256)
(intern "*ABILITY_GOAL_POSITION*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*ABILITY_GOAL_POSITION* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*ABILITY_GOAL_POSITION* 512)
(intern "*ABILITY_PRESENT_SPEED*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*ABILITY_PRESENT_SPEED* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*ABILITY_PRESENT_SPEED* 1024)
(intern "*ABILITY_PRESENT_POSITION*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*ABILITY_PRESENT_POSITION* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*ABILITY_PRESENT_POSITION* 2048)
(intern "*ABILITY_STATUS_RETURN_LEVEL*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*ABILITY_STATUS_RETURN_LEVEL* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*ABILITY_STATUS_RETURN_LEVEL* 4096)
(intern "*ABILITY_OPERATING_MODE*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*ABILITY_OPERATING_MODE* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*ABILITY_OPERATING_MODE* 8192)
(intern "*ABILITY_TORQUE_ENABLE*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*ABILITY_TORQUE_ENABLE* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*ABILITY_TORQUE_ENABLE* 16384)
(intern "*ABILITY_PRESENT_CURRENT*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*ABILITY_PRESENT_CURRENT* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*ABILITY_PRESENT_CURRENT* 32768)
(intern "*ABILITY_TORQUE_LIMIT*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*ABILITY_TORQUE_LIMIT* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*ABILITY_TORQUE_LIMIT* 65536)
(intern "*ABILITY_GOAL_TORQUE*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*ABILITY_GOAL_TORQUE* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*ABILITY_GOAL_TORQUE* 131072)
(intern "*ABILITY_BAUD_RATE*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*ABILITY_BAUD_RATE* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*ABILITY_BAUD_RATE* 262144)
(intern "*MODE_NOP*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*MODE_NOP* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*MODE_NOP* 0)
(intern "*MODE_GET*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*MODE_GET* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*MODE_GET* 1)
(intern "*MODE_SET*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*MODE_SET* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*MODE_SET* 2)
(intern "*MODE_QUERY*" (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(shadow '*MODE_QUERY* (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::SERVOUPDATE"))
(defconstant hw_interface_plugin_dynamixel::servoUpdate::*MODE_QUERY* 4)
(defclass hw_interface_plugin_dynamixel::servoUpdate
  :super ros::object
  :slots (_id _abilityRequested _mode _isDataSigned _uDATA _sDATA ))

(defmethod hw_interface_plugin_dynamixel::servoUpdate
  (:init
   (&key
    ((:id __id) 0)
    ((:abilityRequested __abilityRequested) 0)
    ((:mode __mode) 0)
    ((:isDataSigned __isDataSigned) nil)
    ((:uDATA __uDATA) 0)
    ((:sDATA __sDATA) 0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _abilityRequested (round __abilityRequested))
   (setq _mode (round __mode))
   (setq _isDataSigned __isDataSigned)
   (setq _uDATA (round __uDATA))
   (setq _sDATA (round __sDATA))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:abilityRequested
   (&optional __abilityRequested)
   (if __abilityRequested (setq _abilityRequested __abilityRequested)) _abilityRequested)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:isDataSigned
   (&optional __isDataSigned)
   (if __isDataSigned (setq _isDataSigned __isDataSigned)) _isDataSigned)
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
    ;; uint64 _abilityRequested
    8
    ;; uint8 _mode
    1
    ;; bool _isDataSigned
    1
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
     ;; uint64 _abilityRequested
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _abilityRequested (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _abilityRequested) (= (length (_abilityRequested . bv)) 2)) ;; bignum
              (write-long (ash (elt (_abilityRequested . bv) 0) 0) s)
              (write-long (ash (elt (_abilityRequested . bv) 1) -1) s))
             ((and (class _abilityRequested) (= (length (_abilityRequested . bv)) 1)) ;; big1
              (write-long (elt (_abilityRequested . bv) 0) s)
              (write-long (if (>= _abilityRequested 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _abilityRequested s)(write-long (if (>= _abilityRequested 0) 0 #xffffffff) s)))
     ;; uint8 _mode
       (write-byte _mode s)
     ;; bool _isDataSigned
       (if _isDataSigned (write-byte -1 s) (write-byte 0 s))
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
   ;; uint64 _abilityRequested
     
#+(or :alpha :irix6 :x86_64)
      (setf _abilityRequested (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _abilityRequested (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; uint8 _mode
     (setq _mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _isDataSigned
     (setq _isDataSigned (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint32 _uDATA
     (setq _uDATA (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _sDATA
     (setq _sDATA (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get hw_interface_plugin_dynamixel::servoUpdate :md5sum-) "05a7b26fa0b1df81dea2937a6e1c6eed")
(setf (get hw_interface_plugin_dynamixel::servoUpdate :datatype-) "hw_interface_plugin_dynamixel/servoUpdate")
(setf (get hw_interface_plugin_dynamixel::servoUpdate :definition-)
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
uint64 ABILITY_OPERATING_MODE=8192
uint64 ABILITY_TORQUE_ENABLE=16384
uint64 ABILITY_PRESENT_CURRENT=32768
uint64 ABILITY_TORQUE_LIMIT=65536
uint64 ABILITY_GOAL_TORQUE=131072
uint64 ABILITY_BAUD_RATE=262144
uint8  MODE_NOP=0
uint8  MODE_GET=1
uint8  MODE_SET=2
uint8  MODE_QUERY=4



uint8   id
uint64  abilityRequested
uint8   mode

bool    isDataSigned

uint32  uDATA
int32   sDATA


")



(provide :hw_interface_plugin_dynamixel/servoUpdate "05a7b26fa0b1df81dea2937a6e1c6eed")


