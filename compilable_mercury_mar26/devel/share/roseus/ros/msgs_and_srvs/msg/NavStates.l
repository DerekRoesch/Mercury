;; Auto-generated. Do not edit!


(when (boundp 'msgs_and_srvs::NavStates)
  (if (not (find-package "MSGS_AND_SRVS"))
    (make-package "MSGS_AND_SRVS"))
  (shadow 'NavStates (find-package "MSGS_AND_SRVS")))
(unless (find-package "MSGS_AND_SRVS::NAVSTATES")
  (make-package "MSGS_AND_SRVS::NAVSTATES"))

(in-package "ROS")
;;//! \htmlinclude NavStates.msg.html


(defclass msgs_and_srvs::NavStates
  :super ros::object
  :slots (_speed _direction _angularSpeed ))

(defmethod msgs_and_srvs::NavStates
  (:init
   (&key
    ((:speed __speed) 0.0)
    ((:direction __direction) 0.0)
    ((:angularSpeed __angularSpeed) 0.0)
    )
   (send-super :init)
   (setq _speed (float __speed))
   (setq _direction (float __direction))
   (setq _angularSpeed (float __angularSpeed))
   self)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:angularSpeed
   (&optional __angularSpeed)
   (if __angularSpeed (setq _angularSpeed __angularSpeed)) _angularSpeed)
  (:serialization-length
   ()
   (+
    ;; float32 _speed
    4
    ;; float32 _direction
    4
    ;; float32 _angularSpeed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _direction
       (sys::poke _direction (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angularSpeed
       (sys::poke _angularSpeed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _direction
     (setq _direction (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angularSpeed
     (setq _angularSpeed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get msgs_and_srvs::NavStates :md5sum-) "9caa5a4893d2cb6d4b1fa5b1dce8f2a3")
(setf (get msgs_and_srvs::NavStates :datatype-) "msgs_and_srvs/NavStates")
(setf (get msgs_and_srvs::NavStates :definition-)
      "float32 speed
float32 direction
float32 angularSpeed

")



(provide :msgs_and_srvs/NavStates "9caa5a4893d2cb6d4b1fa5b1dce8f2a3")


