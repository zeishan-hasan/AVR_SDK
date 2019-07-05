#pragma once
#include <gpiodef.h>



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

const uint16_t PROGMEM __adc_channels[] = {
	/*CHANNEL_00*/	 (0<<MUX5) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (0<<MUX1) | (0<<MUX0),
	/*CHANNEL_01*/	 (0<<MUX5) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (0<<MUX1) | (1<<MUX0),
	/*CHANNEL_02*/	 (0<<MUX5) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (1<<MUX1) | (0<<MUX0),
	/*CHANNEL_03*/	 (0<<MUX5) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (1<<MUX1) | (1<<MUX0),
	/*CHANNEL_04*/	 (0<<MUX5) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (0<<MUX1) | (0<<MUX0),
	/*CHANNEL_05*/	 (0<<MUX5) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (0<<MUX1) | (1<<MUX0),
	/*CHANNEL_06*/	 (0<<MUX5) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (1<<MUX1) | (0<<MUX0),
	/*CHANNEL_07*/	 (0<<MUX5) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (1<<MUX1) | (1<<MUX0),
	/*CHANNEL_08*/	 (1<<MUX5) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (0<<MUX1) | (0<<MUX0),
	/*CHANNEL_09*/	 (1<<MUX5) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (0<<MUX1) | (1<<MUX0),
	/*CHANNEL_10*/	 (1<<MUX5) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (1<<MUX1) | (0<<MUX0),
	/*CHANNEL_11*/	 (1<<MUX5) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (1<<MUX1) | (1<<MUX0),
	/*CHANNEL_12*/	 (1<<MUX5) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (0<<MUX1) | (0<<MUX0),
	/*CHANNEL_13*/	 (1<<MUX5) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (0<<MUX1) | (1<<MUX0),
	/*CHANNEL_14*/	 (1<<MUX5) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (1<<MUX1) | (0<<MUX0),
	/*CHANNEL_15*/	 (1<<MUX5) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (1<<MUX1) | (1<<MUX0)
};

const u8t PROGMEM __hw_int_mappedPin[8] = {21, 20, 19, 18, 2, 3, 255, 255};

