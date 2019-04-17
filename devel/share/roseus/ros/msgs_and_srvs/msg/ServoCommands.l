;; Auto-generated. Do not edit!


(when (boundp 'msgs_and_srvs::ServoCommands)
  (if (not (find-package "MSGS_AND_SRVS"))
    (make-package "MSGS_AND_SRVS"))
  (shadow 'ServoCommands (find-package "MSGS_AND_SRVS")))
(unless (find-package "MSGS_AND_SRVS::SERVOCOMMANDS")
  (make-package "MSGS_AND_SRVS::SERVOCOMMANDS"))

(in-package "ROS")
;;//! \htmlinclude ServoCommands.msg.html


(defclass msgs_and_srvs::ServoCommands
  :super ros::object
  :slots (_flSpeed _blSpeed _frSpeed _brSpeed _flTurnAngle _blTurnAngle _frTurnAngle _brTurnAngle ))

(defmethod msgs_and_srvs::ServoCommands
  (:init
   (&key
    ((:flSpeed __flSpeed) 0.0)
    ((:blSpeed __blSpeed) 0.0)
    ((:frSpeed __frSpeed) 0.0)
    ((:brSpeed __brSpeed) 0.0)
    ((:flTurnAngle __flTurnAngle) 0.0)
    ((:blTurnAngle __blTurnAngle) 0.0)
    ((:frTurnAngle __frTurnAngle) 0.0)
    ((:brTurnAngle __brTurnAngle) 0.0)
    )
   (send-super :init)
   (setq _flSpeed (float __flSpeed))
   (setq _blSpeed (float __blSpeed))
   (setq _frSpeed (float __frSpeed))
   (setq _brSpeed (float __brSpeed))
   (setq _flTurnAngle (float __flTurnAngle))
   (setq _blTurnAngle (float __blTurnAngle))
   (setq _frTurnAngle (float __frTurnAngle))
   (setq _brTurnAngle (float __brTurnAngle))
   self)
  (:flSpeed
   (&optional __flSpeed)
   (if __flSpeed (setq _flSpeed __flSpeed)) _flSpeed)
  (:blSpeed
   (&optional __blSpeed)
   (if __blSpeed (setq _blSpeed __blSpeed)) _blSpeed)
  (:frSpeed
   (&optional __frSpeed)
   (if __frSpeed (setq _frSpeed __frSpeed)) _frSpeed)
  (:brSpeed
   (&optional __brSpeed)
   (if __brSpeed (setq _brSpeed __brSpeed)) _brSpeed)
  (:flTurnAngle
   (&optional __flTurnAngle)
   (if __flTurnAngle (setq _flTurnAngle __flTurnAngle)) _flTurnAngle)
  (:blTurnAngle
   (&optional __blTurnAngle)
   (if __blTurnAngle (setq _blTurnAngle __blTurnAngle)) _blTurnAngle)
  (:frTurnAngle
   (&optional __frTurnAngle)
   (if __frTurnAngle (setq _frTurnAngle __frTurnAngle)) _frTurnAngle)
  (:brTurnAngle
   (&optional __brTurnAngle)
   (if __brTurnAngle (setq _brTurnAngle __brTurnAngle)) _brTurnAngle)
  (:serialization-length
   ()
   (+
    ;; float32 _flSpeed
    4
    ;; float32 _blSpeed
    4
    ;; float32 _frSpeed
    4
    ;; float32 _brSpeed
    4
    ;; float32 _flTurnAngle
    4
    ;; float32 _blTurnAngle
    4
    ;; float32 _frTurnAngle
    4
    ;; float32 _brTurnAngle
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _flSpeed
       (sys::poke _flSpeed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _blSpeed
       (sys::poke _blSpeed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _frSpeed
       (sys::poke _frSpeed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _brSpeed
       (sys::poke _brSpeed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _flTurnAngle
       (sys::poke _flTurnAngle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _blTurnAngle
       (sys::poke _blTurnAngle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _frTurnAngle
       (sys::poke _frTurnAngle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _brTurnAngle
       (sys::poke _brTurnAngle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _flSpeed
     (setq _flSpeed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _blSpeed
     (setq _blSpeed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _frSpeed
     (setq _frSpeed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _brSpeed
     (setq _brSpeed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _flTurnAngle
     (setq _flTurnAngle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _blTurnAngle
     (setq _blTurnAngle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _frTurnAngle
     (setq _frTurnAngle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _brTurnAngle
     (setq _brTurnAngle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get msgs_and_srvs::ServoCommands :md5sum-) "ad381411873b60f8ac0ce1b85ac7dbd2")
(setf (get msgs_and_srvs::ServoCommands :datatype-) "msgs_and_srvs/ServoCommands")
(setf (get msgs_and_srvs::ServoCommands :definition-)
      "float32 flSpeed
float32 blSpeed
float32 frSpeed
float32 brSpeed
float32 flTurnAngle
float32 blTurnAngle
float32 frTurnAngle
float32 brTurnAngle

")



(provide :msgs_and_srvs/ServoCommands "ad381411873b60f8ac0ce1b85ac7dbd2")


