; Auto-generated. Do not edit!


(cl:in-package rtosclass-msg)


;//! \htmlinclude Message.msg.html

(cl:defclass <Message> (roslisp-msg-protocol:ros-message)
  ((info
    :reader info
    :initarg :info
    :type cl:string
    :initform ""))
)

(cl:defclass Message (<Message>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Message>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Message)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rtosclass-msg:<Message> is deprecated: use rtosclass-msg:Message instead.")))

(cl:ensure-generic-function 'info-val :lambda-list '(m))
(cl:defmethod info-val ((m <Message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rtosclass-msg:info-val is deprecated.  Use rtosclass-msg:info instead.")
  (info m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Message>) ostream)
  "Serializes a message object of type '<Message>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'info))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'info))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Message>) istream)
  "Deserializes a message object of type '<Message>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'info) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'info) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Message>)))
  "Returns string type for a message object of type '<Message>"
  "rtosclass/Message")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Message)))
  "Returns string type for a message object of type 'Message"
  "rtosclass/Message")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Message>)))
  "Returns md5sum for a message object of type '<Message>"
  "c10fc26d5cca9a4b9114f5fc5dea9570")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Message)))
  "Returns md5sum for a message object of type 'Message"
  "c10fc26d5cca9a4b9114f5fc5dea9570")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Message>)))
  "Returns full string definition for message of type '<Message>"
  (cl:format cl:nil "string info~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Message)))
  "Returns full string definition for message of type 'Message"
  (cl:format cl:nil "string info~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Message>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'info))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Message>))
  "Converts a ROS message object to a list"
  (cl:list 'Message
    (cl:cons ':info (info msg))
))
