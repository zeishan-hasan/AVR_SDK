#include "avr_sdk.h"

bool debug = false;
//#include <avr/iom328p.h>
int main(){
	Serial *serial = SerialManager::getInstance(SERIAL0);
	serial->init(BAUD_1000000);
	Pin pwm(13,OUTPUT);
	pwm.setPWM(31000,20);
	pwm.setDuty(70);
	//pwm.setFreq(2000);


	while (1) {
	//serial->printf("adc %f\r\n", pwm.analogRead() *0.004882813);
		_delay_ms(500);
	}

	return 0;
}
