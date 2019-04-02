#include "avr_sdk.h"



int main(){

	Pin pwm(53,OUTPUT);
	//pwm.setPWM(15000,75);

	while (1) {
	pwm.toggle();
	_delay_us(250);
	}

	return 0;
}
