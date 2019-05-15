#include "avr_sdk.h"



int main(){

	Serial *serial0 = SerialManager::getInstance(SERIAL0);
	serial0->init(BAUD_115200,_LOW_PRIORITY);
	serial0->setRxISRCallBack(false);
	serial0->setEchoServer(false);

	Serial *serial3 = SerialManager::getInstance(SERIAL3);
	serial3->init(BAUD_115200,_LOW_PRIORITY);
	serial3->setRxISRCallBack(true);
	serial3->setEchoServer(false);

	while (1) {
		serial0->printf("Ciao dal firmware");
		_delay_ms(500);
	}

	return 0;
}
