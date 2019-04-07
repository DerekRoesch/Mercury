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

class VirtualBumperStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pointInsideBumper = null;
      this.closestPointDistance = null;
      this.closestPointDirection = null;
    }
    else {
      if (initObj.hasOwnProperty('pointInsideBumper')) {
        this.pointInsideBumper = initObj.pointInsideBumper
      }
      else {
        this.pointInsideBumper = false;
      }
      if (initObj.hasOwnProperty('closestPointDistance')) {
        this.closestPointDistance = initObj.closestPointDistance
      }
      else {
        this.closestPointDistance = 0.0;
      }
      if (initObj.hasOwnProperty('closestPointDirection')) {
        this.closestPointDirection = initObj.closestPointDirection
      }
      else {
        this.closestPointDirection = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VirtualBumperStatus
    // Serialize message field [pointInsideBumper]
    bufferOffset = _serializer.bool(obj.pointInsideBumper, buffer, bufferOffset);
    // Serialize message field [closestPointDistance]
    bufferOffset = _serializer.float32(obj.closestPointDistance, buffer, bufferOffset);
    // Serialize message field [closestPointDirection]
    bufferOffset = _serializer.float32(obj.closestPointDirection, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VirtualBumperStatus
    let len;
    let data = new VirtualBumperStatus(null);
    // Deserialize message field [pointInsideBumper]
    data.pointInsideBumper = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [closestPointDistance]
    data.closestPointDistance = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [closestPointDirection]
    data.closestPointDirection = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'msgs_and_srvs/VirtualBumperStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '04d921a3fed1e194d4292fdcb5f3f0a3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool pointInsideBumper
    float32 closestPointDistance
    float32 closestPointDirection
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VirtualBumperStatus(null);
    if (msg.pointInsideBumper !== undefined) {
      resolved.pointInsideBumper = msg.pointInsideBumper;
    }
    else {
      resolved.pointInsideBumper = false
    }

    if (msg.closestPointDistance !== undefined) {
      resolved.closestPointDistance = msg.closestPointDistance;
    }
    else {
      resolved.closestPointDistance = 0.0
    }

    if (msg.closestPointDirection !== undefined) {
      resolved.closestPointDirection = msg.closestPointDirection;
    }
    else {
      resolved.closestPointDirection = 0.0
    }

    return resolved;
    }
};

module.exports = VirtualBumperStatus;
