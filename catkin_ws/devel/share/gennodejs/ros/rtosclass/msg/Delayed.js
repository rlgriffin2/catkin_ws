// Auto-generated. Do not edit!

// (in-package rtosclass.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Delayed {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.delayed = null;
    }
    else {
      if (initObj.hasOwnProperty('delayed')) {
        this.delayed = initObj.delayed
      }
      else {
        this.delayed = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Delayed
    // Serialize message field [delayed]
    bufferOffset = _serializer.bool(obj.delayed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Delayed
    let len;
    let data = new Delayed(null);
    // Deserialize message field [delayed]
    data.delayed = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rtosclass/Delayed';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c9f55addc8a4b231e9f74c9f4032e734';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool delayed
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Delayed(null);
    if (msg.delayed !== undefined) {
      resolved.delayed = msg.delayed;
    }
    else {
      resolved.delayed = false
    }

    return resolved;
    }
};

module.exports = Delayed;
