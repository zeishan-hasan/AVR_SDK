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
#include <stdio.h>
#include <math.h>

#define _atmega2560 1

#pragma pack(1)


struct MappedPort{
	//volatile uint8_t * ddrx;
	//volatile uint8_t * portx;
	volatile uint8_t * pinx;
	uint8_t registerBit;
	uint16_t controlBits;
	//ControlBits explained
	//|	  13  |	12	 |  11  |   10   |   9  |   8   |   7   |   6  |   5   |   4  |   3  |	  2	   |   1   |   0   |
	//| isPWM |  Output Compare Sel  |  Letter Sel  | isADC |           ADC_SEL          |  isUART |    UART_SEL   |

	//Output Compare Sel		//Letter Sel		//ADC_SEL													//UART_SEL
	// | 0 | 0 | 0 | = TIMER0	//	| 0 | 0 | = A	// | 0 | 0 | 0 | 0 | = ADC0	// | 1 | 0 | 0 | 0 | = ADC8		// | 0 | 0 | = UART0
	// | 0 | 0 | 1 | = TIMER1	//	| 0 | 1 | = B	// | 0 | 0 | 0 | 1 | = ADC1 // | 1 | 0 | 0 | 1 | = ADC9		// | 0 | 1 | = UART1
	// | 0 | 1 | 0 | = TIMER2	//	| 1 | 0 | = C	// | 0 | 0 | 1 | 0 | = ADC2 // | 1 | 0 | 1 | 0 | = ADC10	// | 1 | 0 | = UART2
	// | 0 | 1 | 1 | = TIMER3						// | 0 | 0 | 1 | 1 | = ADC3 // | 1 | 0 | 1 | 1 | = ADC11	// | 1 | 1 | = UART3
	// | 1 | 0 | 0 | = TIMER4						// | 0 | 1 | 0 | 0 | = ADC4 // | 1 | 1 | 0 | 0 | = ADC12
	// | 1 | 0 | 1 | = TIMER5						// | 0 | 1 | 0 | 1 | = ADC5 // | 1 | 1 | 0 | 1 | = ADC13
	// | 0 | 1 | 1 | 0 | = ADC6 // | 1 | 1 | 1 | 0 | = ADC14
	// | 0 | 1 | 1 | 1 | = ADC7 // | 1 | 1 | 1 | 1 | = ADC15

};
#pragma pop


enum DDRx{
	INPUT,OUTPUT
};
enum LogicStates{
	LOW,HIGH
};

enum Analogx{
	A0=54,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15
};

enum _ADMUX{
	INTERNAL_VREF		= (0<<REFS1) | (0<<REFS0), // AREF,Internal VREF turned OFF
	AVCC						= (0<<REFS1) | (1<<REFS0), // AVCC at AREF Pin with external capacitor
	INTERNAL_1_1V		= (1<<REFS1) | (0<<REFS0), // Internal 1.1Voltage reference with external capacitor at AREF pin
	INTERNAL_2_56V	= (1<<REFS1) | (1<<REFS0), // Internal 2.56Voltage reference with external capacitor at AREF pin
};
enum _ADCSRA_PRESCALER{
	F_CPU_BY_2		= (0<<ADPS2)|(0<<ADPS1)|(1<<ADPS0),
	F_CPU_BY_4		= (0<<ADPS2)|(1<<ADPS1)|(0<<ADPS0),
	F_CPU_BY_8		= (0<<ADPS2)|(1<<ADPS1)|(1<<ADPS0),
	F_CPU_BY_16		= (1<<ADPS2)|(0<<ADPS1)|(0<<ADPS0),
	F_CPU_BY_32		= (1<<ADPS2)|(0<<ADPS1)|(1<<ADPS0),
	F_CPU_BY_64		= (1<<ADPS2)|(1<<ADPS1)|(0<<ADPS0),
	F_CPU_BY_128	= (1<<ADPS2)|(1<<ADPS1)|(1<<ADPS0),
};

enum _ADCSRB_AUTOTRIGGER{
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
enum _LOCAL_CTRL_BITS{
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

	float analogRead(_ADMUX vRef = AVCC, _ADCSRA_PRESCALER prescaler = F_CPU_BY_128, _ADCSRB_AUTOTRIGGER autoTrigger = FREE_RUNNING_MODE);
	void getPinData();


private:
	volatile uint8_t *_ddrx;
	volatile uint8_t *_portx;
	volatile uint8_t *_pinx;
	uint16_t channel = 65535;
	uint8_t _registerBit;
	uint8_t _local_ctrl_bits = 0;

	PWM_16BIT _pwm_16BIT;
	PWM_8BIT _pwm_8BIT;

	uint16_t _freq_pwm;
	uint16_t _duty_pwm;
	uint16_t _controlBits;

	uint16_t calculateTicks(uint16_t freq);

};

#endif // PORTMANAGER_H
