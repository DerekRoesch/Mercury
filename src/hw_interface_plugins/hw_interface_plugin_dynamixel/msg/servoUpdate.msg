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

