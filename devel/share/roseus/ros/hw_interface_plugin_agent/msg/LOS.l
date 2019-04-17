;; Auto-generated. Do not edit!


(when (boundp 'hw_interface_plugin_agent::LOS)
  (if (not (find-package "HW_INTERFACE_PLUGIN_AGENT"))
    (make-package "HW_INTERFACE_PLUGIN_AGENT"))
  (shadow 'LOS (find-package "HW_INTERFACE_PLUGIN_AGENT")))
(unless (find-package "HW_INTERFACE_PLUGIN_AGENT::LOS")
  (make-package "HW_INTERFACE_PLUGIN_AGENT::LOS"))

(in-package "ROS")
;;//! \htmlinclude LOS.msg.html


(defclass hw_interface_plugin_agent::LOS
  :super ros::object
  :slots (_LOS ))

(defmethod hw_interface_plugin_agent::LOS
  (:init
   (&key
    ((:LOS __LOS) 0)
    )
   (send-super :init)
   (setq _LOS (round __LOS))
   self)
  (:LOS
   (&optional __LOS)
   (if __LOS (setq _LOS __LOS)) _LOS)
  (:serialization-length
   ()
   (+
    ;; uint8 _LOS
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _LOS
       (write-byte _LOS s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _LOS
     (setq _LOS (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get hw_interface_plugin_agent::LOS :md5sum-) "3e0c4070d76fb968c478473a13650bdd")
(setf (get hw_interface_plugin_agent::LOS :datatype-) "hw_interface_plugin_agent/LOS")
(setf (get hw_interface_plugin_agent::LOS :definition-)
      "uint8 LOS

")



(provide :hw_interface_plugin_agent/LOS "3e0c4070d76fb968c478473a13650bdd")


