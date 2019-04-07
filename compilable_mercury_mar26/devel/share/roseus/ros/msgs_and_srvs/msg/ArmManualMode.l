;; Auto-generated. Do not edit!


(when (boundp 'msgs_and_srvs::ArmManualMode)
  (if (not (find-package "MSGS_AND_SRVS"))
    (make-package "MSGS_AND_SRVS"))
  (shadow 'ArmManualMode (find-package "MSGS_AND_SRVS")))
(unless (find-package "MSGS_AND_SRVS::ARMMANUALMODE")
  (make-package "MSGS_AND_SRVS::ARMMANUALMODE"))

(in-package "ROS")
;;//! \htmlinclude ArmManualMode.msg.html


(defclass msgs_and_srvs::ArmManualMode
  :super ros::object
  :slots (_manualMode _selectedJoint ))

(defmethod msgs_and_srvs::ArmManualMode
  (:init
   (&key
    ((:manualMode __manualMode) nil)
    ((:selectedJoint __selectedJoint) "")
    )
   (send-super :init)
   (setq _manualMode __manualMode)
   (setq _selectedJoint (string __selectedJoint))
   self)
  (:manualMode
   (&optional __manualMode)
   (if __manualMode (setq _manualMode __manualMode)) _manualMode)
  (:selectedJoint
   (&optional __selectedJoint)
   (if __selectedJoint (setq _selectedJoint __selectedJoint)) _selectedJoint)
  (:serialization-length
   ()
   (+
    ;; bool _manualMode
    1
    ;; string _selectedJoint
    4 (length _selectedJoint)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _manualMode
       (if _manualMode (write-byte -1 s) (write-byte 0 s))
     ;; string _selectedJoint
       (write-long (length _selectedJoint) s) (princ _selectedJoint s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _manualMode
     (setq _manualMode (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _selectedJoint
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _selectedJoint (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get msgs_and_srvs::ArmManualMode :md5sum-) "5e2c37a64ce17164b802f9f6014495cb")
(setf (get msgs_and_srvs::ArmManualMode :datatype-) "msgs_and_srvs/ArmManualMode")
(setf (get msgs_and_srvs::ArmManualMode :definition-)
      "bool manualMode
string selectedJoint

")



(provide :msgs_and_srvs/ArmManualMode "5e2c37a64ce17164b802f9f6014495cb")


