#include <gpiodef.h>

static const PROGMEM MappedPort _flashMappedPort[] ={
				//Pin No.	Pin Description
				{&PINE,DD0,(0<<isPWM)|(0<<OUT_CMP_SEL)|(0<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(1<<isUART)|(_UART0<<UART_SEL)}, //0 RX0 - RXD0/PCINT8

				{&PINE,DD1,(0<<isPWM)|(0<<OUT_CMP_SEL)|(0<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(1<<isUART)|(_UART0<<UART_SEL)}, //1 TX0 - TXD0
				//START PWM
				{&PINE,DD4,(1<<isPWM)|(_TIMER3<<OUT_CMP_SEL)|(_B<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)}, //2 - 0C3B/INT4

				{&PINE,DD5,(1<<isPWM)|(_TIMER3<<OUT_CMP_SEL)|(_C<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)}, //3			| OC3C/INT5

				{&PING,DD5,(1<<isPWM)|(_TIMER0<<OUT_CMP_SEL)|(_B<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)}, //4			| OC0B

				{&PINE,DD3,(1<<isPWM)|(_TIMER3<<OUT_CMP_SEL)|(_A<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)},		//5			| OC3A/AIN1

				{&PINH,DD3,(1<<isPWM)|(_TIMER4<<OUT_CMP_SEL)|(_A<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)},		//6			| OC4A

				{&PINH,DD4,(1<<isPWM)|(_TIMER4<<OUT_CMP_SEL)|(_B<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)},		//7			| OC4B

				{&PINH,DD5,(1<<isPWM)|(_TIMER4<<OUT_CMP_SEL)|(_C<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)},		//8			| OC4C

				{&PINH,DD6,(1<<isPWM)|(_TIMER2<<OUT_CMP_SEL)|(_B<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)},		//9			| OC2B

				{&PINB,DD4,(1<<isPWM)|(_TIMER2<<OUT_CMP_SEL)|(_A<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)},		//10		| OC2A/PCINT4

				{&PINB,DD5,(1<<isPWM)|(_TIMER1<<OUT_CMP_SEL)|(_A<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)},		//11		| OC1A/PCINT5

				{&PINB,DD6,(1<<isPWM)|(_TIMER1<<OUT_CMP_SEL)|(_B<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)},		//12		| OC1B/PCINT6

				{&PINB,DD7,(1<<isPWM)|(_TIMER1<<OUT_CMP_SEL)|(_C<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)},		//13		| OC0A/OC1C/PCINT7
				//END PWM

				//START UART
				{&PINJ,DD1,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(1<<isUART)|(_UART3<<UART_SEL)},	//14	TX3	| TXD3/PCINT10

				{&PINJ,DD0,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(1<<isUART)|(_UART3<<UART_SEL)},	//15	RX3	| RXD3/PCINT9

				{&PINH,DD1,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(1<<isUART)|(_UART2<<UART_SEL)},	//16	TX2	| TXD2

				{&PINH,DD0,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(1<<isUART)|(_UART2<<UART_SEL)},	//17	RX2	| RXD2

				{&PIND,DD3,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(1<<isUART)|(_UART1<<UART_SEL)},	//18	TX1	| TXD1/INT3

				{&PIND,DD2,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(1<<isUART)|(_UART1<<UART_SEL)},	//19	RX1	| RXD1/INT2
				//END UART
				{&PIND,DD1,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//20	SDA	| SDA/INT1

				{&PIND,DD0,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//21	SCL	| SCL/INT0

				{&PINA,DD0,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//22		| AD0

				{&PINA,DD1,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//23		| AD1

				{&PINA,DD2,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//24		| AD2

				{&PINA,DD3,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//25		| AD3

				{&PINA,DD4,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//26		| AD4

				{&PINA,DD5,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//27		| AD5

				{&PINA,DD6,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//28		| AD6

				{&PINA,DD7,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//29		| AD7

				{&PINC,DD7,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//30		| A15

				{&PINC,DD6,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//31		| A14

				{&PINC,DD5,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//32		| A13

				{&PINC,DD4,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//33		| A12

				{&PINC,DD3,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//34		| A11

				{&PINC,DD2,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//35		| A10

				{&PINC,DD1,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//36		| A9

				{&PINC,DD0,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//37		| A8

				{&PIND,DD7,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//38		| T0

				{&PING,DD2,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//39		| ALE

				{&PING,DD1,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//40		| RD

				{&PING,DD0,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//41		| WR

				{&PINL,DD7,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//42		|

				{&PINL,DD6,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//43		|

				//START PWM TIMER5
				{&PINL,DD5,(1<<isPWM)|(_TIMER5<<OUT_CMP_SEL)|(_C<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},//44		| OC5C

				{&PINL,DD4,(1<<isPWM)|(_TIMER5<<OUT_CMP_SEL)|(_B<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},//45		| OC5B

				{&PINL,DD3,(1<<isPWM)|(_TIMER5<<OUT_CMP_SEL)|(_A<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},//46		| OC5A
				//END PWM TIMER5
				{&PINL,DD2,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//47		| T5

				{&PINL,DD1,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//48		| ICP5

				{&PINL,DD0,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//49		| ICP4

				{&PINB,DD3,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//50	MISO| MISO/PCINT3

				{&PINB,DD2,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//51	MOSI| MOSI/PCINT2

				{&PINB,DD1,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//52	SCK	| SCK/PCINT1

				{&PINB,DD0,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//53	SS	| SS/PCINT0

				//-------- ADC Pins --------//
				{&PINF,DD0,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x00<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//A0	54	| ADC0

				{&PINF,DD1,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x01<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//A1	55	| ADC1

				{&PINF,DD2,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x02<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//A2	56	| ADC2

				{&PINF,DD3,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x03<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//A3	57	| ADC3

				{&PINF,DD4,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x04<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//A4	58	| ADC4/TMK

				{&PINF,DD5,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x05<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//A5	59	| ADC5/TMS

				{&PINF,DD6,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x06<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//A6	60	| ADC6

				{&PINF,DD7,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x07<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//A7	61	| ADC7

				{&PINK,DD0,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x08<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//A8	62	| ADC8/PCINT16

				{&PINK,DD1,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x09<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//A9	63	| ADC9/PCINT17

				{&PINK,DD2,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x0A<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//A10	64	| ADC10/PCINT18

				{&PINK,DD3,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x0B<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//A11	65	| ADC11/PCINT19

				{&PINK,DD4,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x0C<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//A12	66	| ADC12/PCINT20

				{&PINK,DD5,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x0D<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//A13	67	| ADC13/PCINT21

				{&PINK,DD6,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x0E<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//A14	68	| ADC14/PCINT22

				{&PINK,DD7,(0<<isPWM)|(0x00<<OUT_CMP_SEL)|(0x00<<LETTER_SEL)|(1<<isADC)|(0x0F<<ADC_SEL)|
					(0<<isUART)|(0x00<<UART_SEL)},	//A15	69	| ADC15/PCINT23

};
