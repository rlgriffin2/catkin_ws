;; Auto-generated. Do not edit!


(when (boundp 'realtime::Delayed)
  (if (not (find-package "REALTIME"))
    (make-package "REALTIME"))
  (shadow 'Delayed (find-package "REALTIME")))
(unless (find-package "REALTIME::DELAYED")
  (make-package "REALTIME::DELAYED"))

(in-package "ROS")
;;//! \htmlinclude Delayed.msg.html


(defclass realtime::Delayed
  :super ros::object
  :slots (_delayed ))

(defmethod realtime::Delayed
  (:init
   (&key
    ((:delayed __delayed) nil)
    )
   (send-super :init)
   (setq _delayed __delayed)
   self)
  (:delayed
   (&optional __delayed)
   (if __delayed (setq _delayed __delayed)) _delayed)
  (:serialization-length
   ()
   (+
    ;; bool _delayed
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _delayed
       (if _delayed (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _delayed
     (setq _delayed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get realtime::Delayed :md5sum-) "c9f55addc8a4b231e9f74c9f4032e734")
(setf (get realtime::Delayed :datatype-) "realtime/Delayed")
(setf (get realtime::Delayed :definition-)
      "bool delayed

")



(provide :realtime/Delayed "c9f55addc8a4b231e9f74c9f4032e734")


