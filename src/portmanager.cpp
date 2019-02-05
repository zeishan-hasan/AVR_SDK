#include "portmanager.h"
#include <avr/io.h>
#include <util/delay.h>
#include <stdlib.h>
#include <avr/iomxx0_1.h>
#include <avr/pgmspace.h>
#include <stdio.h>




#if defined _atmega2560
#define _TIMER0 0x00
#define _TIMER1 0x01
#define _TIMER2 0x02
#define _TIMER3 0x03
#define _TIMER4 0x04
#define _TIMER5 0x05
#define _A		0x00
#define _B		0x01
#define _C		0x02
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

static const PROGMEM MappedPort _flashMappedPort[] ={
	//Pin No.	Pin Description
	{&PINE,DD0,(0<<isPWM)|(0<<OUT_CMP_SEL)|(0<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(1<<isUART)|(_UART0<<UART_SEL)},		//0		RX0	| RXD0/PCINT8
	{&PINE,DD1,(0<<isPWM)|(0<<OUT_CMP_SEL)|(0<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(1<<isUART)|(_UART0<<UART_SEL)},		//1		TX0	| TXD0
	//START PWM
	{&PINE,DD4,(1<<isPWM)|(_TIMER3<<OUT_CMP_SEL)|(_B<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},	//2			| 0C3B/INT4
	{&PINE,DD5,(1<<isPWM)|(_TIMER3<<OUT_CMP_SEL)|(_C<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},	//3			| OC3C/INT5
	{&PING,DD5,(1<<isPWM)|(_TIMER0<<OUT_CMP_SEL)|(_B<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},	//4			| OC0B
	{&PINE,DD3,(1<<isPWM)|(_TIMER3<<OUT_CMP_SEL)|(_A<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},	//5			| OC3A/AIN1
	{&PINH,DD3,(1<<isPWM)|(_TIMER4<<OUT_CMP_SEL)|(_A<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},	//6			| OC4A
	{&PINH,DD4,(1<<isPWM)|(_TIMER4<<OUT_CMP_SEL)|(_B<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},	//7			| OC4B
	{&PINH,DD5,(1<<isPWM)|(_TIMER4<<OUT_CMP_SEL)|(_C<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},	//8			| OC4C
	{&PINH,DD6,(1<<isPWM)|(_TIMER2<<OUT_CMP_SEL)|(_B<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},	//9			| OC2B
	{&PINB,DD4,(1<<isPWM)|(_TIMER2<<OUT_CMP_SEL)|(_A<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},	//10		| OC2A/PCINT4
	{&PINB,DD5,(1<<isPWM)|(_TIMER1<<OUT_CMP_SEL)|(_A<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},	//11		| OC1A/PCINT5
	{&PINB,DD6,(1<<isPWM)|(_TIMER1<<OUT_CMP_SEL)|(_B<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},	//12		| OC1B/PCINT6
	{&PINB,DD7,(1<<isPWM)|(_TIMER1<<OUT_CMP_SEL)|(_C<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},	//13		| OC0A/OC1C/PCINT7
	//END PWM 00000000 00000000
	//START UART
	{&PINJ,DD1,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(1<<isUART)|(_UART3<<UART_SEL)},	//14	TX3	| TXD3/PCINT10
	{&PINJ,DD0,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(1<<isUART)|(_UART3<<UART_SEL)},	//15	RX3	| RXD3/PCINT9
	{&PINH,DD1,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(1<<isUART)|(_UART2<<UART_SEL)},	//16	TX2	| TXD2
	{&PINH,DD0,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(1<<isUART)|(_UART2<<UART_SEL)},	//17	RX2	| RXD2
	{&PIND,DD3,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(1<<isUART)|(_UART1<<UART_SEL)},	//18	TX1	| TXD1/INT3
	{&PIND,DD2,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(1<<isUART)|(_UART1<<UART_SEL)},	//19	RX1	| RXD1/INT2
	//END UART
	{&PIND,DD1,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//20	SDA	| SDA/INT1
	{&PIND,DD0,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//21	SCL	| SCL/INT0
	{&PINA,DD0,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//22		| AD0
	{&PINA,DD1,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//23		| AD1
	{&PINA,DD2,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//24		| AD2
	{&PINA,DD3,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//25		| AD3
	{&PINA,DD4,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//26		| AD4
	{&PINA,DD5,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//27		| AD5
	{&PINA,DD6,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//28		| AD6
	{&PINA,DD7,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//29		| AD7
	{&PINC,DD7,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//30		| A15
	{&PINC,DD6,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//31		| A14
	{&PINC,DD5,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//32		| A13
	{&PINC,DD4,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//33		| A12
	{&PINC,DD3,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//34		| A11
	{&PINC,DD2,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//35		| A10
	{&PINC,DD1,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//36		| A9
	{&PINC,DD0,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//37		| A8
	{&PIND,DD7,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//38		| T0
	{&PING,DD2,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//39		| ALE
	{&PING,DD1,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//40		| RD
	{&PING,DD0,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//41		| WR
	{&PINL,DD7,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//42		|
	{&PINL,DD6,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//43		|
	//START PWM TIMER5
	{&PINL,DD5,(1<<isPWM)|(_TIMER5<<OUT_CMP_SEL)|(_C<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},//44		| OC5C
	{&PINL,DD4,(1<<isPWM)|(_TIMER5<<OUT_CMP_SEL)|(_B<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},//45		| OC5B
	{&PINL,DD3,(1<<isPWM)|(_TIMER5<<OUT_CMP_SEL)|(_A<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},//46		| OC5A
	//END PWM TIMER5
	{&PINL,DD2,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//47		| T5
	{&PINL,DD1,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//48		| ICP5
	{&PINL,DD0,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//49		| ICP4
	{&PINB,DD3,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//50	MISO| MISO/PCINT3
	{&PINB,DD2,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//51	MOSI| MOSI/PCINT2
	{&PINB,DD1,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//52	SCK	| SCK/PCINT1
	{&PINB,DD0,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//53	SS	| SS/PCINT0

	//ADC
	{&PINF,DD0,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x00<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//A0	54	| ADC0
	{&PINF,DD1,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x01<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//A1	55	| ADC1
	{&PINF,DD2,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x02<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//A2	56	| ADC2
	{&PINF,DD3,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x03<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//A3	57	| ADC3
	{&PINF,DD4,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x04<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//A4	58	| ADC4/TMK
	{&PINF,DD5,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x05<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//A5	59	| ADC5/TMS
	{&PINF,DD6,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x06<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//A6	60	| ADC6
	{&PINF,DD7,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x07<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//A7	61	| ADC7
	{&PINK,DD0,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x08<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//A8	62	| ADC8/PCINT16
	{&PINK,DD1,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x09<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//A9	63	| ADC9/PCINT17
	{&PINK,DD2,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x0A<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//A10	64	| ADC10/PCINT18
	{&PINK,DD3,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x0B<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//A11	65	| ADC11/PCINT19
	{&PINK,DD4,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x0C<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//A12	66	| ADC12/PCINT20
	{&PINK,DD5,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x0D<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//A13	67	| ADC13/PCINT21
	{&PINK,DD6,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x0E<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//A14	68	| ADC14/PCINT22
	{&PINK,DD7,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x0F<<ADC_SEL)|(0<<isUART)|(0x00<<UART_SEL)},	//A15	69	| ADC15/PCINT23

};
#endif


Pin::Pin(uint8_t portNo, DDRx direction)
{
	uint16_t timers[] = {0x24,0x80,0xB0,0x90,0xA0,0x120};

	uint16_t _ADC_CHANNELS[16] = {
		/*CHANNEL_00*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (0<<MUX1) | (0<<MUX0),
		/*CHANNEL_01*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (0<<MUX1) | (1<<MUX0),
		/*CHANNEL_02*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (1<<MUX1) | (0<<MUX0),
		/*CHANNEL_03*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (1<<MUX1) | (1<<MUX0),
		/*CHANNEL_04*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (0<<MUX1) | (0<<MUX0),
		/*CHANNEL_05*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (0<<MUX1) | (1<<MUX0),
		/*CHANNEL_06*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (1<<MUX1) | (0<<MUX0),
		/*CHANNEL_07*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (1<<MUX1) | (1<<MUX0),
		/*CHANNEL_08*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (0<<MUX1) | (0<<MUX0),
		/*CHANNEL_09*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (0<<MUX1) | (1<<MUX0),
		/*CHANNEL_10*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (1<<MUX1) | (0<<MUX0),
		/*CHANNEL_11*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (1<<MUX1) | (1<<MUX0),
		/*CHANNEL_12*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (0<<MUX1) | (0<<MUX0),
		/*CHANNEL_13*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (0<<MUX1) | (1<<MUX0),
		/*CHANNEL_14*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (1<<MUX1) | (0<<MUX0),
		/*CHANNEL_15*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (1<<MUX1) | (1<<MUX0)
	};

	_pinx		=	(volatile uint8_t*)pgm_read_word(&_flashMappedPort[portNo].pinx);
	_ddrx		=	(volatile uint8_t*)( _pinx + 1);
	_portx		=	(volatile uint8_t*)( _pinx + 2);
	_registerBit	=	pgm_read_byte( &_flashMappedPort[portNo].registerBit );
	_controlBits	=	pgm_read_word( &_flashMappedPort[portNo].controlBits );

	if(pgm_read_word(&_flashMappedPort[portNo].controlBits) & (1<<isPWM)){
		uint16_t temp = (pgm_read_word(&_flashMappedPort[portNo].controlBits) & (0x7<<OUT_CMP_SEL)) >> OUT_CMP_SEL;
		if(temp == 2){
			_local_ctrl_bits = _PWM_8BIT;
			_pwm_8BIT.TCCRxA = (volatile uint8_t*)*(timers+temp);
			_pwm_8BIT.TCCRxB = (volatile uint8_t*)_pwm_8BIT.TCCRxA + 1;
			_pwm_8BIT.TCNTx	 = (volatile uint8_t*)_pwm_8BIT.TCCRxB + 1;
		}

		else{
			_local_ctrl_bits  = _PWM_16BIT;
			_pwm_16BIT.TCCRxA = (volatile uint8_t*)*(timers+temp);
			_pwm_16BIT.TCCRxB = (volatile uint8_t*)_pwm_16BIT.TCCRxA + 1;
			_pwm_16BIT.TCCRxC = (volatile uint8_t*)_pwm_16BIT.TCCRxB + 1;
			_pwm_16BIT.TCNTx  = (volatile uint8_t*)_pwm_16BIT.TCCRxC + 2;
			_pwm_16BIT.ICRx	  = (volatile uint8_t*)_pwm_16BIT.TCNTx  + 2;

		}
	}
	else if(pgm_read_byte(&_flashMappedPort[portNo].controlBits)&(1<<isADC)){
		_local_ctrl_bits = _ADC; //setting ADC flag
		channel = _ADC_CHANNELS[ (pgm_read_word(&_flashMappedPort[portNo].controlBits) &(0xF<<ADC_SEL)) >> ADC_SEL ];
	}

	setDirection(direction);
}

void Pin::on(bool stat)
{
	if(stat==HIGH){

		*_portx |= (1 << _registerBit);
		return;
	}
	*_portx &= ~(1 << _registerBit);
}

void Pin::off()
{
	*_portx &= ~(1 << _registerBit);
}

void Pin::toggle()
{
	*_portx ^= (1 << _registerBit);
}

void Pin::setDirection(DDRx direction)
{

	if(direction==OUTPUT){
		*_ddrx |= (1 << _registerBit);
		return;
	}
	*_ddrx &= ~(1 <<_registerBit);

}

bool Pin::setPWM(uint16_t freq, uint8_t duty)
{
	switch (_local_ctrl_bits) {
		case _PWM_8BIT:
			_duty_pwm=(-2.55*duty) + 255;
			*((volatile uint8_t*)_pwm_8BIT.OCRx)=_duty_pwm;
			switch ((_controlBits & (0x3<<LETTER_SEL) >> LETTER_SEL)) {
				case 0:
					_pwm_8BIT.OCRx = (volatile uint8_t*)_pwm_8BIT.TCNTx + 1;
					*_pwm_8BIT.TCCRxA |= (1<<7) | (1<<6);
					break;
				case 1:
					_pwm_8BIT.OCRx = (volatile uint8_t*) _pwm_8BIT.TCNTx + 2;
					*_pwm_8BIT.TCCRxA |= (1<<5) | (1<<4);
					break;

			}
			*_pwm_8BIT.TCCRxA |= (0 << WGM11) | (1 << WGM10);				// Setting PWM, Phase Correct
			*_pwm_8BIT.TCCRxB |= (0 << WGM22);								// TOP = OCRnA TOVx Flag = BOTTOM
			*_pwm_8BIT.TCCRxB |= (0 << CS12) | (0 << CS11) | (1 << CS10);	// Setting prescaler to 1, so F_CPU
			break;
		case _PWM_16BIT:
			_freq_pwm=calculateTicks(freq);
			_duty_pwm=_freq_pwm-(_freq_pwm*((float)duty/100));
			*((volatile uint16_t*)_pwm_16BIT.ICRx)=_freq_pwm;
			*((volatile uint16_t*)_pwm_16BIT.OCRx)=_duty_pwm;
			switch( (_controlBits & (0x3<<LETTER_SEL) )>>LETTER_SEL){
				case 0:
					_pwm_16BIT.OCRx = (volatile uint8_t*)_pwm_16BIT.ICRx + 2;
					*_pwm_16BIT.TCCRxA |= (1<<7) | (1<<6) ;
					break;
				case 1:
					_pwm_16BIT.OCRx = (volatile uint8_t*)_pwm_16BIT.ICRx + 4;
					*_pwm_16BIT.TCCRxA |= (1<<5) | (1<<4) ;
					break;
				case 2:
					_pwm_16BIT.OCRx = (volatile uint8_t*)_pwm_16BIT.ICRx + 6;
					*_pwm_16BIT.TCCRxA |= (1<<3) | (1<<2) ;
					break;
			};

			*_pwm_16BIT.TCCRxA	|= (1 << WGM11) | (0 << WGM10);// Setting PWM, Phase Correct
			*_pwm_16BIT.TCCRxB  |= (1 << WGM13) | (1 << WGM12);// TOP = OCRnA TOVx Flag = BOTTOM
			*_pwm_16BIT.TCCRxB  |= (0<< CS12) | (0 << CS11) | (1 << CS10); //Setting prescaler to 1, so F_CPU
			break;
		default:
			return false;
	}

}

bool Pin::setDuty(uint8_t duty)
{

	switch (_local_ctrl_bits) {
		case _PWM_8BIT:
			_duty_pwm=(-2.55*duty)+255;
			*((volatile uint8_t*)_pwm_8BIT.OCRx)=_duty_pwm;
			break;
		case _PWM_16BIT:
			_duty_pwm=_freq_pwm-(_freq_pwm*((float)duty/100));
			*((volatile uint16_t*)_pwm_16BIT.OCRx)=_duty_pwm;
			break;
		default:
			return false;
	}

}

bool Pin::setFreq(uint16_t freq)
{
	float ratio=_freq_pwm/_duty_pwm;
	_freq_pwm=calculateTicks(freq);
	_duty_pwm=(float)_freq_pwm/(float)ratio;
	switch (_local_ctrl_bits) {
		case _PWM_8BIT:
			return false; //Can't change frequency
		case _PWM_16BIT:
			*((volatile uint16_t*)_pwm_16BIT.ICRx)=_freq_pwm;
			*((volatile uint16_t*)_pwm_16BIT.OCRx)=_duty_pwm;
			break;
		default:
			return false;
	}
}

bool Pin::digitalRead()
{
	if(*_pinx & (1<<_registerBit)){
		return 1;
	}
	return 0;
}


float Pin::analogRead(_ADMUX vRef, _ADCSRA_PRESCALER prescaler, _ADCSRB_AUTOTRIGGER autoTrigger)
{
	if(_local_ctrl_bits == 0){
		return 65535;
	}
	if(channel == 65535){
		return 65535;
	}
	//			|   7   |    6  |   5   |   4  |   3  |   2   |   1   |   0   |
	//	ADCSRB	|   -   |  ACME |   -   |   -  | MUX5 | ADTS2 | ADTS1 | ADTS0 |
	//	ADMUX	| REFS1 | REFS0 | ADLAR | MUX4 | MUX3 |  MUX2 |  MUX1 |  MUX0 |

	uint16_t _adcsrb_adxmux_reg = (autoTrigger<<8) | vRef | channel;
	if(ADCSRA==0){
		ADCSRA |= (1<<ADEN)| (1<<ADIE) | prescaler;
	}
	while(ADCSRA & (1<<ADIF) == 0);
	ADCSRB	 = (_adcsrb_adxmux_reg>>8);
	ADMUX	 = (_adcsrb_adxmux_reg&0xFF);
	ADCSRA	|= (1<<ADSC);

	while(ADCSRA & (1<<ADSC));

	return ADC;//*0.004882813;
}

void Pin::getPinData()
{
	Serial *serial0 = SerialManager::getSerial(SerialPort::SERIAL0);
	serial0->printf("PINx\t: %p\r\n",_pinx);
	serial0->printf("DDRx\t: %p\r\n",_ddrx);
	serial0->printf("PORTx\t: %p\r\n",_portx);
	serial0->printf("Reg bit\t: %d\r\n",_registerBit);
	if(_controlBits & (1<<isPWM)){
		serial0->printf("Pin is PWM Enabled\r\n");
		serial0->printf("Timer\t: %d\r\n", (_controlBits & (0x7<<OUT_CMP_SEL)) >> OUT_CMP_SEL);
		switch( (_controlBits & (0x3<<LETTER_SEL) )>>LETTER_SEL){
			case 0:
				serial0->printf("Output\t: A\r\n");
				break;
			case 1:
				serial0->printf("Output\t: B\r\n");
				break;
			case 2:
				serial0->printf("Output\t: C\r\n");
				break;
		};

	}
	else if (_controlBits & (1<<isADC)) {
		serial0->printf("Pin is ADC Enabled\r\n");
		serial0->printf("Channel\t: %d\r\n", (_controlBits &(0xF<<ADC_SEL)) >> ADC_SEL);
	}


}

uint16_t Pin::calculateTicks(uint16_t freq)
{
	return (1.0/freq)/(1.0/F_CPU);
}

