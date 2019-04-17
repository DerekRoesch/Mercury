#include <hw_interface_plugin_dynamixel/actuators/mx_106.hpp>


hw_interface_plugin_dynamixel::dynamixel_actuators::mx_106::mx_106(dynamixel_types::dynamixel_id_number_t id,
                        std::vector<uint8_t> parameters,
                      dynamixel_types::comm_version_t commVersion):
    dynamixel_servo(
        (id),
        *( (dynamixel_types::dynamixel_model_number_t*)&parameters.data()[getModelNumOffset(commVersion)]),
        *( (dynamixel_types::dynamixel_firmware_version_t*)&parameters.data()[getFirmwareVersionOffset(commVersion)])
        )
{ 
    /*
     * if (version num)
     *  {select this protocol}
     */
    packedAbilities|=    dynamixel_types::ABILITY_ANGLE_UNITS   |   dynamixel_types::ABILITY_SPEED_UNITS    |   dynamixel_types::ABILITY_RESOLUTION_DIVIDER
                        |dynamixel_types::ABILITY_WHEEL_MODE    |   dynamixel_types::ABILITY_JOINT_MODE     |   dynamixel_types::ABILITY_CCW_LIMIT
                        |dynamixel_types::ABILITY_CW_LIMIT      |   dynamixel_types::ABILITY_MOVING_SPEED   |   dynamixel_types::ABILITY_GOAL_POSITION
                        |dynamixel_types::ABILITY_PRESENT_POSITION| dynamixel_types::ABILITY_PRESENT_SPEED  | dynamixel_types::ABILITY_STATUS_RETURN_LEVEL
                        |dynamixel_types::ABILITY_BAUD_RATE;



    protocolVersion = commVersion;
    actuatorSeries = dynamixel_types::MX;
    actuatorVersion = dynamixel_types::MX_106;
    if(commVersion == dynamixel_types::COMM_V1)
    {
        abilityInfoList.emplace_back(dynamixel_types::ABILITY_MOVING_SPEED, dynamixel_types::MODE_GET | dynamixel_types::MODE_SET,
                                     32, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_WORD, 0, dynamixel_types::MODE_NOP);
        abilityInfoList.emplace_back(dynamixel_types::ABILITY_CCW_LIMIT, dynamixel_types::MODE_GET | dynamixel_types::MODE_SET,
                                     0x08, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_WORD, 0, dynamixel_types::MODE_NOP);
        abilityInfoList.emplace_back(dynamixel_types::ABILITY_CW_LIMIT, dynamixel_types::MODE_GET | dynamixel_types::MODE_SET,
                                     0x06, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_WORD, 0, dynamixel_types::MODE_NOP);
        abilityInfoList.emplace_back(dynamixel_types::ABILITY_WHEEL_MODE, dynamixel_types::MODE_GET | dynamixel_types::MODE_SET,
                                     0x06, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_DWORD, 0, dynamixel_types::MODE_NOP);
        abilityInfoList.emplace_back(dynamixel_types::ABILITY_GOAL_POSITION, dynamixel_types::MODE_GET | dynamixel_types::MODE_SET,
                                     0x1e, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_WORD, 0, dynamixel_types::MODE_NOP);

        abilityInfoList.emplace_back(dynamixel_types::ABILITY_JOINT_MODE, dynamixel_types::MODE_GET | dynamixel_types::MODE_SET,
                                     0x08, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_WORD, 0, dynamixel_types::MODE_NOP);

        abilityInfoList.emplace_back(dynamixel_types::ABILITY_PRESENT_SPEED, dynamixel_types::MODE_QUERY | dynamixel_types::MODE_GET | dynamixel_types::MODE_SET,
                                     36, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_WORD, 0, dynamixel_types::MODE_NOP);
        abilityInfoList.emplace_back(dynamixel_types::ABILITY_PRESENT_POSITION, dynamixel_types::MODE_QUERY | dynamixel_types::MODE_GET | dynamixel_types::MODE_SET,
                                     38, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_WORD, 0, dynamixel_types::MODE_NOP);

        abilityInfoList.emplace_back(dynamixel_types::ABILITY_STATUS_RETURN_LEVEL, dynamixel_types::MODE_QUERY | dynamixel_types::MODE_GET | dynamixel_types::MODE_SET,
                                     0x10, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_WORD, 0, dynamixel_types::MODE_NOP);
        abilityInfoList.emplace_back(dynamixel_types::ABILITY_NOP, 0,
                                         0, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_BYTE, 0, dynamixel_types::MODE_NOP);
        abilityInfoList.emplace_back(dynamixel_types::ABILITY_BAUD_RATE, dynamixel_types::MODE_GET | dynamixel_types::MODE_SET,
                                         4, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_BYTE, 0, dynamixel_types::MODE_NOP);
    }
    else if(commVersion == dynamixel_types::COMM_V2)
    {
        packedAbilities |= dynamixel_types::ABILITY_TORQUE_ENABLE;
        
        abilityInfoList.emplace_back(dynamixel_types::ABILITY_MOVING_SPEED, dynamixel_types::MODE_GET | dynamixel_types::MODE_SET,
                                     104, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_DWORD, 0, dynamixel_types::MODE_NOP);
        abilityInfoList.emplace_back(dynamixel_types::ABILITY_CCW_LIMIT, dynamixel_types::MODE_GET | dynamixel_types::MODE_SET,
                                     52, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_DWORD, 0, dynamixel_types::MODE_NOP);
        abilityInfoList.emplace_back(dynamixel_types::ABILITY_CW_LIMIT, dynamixel_types::MODE_GET | dynamixel_types::MODE_SET,
                                     48, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_DWORD, 0, dynamixel_types::MODE_NOP);
        abilityInfoList.emplace_back(dynamixel_types::ABILITY_WHEEL_MODE, dynamixel_types::MODE_GET | dynamixel_types::MODE_SET,
                                     11, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_BYTE, 0, dynamixel_types::MODE_NOP);
        abilityInfoList.emplace_back(dynamixel_types::ABILITY_GOAL_POSITION, dynamixel_types::MODE_GET | dynamixel_types::MODE_SET,
                                     116, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_DWORD, 0, dynamixel_types::MODE_NOP);

        abilityInfoList.emplace_back(dynamixel_types::ABILITY_JOINT_MODE, dynamixel_types::MODE_GET | dynamixel_types::MODE_SET,
                                     11, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_BYTE, 0, dynamixel_types::MODE_NOP);

        abilityInfoList.emplace_back(dynamixel_types::ABILITY_PRESENT_SPEED, dynamixel_types::MODE_QUERY | dynamixel_types::MODE_GET | dynamixel_types::MODE_SET,
                                     128, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_DWORD, 0, dynamixel_types::MODE_NOP);
        abilityInfoList.emplace_back(dynamixel_types::ABILITY_PRESENT_POSITION, dynamixel_types::MODE_QUERY | dynamixel_types::MODE_GET | dynamixel_types::MODE_SET,
                                     132, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_DWORD, 0, dynamixel_types::MODE_NOP);

        abilityInfoList.emplace_back(dynamixel_types::ABILITY_STATUS_RETURN_LEVEL, dynamixel_types::MODE_QUERY | dynamixel_types::MODE_GET | dynamixel_types::MODE_SET,
                                     68, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_BYTE, 0, dynamixel_types::MODE_NOP);
        abilityInfoList.emplace_back(dynamixel_types::ABILITY_TORQUE_ENABLE, dynamixel_types::MODE_QUERY | dynamixel_types::MODE_GET | dynamixel_types::MODE_SET,
                                     64, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_BYTE, 0, dynamixel_types::MODE_NOP);
        abilityInfoList.emplace_back(dynamixel_types::ABILITY_BAUD_RATE, dynamixel_types::MODE_GET | dynamixel_types::MODE_SET,
                                     8, dynamixel_types::UNIT_RAW, dynamixel_types::UNSIGNED_BYTE, 0, dynamixel_types::MODE_NOP);
    }


}


hw_interface_plugin_dynamixel::dynamixel_types::dynamixel_ability_result_t
    hw_interface_plugin_dynamixel::dynamixel_actuators::mx_106::_implAbilityRequest(dynamixel_types::dynamixel_ability_request_t &request)
{


}

hw_interface_plugin_dynamixel::dynamixel_types::dynamixel_ability_info_t *
    hw_interface_plugin_dynamixel::dynamixel_actuators::mx_106::_implAbilityInfoGet(dynamixel_types::dynamixel_ability_request_t &requestedAbility)
{
    if(requestedAbility.mode == dynamixel_types::MODE_GET)
    {
        switch(requestedAbility.abilityRequested)
        {
            case dynamixel_types::ABILITY_MOVING_SPEED:
                return &(abilityInfoList[0]);
            case dynamixel_types::ABILITY_CCW_LIMIT:
                return &(abilityInfoList[1]);
            case dynamixel_types::ABILITY_CW_LIMIT:
                return &(abilityInfoList[2]);
            case dynamixel_types::ABILITY_WHEEL_MODE:
                return &(abilityInfoList[3]);
            case dynamixel_types::ABILITY_GOAL_POSITION:
                return &(abilityInfoList[4]);
            case dynamixel_types::ABILITY_JOINT_MODE:
                return &(abilityInfoList[5]);
            case dynamixel_types::ABILITY_PRESENT_SPEED:
                return &(abilityInfoList[6]);
            case dynamixel_types::ABILITY_PRESENT_POSITION:
                return &(abilityInfoList[7]);
            case dynamixel_types::ABILITY_STATUS_RETURN_LEVEL:
                return &(abilityInfoList[8]);
            case dynamixel_types::ABILITY_TORQUE_ENABLE:
                return &(abilityInfoList[9]);
            case dynamixel_types::ABILITY_BAUD_RATE:
                return &(abilityInfoList[10]);
            default:
                return 0;


        }
    }
    else if(requestedAbility.mode == dynamixel_types::MODE_SET)
    {
        switch(requestedAbility.abilityRequested)
        {
            case dynamixel_types::ABILITY_MOVING_SPEED:
                return &(abilityInfoList[0]);
            case dynamixel_types::ABILITY_CCW_LIMIT:
                return &(abilityInfoList[1]);
            case dynamixel_types::ABILITY_CW_LIMIT:
                return &(abilityInfoList[2]);
            case dynamixel_types::ABILITY_WHEEL_MODE:
                return &(abilityInfoList[3]);
            case dynamixel_types::ABILITY_GOAL_POSITION:
                return &(abilityInfoList[4]);
            case dynamixel_types::ABILITY_JOINT_MODE:
                return &(abilityInfoList[5]);
            case dynamixel_types::ABILITY_PRESENT_SPEED:
                return &(abilityInfoList[6]);
            case dynamixel_types::ABILITY_PRESENT_POSITION:
                return &(abilityInfoList[7]);
            case dynamixel_types::ABILITY_STATUS_RETURN_LEVEL:
                return &(abilityInfoList[8]);
            case dynamixel_types::ABILITY_TORQUE_ENABLE:
                return &(abilityInfoList[9]);
            case dynamixel_types::ABILITY_BAUD_RATE:
                return &(abilityInfoList[10]);
            default:
                return 0;
        }
    }
    else if(requestedAbility.mode == dynamixel_types::MODE_QUERY)
    {
        switch(requestedAbility.abilityRequested)
        {
            case dynamixel_types::ABILITY_PRESENT_SPEED:
                return &(abilityInfoList[6]);
            case dynamixel_types::ABILITY_PRESENT_POSITION:
                return &(abilityInfoList[7]);
            case dynamixel_types::ABILITY_TORQUE_ENABLE:
                return &(abilityInfoList[9]);
            default:
                return 0;
        }
    }

    return 0;
}
