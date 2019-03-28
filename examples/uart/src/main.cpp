#include "avr_sdk.h"



int main(){

	Serial *serial0 = SerialManager::getInstance(SERIAL0);
	serial0->init(BAUD_1000000,_LOW_PRIORITY);
	serial0->setRxISRCallBack(false);
	serial0->setEchoServer(false);



	while (1) {
		serial0->printf("Hello World\r\n");
		_delay_ms(500);
	}

	return 0;
}
