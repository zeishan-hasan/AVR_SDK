#include "avr_sdk.h"



int main(){

	Pin builtin_led(13,OUTPUT);

	while (1) {
		builtin_led.toggle();
		_delay_ms(500);
	}

	return 0;
}

