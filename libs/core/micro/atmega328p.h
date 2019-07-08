#pragma once
#include <gpiodef.h>
#include <avr/io.h>

//const PROGMEM MappedPort __flashMappedPort[] ={
//	{&PIND, DD0, NONE},//0	RX - PCINT16
//	{&PIND, DD1, NONE},//1 TX- PCINT17
//	{&PIND, DD2, NONE}, //2 INT0 - PCINT18
//	{&PIND, DD3, IS_PWM | PWM8BIT | _TIMER2 | LETTER_B}, //3 INT1 - PCINT19
//	{&PIND, DD4, NONE}, //4 T0 - PCINT20 - XCK
//	{&PIND, DD5, IS_PWM | PWM8BIT | _TIMER0 | LETTER_B }, //5 T1 - PCINT21
//	{&PIND, DD6, IS_PWM | PWM8BIT | _TIMER0 | LETTER_A }, //6 AIN0 - PCINT22
//	{&PIND, DD7, NONE}, //7 AIN1 - PCINT23
//	{&PINB, DD0, NONE}, //8 CLKO - PCINT0 - ICP1
//	{&PINB, DD1, IS_PWM | _TIMER1 | LETTER_A}, //9 PCINT1
//	{&PINB, DD2, IS_PWM | _TIMER1 | LETTER_B}, //10 PCINT2 - SS
//	{&PINB, DD3, IS_PWM | _TIMER2 | LETTER_A}, //11 PCINT3 - MOSI
//	{&PINB, DD4, NONE}, //12 PCINT4 - MISO
//	{&PINB, DD5, NONE}, //13 PCINT5 - SCK
//	{&PINC, DD0, IS_ADC | _ADC(0x00)}, //14 PCINT8
//	{&PINC, DD1, IS_ADC | _ADC(0x01)}, //15 PCINT9
//	{&PINC, DD2, IS_ADC | _ADC(0x02)}, //16 PCINT10
//	{&PINC, DD3, IS_ADC | _ADC(0x03)}, //17 PCINT11
//	{&PINC, DD4, IS_ADC | _ADC(0x04)}, //18 PCINT12
//	{&PINC, DD5, IS_ADC | _ADC(0x05)}, //19 PCINT13
//	{nullptr, 255, IS_ADC | _ADC(0x06)},
//	{nullptr, 255, IS_ADC | _ADC(0x07)},
//};

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

const u8t PROGMEM __hw_timer_addr[] = {0x24, 0x80, 0xB0};
const u8t PROGMEM __hw_int_mappedPin[] = {2, 3};


//const u8t PROGMEM __hw_int_mappedPin[8] = {2, 3, 255, 255, 255, 255, 255, 255};

//const uint8_t PROGMEM __adc_channels[] = {
//	/*CHANNEL_00*/	 (0 << MUX3) | (0 << MUX2) | (0 << MUX1) | (0 << MUX0),
//	/*CHANNEL_01*/	 (0 << MUX3) | (0 << MUX2) | (0 << MUX1) | (1 << MUX0),
//	/*CHANNEL_02*/	 (0 << MUX3) | (0 << MUX2) | (1 << MUX1) | (0 << MUX0),
//	/*CHANNEL_03*/	 (0 << MUX3) | (0 << MUX2) | (1 << MUX1) | (1 << MUX0),
//	/*CHANNEL_04*/	 (0 << MUX3) | (1 << MUX2) | (0 << MUX1) | (0 << MUX0),
//	/*CHANNEL_05*/	 (0 << MUX3) | (1 << MUX2) | (0 << MUX1) | (1 << MUX0),
//	/*CHANNEL_06*/	 (0 << MUX3) | (1 << MUX2) | (1 << MUX1) | (0 << MUX0),
//	/*CHANNEL_07*/	 (0 << MUX3) | (1 << MUX2) | (1 << MUX1) | (1 << MUX0),
//};

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
╔════╦════╦════╦════╦════╦═════════╦════╦═══╦═══════════╦═══╦═══╦═══╦═══╦═══╦═══╦═══╗
║ 15 ║ 14 ║ 13 ║ 12 ║ 11 ║    10   ║  9 ║ 8 ║     7     ║ 6 ║ 5 ║ 4 ║ 3 ║ 2 ║ 1 ║ 0 ║
╠════╬════╬════╬════╬════╬═════════╬════╩═══╬═══════════╬═══╩═══╩═══╬═══╩═══╩═══╩═══╣
║    ║    ║    ║    ║    ║ LETTERx ║ TIMERx ║ PWM GROUP ║  REG BIT  ║      PINx     ║
╚════╩════╩════╩════╩════╩═════════╩════════╩═══════════╩═══════════╩═══════════════╝
*/

const PROGMEM u16t __flashMappedPort[] = {
	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD0) |  PINx(_PIND), //0	RX - PCINT16
	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD1) |  PINx(_PIND), //1 TX- PCINT17
	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD2) |  PINx(_PIND), //2 INT0 - PCINT18
	LETTERx(LETTER_B) | TIMERx(TIMER_2)  | PWM_GROUP(PWM8BIT)  | BIT(DD3) |  PINx(_PIND), //3 INT1 - PCINT19
	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD4) |  PINx(_PIND), //4 T0 - PCINT20 - XCK
	LETTERx(LETTER_B) | TIMERx(TIMER_0)  | PWM_GROUP(PWM8BIT)  | BIT(DD5) |  PINx(_PIND), //5 T1 - PCINT21
	LETTERx(LETTER_A) | TIMERx(TIMER_0)  | PWM_GROUP(PWM8BIT)  | BIT(DD6) |  PINx(_PIND), //6 AIN0 - PCINT22
	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD7) |  PINx(_PIND), //7 AIN1 - PCINT23
	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD0) |  PINx(_PINB), //8 CLKO - PCINT0 - ICP1
	LETTERx(LETTER_A) | TIMERx(TIMER_1)  | PWM_GROUP(PWM16BIT) | BIT(DD1) |  PINx(_PINB), //9 PCINT1
	LETTERx(LETTER_B) | TIMERx(TIMER_1)  | PWM_GROUP(PWM16BIT) | BIT(DD2) |  PINx(_PINB), //10 PCINT2 - SS
	LETTERx(LETTER_A) | TIMERx(TIMER_2)  | PWM_GROUP(PWM8BIT)  | BIT(DD3) |  PINx(_PINB), //11 PCINT3 - MOSI
	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD4) |  PINx(_PINB), //12 PCINT4 - MISO
	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD5) |  PINx(_PINB), //13 PCINT5 - SCK
	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD5) |  PINx(_PINC), //14 PCINT8 - SCK
	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD5) |  PINx(_PINC), //15 PCINT9 - SCK
	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD5) |  PINx(_PINC), //16 PCINT10 - SCK
	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD5) |  PINx(_PINC), //17 PCINT11 - SCK
	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD5) |  PINx(_PINC), //18 PCINT12 - SCK
	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(DD5) |  PINx(_PINC), //19 PCINT13 - SCK
	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(0)   |  PINx(NO_PINX),
	LETTERx(0)        | TIMERx(NO_TIMER) | PWM_GROUP(0)        | BIT(0)   |  PINx(NO_PINX),
};


