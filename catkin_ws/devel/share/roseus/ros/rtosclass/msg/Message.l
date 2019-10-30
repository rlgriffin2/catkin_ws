;; Auto-generated. Do not edit!


(when (boundp 'rtosclass::Message)
  (if (not (find-package "RTOSCLASS"))
    (make-package "RTOSCLASS"))
  (shadow 'Message (find-package "RTOSCLASS")))
(unless (find-package "RTOSCLASS::MESSAGE")
  (make-package "RTOSCLASS::MESSAGE"))

(in-package "ROS")
;;//! \htmlinclude Message.msg.html


(defclass rtosclass::Message
  :super ros::object
  :slots (_info ))

(defmethod rtosclass::Message
  (:init
   (&key
    ((:info __info) "")
    )
   (send-super :init)
   (setq _info (string __info))
   self)
  (:info
   (&optional __info)
   (if __info (setq _info __info)) _info)
  (:serialization-length
   ()
   (+
    ;; string _info
    4 (length _info)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _info
       (write-long (length _info) s) (princ _info s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _info
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _info (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get rtosclass::Message :md5sum-) "c10fc26d5cca9a4b9114f5fc5dea9570")
(setf (get rtosclass::Message :datatype-) "rtosclass/Message")
(setf (get rtosclass::Message :definition-)
      "string info

")



(provide :rtosclass/Message "c10fc26d5cca9a4b9114f5fc5dea9570")


