#include "avr_sdk.h"


int main(){
	Pin pwm(13,OUTPUT);
	pwm.setPWM(1000,50);
	pwm.setDuty(70);
	pwm.setFreq(2000);


	while (1) {
	}

	return 0;
}
