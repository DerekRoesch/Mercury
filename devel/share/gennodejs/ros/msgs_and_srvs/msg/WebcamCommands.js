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

class WebcamCommands {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.start = null;
      this.serverAddress = null;
      this.serverPort = null;
    }
    else {
      if (initObj.hasOwnProperty('start')) {
        this.start = initObj.start
      }
      else {
        this.start = false;
      }
      if (initObj.hasOwnProperty('serverAddress')) {
        this.serverAddress = initObj.serverAddress
      }
      else {
        this.serverAddress = '';
      }
      if (initObj.hasOwnProperty('serverPort')) {
        this.serverPort = initObj.serverPort
      }
      else {
        this.serverPort = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WebcamCommands
    // Serialize message field [start]
    bufferOffset = _serializer.bool(obj.start, buffer, bufferOffset);
    // Serialize message field [serverAddress]
    bufferOffset = _serializer.string(obj.serverAddress, buffer, bufferOffset);
    // Serialize message field [serverPort]
    bufferOffset = _serializer.uint32(obj.serverPort, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WebcamCommands
    let len;
    let data = new WebcamCommands(null);
    // Deserialize message field [start]
    data.start = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [serverAddress]
    data.serverAddress = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [serverPort]
    data.serverPort = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.serverAddress.length;
    return length + 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'msgs_and_srvs/WebcamCommands';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cf8209a39d7dbfef347c708799d329fe';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool start
    string serverAddress
    uint32 serverPort
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new WebcamCommands(null);
    if (msg.start !== undefined) {
      resolved.start = msg.start;
    }
    else {
      resolved.start = false
    }

    if (msg.serverAddress !== undefined) {
      resolved.serverAddress = msg.serverAddress;
    }
    else {
      resolved.serverAddress = ''
    }

    if (msg.serverPort !== undefined) {
      resolved.serverPort = msg.serverPort;
    }
    else {
      resolved.serverPort = 0
    }

    return resolved;
    }
};

module.exports = WebcamCommands;
