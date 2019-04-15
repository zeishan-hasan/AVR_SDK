#include "avr_sdk.h"

//extern "C" void a();
extern uint32_t __microSecond;
int main(){
	//Timer::init();
	//Timer::start();

	TCCR0A  = (0 << COM0A1) | (0 << COM0A0)|( 1 << WGM01);    // Setting 0 means that the timer will reach the overflow
	TCCR0B  = 0;
	TCNT0   = 0;
	OCR0A   = 15;
	TIMSK0  = (0 << TOIE0) | (1 << OCIE0A);	// Set the ISR OVF vect
	TCCR0B |= (0 << CS02) |(0 << CS01) | (1 << CS00);
	sei();


	//Pin builtin_led(13,OUTPUT);
	DDRB = 0x80;
	Serial *serial0 = SerialManager::getInstance(SERIAL0);
	serial0->init(BAUD_1000000,_LOW_PRIORITY);
	serial0->setRxISRCallBack(false);
	serial0->setEchoServer(false);
	u32t _now = 0;
	u32t _prev = 0;
	u32t _deltaT = 0;

	//_delay_ms(1000);
	_prev = __microSecond;
	//_prev = __microSecond;

	//prev = TCNT0;
	_delay_us(789);
	//now = TCNT0;
	_now = __microSecond;
	//deltaT = (uint8_t)(ABS(now-prev)-1)*0.0625;
	_deltaT = _now-_prev;

	//serial0->printf("Now :%u\r\n", now);
	//serial0->printf("Prev :%u\r\n", prev);
	//serial0->printf("Delta T :%f\r\n", deltaT);
	serial0->printf("_Now :%lu\r\n", _now);
	serial0->printf("_Prev :%lu\r\n", _prev);
	serial0->printf("_Delta T :%f\r\n\r\n",(_deltaT*0.125)-1.25);

	while (1) {
		//_prev =  __microSecond;
		////prev = TCNT0;
		//_delay_us(15);
		////now = TCNT0;
		//_now =  __microSecond;
		////deltaT = (uint8_t)(ABS(now-prev)-1)*0.0625;
		//_deltaT = ((ABS(_now-_prev))*0.5)-1.25;
		//
		////serial0->printf("Now :%u\r\n", now);
		////serial0->printf("Prev :%u\r\n", prev);
		////serial0->printf("Delta T :%f\r\n", deltaT);
		////serial0->printf("_Now :%lu\r\n", _now);
		////serial0->printf("_Prev :%lu\r\n", _prev);
		//serial0->printf("_Delta T :%uuS\r\n\r\n", _deltaT);
		//_delay_ms(1000);
	}

	return 0;
}
