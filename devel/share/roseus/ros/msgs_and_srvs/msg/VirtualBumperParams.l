;; Auto-generated. Do not edit!


(when (boundp 'msgs_and_srvs::VirtualBumperParams)
  (if (not (find-package "MSGS_AND_SRVS"))
    (make-package "MSGS_AND_SRVS"))
  (shadow 'VirtualBumperParams (find-package "MSGS_AND_SRVS")))
(unless (find-package "MSGS_AND_SRVS::VIRTUALBUMPERPARAMS")
  (make-package "MSGS_AND_SRVS::VIRTUALBUMPERPARAMS"))

(in-package "ROS")
;;//! \htmlinclude VirtualBumperParams.msg.html


(defclass msgs_and_srvs::VirtualBumperParams
  :super ros::object
  :slots (_active _radius _springConstant ))

(defmethod msgs_and_srvs::VirtualBumperParams
  (:init
   (&key
    ((:active __active) nil)
    ((:radius __radius) 0.0)
    ((:springConstant __springConstant) 0.0)
    )
   (send-super :init)
   (setq _active __active)
   (setq _radius (float __radius))
   (setq _springConstant (float __springConstant))
   self)
  (:active
   (&optional __active)
   (if __active (setq _active __active)) _active)
  (:radius
   (&optional __radius)
   (if __radius (setq _radius __radius)) _radius)
  (:springConstant
   (&optional __springConstant)
   (if __springConstant (setq _springConstant __springConstant)) _springConstant)
  (:serialization-length
   ()
   (+
    ;; bool _active
    1
    ;; float32 _radius
    4
    ;; float32 _springConstant
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _active
       (if _active (write-byte -1 s) (write-byte 0 s))
     ;; float32 _radius
       (sys::poke _radius (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _springConstant
       (sys::poke _springConstant (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _active
     (setq _active (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _radius
     (setq _radius (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _springConstant
     (setq _springConstant (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get msgs_and_srvs::VirtualBumperParams :md5sum-) "7f390f4d392b83cae602d14c4638fb17")
(setf (get msgs_and_srvs::VirtualBumperParams :datatype-) "msgs_and_srvs/VirtualBumperParams")
(setf (get msgs_and_srvs::VirtualBumperParams :definition-)
      "bool active
float32 radius
float32 springConstant

")



(provide :msgs_and_srvs/VirtualBumperParams "7f390f4d392b83cae602d14c4638fb17")


