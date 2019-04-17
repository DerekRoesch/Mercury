
(cl:in-package :asdf)

(defsystem "hw_interface_plugin_agent-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "LOS" :depends-on ("_package_LOS"))
    (:file "_package_LOS" :depends-on ("_package"))
  ))