#ifndef PINS_H
#define PINS_H
#include <stddef.h>
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
enum DDRx {
				INPUT,
				OUTPUT,
				INPUT_PULLUP
};

/**
* @brief The LogicStates enum
*/
enum LOGIC_STATE {
				_LOW, _HIGH
};


/**
* @brief The _ADMUX enum
*/
enum _ADMUX {
				INTERNAL_VREF   = (0<<REFS1) | (0<<REFS0), // AREF,Internal VREF turned OFF
				AVCC            = (0<<REFS1) | (1<<REFS0), // AVCC at AREF Pin with external capacitor
				INTERNAL_1_1V   = (1<<REFS1) | (0<<REFS0), // Internal 1.1Voltage reference with external capacitor at AREF pin
				INTERNAL_2_56V  = (1<<REFS1) | (1<<REFS0), // Internal 2.56Voltage reference with external capacitor at AREF pin
};

/**
* @brief The _ADCSRA_PRESCALER enum
*/
enum _ADCSRA_PRESCALER {
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
enum _ADCSRB_AUTOTRIGGER {
				FREE_RUNNING_MODE         = (0<<ADTS2) | (0<<ADTS1) |(0<<ADTS0),
				ANALOG_COMPARATOR         = (0<<ADTS2) | (0<<ADTS1) |(1<<ADTS0),
				EXTERNAL_INTERRUPT_REQ_0  = (0<<ADTS2) | (1<<ADTS1) |(0<<ADTS0),
				TNCT0_COMP_A              = (0<<ADTS2) | (1<<ADTS1) |(1<<ADTS0),
				TNCT0_OVERFLOW            = (1<<ADTS2) | (0<<ADTS1) |(0<<ADTS0),
				TNCT1_COMP_B              = (1<<ADTS2) | (0<<ADTS1) |(1<<ADTS0),
				TNCT1_OVERFLOW												= (1<<ADTS2) | (1<<ADTS1) |(0<<ADTS0),
				TNCT1_CAPTURE_EVENT	      = (1<<ADTS2) | (1<<ADTS1) |(1<<ADTS0),
};


/*
inline void pinMode(u8t pin, enum DDRx direction)
{
				if(direction == OUTPUT){
								_DDRx(pinToPinx(pin))	|= bitValue(pinToRegBit(pin));
								return;
				}
				_DDRx(pinToPinx(pin)) &= ~bitValue(pinToRegBit(pin));
				if(direction == INPUT_PULLUP){
								_PORTx(pinToPinx(pin))	|= bitValue(pinToRegBit(pin));
				}


}*/

extern void toggle(u8t pin);


//void toggle(u8t pin){
//	_PORTx(pinToPinx(pin)) ^= bitValue(pinToRegBit(pin));
//}

	////u16t var = __flashMappedPort[pin];
	////volatile u8t* pinx = (var & OR100 ? &_SFR_MEM8(0x100 | (var & 0x1F)) :  &_SFR_IO8(var & 0x1F));
	//_PORTx(pinx) ^= bitValue(((var >> 6) & 0x07));
//}

//inline void digitalWrite(u8t pin, LOGIC_STATE state){
//
//	if(state == _HIGH){
//		_PORTx(pinToPinx(pin)) |= bitValue(pinToRegBit(pin));
//		return;
//	}
//	_PORTx(pinToPinx(pin)) &= ~bitValue(pinToRegBit(pin));
//}

//inline bool digitalRead(u8t pin){
//	if( *pinToPinx(pin) & bitValue(pinToRegBit(pin))){
//		return true;
//	}
//	return false;
//}




//void setPWM(u8t pin, size_t freq, u8t duty);


//inline uint16_t analogRead(u8t pin, _ADMUX vRef = AVCC, _ADCSRA_PRESCALER prescaler = F_CPU_BY_128, _ADCSRB_AUTOTRIGGER autoTrigger = FREE_RUNNING_MODE){
//	if(pin < A0){
//		return 0;
//	}
//	pin -= A0;
//#if defined(__AVR_ATmega640__) || defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)
//	uint16_t _adcsrb_adxmux_reg = (autoTrigger << 8) | vRef | (pin > 7 ? (bitValue(11) | pin) : pin);
//#elif defined(__AVR_ATmega328P__)
//	uint16_t _adcsrb_adxmux_reg = (autoTrigger << 8) | vRef | pin;
//#endif
//	if(ADCSRA == 0){
//		ADCSRA |= (1<<ADEN) | (0<<ADIE) | prescaler;//FIXME if set ADIE will not work and crash(it's necessary?)
//	}
//
//	while(ADCSRA & bitValue(ADIF) == 0);
//
//	ADCSRB = HI(_adcsrb_adxmux_reg);
//
//	ADMUX = LO(_adcsrb_adxmux_reg);
//
//	ADCSRA |= bitValue(ADSC);
//
//	while(ADCSRA & bitValue(ADSC));
//
//	return ADC;//*0.004882813;
//
//}

#ifdef __cplusplus
}
#endif

#endif
