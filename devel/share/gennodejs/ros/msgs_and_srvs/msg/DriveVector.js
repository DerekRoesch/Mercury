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

class DriveVector {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.speed = null;
      this.direction = null;
      this.angularSpeed = null;
      this.allStop = null;
    }
    else {
      if (initObj.hasOwnProperty('speed')) {
        this.speed = initObj.speed
      }
      else {
        this.speed = 0.0;
      }
      if (initObj.hasOwnProperty('direction')) {
        this.direction = initObj.direction
      }
      else {
        this.direction = 0.0;
      }
      if (initObj.hasOwnProperty('angularSpeed')) {
        this.angularSpeed = initObj.angularSpeed
      }
      else {
        this.angularSpeed = 0.0;
      }
      if (initObj.hasOwnProperty('allStop')) {
        this.allStop = initObj.allStop
      }
      else {
        this.allStop = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DriveVector
    // Serialize message field [speed]
    bufferOffset = _serializer.float32(obj.speed, buffer, bufferOffset);
    // Serialize message field [direction]
    bufferOffset = _serializer.float32(obj.direction, buffer, bufferOffset);
    // Serialize message field [angularSpeed]
    bufferOffset = _serializer.float32(obj.angularSpeed, buffer, bufferOffset);
    // Serialize message field [allStop]
    bufferOffset = _serializer.bool(obj.allStop, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DriveVector
    let len;
    let data = new DriveVector(null);
    // Deserialize message field [speed]
    data.speed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [direction]
    data.direction = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angularSpeed]
    data.angularSpeed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [allStop]
    data.allStop = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'msgs_and_srvs/DriveVector';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '37ae2201b8c904c2c7b9f43b7439cdbe';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 speed
    float32 direction
    float32 angularSpeed
    bool allStop
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DriveVector(null);
    if (msg.speed !== undefined) {
      resolved.speed = msg.speed;
    }
    else {
      resolved.speed = 0.0
    }

    if (msg.direction !== undefined) {
      resolved.direction = msg.direction;
    }
    else {
      resolved.direction = 0.0
    }

    if (msg.angularSpeed !== undefined) {
      resolved.angularSpeed = msg.angularSpeed;
    }
    else {
      resolved.angularSpeed = 0.0
    }

    if (msg.allStop !== undefined) {
      resolved.allStop = msg.allStop;
    }
    else {
      resolved.allStop = false
    }

    return resolved;
    }
};

module.exports = DriveVector;
