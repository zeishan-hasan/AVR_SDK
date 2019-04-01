#include "avr_sdk.h"
#define u8 uint8_t


int main(){
	Timer::start();
	//Timer *timer = Timer::getInstance();
	//timer->init();
	//timer->start();
	Pin builtin_led(13,OUTPUT);
	Serial *serial1 = SerialManager::getInstance(SERIAL1);
	serial1->init(BAUD_1000000,_LOW_PRIORITY);
	serial1->setRxISRCallBack(false);
	serial1->setEchoServer(false);

	double now;
	double previous = Timer::now();
	uint16_t ms_now;
	uint16_t ms_prev = now /1000.0;
	u8 pippo;
	while (1) {
		//serial1->printf("Now : %u:%u:%u:%u\r\n",timer->_time.minutes,
		//																timer->_time.seconds,
		//																timer->_time.milliSeconds,
		//																timer->_time.microSeconds);

		//timer->_time.milliSeconds;
		now = Timer::now();
		ms_now = now /1000.0;
		//serial1->printf("Now : %u:%u\r\n",(int)(now/1000000.0),temp);

		// 1500/1000 = 1.500;
		// 1.500 - (int)1.500 = 0.500

		if(ABS(ms_now - ms_prev) > 100){
			//serial1->printf("triggered\r\n");
			builtin_led.toggle();
			ms_prev = ms_now;
		}
		//_delay_us(1);
	}

	return 0;
}
