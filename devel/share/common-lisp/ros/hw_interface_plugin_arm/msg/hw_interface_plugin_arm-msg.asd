
(cl:in-package :asdf)

(defsystem "hw_interface_plugin_arm-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "armPosition" :depends-on ("_package_armPosition"))
    (:file "_package_armPosition" :depends-on ("_package"))
  ))