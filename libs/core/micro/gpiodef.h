#pragma once

#include <avr/pgmspace.h>
#include <avr/eeprom.h>
#include <macros.h>
#include <avr/io.h>
#include <util/delay.h>



//#define TCCRxA(x) (*(&_SFR_MEM8(__hw_timer_addr[x])))

#define TCCRxB_8BIT(x)(*(x + 1))
#define TCNTx_8BIT(x)	(*(x + 2))
#define OCRxA_8BIT(x)	(*(x + 3))
#define OCRxB_8BIT(x)	(*(x + 4))


#define TCCRxB_16BIT(x) (*(x + 1))
#define TCCRxC_16BIT(x) (*(x + 2))
#define TCNTx_16BIT(x)  (*(&_SFR_MEM16(x + 4)))
#define ICRx_16BIT(x)   (*(&_SFR_MEM16(x + 6)))
#define OCRxA_16BIT(x)		(*(&_SFR_MEM16(x + 8)))
#define OCRxB_16BIT(x)		(*(&_SFR_MEM16(x + 10)))
#define OCRxC_16BIT(x)		(*(&_SFR_MEM16(x + 12)))
static const u8t __bitToValue[] = {1,2,4,8,16,32,64,128};
static const u8t __bitToValue_compl[] = {0xFE, 0xFD, 0xFB, 0xF7, 0xEF, 0xDF, 0xBF, 0x7F};



// Dummy declaration of gpios
#if defined(__COMPILE__)
#else
enum class PIN : u16t {
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
	IO10,
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
	IO53,
	A0,
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
enum class PIN_ADC : u8t {
	A0,
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
#endif
//#pragma pop
