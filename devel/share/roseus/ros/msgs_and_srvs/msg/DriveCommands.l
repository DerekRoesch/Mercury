;; Auto-generated. Do not edit!


(when (boundp 'msgs_and_srvs::DriveCommands)
  (if (not (find-package "MSGS_AND_SRVS"))
    (make-package "MSGS_AND_SRVS"))
  (shadow 'DriveCommands (find-package "MSGS_AND_SRVS")))
(unless (find-package "MSGS_AND_SRVS::DRIVECOMMANDS")
  (make-package "MSGS_AND_SRVS::DRIVECOMMANDS"))

(in-package "ROS")
;;//! \htmlinclude DriveCommands.msg.html


(defclass msgs_and_srvs::DriveCommands
  :super ros::object
  :slots (_allStop _fastMode ))

(defmethod msgs_and_srvs::DriveCommands
  (:init
   (&key
    ((:allStop __allStop) nil)
    ((:fastMode __fastMode) nil)
    )
   (send-super :init)
   (setq _allStop __allStop)
   (setq _fastMode __fastMode)
   self)
  (:allStop
   (&optional __allStop)
   (if __allStop (setq _allStop __allStop)) _allStop)
  (:fastMode
   (&optional __fastMode)
   (if __fastMode (setq _fastMode __fastMode)) _fastMode)
  (:serialization-length
   ()
   (+
    ;; bool _allStop
    1
    ;; bool _fastMode
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _allStop
       (if _allStop (write-byte -1 s) (write-byte 0 s))
     ;; bool _fastMode
       (if _fastMode (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _allStop
     (setq _allStop (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _fastMode
     (setq _fastMode (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get msgs_and_srvs::DriveCommands :md5sum-) "e4865336e17f16193eb66cf5414820f8")
(setf (get msgs_and_srvs::DriveCommands :datatype-) "msgs_and_srvs/DriveCommands")
(setf (get msgs_and_srvs::DriveCommands :definition-)
      "bool allStop
bool fastMode

")



(provide :msgs_and_srvs/DriveCommands "e4865336e17f16193eb66cf5414820f8")


