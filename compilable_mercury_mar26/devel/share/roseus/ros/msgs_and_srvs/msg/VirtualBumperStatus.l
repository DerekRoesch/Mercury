;; Auto-generated. Do not edit!


(when (boundp 'msgs_and_srvs::VirtualBumperStatus)
  (if (not (find-package "MSGS_AND_SRVS"))
    (make-package "MSGS_AND_SRVS"))
  (shadow 'VirtualBumperStatus (find-package "MSGS_AND_SRVS")))
(unless (find-package "MSGS_AND_SRVS::VIRTUALBUMPERSTATUS")
  (make-package "MSGS_AND_SRVS::VIRTUALBUMPERSTATUS"))

(in-package "ROS")
;;//! \htmlinclude VirtualBumperStatus.msg.html


(defclass msgs_and_srvs::VirtualBumperStatus
  :super ros::object
  :slots (_pointInsideBumper _closestPointDistance _closestPointDirection ))

(defmethod msgs_and_srvs::VirtualBumperStatus
  (:init
   (&key
    ((:pointInsideBumper __pointInsideBumper) nil)
    ((:closestPointDistance __closestPointDistance) 0.0)
    ((:closestPointDirection __closestPointDirection) 0.0)
    )
   (send-super :init)
   (setq _pointInsideBumper __pointInsideBumper)
   (setq _closestPointDistance (float __closestPointDistance))
   (setq _closestPointDirection (float __closestPointDirection))
   self)
  (:pointInsideBumper
   (&optional __pointInsideBumper)
   (if __pointInsideBumper (setq _pointInsideBumper __pointInsideBumper)) _pointInsideBumper)
  (:closestPointDistance
   (&optional __closestPointDistance)
   (if __closestPointDistance (setq _closestPointDistance __closestPointDistance)) _closestPointDistance)
  (:closestPointDirection
   (&optional __closestPointDirection)
   (if __closestPointDirection (setq _closestPointDirection __closestPointDirection)) _closestPointDirection)
  (:serialization-length
   ()
   (+
    ;; bool _pointInsideBumper
    1
    ;; float32 _closestPointDistance
    4
    ;; float32 _closestPointDirection
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _pointInsideBumper
       (if _pointInsideBumper (write-byte -1 s) (write-byte 0 s))
     ;; float32 _closestPointDistance
       (sys::poke _closestPointDistance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _closestPointDirection
       (sys::poke _closestPointDirection (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _pointInsideBumper
     (setq _pointInsideBumper (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _closestPointDistance
     (setq _closestPointDistance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _closestPointDirection
     (setq _closestPointDirection (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get msgs_and_srvs::VirtualBumperStatus :md5sum-) "04d921a3fed1e194d4292fdcb5f3f0a3")
(setf (get msgs_and_srvs::VirtualBumperStatus :datatype-) "msgs_and_srvs/VirtualBumperStatus")
(setf (get msgs_and_srvs::VirtualBumperStatus :definition-)
      "bool pointInsideBumper
float32 closestPointDistance
float32 closestPointDirection

")



(provide :msgs_and_srvs/VirtualBumperStatus "04d921a3fed1e194d4292fdcb5f3f0a3")


