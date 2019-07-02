#pragma once
#include <gpiodef.h>

#define getPin(x) ()


const PROGMEM MappedPort __flashMappedPort[] ={
	{&PIND, DD0, NONE},//0	RX - PCINT16
	{&PIND, DD1, NONE},//1 TX- PCINT17
	{&PIND, DD2, NONE}, //2 INT0 - PCINT18
	{&PIND, DD3, IS_PWM | PWM8BIT | _TIMER2 | LETTER_B}, //3 INT1 - PCINT19
	{&PIND, DD4, NONE}, //4 T0 - PCINT20 - XCK
	{&PIND, DD5, IS_PWM | PWM8BIT | _TIMER0 | LETTER_B }, //5 T1 - PCINT21
	{&PIND, DD6, IS_PWM | PWM8BIT | _TIMER0 | LETTER_A }, //6 AIN0 - PCINT22
	{&PIND, DD7, NONE}, //7 AIN1 - PCINT23
	{&PINB, DD0, NONE}, //8 CLKO - PCINT0 - ICP1
	{&PINB, DD1, IS_PWM | _TIMER1 | LETTER_A}, //9 PCINT1
	{&PINB, DD2, IS_PWM | _TIMER1 | LETTER_B}, //10 PCINT2 - SS
	{&PINB, DD3, IS_PWM | _TIMER2 | LETTER_A}, //11 PCINT3 - MOSI
	{&PINB, DD4, NONE}, //12 PCINT4 - MISO
	{&PINB, DD5, NONE}, //13 PCINT5 - SCK
	{&PINC, DD0, IS_ADC | _ADC(0x00)}, //14 PCINT8
	{&PINC, DD1, IS_ADC | _ADC(0x01)}, //15 PCINT9
	{&PINC, DD2, IS_ADC | _ADC(0x02)}, //16 PCINT10
	{&PINC, DD3, IS_ADC | _ADC(0x03)}, //17 PCINT11
	{&PINC, DD4, IS_ADC | _ADC(0x04)}, //18 PCINT12
	{&PINC, DD5, IS_ADC | _ADC(0x05)}, //19 PCINT13
	{nullptr, 255, IS_ADC | _ADC(0x06)},
	{nullptr, 255, IS_ADC | _ADC(0x07)},
};

enum Analogx:uint8_t{
	A0 = 14,
	A1,
	A2,
	A3,
	A4,
	A5,
	A6,
	A7,
};

const PROGMEM u8t __hw_timer_addr[] = {0x24,0x80,0xB0};

const PROGMEM u8t __adc_channels[] = {
	/*CHANNEL_00*/	 (0<<MUX3) | (0<<MUX2) | (0<<MUX1) | (0<<MUX0),
	/*CHANNEL_01*/	 (0<<MUX3) | (0<<MUX2) | (0<<MUX1) | (1<<MUX0),
	/*CHANNEL_02*/	 (0<<MUX3) | (0<<MUX2) | (1<<MUX1) | (0<<MUX0),
	/*CHANNEL_03*/	 (0<<MUX3) | (0<<MUX2) | (1<<MUX1) | (1<<MUX0),
	/*CHANNEL_04*/	 (0<<MUX3) | (1<<MUX2) | (0<<MUX1) | (0<<MUX0),
	/*CHANNEL_05*/	 (0<<MUX3) | (1<<MUX2) | (0<<MUX1) | (1<<MUX0),
	/*CHANNEL_06*/	 (0<<MUX3) | (1<<MUX2) | (1<<MUX1) | (0<<MUX0),
	/*CHANNEL_07*/	 (0<<MUX3) | (1<<MUX2) | (1<<MUX1) | (1<<MUX0),
};
