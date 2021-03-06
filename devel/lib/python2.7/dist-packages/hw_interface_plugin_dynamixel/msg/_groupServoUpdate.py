# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from hw_interface_plugin_dynamixel/groupServoUpdate.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import hw_interface_plugin_dynamixel.msg

class groupServoUpdate(genpy.Message):
  _md5sum = "e6ee49bcc6a9ac8d662236a4935e5ee8"
  _type = "hw_interface_plugin_dynamixel/groupServoUpdate"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """servoUpdate[] updateVector

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

"""
  __slots__ = ['updateVector']
  _slot_types = ['hw_interface_plugin_dynamixel/servoUpdate[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       updateVector

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(groupServoUpdate, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.updateVector is None:
        self.updateVector = []
    else:
      self.updateVector = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.updateVector)
      buff.write(_struct_I.pack(length))
      for val1 in self.updateVector:
        _x = val1
        buff.write(_get_struct_BQ2BIi().pack(_x.id, _x.abilityRequested, _x.mode, _x.isDataSigned, _x.uDATA, _x.sDATA))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.updateVector is None:
        self.updateVector = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.updateVector = []
      for i in range(0, length):
        val1 = hw_interface_plugin_dynamixel.msg.servoUpdate()
        _x = val1
        start = end
        end += 19
        (_x.id, _x.abilityRequested, _x.mode, _x.isDataSigned, _x.uDATA, _x.sDATA,) = _get_struct_BQ2BIi().unpack(str[start:end])
        val1.isDataSigned = bool(val1.isDataSigned)
        self.updateVector.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.updateVector)
      buff.write(_struct_I.pack(length))
      for val1 in self.updateVector:
        _x = val1
        buff.write(_get_struct_BQ2BIi().pack(_x.id, _x.abilityRequested, _x.mode, _x.isDataSigned, _x.uDATA, _x.sDATA))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.updateVector is None:
        self.updateVector = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.updateVector = []
      for i in range(0, length):
        val1 = hw_interface_plugin_dynamixel.msg.servoUpdate()
        _x = val1
        start = end
        end += 19
        (_x.id, _x.abilityRequested, _x.mode, _x.isDataSigned, _x.uDATA, _x.sDATA,) = _get_struct_BQ2BIi().unpack(str[start:end])
        val1.isDataSigned = bool(val1.isDataSigned)
        self.updateVector.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_BQ2BIi = None
def _get_struct_BQ2BIi():
    global _struct_BQ2BIi
    if _struct_BQ2BIi is None:
        _struct_BQ2BIi = struct.Struct("<BQ2BIi")
    return _struct_BQ2BIi
