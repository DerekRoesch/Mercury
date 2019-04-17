;; Auto-generated. Do not edit!


(when (boundp 'hw_interface_plugin_dynamixel::groupServoUpdate)
  (if (not (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL"))
    (make-package "HW_INTERFACE_PLUGIN_DYNAMIXEL"))
  (shadow 'groupServoUpdate (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL")))
(unless (find-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::GROUPSERVOUPDATE")
  (make-package "HW_INTERFACE_PLUGIN_DYNAMIXEL::GROUPSERVOUPDATE"))

(in-package "ROS")
;;//! \htmlinclude groupServoUpdate.msg.html


(defclass hw_interface_plugin_dynamixel::groupServoUpdate
  :super ros::object
  :slots (_updateVector ))

(defmethod hw_interface_plugin_dynamixel::groupServoUpdate
  (:init
   (&key
    ((:updateVector __updateVector) (let (r) (dotimes (i 0) (push (instance hw_interface_plugin_dynamixel::servoUpdate :init) r)) r))
    )
   (send-super :init)
   (setq _updateVector __updateVector)
   self)
  (:updateVector
   (&rest __updateVector)
   (if (keywordp (car __updateVector))
       (send* _updateVector __updateVector)
     (progn
       (if __updateVector (setq _updateVector (car __updateVector)))
       _updateVector)))
  (:serialization-length
   ()
   (+
    ;; hw_interface_plugin_dynamixel/servoUpdate[] _updateVector
    (apply #'+ (send-all _updateVector :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; hw_interface_plugin_dynamixel/servoUpdate[] _updateVector
     (write-long (length _updateVector) s)
     (dolist (elem _updateVector)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; hw_interface_plugin_dynamixel/servoUpdate[] _updateVector
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _updateVector (let (r) (dotimes (i n) (push (instance hw_interface_plugin_dynamixel::servoUpdate :init) r)) r))
     (dolist (elem- _updateVector)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get hw_interface_plugin_dynamixel::groupServoUpdate :md5sum-) "e6ee49bcc6a9ac8d662236a4935e5ee8")
(setf (get hw_interface_plugin_dynamixel::groupServoUpdate :datatype-) "hw_interface_plugin_dynamixel/groupServoUpdate")
(setf (get hw_interface_plugin_dynamixel::groupServoUpdate :definition-)
      "servoUpdate[] updateVector

================================================================================
MSG: hw_interface_plugin_dynamixel/servoUpdate
uint64 ABILITY_NOP = 0
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



(provide :hw_interface_plugin_dynamixel/groupServoUpdate "e6ee49bcc6a9ac8d662236a4935e5ee8")


