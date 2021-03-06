// Generated by gencpp from file msgs_and_srvs/DriveCommands.msg
// DO NOT EDIT!


#ifndef MSGS_AND_SRVS_MESSAGE_DRIVECOMMANDS_H
#define MSGS_AND_SRVS_MESSAGE_DRIVECOMMANDS_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace msgs_and_srvs
{
template <class ContainerAllocator>
struct DriveCommands_
{
  typedef DriveCommands_<ContainerAllocator> Type;

  DriveCommands_()
    : allStop(false)
    , fastMode(false)  {
    }
  DriveCommands_(const ContainerAllocator& _alloc)
    : allStop(false)
    , fastMode(false)  {
  (void)_alloc;
    }



   typedef uint8_t _allStop_type;
  _allStop_type allStop;

   typedef uint8_t _fastMode_type;
  _fastMode_type fastMode;





  typedef boost::shared_ptr< ::msgs_and_srvs::DriveCommands_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::msgs_and_srvs::DriveCommands_<ContainerAllocator> const> ConstPtr;

}; // struct DriveCommands_

typedef ::msgs_and_srvs::DriveCommands_<std::allocator<void> > DriveCommands;

typedef boost::shared_ptr< ::msgs_and_srvs::DriveCommands > DriveCommandsPtr;
typedef boost::shared_ptr< ::msgs_and_srvs::DriveCommands const> DriveCommandsConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::msgs_and_srvs::DriveCommands_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::msgs_and_srvs::DriveCommands_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace msgs_and_srvs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'msgs_and_srvs': ['/home/derekroesch/catkin_ws/src/msgs_and_srvs/msg'], 'std_msgs': ['/opt/ros/melodic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::msgs_and_srvs::DriveCommands_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::msgs_and_srvs::DriveCommands_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::msgs_and_srvs::DriveCommands_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::msgs_and_srvs::DriveCommands_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::msgs_and_srvs::DriveCommands_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::msgs_and_srvs::DriveCommands_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::msgs_and_srvs::DriveCommands_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e4865336e17f16193eb66cf5414820f8";
  }

  static const char* value(const ::msgs_and_srvs::DriveCommands_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe4865336e17f1619ULL;
  static const uint64_t static_value2 = 0x3eb66cf5414820f8ULL;
};

template<class ContainerAllocator>
struct DataType< ::msgs_and_srvs::DriveCommands_<ContainerAllocator> >
{
  static const char* value()
  {
    return "msgs_and_srvs/DriveCommands";
  }

  static const char* value(const ::msgs_and_srvs::DriveCommands_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::msgs_and_srvs::DriveCommands_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool allStop\n\
bool fastMode\n\
";
  }

  static const char* value(const ::msgs_and_srvs::DriveCommands_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::msgs_and_srvs::DriveCommands_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.allStop);
      stream.next(m.fastMode);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DriveCommands_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::msgs_and_srvs::DriveCommands_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::msgs_and_srvs::DriveCommands_<ContainerAllocator>& v)
  {
    s << indent << "allStop: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.allStop);
    s << indent << "fastMode: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.fastMode);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MSGS_AND_SRVS_MESSAGE_DRIVECOMMANDS_H
