#pragma once
#include <gpiodef.h>
#include <avr/io.h>
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


#define pinToPinx(x) (&_SFR_IO8(pgm_read_word(&__flashMappedPort[x]) & 0xF))
#define pinToRegBit(x) ((pgm_read_word(&__flashMappedPort[x]) >> 4) & 0x07)
#define pinToPWMGroup(x) ((pgm_read_word(&__flashMappedPort[x]) >> 7) & 0x01)
#define pinToTimer(x) (((pgm_read_word(&__flashMappedPort[x]) >> 8) & 0x07))
#define pinToLetter(x) (((pgm_read_word(&__flashMappedPort[x]) >> 10) & 0x03))


/*
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

*/
enum Analogx{
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


