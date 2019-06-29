#pragma once

#include <avr/pgmspace.h>

#define _TIMER0 0x00
#define _TIMER1 0x01
#define _TIMER2 0x02
#define _TIMER3 0x03
#define _TIMER4 0x04
#define _TIMER5 0x05
#define _A	0x00
#define _B	0x01
#define _C	0x02
#define _UART0	0x00
#define _UART1	0x01
#define _UART2	0x02
#define _UART3	0x03
#define isPWM 13
#define OUT_CMP_SEL 10
#define isADC 7
#define LETTER_SEL 8
#define ADC_SEL 3
#define isUART 2
#define UART_SEL 0

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
								@endverbatim
		*/
	uint16_t controlBits;

};

/**
	* @brief The DDRx enum
	*/
enum DDRx:uint8_t{
	INPUT,
	OUTPUT,
	INPUT_PULLUP
};

/**
	* @brief The LogicStates enum
	*/
enum LogicStates:uint8_t{
	LOW, HIGH
};



#pragma pop
