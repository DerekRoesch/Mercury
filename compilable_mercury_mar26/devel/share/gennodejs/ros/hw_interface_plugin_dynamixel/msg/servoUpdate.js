// Auto-generated. Do not edit!

// (in-package hw_interface_plugin_dynamixel.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class servoUpdate {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.abilityRequested = null;
      this.mode = null;
      this.isDataSigned = null;
      this.uDATA = null;
      this.sDATA = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('abilityRequested')) {
        this.abilityRequested = initObj.abilityRequested
      }
      else {
        this.abilityRequested = 0;
      }
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = 0;
      }
      if (initObj.hasOwnProperty('isDataSigned')) {
        this.isDataSigned = initObj.isDataSigned
      }
      else {
        this.isDataSigned = false;
      }
      if (initObj.hasOwnProperty('uDATA')) {
        this.uDATA = initObj.uDATA
      }
      else {
        this.uDATA = 0;
      }
      if (initObj.hasOwnProperty('sDATA')) {
        this.sDATA = initObj.sDATA
      }
      else {
        this.sDATA = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type servoUpdate
    // Serialize message field [id]
    bufferOffset = _serializer.uint8(obj.id, buffer, bufferOffset);
    // Serialize message field [abilityRequested]
    bufferOffset = _serializer.uint64(obj.abilityRequested, buffer, bufferOffset);
    // Serialize message field [mode]
    bufferOffset = _serializer.uint8(obj.mode, buffer, bufferOffset);
    // Serialize message field [isDataSigned]
    bufferOffset = _serializer.bool(obj.isDataSigned, buffer, bufferOffset);
    // Serialize message field [uDATA]
    bufferOffset = _serializer.uint32(obj.uDATA, buffer, bufferOffset);
    // Serialize message field [sDATA]
    bufferOffset = _serializer.int32(obj.sDATA, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type servoUpdate
    let len;
    let data = new servoUpdate(null);
    // Deserialize message field [id]
    data.id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [abilityRequested]
    data.abilityRequested = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [mode]
    data.mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [isDataSigned]
    data.isDataSigned = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [uDATA]
    data.uDATA = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [sDATA]
    data.sDATA = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 19;
  }

  static datatype() {
    // Returns string type for a message object
    return 'hw_interface_plugin_dynamixel/servoUpdate';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'aec93516bd00d77b6c5579d881a6bf44';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint64 ABILITY_NOP = 0
    uint64 ABILITY_ANGLE_UNITS=1
    uint64 ABILITY_SPEED_UNITS=2
    uint64 ABILITY_RESOLUTION_DIVIDER=4
    uint64 ABILITY_WHEEL_MODE=8
    uint64 ABILITY_JOINT_MODE=16
    uint64 ABILITY_CCW_LIMIT=32
    uint64 ABILITY_CW_LIMIT=64
    uint64 ABILITY_INIT=128
    uint64 ABILITY_MOVING_SPEED=256
    uint64 ABILITY_GOAL_POSITION=512
    uint64 ABILITY_PRESENT_SPEED=1024
    uint64 ABILITY_PRESENT_POSITION=2048
    uint64 ABILITY_STATUS_RETURN_LEVEL=4096
    uint64 ABILITY_OPERATING_MODE=8192
    uint64 ABILITY_TORQUE=16384
    uint64 ABILITY_PRESENT_CURRENT=32768
    uint64 ABILITY_TORQUE_LIMIT=65536
    uint64 ABILITY_GOAL_TORQUE=131072
    uint8  MODE_NOP=0
    uint8  MODE_GET=1
    uint8  MODE_SET=2
    uint8  MODE_QUERY=4
    
    
    
    uint8   id
    uint64  abilityRequested
    uint8   mode
    
    bool    isDataSigned
    
    uint32  uDATA
    int32   sDATA
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new servoUpdate(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.abilityRequested !== undefined) {
      resolved.abilityRequested = msg.abilityRequested;
    }
    else {
      resolved.abilityRequested = 0
    }

    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = 0
    }

    if (msg.isDataSigned !== undefined) {
      resolved.isDataSigned = msg.isDataSigned;
    }
    else {
      resolved.isDataSigned = false
    }

    if (msg.uDATA !== undefined) {
      resolved.uDATA = msg.uDATA;
    }
    else {
      resolved.uDATA = 0
    }

    if (msg.sDATA !== undefined) {
      resolved.sDATA = msg.sDATA;
    }
    else {
      resolved.sDATA = 0
    }

    return resolved;
    }
};

// Constants for message
servoUpdate.Constants = {
  ABILITY_NOP: 0,
  ABILITY_ANGLE_UNITS: 1,
  ABILITY_SPEED_UNITS: 2,
  ABILITY_RESOLUTION_DIVIDER: 4,
  ABILITY_WHEEL_MODE: 8,
  ABILITY_JOINT_MODE: 16,
  ABILITY_CCW_LIMIT: 32,
  ABILITY_CW_LIMIT: 64,
  ABILITY_INIT: 128,
  ABILITY_MOVING_SPEED: 256,
  ABILITY_GOAL_POSITION: 512,
  ABILITY_PRESENT_SPEED: 1024,
  ABILITY_PRESENT_POSITION: 2048,
  ABILITY_STATUS_RETURN_LEVEL: 4096,
  ABILITY_OPERATING_MODE: 8192,
  ABILITY_TORQUE: 16384,
  ABILITY_PRESENT_CURRENT: 32768,
  ABILITY_TORQUE_LIMIT: 65536,
  ABILITY_GOAL_TORQUE: 131072,
  MODE_NOP: 0,
  MODE_GET: 1,
  MODE_SET: 2,
  MODE_QUERY: 4,
}

module.exports = servoUpdate;
