#include "avr_sdk.h"



int main(){
	Timer::start();
	Serial *serial1 = SerialManager::getInstance(SERIAL1);
	serial1->init(BAUD_1000000);

	Dht11 dht11(22);
	serial1->clear();
	serial1->printf("Setup complete\r\n");
	//_delay_ms(2000);
	while (1) {
		_delay_ms(2000);
		serial1->printf("%u\r\n",dht11.getHumidity());
	}

	return 0;
}
