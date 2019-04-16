#include "avr_sdk.h"


//extern u8t __microSecond;
//extern static inline u32t micros();
int main(){
	//Pin builtin_led(13,OUTPUT);
	DDRB = 0x80;

	TCCR0A  = 0;
	TCCR0B  = 0;
	TCNT0   = 0;
	OCR0A   = 15;
	TCCR0A |= (0 << COM0A1) | (1 << COM0A0)|( 1 << WGM01);
	TCCR0B |= (0 << FOC0A) | (0 << CS02) | (0 << CS01) | (1 << CS00);
	TIMSK0  = (0 << TOIE0) | (1 << OCIE0A);
	sei();

	Serial *serial0 = SerialManager::getInstance(SERIAL0);
	serial0->init(BAUD_1000000,_LOW_PRIORITY);
	serial0->setRxISRCallBack(false);
	serial0->setEchoServer(false);
	volatile u32t _now = 0;
	volatile u32t _prev = 0;
	volatile u32t _deltaT = 0;
	//Timer::start();
	//int i = 500;

	_prev = micros();
	_delay_us(32);
	_now = micros();
	_deltaT = _now-_prev;

	serial0->printf("_Now :%lu\r\n", _now);
	serial0->printf("_Prev :%lu\r\n", _prev);
	serial0->printf("_Delta T :%lu\r\n\r\n",_deltaT);

	while (1) {

	}

	return 0;
}
