#ifndef PORTMANAGER_H
#define PORTMANAGER_H
#ifndef F_CPU
#define F_CPU 16000000UL
#endif
#define SIZE_OF_ARRAY(x) sizeof(x)/sizeof(x[0])
#include <avr/io.h>
#include <stdlib.h>
#include <avr/iom2560.h>
#include <serial.h>
#include <math.h>
#include <util/delay.h>
#include <stdlib.h>
#include <avr/iomxx0_1.h>
#include <avr/pgmspace.h>
#include <stdio.h>
#define _atmega2560 1

#pragma pack(1)
struct MappedPort{
	volatile uint8_t * pinx;
	uint8_t registerBit;
	uint16_t controlBits;
	//ControlBits explained
	//|	  13  |	12	 |  11  |   10   |   9  |   8   |   7   |   6  |   5   |   4  |   3  |	  2	   |   1   |   0   |
	//| isPWM |  Output Compare Sel  |  Letter Sel  | isADC |           ADC_SEL          |  isUART |    UART_SEL   |

};
#pragma pop
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
	{&PINE,DD0,(0<<isPWM)|(0<<OUT_CMP_SEL)|(0<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(1<<isUART)|(_UART0<<UART_SEL)},			//0		RX0	| RXD0/PCINT8
	{&PINE,DD1,(0<<isPWM)|(0<<OUT_CMP_SEL)|(0<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(1<<isUART)|(_UART0<<UART_SEL)},			//1		TX0	| TXD0
	//START PWM
	{&PINE,DD4,(1<<isPWM)|(_TIMER3<<OUT_CMP_SEL)|(_B<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},		//2			| 0C3B/INT4
	{&PINE,DD5,(1<<isPWM)|(_TIMER3<<OUT_CMP_SEL)|(_C<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},		//3			| OC3C/INT5
	{&PING,DD5,(1<<isPWM)|(_TIMER0<<OUT_CMP_SEL)|(_B<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},		//4			| OC0B
	{&PINE,DD3,(1<<isPWM)|(_TIMER3<<OUT_CMP_SEL)|(_A<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},		//5			| OC3A/AIN1
	{&PINH,DD3,(1<<isPWM)|(_TIMER4<<OUT_CMP_SEL)|(_A<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},		//6			| OC4A
	{&PINH,DD4,(1<<isPWM)|(_TIMER4<<OUT_CMP_SEL)|(_B<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},		//7			| OC4B
	{&PINH,DD5,(1<<isPWM)|(_TIMER4<<OUT_CMP_SEL)|(_C<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},		//8			| OC4C
	{&PINH,DD6,(1<<isPWM)|(_TIMER2<<OUT_CMP_SEL)|(_B<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},		//9			| OC2B
	{&PINB,DD4,(1<<isPWM)|(_TIMER2<<OUT_CMP_SEL)|(_A<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},		//10		| OC2A/PCINT4
	{&PINB,DD5,(1<<isPWM)|(_TIMER1<<OUT_CMP_SEL)|(_A<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},		//11		| OC1A/PCINT5
	{&PINB,DD6,(1<<isPWM)|(_TIMER1<<OUT_CMP_SEL)|(_B<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},		//12		| OC1B/PCINT6
	{&PINB,DD7,(1<<isPWM)|(_TIMER1<<OUT_CMP_SEL)|(_C<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|(0<<isUART)|(0<<UART_SEL)},		//13		| OC0A/OC1C/PCINT7
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



enum DDRx:uint8_t{
	INPUT,OUTPUT,INPUT_PULLUP
};
enum LogicStates:uint8_t{
	LOW,HIGH
};

enum Analogx:uint8_t{
	A0=54,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15
};

enum _ADMUX:uint8_t{
	INTERNAL_VREF		= (0<<REFS1) | (0<<REFS0), // AREF,Internal VREF turned OFF
	AVCC						= (0<<REFS1) | (1<<REFS0), // AVCC at AREF Pin with external capacitor
	INTERNAL_1_1V		= (1<<REFS1) | (0<<REFS0), // Internal 1.1Voltage reference with external capacitor at AREF pin
	INTERNAL_2_56V	= (1<<REFS1) | (1<<REFS0), // Internal 2.56Voltage reference with external capacitor at AREF pin
};
enum _ADCSRA_PRESCALER:uint8_t{
	F_CPU_BY_2		= (0<<ADPS2)|(0<<ADPS1)|(1<<ADPS0),
	F_CPU_BY_4		= (0<<ADPS2)|(1<<ADPS1)|(0<<ADPS0),
	F_CPU_BY_8		= (0<<ADPS2)|(1<<ADPS1)|(1<<ADPS0),
	F_CPU_BY_16		= (1<<ADPS2)|(0<<ADPS1)|(0<<ADPS0),
	F_CPU_BY_32		= (1<<ADPS2)|(0<<ADPS1)|(1<<ADPS0),
	F_CPU_BY_64		= (1<<ADPS2)|(1<<ADPS1)|(0<<ADPS0),
	F_CPU_BY_128	= (1<<ADPS2)|(1<<ADPS1)|(1<<ADPS0),
};

enum _ADCSRB_AUTOTRIGGER:uint8_t{
	FREE_RUNNING_MODE					= (0<<ADTS2) | (0<<ADTS1) |(0<<ADTS0),
	ANALOG_COMPARATOR					= (0<<ADTS2) | (0<<ADTS1) |(1<<ADTS0),
	EXTERNAL_INTERRUPT_REQ_0	= (0<<ADTS2) | (1<<ADTS1) |(0<<ADTS0),
	TNCT0_COMP_A							= (0<<ADTS2) | (1<<ADTS1) |(1<<ADTS0),
	TNCT0_OVERFLOW						= (1<<ADTS2) | (0<<ADTS1) |(0<<ADTS0),
	TNCT1_COMP_B							= (1<<ADTS2) | (0<<ADTS1) |(1<<ADTS0),
	TNCT1_OVERFLOW						= (1<<ADTS2) | (1<<ADTS1) |(0<<ADTS0),
	TNCT1_CAPTURE_EVENT				= (1<<ADTS2) | (1<<ADTS1) |(1<<ADTS0),
};

struct PWM_8BIT{
	volatile uint8_t *TCCRxA = (volatile uint8_t *)0xFF;
	volatile uint8_t *TCCRxB = (volatile uint8_t *)0xFF;
	volatile uint8_t *TCNTx	 = (volatile uint8_t *)0xFF;
	volatile uint8_t *OCRx	 = (volatile uint8_t *)0xFF;
	//volatile uint8_t *OCRxA;
	//volatile uint8_t *OCRxB;
};

struct PWM_16BIT : PWM_8BIT {
	volatile uint8_t *TCCRxC = (volatile uint8_t *)0xFF;
	volatile uint8_t *ICRx	= (volatile uint8_t *)0xFF;
};
enum _LOCAL_CTRL_BITS:uint8_t{
	_PWM_8BIT = 0x2, _PWM_16BIT = 0x3, _ADC = 0x4
};
class Pin{
public:
	Pin(uint8_t portNo, DDRx direction);

	void on(bool stat = true);
	void off();
	void toggle();

	void setDirection(DDRx direction);

	bool setPWM(uint16_t freq, uint8_t duty = 50);
	bool setDuty(uint8_t duty);
	bool setFreq(uint16_t freq);
	bool stopPWM();

	bool digitalRead();

	uint16_t analogRead(_ADMUX vRef = AVCC, _ADCSRA_PRESCALER prescaler = F_CPU_BY_128, _ADCSRB_AUTOTRIGGER autoTrigger = FREE_RUNNING_MODE);
	void getPinData();

	uint8_t getPinNumber();
	uint8_t getPWM();

private:
	volatile uint8_t *_ddrx;
	volatile uint8_t *_portx;
	volatile uint8_t *_pinx;
	uint16_t channel = 65535;
	uint8_t _registerBit;
	uint8_t _local_ctrl_bits;

	PWM_16BIT _pwm_16BIT;
	PWM_8BIT _pwm_8BIT;

	uint16_t _freq_pwm;
	uint16_t _duty_pwm;
	uint16_t _controlBits;

	uint16_t calculateTicks(uint16_t freq);

	uint8_t _pinNumber;
};


#endif // PORTMANAGER_H
