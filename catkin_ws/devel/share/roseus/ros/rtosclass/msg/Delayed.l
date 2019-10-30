;; Auto-generated. Do not edit!


(when (boundp 'rtosclass::Delayed)
  (if (not (find-package "RTOSCLASS"))
    (make-package "RTOSCLASS"))
  (shadow 'Delayed (find-package "RTOSCLASS")))
(unless (find-package "RTOSCLASS::DELAYED")
  (make-package "RTOSCLASS::DELAYED"))

(in-package "ROS")
;;//! \htmlinclude Delayed.msg.html


(defclass rtosclass::Delayed
  :super ros::object
  :slots (_delayed ))

(defmethod rtosclass::Delayed
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

(setf (get rtosclass::Delayed :md5sum-) "c9f55addc8a4b231e9f74c9f4032e734")
(setf (get rtosclass::Delayed :datatype-) "rtosclass/Delayed")
(setf (get rtosclass::Delayed :definition-)
      "bool delayed

")



(provide :rtosclass/Delayed "c9f55addc8a4b231e9f74c9f4032e734")


