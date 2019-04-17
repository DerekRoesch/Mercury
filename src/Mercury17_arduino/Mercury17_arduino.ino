#include <Servo.h>

Servo left;
Servo right;
Servo claw;
Servo wrist;

typedef struct s_pkt pkt_t;
struct s_pkt
{
  char header[2];
  uint8_t counter;
  uint8_t pos[5];
  uint8_t LOS;
  uint8_t checksum;
}__attribute__((packed));

pkt_t goodPkt = {
  .header = {'A', 'z'},
  .counter = 0,
  .pos = { 0, 138, 138, 106, 0},
  .LOS = 1,
  .checksum = 0,
};


uint8_t serialBuffer[50] = {0};

uint16_t amountRead = 0;
uint16_t headerCounter = 0;
uint16_t headerLength = 2;
const char header[3] = {'A', 'z', 0};
uint16_t dataArrayStart = 0;

float left_cmd, right_cmd, claw_cmd, wrist_cmd;

void setup() {
  digitalWrite(A5, HIGH);

  right.attach(A0);
  left.attach(11);
  claw.attach(10);
  wrist.attach(9);

  left.writeMicroseconds(1000);
  right.writeMicroseconds(1450);
  claw.writeMicroseconds(1450);
  wrist.writeMicroseconds(1600);

  Serial.begin(115200);

}

 

void loop() {
  uint16_t toRead = 0;
  if(amountRead >= sizeof(pkt_t))
  {
    headerCounter = 0;
    dataArrayStart=0;
    for(uint16_t i = 0; i < amountRead; i++)
    {
      //Serial.println(i);
      if(headerCounter != headerLength)
      {
        if(serialBuffer[i] == header[headerCounter])
        {
          headerCounter++;
          if(headerCounter == headerLength)
          {
            dataArrayStart = i-(headerLength-1);
            continue;
          }
        }
        else
        {
          headerCounter = 0;
        }
      }
      else
      {
        if((amountRead-dataArrayStart)>=sizeof(pkt_t))
        {
          toRead = 0;
          for(uint16_t j = 0; j < sizeof(pkt_t); j++)
          {
            ((uint8_t*)(&goodPkt))[j]=serialBuffer[dataArrayStart+j];
          }
          amountRead=0;
          break;
        }
        else
        {
          toRead=1;
          break;
        }
      }//end else
    }//end for
  }
  else
  {
    toRead=sizeof(pkt_t)-amountRead;
  }
  if(toRead)
  {
    if((amountRead + Serial.available())>50)
    {
      amountRead=0;
      toRead=10;
    }
    amountRead+=Serial.readBytes(&(serialBuffer[amountRead]), toRead);
  }
  
  left_cmd = (unsigned int)(1000 + ((2100 - 900) * (((float)goodPkt.pos[0] - 0) / (255 - 0))));
  left.writeMicroseconds(left_cmd);

  right_cmd = (unsigned int)(2100 + ((900 - 2100) * (((float)goodPkt.pos[1] - 0) / (255 - 0))));
  right.writeMicroseconds(right_cmd);

  claw_cmd = (unsigned int)(2100 + ((900 - 2100) * (((float)goodPkt.pos[2] - 0) / (255 - 0))));
  claw.writeMicroseconds(claw_cmd);

  wrist_cmd = (unsigned int)(2100 + ((900 - 2100) * (((float)goodPkt.pos[3] - 0) / (255 - 0))));
  wrist.writeMicroseconds(wrist_cmd);

  if(goodPkt.LOS) {
    digitalWrite(A5, HIGH);
  }
  else {
    digitalWrite(A5, LOW);
  }
}

