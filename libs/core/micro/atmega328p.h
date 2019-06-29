#pragma once
#include <gpiodef.h>



static const PROGMEM MappedPort _flashMappedPort[] ={
				{&PIND,DD0,(0<<isPWM)|(0<<OUT_CMP_SEL)|(0<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(1<<isUART)|(_UART0<<UART_SEL)},//0	RX - PCINT16

				{&PIND,DD1,(0<<isPWM)|(0<<OUT_CMP_SEL)|(0<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(1<<isUART)|(_UART0<<UART_SEL)},//1 TX- PCINT17

				{&PIND,DD2,(0<<isPWM)|(0<<OUT_CMP_SEL)|(0<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)}, //2 INT0 - PCINT18

				{&PIND,DD3,(1<<isPWM)|(_TIMER2<<OUT_CMP_SEL)|(_B<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)}, //3 INT1 - PCINT19

				{&PIND,DD4,(0<<isPWM)|(0<<OUT_CMP_SEL)|(0<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)}, //4 T0 - PCINT20 - XCK

				{&PIND,DD5,(1<<isPWM)|(_TIMER0<<OUT_CMP_SEL)|(_B<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)}, //5 T1 - PCINT21

				{&PIND,DD6,(1<<isPWM)|(_TIMER0<<OUT_CMP_SEL)|(_A<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)}, //6 AIN0 - PCINT22

				{&PIND,DD7,(0<<isPWM)|(0<<OUT_CMP_SEL)|(0<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)}, //7 AIN1 - PCINT23

				{&PINB,DD0,(0<<isPWM)|(0<<OUT_CMP_SEL)|(0<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)}, //8 CLKO - PCINT0 - ICP1

				{&PINB,DD1,(1<<isPWM)|(_TIMER1<<OUT_CMP_SEL)|(_A<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)}, //9 PCINT1

				{&PINB,DD2,(1<<isPWM)|(_TIMER1<<OUT_CMP_SEL)|(_B<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)}, //10 PCINT2 - SS

				{&PINB,DD3,(1<<isPWM)|(_TIMER2<<OUT_CMP_SEL)|(_A<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)}, //11 PCINT3 - MOSI

				{&PINB,DD4,(0<<isPWM)|(0<<OUT_CMP_SEL)|(0<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)}, //12 PCINT4 - MISO

				{&PINB,DD5,(0<<isPWM)|(0<<OUT_CMP_SEL)|(0<<LETTER_SEL)|(0<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)}, //13 PCINT5 - SCK

				{&PINC,DD0,(0<<isPWM)|(0<<OUT_CMP_SEL)|(0<<LETTER_SEL)|(1<<isADC)|(0<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)}, //14 PCINT8

				{&PINC,DD1,(0<<isPWM)|(0<<OUT_CMP_SEL)|(0<<LETTER_SEL)|(1<<isADC)|(1<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)}, //15 PCINT9

				{&PINC,DD2,(0<<isPWM)|(0<<OUT_CMP_SEL)|(0<<LETTER_SEL)|(1<<isADC)|(2<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)}, //16 PCINT10

				{&PINC,DD3,(0<<isPWM)|(0<<OUT_CMP_SEL)|(0<<LETTER_SEL)|(1<<isADC)|(3<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)}, //17 PCINT11

				{&PINC,DD4,(0<<isPWM)|(0<<OUT_CMP_SEL)|(0<<LETTER_SEL)|(1<<isADC)|(4<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)}, //18 PCINT12

				{&PINC,DD5,(0<<isPWM)|(0<<OUT_CMP_SEL)|(0<<LETTER_SEL)|(1<<isADC)|(5<<ADC_SEL)|
					(0<<isUART)|(0<<UART_SEL)}, //19 PCINT13

};
