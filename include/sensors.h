#ifndef SENSORS_H
#define SENSORS_H
#include <avr/io.h>
#pragma pack(1)
struct _PIR{
    uint8_t PIR0			= 0;//0
    uint8_t PIR1			= 0;//1
    uint8_t PIR2			= 0;//2
    uint8_t PIR3			= 0;//3
};
struct _RELAY{
	uint8_t VCC_RELAY	= 0;//5
	uint8_t RELAY0		= 0;//6
    uint8_t RELAY1		= 0;//7
    uint8_t RELAY2		= 0;//8
    uint8_t RELAY3		= 0;//9
};
struct _LED{
	uint8_t LED0			= 0;//10
	uint8_t LED1			= 0;//11
	uint8_t LED2			= 0;//12
	uint8_t LED3			= 0;//13
};
struct _US{
	uint8_t US0				= 0;//14
	uint8_t US1				= 0;//15
	uint8_t US2				= 0;//16
	uint8_t US3				= 0;//17
};
struct _ADC{
	uint16_t ADC00		= 0;//18
    uint16_t ADC01		= 0;//19
    uint16_t ADC02		= 0;//20
    uint16_t ADC03		= 0;//21
    uint16_t ADC04		= 0;//22
    uint16_t ADC05		= 0;//23
    uint16_t ADC06		= 0;//24
    uint16_t ADC07		= 0;//25
    uint16_t ADC08		= 0;//26
    uint16_t ADC09		= 0;//27
    uint16_t ADC10		= 0;//28
    uint16_t ADC11		= 0;//29
    uint16_t ADC12		= 0;//30
    uint16_t ADC13		= 0;//31
    uint16_t ADC14		= 0;//32
    uint16_t ADC15		= 0;//33

};
struct _COORDINATES{
    uint8_t degrees  = 0;
    uint8_t minutesInteger  = 0;
    uint16_t minutesDecimal  = 0;
    uint8_t dir      = 0; //Default NORTH or WEST

};
struct _LATITUDE  : _COORDINATES{};
struct _LONGITUDE : _COORDINATES{};
struct _SPEED{
    uint8_t integer;
    uint8_t decimal;
};
struct _DATETIME{
    uint8_t hours   = 0;
    uint8_t minutes = 0;
    uint8_t seconds = 0;
    uint8_t day     = 0;
    uint8_t month   = 0;
    uint8_t year    = 0;
};

struct _GPS{
    _DATETIME datetime;
    uint8_t status  = 0;
    _LATITUDE latitude;
    _LONGITUDE longitude;
    _SPEED speed;

};
struct Sensors{

    struct _PIR pir;
    struct _RELAY relay;
    uint8_t VCC_MOTOR = 0;//4
    struct _LED led;
    struct _US us;
    struct _GPS gps;
    struct _ADC adc;
};

#pragma pop

extern struct Sensors sensors;

#endif // SENSORS_H


