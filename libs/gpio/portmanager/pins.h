#ifndef PINS_H
#define PINS_H

#include <macros.h>


#if defined(__AVR_ATmega640__) || defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)
#include <atmega2560.h>
#endif
#if defined(__AVR_ATmega48p__) ||  defined(__AVR_ATmega88P__) || defined(__AVR_ATmega328P__)
#include <atmega328p.h>
#endif

// Must pass PINx
#define _DDRx(x) (*(x  + 1))

// Must pass PINx
#define _PORTx(x) (*(x  + 2))


#ifdef __cplusplus
extern "C" {
#endif

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
enum LOGIC_STATE:uint8_t{
	_LOW, _HIGH
};


/**
* @brief The _ADMUX enum
*/
enum _ADMUX: u8t {
	INTERNAL_VREF   = (0<<REFS1) | (0<<REFS0), // AREF,Internal VREF turned OFF
	AVCC            = (0<<REFS1) | (1<<REFS0), // AVCC at AREF Pin with external capacitor
	INTERNAL_1_1V   = (1<<REFS1) | (0<<REFS0), // Internal 1.1Voltage reference with external capacitor at AREF pin
	INTERNAL_2_56V  = (1<<REFS1) | (1<<REFS0), // Internal 2.56Voltage reference with external capacitor at AREF pin
};

/**
* @brief The _ADCSRA_PRESCALER enum
*/
enum _ADCSRA_PRESCALER: u8t {
	F_CPU_BY_2	  = (0<<ADPS2)|(0<<ADPS1)|(1<<ADPS0),
	F_CPU_BY_4	  = (0<<ADPS2)|(1<<ADPS1)|(0<<ADPS0),
	F_CPU_BY_8	  = (0<<ADPS2)|(1<<ADPS1)|(1<<ADPS0),
	F_CPU_BY_16	 = (1<<ADPS2)|(0<<ADPS1)|(0<<ADPS0),
	F_CPU_BY_32	 = (1<<ADPS2)|(0<<ADPS1)|(1<<ADPS0),
	F_CPU_BY_64	 = (1<<ADPS2)|(1<<ADPS1)|(0<<ADPS0),
	F_CPU_BY_128 = (1<<ADPS2)|(1<<ADPS1)|(1<<ADPS0),
};


/**
* @brief The _ADCSRB_AUTOTRIGGER enum
*/
enum _ADCSRB_AUTOTRIGGER: u8t{
	FREE_RUNNING_MODE         = (0<<ADTS2) | (0<<ADTS1) |(0<<ADTS0),
	ANALOG_COMPARATOR         = (0<<ADTS2) | (0<<ADTS1) |(1<<ADTS0),
	EXTERNAL_INTERRUPT_REQ_0  = (0<<ADTS2) | (1<<ADTS1) |(0<<ADTS0),
	TNCT0_COMP_A              = (0<<ADTS2) | (1<<ADTS1) |(1<<ADTS0),
	TNCT0_OVERFLOW												= (1<<ADTS2) | (0<<ADTS1) |(0<<ADTS0),
	TNCT1_COMP_B														= (1<<ADTS2) | (0<<ADTS1) |(1<<ADTS0),
	TNCT1_OVERFLOW												= (1<<ADTS2) | (1<<ADTS1) |(0<<ADTS0),
	TNCT1_CAPTURE_EVENT	      = (1<<ADTS2) | (1<<ADTS1) |(1<<ADTS0),
};



inline void pinMode(u8t pin, DDRx direction)
{
	if(direction == OUTPUT){
		_DDRx(pinToPinx(pin)) |= bitValue(pinToRegBit(pin));
		return;
	}
	_DDRx(pinToPinx(pin))  &= ~bitValue(pinToRegBit(pin));
	if(direction == INPUT_PULLUP){
		_PORTx(pinToPinx(pin)) |= bitValue(pinToRegBit(pin));
	}
}

inline void toggle(u8t pin){
	_PORTx(pinToPinx(pin)) ^= bitValue(pinToRegBit(pin));
}

inline void digitalWrite(u8t pin, LOGIC_STATE state){

	if(state == _HIGH){
		_PORTx(pinToPinx(pin)) |= bitValue(pinToRegBit(pin));
		return;
	}
	_PORTx(pinToPinx(pin)) &= ~bitValue(pinToRegBit(pin));

}

inline bool digitalRead(u8t pin){
	if( *pinToPinx(pin) & bitValue(pinToRegBit(pin))){
		return true;
	}
	return false;
}

inline void setPWM(u8t pin, size_t freq, u8t duty){

	if(pinToTimer(pin) == NO_TIMER || pinToTimer(pin) == TIMER_0){
		return;
	}
	switch (pinToPWMGroup(pin)) {
	case PWM8BIT:
		switch (pinToLetter(pin)) {
		case LETTER_A:
			TCCRxA(pinToTimer(pin))	|= bitValue(7) | bitValue(6);
			OCRxA_8BIT(pinToTimer(pin)) = CALCULATE_DUTY_8BIT(duty);
			break;
		case LETTER_B:
			TCCRxA(pinToTimer(pin))	|= bitValue(5) | bitValue(4);
			OCRxB_8BIT(pinToTimer(pin)) = CALCULATE_DUTY_8BIT(duty);
			break;
		default:
			break;
		}
		TCCRxA(pinToTimer(pin)) |= (0 << WGM11) | (1 << WGM10);
		TCCRxB_8BIT(pinToTimer(pin)) |= (0 << WGM22);
		TCCRxB_8BIT(pinToTimer(pin)) |= (0 << CS12) | (1 << CS11) | (0 << CS10);
		break;
	case PWM16BIT:
		ICRx_16BIT(pinToTimer(pin)) = CALCULATE_PWM_TICKS(freq);
		switch (pinToLetter(pin)) {
		case LETTER_A:
			TCCRxA(pinToTimer(pin))	|= bitValue(7) | bitValue(6);
			OCRxA_16BIT(pinToTimer(pin)) = CALCULATE_DUTY_16BIT(freq, duty);
			break;
		case LETTER_B:
			TCCRxA(pinToTimer(pin))	|= bitValue(5) | bitValue(4);
			OCRxB_16BIT(pinToTimer(pin)) = CALCULATE_DUTY_16BIT(freq, duty);
			break;
#if defined(LETTER_C)
		case LETTER_C:
			TCCRxA(pinToTimer(pin))	|= bitValue(3) | bitValue(2);
			OCRxC_16BIT(pinToTimer(pin)) = CALCULATE_DUTY_16BIT(freq, duty);
			break;
#endif
		default:
			break;
		}
		TCCRxA(pinToTimer(pin))  |= (1 << WGM11) | (0 << WGM10);// Setting PWM, Phase Correct
		TCCRxB_16BIT(pinToTimer(pin))  |= (1 << WGM13) | (1 << WGM12);// TOP = OCRnA TOVx Flag = BOTTOM
		TCCRxB_16BIT(pinToTimer(pin))  |= (0 << CS12) | (0 << CS11) | (1 << CS10); //Setting prescaler to 1, so F_CPU
		break;
	default:
		break;
	}
}

inline uint16_t analogRead(u8t pin, _ADMUX vRef = AVCC, _ADCSRA_PRESCALER prescaler = F_CPU_BY_128, _ADCSRB_AUTOTRIGGER autoTrigger = FREE_RUNNING_MODE){
	if(pin < A0){
		return 0;
	}
	pin -= A0;
#if defined(__AVR_ATmega640__) || defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)
	uint16_t _adcsrb_adxmux_reg = (autoTrigger << 8) | vRef | (pin > 7 ? (bitValue(11) | pin) : pin);
#elif defined(__AVR_ATmega328P__)
	uint16_t _adcsrb_adxmux_reg = (autoTrigger << 8) | vRef | pin;
#endif
	if(ADCSRA == 0){
		ADCSRA |= (1<<ADEN) | (0<<ADIE) | prescaler;//FIXME if set ADIE will not work and crash(it's necessary?)
	}

	while(ADCSRA & bitValue(ADIF) == 0);

	ADCSRB = HI(_adcsrb_adxmux_reg);

	ADMUX = LO(_adcsrb_adxmux_reg);

	ADCSRA |= bitValue(ADSC);

	while(ADCSRA & bitValue(ADSC));

	return ADC;//*0.004882813;

}

#ifdef __cplusplus
}
#endif

#endif
