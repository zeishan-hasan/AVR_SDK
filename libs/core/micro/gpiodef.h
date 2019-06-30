#pragma once

#include <avr/pgmspace.h>
#include <macros.h>
#define _TIMER0 0x00
#define _TIMER1 0x01
#define _TIMER2 0x02
#define _TIMER3 0x03
#define _TIMER4 0x04
#define _TIMER5 0x05
#define _A	0x00
#define _B	0x01
#define _C	0x02
//#define _UART0	0x00
//#define _UART1	0x01
//#define _UART2	0x02
//#define _UART3	0x03
#define isPWM 12
#define OUT_CMP_SEL 7
#define isADC 4
#define LETTER_SEL 5
#define ADC_SEL 0

#define PWM_BITS_MASK(x) ((x & (0x03 << 10)) >> 10)
#define IS_PWM_MASK(x) (x & bitValue(isPWM))
#define OUT_CMP_SEL_MASK(x) ((x  & (0x7 << OUT_CMP_SEL)) >> OUT_CMP_SEL)
#define IS_ADC_MASK(x) (x & bitValue(isADC))
#define ADC_CH_MASK(x) (x & 0xF)
//#define isUART 2
//#define UART_SEL 0

#pragma pack(1)
/**
	* @brief The MappedPort struct. It's used to manage pins.
	*/
struct MappedPort {
	/**
					* @brief Is the pointer used to manage a pin
					*/
	volatile uint8_t * pinx;
	/**
					* @brief The bit into own register
					*/
	uint8_t registerBit;

	/*! @var controlBits
								@brief Used to get pin functions mode.
								@verbatim
								╔═════╦════╦═══════╦══════╦══════╦══════╦══════╦═════╦═══════╦═══╦═══╦═══╦═══╦════════╦═════╦════╗
								║ 15  ║ 14 ║ 13    ║ 12   ║ 11   ║ 10   ║ 9    ║ 8   ║ 7     ║ 6 ║ 5 ║ 4 ║ 3 ║ 2      ║ 1   ║ 0  ║
								╠═════╩════╬═══════╬══════╩══════╩══════╬══════╩═════╬═══════╬═══╩═══╩═══╩═══╬════════╬═════╩════╣
								║ NOT USED ║ isPWM ║ Output Compare Sel ║ Letter Sel ║ isADC ║   ADC_SEL     ║ isUART ║ UART_SEL ║
								╚══════════╩═══════╩════════════════════╩════════════╩═══════╩═══════════════╩════════╩══════════╝
								╔════╦════╦════╦═══════╦═════╦════╦══════╦══════╦══════╦══════╦═════╦═══════╦═══╦═══╦═══╦═══╗
								║ 15 ║ 14 ║ 13 ║ 12    ║ 11  ║ 10 ║ 9    ║ 8    ║ 7    ║ 6    ║ 5   ║ 4     ║ 3 ║ 2 ║ 1 ║ 0 ║
								╠════╬════╬════╬═══════╬═════╩════╬══════╩══════╩══════╬══════╩═════╬═══════╬═══╩═══╩═══╩═══╣
								║    ║    ║    ║ isPWM ║ PWM bits ║ Output Compare Sel ║ letter Sel ║ isADC ║    ADC_SEL    ║
								╚════╩════╩════╩═══════╩══════════╩════════════════════╩════════════╩═══════╩═══════════════╝
								@endverbatim
		*/
	uint16_t controlBits;

};


#pragma pop
