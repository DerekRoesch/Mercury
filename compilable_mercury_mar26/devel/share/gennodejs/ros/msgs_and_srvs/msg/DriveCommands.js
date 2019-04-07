// Auto-generated. Do not edit!

// (in-package msgs_and_srvs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class DriveCommands {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.allStop = null;
      this.fastMode = null;
    }
    else {
      if (initObj.hasOwnProperty('allStop')) {
        this.allStop = initObj.allStop
      }
      else {
        this.allStop = false;
      }
      if (initObj.hasOwnProperty('fastMode')) {
        this.fastMode = initObj.fastMode
      }
      else {
        this.fastMode = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DriveCommands
    // Serialize message field [allStop]
    bufferOffset = _serializer.bool(obj.allStop, buffer, bufferOffset);
    // Serialize message field [fastMode]
    bufferOffset = _serializer.bool(obj.fastMode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DriveCommands
    let len;
    let data = new DriveCommands(null);
    // Deserialize message field [allStop]
    data.allStop = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [fastMode]
    data.fastMode = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'msgs_and_srvs/DriveCommands';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e4865336e17f16193eb66cf5414820f8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool allStop
    bool fastMode
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DriveCommands(null);
    if (msg.allStop !== undefined) {
      resolved.allStop = msg.allStop;
    }
    else {
      resolved.allStop = false
    }

    if (msg.fastMode !== undefined) {
      resolved.fastMode = msg.fastMode;
    }
    else {
      resolved.fastMode = false
    }

    return resolved;
    }
};

module.exports = DriveCommands;
