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

class ArmManualMode {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.manualMode = null;
      this.selectedJoint = null;
    }
    else {
      if (initObj.hasOwnProperty('manualMode')) {
        this.manualMode = initObj.manualMode
      }
      else {
        this.manualMode = false;
      }
      if (initObj.hasOwnProperty('selectedJoint')) {
        this.selectedJoint = initObj.selectedJoint
      }
      else {
        this.selectedJoint = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ArmManualMode
    // Serialize message field [manualMode]
    bufferOffset = _serializer.bool(obj.manualMode, buffer, bufferOffset);
    // Serialize message field [selectedJoint]
    bufferOffset = _serializer.string(obj.selectedJoint, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ArmManualMode
    let len;
    let data = new ArmManualMode(null);
    // Deserialize message field [manualMode]
    data.manualMode = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [selectedJoint]
    data.selectedJoint = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.selectedJoint.length;
    return length + 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'msgs_and_srvs/ArmManualMode';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5e2c37a64ce17164b802f9f6014495cb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool manualMode
    string selectedJoint
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ArmManualMode(null);
    if (msg.manualMode !== undefined) {
      resolved.manualMode = msg.manualMode;
    }
    else {
      resolved.manualMode = false
    }

    if (msg.selectedJoint !== undefined) {
      resolved.selectedJoint = msg.selectedJoint;
    }
    else {
      resolved.selectedJoint = ''
    }

    return resolved;
    }
};

module.exports = ArmManualMode;
