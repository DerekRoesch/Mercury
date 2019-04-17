// Auto-generated. Do not edit!

// (in-package hw_interface_plugin_agent.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class LOS {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.LOS = null;
    }
    else {
      if (initObj.hasOwnProperty('LOS')) {
        this.LOS = initObj.LOS
      }
      else {
        this.LOS = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LOS
    // Serialize message field [LOS]
    bufferOffset = _serializer.uint8(obj.LOS, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LOS
    let len;
    let data = new LOS(null);
    // Deserialize message field [LOS]
    data.LOS = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'hw_interface_plugin_agent/LOS';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3e0c4070d76fb968c478473a13650bdd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 LOS
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LOS(null);
    if (msg.LOS !== undefined) {
      resolved.LOS = msg.LOS;
    }
    else {
      resolved.LOS = 0
    }

    return resolved;
    }
};

module.exports = LOS;
