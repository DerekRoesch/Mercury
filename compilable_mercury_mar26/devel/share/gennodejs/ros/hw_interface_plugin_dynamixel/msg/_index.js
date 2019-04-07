
"use strict";

let servoUpdate = require('./servoUpdate.js');
let groupServoUpdate = require('./groupServoUpdate.js');
let servoStateResponse = require('./servoStateResponse.js');

module.exports = {
  servoUpdate: servoUpdate,
  groupServoUpdate: groupServoUpdate,
  servoStateResponse: servoStateResponse,
};
