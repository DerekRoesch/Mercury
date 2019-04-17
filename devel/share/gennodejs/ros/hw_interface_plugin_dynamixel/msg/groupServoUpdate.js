// Auto-generated. Do not edit!

// (in-package hw_interface_plugin_dynamixel.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let servoUpdate = require('./servoUpdate.js');

//-----------------------------------------------------------

class groupServoUpdate {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.updateVector = null;
    }
    else {
      if (initObj.hasOwnProperty('updateVector')) {
        this.updateVector = initObj.updateVector
      }
      else {
        this.updateVector = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type groupServoUpdate
    // Serialize message field [updateVector]
    // Serialize the length for message field [updateVector]
    bufferOffset = _serializer.uint32(obj.updateVector.length, buffer, bufferOffset);
    obj.updateVector.forEach((val) => {
      bufferOffset = servoUpdate.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type groupServoUpdate
    let len;
    let data = new groupServoUpdate(null);
    // Deserialize message field [updateVector]
    // Deserialize array length for message field [updateVector]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.updateVector = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.updateVector[i] = servoUpdate.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 19 * object.updateVector.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'hw_interface_plugin_dynamixel/groupServoUpdate';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e6ee49bcc6a9ac8d662236a4935e5ee8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    servoUpdate[] updateVector
    
    ================================================================================
    MSG: hw_interface_plugin_dynamixel/servoUpdate
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
    uint64 ABILITY_TORQUE_ENABLE=16384
    uint64 ABILITY_PRESENT_CURRENT=32768
    uint64 ABILITY_TORQUE_LIMIT=65536
    uint64 ABILITY_GOAL_TORQUE=131072
    uint64 ABILITY_BAUD_RATE=262144
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
    const resolved = new groupServoUpdate(null);
    if (msg.updateVector !== undefined) {
      resolved.updateVector = new Array(msg.updateVector.length);
      for (let i = 0; i < resolved.updateVector.length; ++i) {
        resolved.updateVector[i] = servoUpdate.Resolve(msg.updateVector[i]);
      }
    }
    else {
      resolved.updateVector = []
    }

    return resolved;
    }
};

module.exports = groupServoUpdate;
