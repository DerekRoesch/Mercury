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

class ServoFeedback {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.flSpeed = null;
      this.blSpeed = null;
      this.frSpeed = null;
      this.brSpeed = null;
      this.flTurnAngle = null;
      this.blTurnAngle = null;
      this.frTurnAngle = null;
      this.brTurnAngle = null;
    }
    else {
      if (initObj.hasOwnProperty('flSpeed')) {
        this.flSpeed = initObj.flSpeed
      }
      else {
        this.flSpeed = 0.0;
      }
      if (initObj.hasOwnProperty('blSpeed')) {
        this.blSpeed = initObj.blSpeed
      }
      else {
        this.blSpeed = 0.0;
      }
      if (initObj.hasOwnProperty('frSpeed')) {
        this.frSpeed = initObj.frSpeed
      }
      else {
        this.frSpeed = 0.0;
      }
      if (initObj.hasOwnProperty('brSpeed')) {
        this.brSpeed = initObj.brSpeed
      }
      else {
        this.brSpeed = 0.0;
      }
      if (initObj.hasOwnProperty('flTurnAngle')) {
        this.flTurnAngle = initObj.flTurnAngle
      }
      else {
        this.flTurnAngle = 0.0;
      }
      if (initObj.hasOwnProperty('blTurnAngle')) {
        this.blTurnAngle = initObj.blTurnAngle
      }
      else {
        this.blTurnAngle = 0.0;
      }
      if (initObj.hasOwnProperty('frTurnAngle')) {
        this.frTurnAngle = initObj.frTurnAngle
      }
      else {
        this.frTurnAngle = 0.0;
      }
      if (initObj.hasOwnProperty('brTurnAngle')) {
        this.brTurnAngle = initObj.brTurnAngle
      }
      else {
        this.brTurnAngle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ServoFeedback
    // Serialize message field [flSpeed]
    bufferOffset = _serializer.float32(obj.flSpeed, buffer, bufferOffset);
    // Serialize message field [blSpeed]
    bufferOffset = _serializer.float32(obj.blSpeed, buffer, bufferOffset);
    // Serialize message field [frSpeed]
    bufferOffset = _serializer.float32(obj.frSpeed, buffer, bufferOffset);
    // Serialize message field [brSpeed]
    bufferOffset = _serializer.float32(obj.brSpeed, buffer, bufferOffset);
    // Serialize message field [flTurnAngle]
    bufferOffset = _serializer.float32(obj.flTurnAngle, buffer, bufferOffset);
    // Serialize message field [blTurnAngle]
    bufferOffset = _serializer.float32(obj.blTurnAngle, buffer, bufferOffset);
    // Serialize message field [frTurnAngle]
    bufferOffset = _serializer.float32(obj.frTurnAngle, buffer, bufferOffset);
    // Serialize message field [brTurnAngle]
    bufferOffset = _serializer.float32(obj.brTurnAngle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ServoFeedback
    let len;
    let data = new ServoFeedback(null);
    // Deserialize message field [flSpeed]
    data.flSpeed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [blSpeed]
    data.blSpeed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [frSpeed]
    data.frSpeed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [brSpeed]
    data.brSpeed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [flTurnAngle]
    data.flTurnAngle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [blTurnAngle]
    data.blTurnAngle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [frTurnAngle]
    data.frTurnAngle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [brTurnAngle]
    data.brTurnAngle = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'msgs_and_srvs/ServoFeedback';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ad381411873b60f8ac0ce1b85ac7dbd2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 flSpeed
    float32 blSpeed
    float32 frSpeed
    float32 brSpeed
    float32 flTurnAngle
    float32 blTurnAngle
    float32 frTurnAngle
    float32 brTurnAngle
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ServoFeedback(null);
    if (msg.flSpeed !== undefined) {
      resolved.flSpeed = msg.flSpeed;
    }
    else {
      resolved.flSpeed = 0.0
    }

    if (msg.blSpeed !== undefined) {
      resolved.blSpeed = msg.blSpeed;
    }
    else {
      resolved.blSpeed = 0.0
    }

    if (msg.frSpeed !== undefined) {
      resolved.frSpeed = msg.frSpeed;
    }
    else {
      resolved.frSpeed = 0.0
    }

    if (msg.brSpeed !== undefined) {
      resolved.brSpeed = msg.brSpeed;
    }
    else {
      resolved.brSpeed = 0.0
    }

    if (msg.flTurnAngle !== undefined) {
      resolved.flTurnAngle = msg.flTurnAngle;
    }
    else {
      resolved.flTurnAngle = 0.0
    }

    if (msg.blTurnAngle !== undefined) {
      resolved.blTurnAngle = msg.blTurnAngle;
    }
    else {
      resolved.blTurnAngle = 0.0
    }

    if (msg.frTurnAngle !== undefined) {
      resolved.frTurnAngle = msg.frTurnAngle;
    }
    else {
      resolved.frTurnAngle = 0.0
    }

    if (msg.brTurnAngle !== undefined) {
      resolved.brTurnAngle = msg.brTurnAngle;
    }
    else {
      resolved.brTurnAngle = 0.0
    }

    return resolved;
    }
};

module.exports = ServoFeedback;
