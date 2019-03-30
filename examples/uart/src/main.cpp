#include "avr_sdk.h"



int main(){

	Serial *serial1 = SerialManager::getInstance(SERIAL1);
	serial1->init(BAUD_1000000,_LOW_PRIORITY);
	serial1->setRxISRCallBack(false);
	serial1->setEchoServer(false);



	while (1) {
		serial1->printf("Hello World\r\n");
		_delay_ms(500);
	}

	return 0;
}
