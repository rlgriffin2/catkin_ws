
(cl:in-package :asdf)

(defsystem "rtosclass-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Delayed" :depends-on ("_package_Delayed"))
    (:file "_package_Delayed" :depends-on ("_package"))
    (:file "Message" :depends-on ("_package_Message"))
    (:file "_package_Message" :depends-on ("_package"))
  ))