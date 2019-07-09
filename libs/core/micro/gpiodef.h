#pragma once

#include <avr/pgmspace.h>
#include <avr/eeprom.h>
#include <macros.h>
#include <avr/io.h>
#include <util/delay.h>

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
#define _TIMER0 (0x00 << 7)
#define _TIMER1 (0x01	<< 7)
#define _TIMER2 (0x02	<< 7)
#define _TIMER3 (0x03	<< 7)
#define _TIMER4 (0x04	<< 7)
#define _TIMER5 (0x05 << 7)
#define _A	0x00
#define _B	0x01
#define _C	0x02
//#define _UART0	0x00
//#define _UART1	0x01
//#define _UART2	0x02
//#define _UART3	0x03
#define isPWM 12
#define PWM_BITS 10
#define OUT_CMP_SEL 7
#define isADC 4
#define LETTER_SEL 5
#define ADC_SEL 0

#define PWM_LETTER_MASK(x) ((x >> LETTER_SEL) & 0x03)
#define PWM_BITS_MASK(x) ((x >> 10) & 0x03)
#define IS_PWM_MASK(x) (x & bitValue(isPWM))
#define OUT_CMP_SEL_MASK(x) ((x >> OUT_CMP_SEL)  & 0x7)
#define IS_ADC_MASK(x) (x & bitValue(isADC))
#define ADC_CH_MASK(x) (x & 0xF)
//#define isUART 2
//#define UART_SEL 0

#define IS_PWM (1 << 12)
#define PWM8BIT (0 << 10)
#define PWM16BIT (1 << 10)
#define LETTER_A (0 << 5)
#define LETTER_B (1 << 5)
#define LETTER_C (2 << 5)
#define IS_ADC (1 << 4)
#define _ADC(x) (x << 0)
#define NONE 0
#pragma pack(1)

///
//**
//* @brief The MappedPort struct. It's used to manage pins.
//*/
//truct MappedPort {
///**
//				* @brief Is the pointer used to manage a pin
//				*/
//volatile uint8_t * pinx;
///**
//				* @brief The bit into own register
//				*/
//uint8_t registerBit;
//
///*! @var controlBits
//							@brief Used to get pin functions mode.
//							@verbatim
//							╔════╦════╦════╦═══════╦═════╦════╦══════╦══════╦══════╦══════╦═════╦═══════╦═══╦═══╦═══╦═══╗
//							║ 15 ║ 14 ║ 13 ║ 12    ║ 11  ║ 10 ║ 9    ║ 8    ║ 7    ║ 6    ║ 5   ║ 4     ║ 3 ║ 2 ║ 1 ║ 0 ║
//							╠════╬════╬════╬═══════╬═════╩════╬══════╩══════╩══════╬══════╩═════╬═══════╬═══╩═══╩═══╩═══╣
//							║    ║    ║    ║ isPWM ║ PWM bits ║ Output Compare Sel ║ letter Sel ║ isADC ║    ADC_SEL    ║
//							╚════╩════╩════╩═══════╩══════════╩════════════════════╩════════════╩═══════╩═══════════════╝
//							@endverbatim
//
//	*/
//uint16_t controlBits;
//
//;


//#pragma pop
