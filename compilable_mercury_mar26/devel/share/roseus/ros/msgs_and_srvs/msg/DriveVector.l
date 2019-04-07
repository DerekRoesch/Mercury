;; Auto-generated. Do not edit!


(when (boundp 'msgs_and_srvs::DriveVector)
  (if (not (find-package "MSGS_AND_SRVS"))
    (make-package "MSGS_AND_SRVS"))
  (shadow 'DriveVector (find-package "MSGS_AND_SRVS")))
(unless (find-package "MSGS_AND_SRVS::DRIVEVECTOR")
  (make-package "MSGS_AND_SRVS::DRIVEVECTOR"))

(in-package "ROS")
;;//! \htmlinclude DriveVector.msg.html


(defclass msgs_and_srvs::DriveVector
  :super ros::object
  :slots (_speed _direction _angularSpeed _allStop ))

(defmethod msgs_and_srvs::DriveVector
  (:init
   (&key
    ((:speed __speed) 0.0)
    ((:direction __direction) 0.0)
    ((:angularSpeed __angularSpeed) 0.0)
    ((:allStop __allStop) nil)
    )
   (send-super :init)
   (setq _speed (float __speed))
   (setq _direction (float __direction))
   (setq _angularSpeed (float __angularSpeed))
   (setq _allStop __allStop)
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
  (:allStop
   (&optional __allStop)
   (if __allStop (setq _allStop __allStop)) _allStop)
  (:serialization-length
   ()
   (+
    ;; float32 _speed
    4
    ;; float32 _direction
    4
    ;; float32 _angularSpeed
    4
    ;; bool _allStop
    1
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
     ;; bool _allStop
       (if _allStop (write-byte -1 s) (write-byte 0 s))
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
   ;; bool _allStop
     (setq _allStop (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get msgs_and_srvs::DriveVector :md5sum-) "37ae2201b8c904c2c7b9f43b7439cdbe")
(setf (get msgs_and_srvs::DriveVector :datatype-) "msgs_and_srvs/DriveVector")
(setf (get msgs_and_srvs::DriveVector :definition-)
      "float32 speed
float32 direction
float32 angularSpeed
bool allStop

")



(provide :msgs_and_srvs/DriveVector "37ae2201b8c904c2c7b9f43b7439cdbe")


