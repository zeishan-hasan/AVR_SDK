#include "avr_sdk.h"



int main(){

	Dht11 dht11(8);


	while (1) {
		builtin_led.toggle();
		_delay_ms(500);
	}

	return 0;
}
