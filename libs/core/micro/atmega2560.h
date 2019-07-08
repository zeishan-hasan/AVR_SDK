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

#define TCCRxA(x) (*(&_SFR_MEM8(pgm_read_word(&__hw_timer_addr[x]))))

// Must pass TCCRxA
#define TCCRxB_8BIT(x) (*(&_SFR_MEM8(pgm_read_word(&__hw_timer_addr[x]) + 1)))
// Must pass TCCRxA
#define TCNTx_8BIT(x)	(*(&_SFR_MEM8(pgm_read_word(&__hw_timer_addr[x]) + 2)))
// Must pass TCCRxA
#define OCRxA_8BIT(x)	(*(&_SFR_MEM8(pgm_read_word(&__hw_timer_addr[x]) + 3)))
// Must pass TCCRxA
#define OCRxB_8BIT(x)	(*(&_SFR_MEM8(pgm_read_word(&__hw_timer_addr[x]) + 4)))



// Must pass TCCRxA
#define TCCRxB_16BIT(x) (*(&_SFR_MEM8(pgm_read_word(&__hw_timer_addr[x]) + 1)))
// Must pass TCCRxA
#define TCCRxC_16BIT(x) (*(&_SFR_MEM8(pgm_read_word(&__hw_timer_addr[x]) + 2)))
// Must pass TCCRxA
#define TCNTx_16BIT(x) (*(&_SFR_MEM16(pgm_read_word(&__hw_timer_addr[x]) + 4)))
// Must pass TCCRxA
#define ICRx_16BIT(x) (*(&_SFR_MEM16(pgm_read_word(&__hw_timer_addr[x]) + 6)))
// Must pass TCCRxA
#define OCRxA_16BIT(x)		(*(&_SFR_MEM16(pgm_read_word(&__hw_timer_addr[x]) + 8)))
// Must pass TCCRxA
#define OCRxB_16BIT(x)		(*(&_SFR_MEM16(pgm_read_word(&__hw_timer_addr[x]) + 10)))
// Must pass TCCRxA
#define OCRxC_16BIT(x)		(*(&_SFR_MEM16(pgm_read_word(&__hw_timer_addr[x]) + 12)))

/*
static const PROGMEM MappedPort __flashMappedPort[] ={
	//Pin No.	Pin Description
	{&PINE, DD0, NONE}, //0 RX0 - RXD0/PCINT8
	{&PINE, DD1, NONE}, //1 TX0 - TXD0
	//START PWM
	{&PINE, DD4, IS_PWM | PWM16BIT | _TIMER3 | LETTER_B}, //2 - 0C3B/INT4
	{&PINE, DD5, IS_PWM | PWM16BIT | _TIMER3 | LETTER_C}, //3			| OC3C/INT5
	{&PING, DD5, IS_PWM | PWM8BIT  | _TIMER0 | LETTER_B}, //4			| OC0B
	{&PINE, DD3, IS_PWM | PWM16BIT | _TIMER3 | LETTER_A},		//5			| OC3A/AIN1
	{&PINH, DD3, IS_PWM | PWM16BIT | _TIMER4 | LETTER_A},		//6			| OC4A
	{&PINH, DD4, IS_PWM | PWM16BIT | _TIMER4 | LETTER_B},		//7			| OC4B
	{&PINH, DD5, IS_PWM | PWM16BIT | _TIMER4 | LETTER_C},		//8			| OC4C
	{&PINH, DD6, IS_PWM | PWM8BIT  | _TIMER2 | LETTER_B},		//9			| OC2B
	{&PINB, DD4, IS_PWM | PWM8BIT  | _TIMER2 | LETTER_A}, //10		| OC2A/PCINT4
	{&PINB, DD5, IS_PWM | PWM16BIT | _TIMER1 | LETTER_A},  //11		| OC1A/PCINT5
	{&PINB, DD6, IS_PWM | PWM16BIT | _TIMER1 | LETTER_B},		//12		| OC1B/PCINT6
	{&PINB, DD7, IS_PWM | PWM16BIT | _TIMER1 | LETTER_C},		//13		| OC0A/OC1C/PCINT7
	//END PWM
	{&PINJ, DD1, NONE},	//14	TX3	| TXD3/PCINT10
	{&PINJ, DD0, NONE},	//15	RX3	| RXD3/PCINT9
	{&PINH, DD1, NONE},	//16	TX2	| TXD2
	{&PINH, DD0, NONE},	//17	RX2	| RXD2
	{&PIND, DD3, NONE},	//18	TX1	| TXD1/INT3
	{&PIND, DD2, NONE},	//19	RX1	| RXD1/INT2
	{&PIND, DD1, NONE},	//20	SDA	| SDA/INT1
	{&PIND, DD0, NONE},	//21	SCL	| SCL/INT0
	{&PINA, DD0, NONE},	//22		| AD0
	{&PINA, DD1, NONE},	//23		| AD1
	{&PINA, DD2, NONE},	//24		| AD2
	{&PINA, DD3, NONE},	//25		| AD3
	{&PINA, DD4, NONE},	//26		| AD4
	{&PINA, DD5, NONE},	//27		| AD5
	{&PINA, DD6, NONE},	//28		| AD6
	{&PINA, DD7, NONE},	//29		| AD7
	{&PINC, DD7, NONE},	//30		| A15
	{&PINC, DD6, NONE},	//31		| A14
	{&PINC, DD5, NONE},	//32		| A13
	{&PINC, DD4, NONE},	//33		| A12
	{&PINC, DD3, NONE},	//34		| A11
	{&PINC, DD2, NONE},	//35		| A10
	{&PINC, DD1, NONE},	//36		| A9
	{&PINC, DD0, NONE},	//37		| A8
	{&PIND, DD7, NONE},	//38		| T0
	{&PING, DD2, NONE},	//39		| ALE
	{&PING, DD1, NONE},	//40		| RD
	{&PING, DD0, NONE},	//41		| WR
	{&PINL, DD7, NONE},	//42		|
	{&PINL, DD6, NONE},	//43		|
	//START PWM TIMER5
	{&PINL, DD5, IS_PWM | PWM16BIT |_TIMER5 | LETTER_C },//44		| OC5C
	{&PINL, DD4, IS_PWM | PWM16BIT |_TIMER5 | LETTER_B },//45		| OC5B
	{&PINL, DD3, IS_PWM | PWM16BIT |_TIMER5 | LETTER_A },//46		| OC5A
	//END PWM TIMER5
	{&PINL, DD2, NONE},	//47		| T5
	{&PINL, DD1, NONE},	//48		| ICP5
	{&PINL, DD0, NONE},	//49		| ICP4
	{&PINB, DD3, NONE},	//50	MISO| MISO/PCINT3
	{&PINB, DD2, NONE},	//51	MOSI| MOSI/PCINT2
	{&PINB, DD1, NONE},	//52	SCK	| SCK/PCINT1
	{&PINB, DD0, NONE},	//53	SS	| SS/PCINT0
	//-------- ADC Pins --------//
	{&PINF, DD0, IS_ADC | _ADC(0x00)},	//A00	54	| ADC0
	{&PINF, DD1, IS_ADC | _ADC(0x01)},	//A01	55	| ADC1
	{&PINF, DD2, IS_ADC | _ADC(0x02)},	//A02	56	| ADC2
	{&PINF, DD3, IS_ADC | _ADC(0x03)},	//A03	57	| ADC3
	{&PINF, DD4, IS_ADC | _ADC(0x04)},	//A04	58	| ADC4/TMK
	{&PINF, DD5, IS_ADC | _ADC(0x05)},	//A05	59	| ADC5/TMS
	{&PINF, DD6, IS_ADC | _ADC(0x06)},	//A06	60	| ADC6
	{&PINF, DD7, IS_ADC | _ADC(0x07)},	//A07	61	| ADC7
	{&PINK, DD0, IS_ADC | _ADC(0x08)},	//A08	62	| ADC8/PCINT16
	{&PINK, DD1, IS_ADC | _ADC(0x09)},	//A09	63	| ADC9/PCINT17
	{&PINK, DD2, IS_ADC | _ADC(0x0A)},	//A10	64	| ADC10/PCINT18
	{&PINK, DD3, IS_ADC | _ADC(0x0B)},	//A11	65	| ADC11/PCINT19
	{&PINK, DD4, IS_ADC | _ADC(0x0C)},	//A12	66	| ADC12/PCINT20
	{&PINK, DD5, IS_ADC | _ADC(0x0D)},	//A13	67	| ADC13/PCINT21
	{&PINK, DD6, IS_ADC | _ADC(0x0E)},	//A14	68	| ADC14/PCINT22
	{&PINK, DD7, IS_ADC | _ADC(0x0F)},	//A15	69	| ADC15/PCINT23

};

*/
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



const uint16_t PROGMEM __hw_timer_addr[] = {0x24,0x80,0xB0,0x90,0xA0,0x120};
//const volatile u8t* PROGMEM __hw_timer_addr[] = {&TCCR0A, &TCCR1A, &TCCR2A, &TCCR3A, &TCCR3A, &TCCR4A};

//const uint16_t PROGMEM __adc_channels[] = {
//	/*CHANNEL_00*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (0<<MUX1) | (0<<MUX0),
//	/*CHANNEL_01*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (0<<MUX1) | (1<<MUX0),
//	/*CHANNEL_02*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (1<<MUX1) | (0<<MUX0),
//	/*CHANNEL_03*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (1<<MUX1) | (1<<MUX0),
//	/*CHANNEL_04*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (0<<MUX1) | (0<<MUX0),
//	/*CHANNEL_05*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (0<<MUX1) | (1<<MUX0),
//	/*CHANNEL_06*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (1<<MUX1) | (0<<MUX0),
//	/*CHANNEL_07*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (1<<MUX1) | (1<<MUX0),
//	/*CHANNEL_08*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (0<<MUX1) | (0<<MUX0),
//	/*CHANNEL_09*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (0<<MUX1) | (1<<MUX0),
//	/*CHANNEL_10*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (1<<MUX1) | (0<<MUX0),
//	/*CHANNEL_11*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (1<<MUX1) | (1<<MUX0),
//	/*CHANNEL_12*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (0<<MUX1) | (0<<MUX0),
//	/*CHANNEL_13*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (0<<MUX1) | (1<<MUX0),
//	/*CHANNEL_14*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (1<<MUX1) | (0<<MUX0),
//	/*CHANNEL_15*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (1<<MUX1) | (1<<MUX0)
//};

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
