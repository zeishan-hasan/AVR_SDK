#ifndef COMMAND_H
#define COMMAND_H
#include <serial.h>
#include <stdlib.h>
#include <ctype.h>
#include <stdio.h>
#include <vector.h>
#include <timer.h>
#include <sensors.h>
#include <util/atomic.h>

#define _WRITE_CMD      7
#define _CMD_SEL        4
#define _WRITE_CMD_MSK  (1 << _WRITE_CMD)
#define _CMD_SEL_MSK	(3 << _CMD_SEL)


enum CMD_LIST{
	CMD_INVALID=-1,
	//--------------ADC_COMMANDS READ_ONLY-------------//
	CMD_ADC00_R = 0x00, CMD_ADC08_R = 0x08,
	CMD_ADC01_R = 0x01, CMD_ADC09_R = 0x09,
	CMD_ADC02_R = 0x02, CMD_ADC10_R = 0x0A,
	CMD_ADC03_R = 0x03, CMD_ADC11_R = 0x0B,
	CMD_ADC04_R = 0x04, CMD_ADC12_R = 0x0C,
	CMD_ADC05_R = 0x05, CMD_ADC13_R = 0x0D,
	CMD_ADC06_R = 0x06, CMD_ADC14_R = 0x0E,
	CMD_ADC07_R = 0x07, CMD_ADC15_R = 0x0F,

	//----------ULTRASONIC_COMMANDS READ_ONLY----------//
	CMD_US0_R = 0x10,
	CMD_US1_R = 0x11,
	CMD_US2_R = 0x12,
	CMD_US3_R = 0x13,
	CMD_US4_R = 0x14,

	//--------------PIR_COMMANDS READ_ONLY-------------//
	CMD_PIR0_R = 0x20,
	CMD_PIR1_R = 0x21,
	CMD_PIR2_R = 0x22,
	CMD_PIR3_R = 0x23,

	//--------------LED_COMMANDS READ&WRITE------------//
	CMD_LED0_R = 0x30, CMD_LED0_W = 0xB0,
	CMD_LED1_R = 0x31, CMD_LED1_W = 0xB1,
	CMD_LED2_R = 0x32, CMD_LED2_W = 0xB2,
	CMD_LED3_R = 0x33, CMD_LED3_W = 0xB3,

	//--------------VCC_MOTORS READ&WRITE--------------//
	CMD_VCC_MOTOR_R = 0x40, CMD_VCC_MOTOR_W = 0xC0,

	//------------RELAY_COMMANDS READ&WRITE------------//
	CMD_RELAY0_R = 0x50, CMD_RELAY0_W = 0xD0,
	CMD_RELAY1_R = 0x51, CMD_RELAY1_W = 0xD1,
	CMD_RELAY2_R = 0x52, CMD_RELAY2_W = 0xD2,
	CMD_RELAY3_R = 0x53, CMD_RELAY3_W = 0xD3,

	//----------------GPS_COMMAND READ_ONLY------------//
	CMD_GPS_R = 0x40,

	//----------EXTENDED_COMMAND READ&WRITE------------//
	CMD_EXTENDED_R = 0x70, CMD_EXTENDED_W = 0xF0

};

enum __LED{
	_LED0,
	_LED1,
	_LED2,
	_LED3,
};
enum __PIR{
	_PIR0,
	_PIR1,
	_PIR2,
	_PIR3,
};
enum __RELAY{
	_VCC_RELAY,
	_RELAY0,
	_RELAY1,
	_RELAY2,
	_RELAY3,
};
enum __US{
	_US0,
	_US1,
	_US2,
	_US3,
};
enum __ADC{
	_ADC00,
	_ADC01,
	_ADC02,
	_ADC03,
	_ADC04,
	_ADC05,
	_ADC06,
	_ADC07,
	_ADC08,
	_ADC09,
	_ADC10,
	_ADC11,
	_ADC12,
	_ADC13,
	_ADC14,
	_ADC15,
};
enum CMD_PRIORITY{
	CMD_PRIORITY_LOW,
	CMD_PRIORITY_MEDIUM,
	CMD_PRIORITY_HIGH};
enum CMD_GROUP {
	CMD_GROUP_ADC,
	CMD_GROUP_US,
	CMD_GROUP_PIR,
	CMD_GROUP_LED,
	CMD_GROUP_VCC_MOTOR,
	CMD_GROUP_RELAY,
	CMD_GROUP_GPS,
	CMD_GROUP_EXTENDED};

class Command
{
public:
	Command();
    static void handleCommands(void *f);
	static void addCommand(uint8_t cmd);
	static void delCommand();
	static uint8_t decodeCommand();

	static uint8_t getQueueSize();
	static uint8_t *serialOutput;
private:
	static yanujz::vector<uint8_t> fetchCommandQueue;
	//static yanujz::vector<func> executeCommandQueue;


};
inline void readPir(uint8_t sensorSelect);

inline void readRelay(uint8_t sensorSelect);
inline void writeRelay(uint8_t sensorSelect, uint8_t value);

inline void readLed(uint8_t sensorSelect);
inline void writeLed(uint8_t sensorSelect, uint8_t value);

inline void readMotor(uint8_t sensorSelect);
inline void writeMotor(uint8_t sensorSelect, uint8_t value);

inline void readUS(uint8_t sensorSelect);

inline void readADC(uint8_t sensorSelect);


#endif // COMMAND_H
