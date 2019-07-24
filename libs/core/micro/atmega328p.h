#pragma once
#include <gpiodef.h>

#define PINx(x) (x << 0)
#define BIT(x) (x << 4)
#define PWM_GROUP(x) (x << 7)
#define TIMERx(x) (x << 8)
#define LETTERx(x) (x << 10)

#define TIMER_0 0x00
#define TIMER_1 0x01
#define TIMER_2 0x02
#define NO_TIMER 0x03

#define LETTER_A 0x00
#define LETTER_B 0x01

#define PWM8BIT 0
#define PWM16BIT 1

#define _PINB 0x03
#define _PINC 0x06
#define _PIND 0x09
#define NO_PINX 0xF



//#define varToPinx(x) (&_SFR_IO8(toU16(x) & 0xF))
//#define varToRegBit(x) ((toU16(x) >> 4) & 0x07)
//#define varToPWMGroup(x) ((toU16(x) >> 7) & 0x01)
//#define varToTimer(x) (((toU16(x) >> 8) & 0x07))
//#define varToLetter(x) (((toU16(x) >> 10) & 0x03))




enum class PIN_ADC : u8t {
	A0,
	A1,
	A2,
	A3,
	A4,
	A5
};

/*
╔════╦════╦════╦════╦════╦═════════╦════╦═══╦═══════════╦═══╦═══╦═══╦═══╦═══╦═══╦═══╗
║ 15 ║ 14 ║ 13 ║ 12 ║ 11 ║    10   ║  9 ║ 8 ║     7     ║ 6 ║ 5 ║ 4 ║ 3 ║ 2 ║ 1 ║ 0 ║
╠════╬════╬════╬════╬════╬═════════╬════╩═══╬═══════════╬═══╩═══╩═══╬═══╩═══╩═══╩═══╣
║    ║    ║    ║    ║    ║ LETTERx ║ TIMERx ║ PWM GROUP ║  REG BIT  ║      PINx     ║
╚════╩════╩════╩════╩════╩═════════╩════════╩═══════════╩═══════════╩═══════════════╝
*/

enum class PIN : int
{
	IO0  =	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD0) |  PINx(_PIND), //0	RX - PCINT16
	IO1  =	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD1) |  PINx(_PIND), //1 TX- PCINT17
	IO2  =	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD2) |  PINx(_PIND), //2 INT0 - PCINT18
	IO3  =	LETTERx(LETTER_B) | TIMERx(TIMER_2)  | PWM_GROUP(PWM8BIT)  | BIT(DD3) |  PINx(_PIND), //3 INT1 - PCINT19
	IO4  =	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD4) |  PINx(_PIND), //4 T0 - PCINT20 - XCK
	IO5  =	LETTERx(LETTER_B) | TIMERx(TIMER_0)  | PWM_GROUP(PWM8BIT)  | BIT(DD5) |  PINx(_PIND), //5 T1 - PCINT21
	IO6  =	LETTERx(LETTER_A) | TIMERx(TIMER_0)  | PWM_GROUP(PWM8BIT)  | BIT(DD6) |  PINx(_PIND), //6 AIN0 - PCINT22
	IO7  =	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD7) |  PINx(_PIND), //7 AIN1 - PCINT23
	IO8  =	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD0) |  PINx(_PINB), //8 CLKO - PCINT0 - ICP1
	IO9  =	LETTERx(LETTER_A) | TIMERx(TIMER_1)  | PWM_GROUP(PWM16BIT) | BIT(DD1) |  PINx(_PINB), //9 PCINT1
	IO10 =	LETTERx(LETTER_B) | TIMERx(TIMER_1)  | PWM_GROUP(PWM16BIT) | BIT(DD2) |  PINx(_PINB), //10 PCINT2 - SS
	IO11 =	LETTERx(LETTER_A) | TIMERx(TIMER_2)  | PWM_GROUP(PWM8BIT)  | BIT(DD3) |  PINx(_PINB), //11 PCINT3 - MOSI
	IO12 =	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD4) |  PINx(_PINB), //12 PCINT4 - MISO
	IO13 =	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD5) |  PINx(_PINB), //13 PCINT5 - SCK
	A0		 =	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD0) |  PINx(_PINC), //14 PCINT8 - SCK
	A1	  = LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD1) |  PINx(_PINC), //15 PCINT9 - SCK
	A2	  = LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD2) |  PINx(_PINC), //16 PCINT10 - SCK
	A3	  = LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD3) |  PINx(_PINC), //17 PCINT11 - SCK
	A4	  = LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD4) |  PINx(_PINC), //18 PCINT12 - SCK
	A5 	 = LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD5) |  PINx(_PINC), //19 PCINT13 - SCK
};

enum class HW_UART : int {
	BAUD2400    = 416,
	BAUD4800    = 207,
	BAUD9600    = 103,
	BAUD14400   =	 68,
	BAUD19200   =		51,
	BAUD28800   =  34,
	BAUD38400   =  25,
	BAUD57600   =  16,
	BAUD76800   =  12,
	BAUD115200  =   8,
	BAUD250000  =   3,
	BAUD500000  =   1,
	BAUD1000000 =   0
};

constexpr u16t __hw_timer_addr[] = {0x24, 0x80, 0xB0};
constexpr u8t PROGMEM __hw_int_mappedPin[] = {2, 3};


constexpr volatile u8t* varToPinx(PIN x){
	return (&_SFR_IO8(toU16(x) & 0xF));
}
constexpr u8t varToRegBit(PIN x){
	return ((toU16(x) >> 4) & 0x07);
}
constexpr u8t varToPWMGroup(PIN x){
	return ((toU16(x) >> 7) & 0x01);
}
constexpr u8t varToTimer(PIN x){
	return ((toU16(x) >> 8) & 0x07);
}
constexpr u8t varToLetter(PIN x){
	return 	(((toU16(x) >> 10) & 0x03));
}



