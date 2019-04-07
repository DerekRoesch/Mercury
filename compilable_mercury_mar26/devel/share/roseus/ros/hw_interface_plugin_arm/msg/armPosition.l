;; Auto-generated. Do not edit!


(when (boundp 'hw_interface_plugin_arm::armPosition)
  (if (not (find-package "HW_INTERFACE_PLUGIN_ARM"))
    (make-package "HW_INTERFACE_PLUGIN_ARM"))
  (shadow 'armPosition (find-package "HW_INTERFACE_PLUGIN_ARM")))
(unless (find-package "HW_INTERFACE_PLUGIN_ARM::ARMPOSITION")
  (make-package "HW_INTERFACE_PLUGIN_ARM::ARMPOSITION"))

(in-package "ROS")
;;//! \htmlinclude armPosition.msg.html


(defclass hw_interface_plugin_arm::armPosition
  :super ros::object
  :slots (_pos ))

(defmethod hw_interface_plugin_arm::armPosition
  (:init
   (&key
    ((:pos __pos) (make-array 5 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _pos __pos)
   self)
  (:pos
   (&optional __pos)
   (if __pos (setq _pos __pos)) _pos)
  (:serialization-length
   ()
   (+
    ;; uint8[5] _pos
    (* 1    5)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8[5] _pos
     (princ _pos s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8[5] _pos
   (setq _pos (make-array 5 :element-type :char))
   (replace _pos buf :start2 ptr-) (incf ptr- 5)
   ;;
   self)
  )

(setf (get hw_interface_plugin_arm::armPosition :md5sum-) "d87336f0d14ef5164ad497c9edcf53e0")
(setf (get hw_interface_plugin_arm::armPosition :datatype-) "hw_interface_plugin_arm/armPosition")
(setf (get hw_interface_plugin_arm::armPosition :definition-)
      "uint8[5] pos

")



(provide :hw_interface_plugin_arm/armPosition "d87336f0d14ef5164ad497c9edcf53e0")


