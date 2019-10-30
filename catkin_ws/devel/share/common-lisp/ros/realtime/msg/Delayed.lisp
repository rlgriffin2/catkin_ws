; Auto-generated. Do not edit!


(cl:in-package realtime-msg)


;//! \htmlinclude Delayed.msg.html

(cl:defclass <Delayed> (roslisp-msg-protocol:ros-message)
  ((delayed
    :reader delayed
    :initarg :delayed
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Delayed (<Delayed>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Delayed>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Delayed)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realtime-msg:<Delayed> is deprecated: use realtime-msg:Delayed instead.")))

(cl:ensure-generic-function 'delayed-val :lambda-list '(m))
(cl:defmethod delayed-val ((m <Delayed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realtime-msg:delayed-val is deprecated.  Use realtime-msg:delayed instead.")
  (delayed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Delayed>) ostream)
  "Serializes a message object of type '<Delayed>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'delayed) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Delayed>) istream)
  "Deserializes a message object of type '<Delayed>"
    (cl:setf (cl:slot-value msg 'delayed) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Delayed>)))
  "Returns string type for a message object of type '<Delayed>"
  "realtime/Delayed")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Delayed)))
  "Returns string type for a message object of type 'Delayed"
  "realtime/Delayed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Delayed>)))
  "Returns md5sum for a message object of type '<Delayed>"
  "c9f55addc8a4b231e9f74c9f4032e734")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Delayed)))
  "Returns md5sum for a message object of type 'Delayed"
  "c9f55addc8a4b231e9f74c9f4032e734")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Delayed>)))
  "Returns full string definition for message of type '<Delayed>"
  (cl:format cl:nil "bool delayed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Delayed)))
  "Returns full string definition for message of type 'Delayed"
  (cl:format cl:nil "bool delayed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Delayed>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Delayed>))
  "Converts a ROS message object to a list"
  (cl:list 'Delayed
    (cl:cons ':delayed (delayed msg))
))
