#pragma once
#include <gpiodef.h>
#include <avr/iom2560.h>


#define PINx(x) (x << 0)
#define BIT(x) (x << 6)
#define PWM_GROUP(x) (x << 9)
#define TIMERx(x) (x << 10)
#define LETTERx(x) (x << 13)

#define TIMER_0 0x00
#define TIMER_1 0x01
#define TIMER_2 0x02
#define TIMER_3 0x03
#define TIMER_4 0x04
#define TIMER_5 0x05
#define NO_TIMER 0x07

#define LETTER_A 0x00
#define LETTER_B 0x01
#define LETTER_C 0x02
#define NO_LETTER 0x03

#define PWM8BIT 0
#define PWM16BIT 1

#define OR100 (1 << 5)

#define _PINA 0x00
#define _PINB 0x03
#define _PINC 0x06
#define _PIND 0x09
#define _PINE 0x0C
#define _PINF 0x0F
#define _PING 0x12
#define _PINH (OR100 | 0x00)
#define _PINJ (OR100 | 0x03)
#define _PINK (OR100 | 0x06)
#define _PINL (OR100 | 0x09)

#define pinToPinx(x) (__flashMappedPort[x] & OR100 ? &_SFR_MEM8(0x100 | __flashMappedPort[x] & 0x1F) :  &_SFR_IO8(__flashMappedPort[x] & 0x1F))
#define pinToRegBit(x) ((__flashMappedPort[x] >> 6) & 0x07)
#define pinToPWMGroup(x) ((__flashMappedPort[x] >> 9) & 0x01)
#define pinToTimer(x) (((__flashMappedPort[x] >> 10) & 0x07))
#define pinToLetter(x) (((__flashMappedPort[x] >> 13) & 0x03))



enum GPIO : u8t {
	IO0,
	IO1,
	IO2,
	IO3,
	IO4,
	IO5,
	IO6,
	IO7,
	IO8,
	IO9,
	IO11,
	IO12,
	IO13,
	IO14,
	IO15,
	IO16,
	IO17,
	IO18,
	IO19,
	IO20,
	IO21,
	IO22,
	IO23,
	IO24,
	IO25,
	IO26,
	IO27,
	IO28,
	IO29,
	IO30,
	IO31,
	IO32,
	IO33,
	IO34,
	IO35,
	IO36,
	IO37,
	IO38,
	IO39,
	IO40,
	IO41,
	IO42,
	IO43,
	IO44,
	IO45,
	IO46,
	IO47,
	IO48,
	IO49,
	IO50,
	IO51,
	IO52,
	IO53
};
/*!
		@brief The Analogx enum
		*/
enum Analogx:uint8_t{
	A0 = 54,
	A1,
	A2,
	A3,
	A4,
	A5,
	A6,
	A7,
	A8,
	A9,
	A10,
	A11,
	A12,
	A13,
	A14,
	A15
};



const uint16_t PROGMEM __hw_timer_addr[] = {0x24, 0x80, 0xB0, 0x90, 0xA0, 0x120};
const u8t PROGMEM __hw_int_mappedPin[8] = {21, 20, 19, 18, 2, 3, 255, 255};




/*
╔════╦════╦════╦════╦════╦════╦═══════════╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╗
║ 15 ║ 14 ║ 13 ║ 12 ║ 11 ║ 10 ║     9     ║ 8 ║ 7 ║ 6 ║ 5 ║ 4 ║ 3 ║ 2 ║ 1 ║ 0 ║
╠════╬════╩════╬════╩════╩════╬═══════════╬═══╩═══╩═══╬═══╩═══╩═══╩═══╩═══╩═══╣
║    ║ LETTERx ║    TIMERx    ║ PWM GROUP ║  REG BIT  ║          PINx         ║
╚════╩═════════╩══════════════╩═══════════╩═══════════╩═══════════════════════╝
*/
const PROGMEM u16t __flashMappedPort[] = {
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD0) |  PINx(_PINE), //0 RX0 - RXD0/PCINT8
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD1) |  PINx(_PINE), //1 TX0 - TXD0
	LETTERx(LETTER_B)  | TIMERx(TIMER_3)  | PWM_GROUP(PWM16BIT) | BIT(DD4) |  PINx(_PINE), //2 - 0C3B/INT4
	LETTERx(LETTER_C)  | TIMERx(TIMER_3)  | PWM_GROUP(PWM16BIT) | BIT(DD5) |  PINx(_PINE), //3	- OC3C/INT5
	LETTERx(LETTER_B)  | TIMERx(TIMER_0)  | PWM_GROUP(PWM8BIT)  | BIT(DD5) |  PINx(_PING), //4			| OC0B
	LETTERx(LETTER_A)  | TIMERx(TIMER_3)  | PWM_GROUP(PWM16BIT) | BIT(DD3) |  PINx(_PINE), //5			| OC3A/AIN1
	LETTERx(LETTER_A)  | TIMERx(TIMER_4)  | PWM_GROUP(PWM16BIT) | BIT(DD3) |  PINx(_PINH), //6			| OC4A
	LETTERx(LETTER_B)  | TIMERx(TIMER_4)  | PWM_GROUP(PWM16BIT) | BIT(DD4) |  PINx(_PINH), //7			| OC4B
	LETTERx(LETTER_C)  | TIMERx(TIMER_4)  | PWM_GROUP(PWM16BIT) | BIT(DD5) |  PINx(_PINH), //8			| OC4C
	LETTERx(LETTER_B)  | TIMERx(TIMER_2)  | PWM_GROUP(PWM8BIT)  | BIT(DD6) |  PINx(_PINH), //9			| OC2B
	LETTERx(LETTER_A)  | TIMERx(TIMER_2)  | PWM_GROUP(PWM8BIT)  | BIT(DD4) |  PINx(_PINB), //10		| OC2A/PCINT4
	LETTERx(LETTER_A)  | TIMERx(TIMER_1)  | PWM_GROUP(PWM16BIT) | BIT(DD5) |  PINx(_PINB), //11		| OC1A/PCINT5
	LETTERx(LETTER_B)  | TIMERx(TIMER_1)  | PWM_GROUP(PWM16BIT) | BIT(DD6) |  PINx(_PINB), //12		| OC1B/PCINT6
	LETTERx(LETTER_C)  | TIMERx(TIMER_1)  | PWM_GROUP(PWM16BIT) | BIT(DD7) |  PINx(_PINB), //13		| OC0A/OC1C/PCINT7
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD1) |  PINx(_PINJ), //14	TX3	| TXD3/PCINT10
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD0) |  PINx(_PINJ), //15	RX3	| RXD3/PCINT9
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD1) |  PINx(_PINH), //16	TX2	| TXD2
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD0) |  PINx(_PINH), //17	RX2	| RXD2
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD3) |  PINx(_PIND), //18	TX1	| TXD1/INT3
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD2) |  PINx(_PIND), //19	RX1	| RXD1/INT2
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD1) |  PINx(_PIND), //20	SDA	| SDA/INT1
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD0) |  PINx(_PIND), //21	SCL	| SCL/INT0
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD0) |  PINx(_PINA), //22		| AD0
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD1) |  PINx(_PINA), //23		| AD1
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD2) |  PINx(_PINA), //24		| AD2
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD3) |  PINx(_PINA), //25		| AD3
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD4) |  PINx(_PINA), //26		| AD4
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD5) |  PINx(_PINA), //27		| AD5
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD6) |  PINx(_PINA), //28		| AD6
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD7) |  PINx(_PINA), //29		| AD7
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD7) |  PINx(_PINC), //30		| A15
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD6) |  PINx(_PINC), //31		| A14
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD5) |  PINx(_PINC), //32		| A13
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD4) |  PINx(_PINC), //33		| A12
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD3) |  PINx(_PINC), //34		| A11
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD2) |  PINx(_PINC), //35		| A10
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD1) |  PINx(_PINC), //36		| A9
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD0) |  PINx(_PINC), //37		| A8
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD7) |  PINx(_PIND), //38		| T0
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD2) |  PINx(_PING), //39		| ALE
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD1) |  PINx(_PING), //40		| RD
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD0) |  PINx(_PING), //41		| WR
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD7) |  PINx(_PINL), //42		|
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD6) |  PINx(_PINL), //43		|
	LETTERx(LETTER_C)  | TIMERx(TIMER_5)  | PWM_GROUP(PWM16BIT) | BIT(DD5) |  PINx(_PINL), //44		| OC5C
	LETTERx(LETTER_B)  | TIMERx(TIMER_5)  | PWM_GROUP(PWM16BIT) | BIT(DD4) |  PINx(_PINL), //45		| OC5B
	LETTERx(LETTER_A)  | TIMERx(TIMER_5)  | PWM_GROUP(PWM16BIT) | BIT(DD3) |  PINx(_PINL), //46		| OC5A
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD2) |  PINx(_PINL), //47		| T5
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD1) |  PINx(_PINL), //48		| ICP5
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD0) |  PINx(_PINL), //49		| ICP4
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD3) |  PINx(_PINB), //50	MISO| MISO/PCINT3
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD2) |  PINx(_PINB), //51	MOSI| MOSI/PCINT2
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD1) |  PINx(_PINB), //52	SCK	| SCK/PCINT1
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD1) |  PINx(_PINB), //52	SCK	| SCK/PCINT1
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD0) |  PINx(_PINB), //53	SS	| SS/PCINT0

	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD0) |  PINx(_PINF), //A00	54	| ADC0
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD1) |  PINx(_PINF), //A01	55	| ADC1
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD2) |  PINx(_PINF), //A02	56	| ADC2
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD3) |  PINx(_PINF), //A03	57	| ADC3
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD4) |  PINx(_PINF), //A04	58	| ADC4/TMK
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD5) |  PINx(_PINF), //A05	59	| ADC5/TMS
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD6) |  PINx(_PINF), //A06	60	| ADC6
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD7) |  PINx(_PINF), //A07	61	| ADC7
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD0) |  PINx(_PINK), //A08	62	| ADC8/PCINT16
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD1) |  PINx(_PINK), //A09	63	| ADC9/PCINT17
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD2) |  PINx(_PINK), //A10	64	| ADC10/PCINT18
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD3) |  PINx(_PINK), //A11	65	| ADC11/PCINT19
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD4) |  PINx(_PINK), //A12	66	| ADC12/PCINT20
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD5) |  PINx(_PINK), //A13	67	| ADC13/PCINT21
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD6) |  PINx(_PINK), //A14	68	| ADC14/PCINT22
	LETTERx(NO_LETTER) | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD7) |  PINx(_PINK) //A15	69	| ADC15/PCINT23
};
