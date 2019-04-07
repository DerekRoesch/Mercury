// Auto-generated. Do not edit!

// (in-package hw_interface_plugin_arm.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class armPosition {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pos = null;
    }
    else {
      if (initObj.hasOwnProperty('pos')) {
        this.pos = initObj.pos
      }
      else {
        this.pos = new Array(5).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type armPosition
    // Check that the constant length array field [pos] has the right length
    if (obj.pos.length !== 5) {
      throw new Error('Unable to serialize array field pos - length must be 5')
    }
    // Serialize message field [pos]
    bufferOffset = _arraySerializer.uint8(obj.pos, buffer, bufferOffset, 5);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type armPosition
    let len;
    let data = new armPosition(null);
    // Deserialize message field [pos]
    data.pos = _arrayDeserializer.uint8(buffer, bufferOffset, 5)
    return data;
  }

  static getMessageSize(object) {
    return 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'hw_interface_plugin_arm/armPosition';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd87336f0d14ef5164ad497c9edcf53e0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8[5] pos
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new armPosition(null);
    if (msg.pos !== undefined) {
      resolved.pos = msg.pos;
    }
    else {
      resolved.pos = new Array(5).fill(0)
    }

    return resolved;
    }
};

module.exports = armPosition;
