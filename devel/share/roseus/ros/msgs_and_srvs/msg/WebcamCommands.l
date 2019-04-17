;; Auto-generated. Do not edit!


(when (boundp 'msgs_and_srvs::WebcamCommands)
  (if (not (find-package "MSGS_AND_SRVS"))
    (make-package "MSGS_AND_SRVS"))
  (shadow 'WebcamCommands (find-package "MSGS_AND_SRVS")))
(unless (find-package "MSGS_AND_SRVS::WEBCAMCOMMANDS")
  (make-package "MSGS_AND_SRVS::WEBCAMCOMMANDS"))

(in-package "ROS")
;;//! \htmlinclude WebcamCommands.msg.html


(defclass msgs_and_srvs::WebcamCommands
  :super ros::object
  :slots (_start _serverAddress _serverPort ))

(defmethod msgs_and_srvs::WebcamCommands
  (:init
   (&key
    ((:start __start) nil)
    ((:serverAddress __serverAddress) "")
    ((:serverPort __serverPort) 0)
    )
   (send-super :init)
   (setq _start __start)
   (setq _serverAddress (string __serverAddress))
   (setq _serverPort (round __serverPort))
   self)
  (:start
   (&optional __start)
   (if __start (setq _start __start)) _start)
  (:serverAddress
   (&optional __serverAddress)
   (if __serverAddress (setq _serverAddress __serverAddress)) _serverAddress)
  (:serverPort
   (&optional __serverPort)
   (if __serverPort (setq _serverPort __serverPort)) _serverPort)
  (:serialization-length
   ()
   (+
    ;; bool _start
    1
    ;; string _serverAddress
    4 (length _serverAddress)
    ;; uint32 _serverPort
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _start
       (if _start (write-byte -1 s) (write-byte 0 s))
     ;; string _serverAddress
       (write-long (length _serverAddress) s) (princ _serverAddress s)
     ;; uint32 _serverPort
       (write-long _serverPort s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _start
     (setq _start (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _serverAddress
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _serverAddress (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint32 _serverPort
     (setq _serverPort (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get msgs_and_srvs::WebcamCommands :md5sum-) "cf8209a39d7dbfef347c708799d329fe")
(setf (get msgs_and_srvs::WebcamCommands :datatype-) "msgs_and_srvs/WebcamCommands")
(setf (get msgs_and_srvs::WebcamCommands :definition-)
      "bool start
string serverAddress
uint32 serverPort
")



(provide :msgs_and_srvs/WebcamCommands "cf8209a39d7dbfef347c708799d329fe")


