#include "avr_sdk.h"


int main(){

	Serial *serial0 = SerialManager::getInstance(SERIAL0);
	serial0->init(BAUD_1000000);
	serial0->setRxISRCallBack(false);
	serial0->setEchoServer(false);
	serial0->clear();


	//Serial *serial3 = SerialManager::getInstance(SERIAL3);
	//serial3->init(BAUD_9600);
	//serial3->setRxISRCallBack(false);
	//serial3->setEchoServer(false);
	//serial3->clear();

	Rdm6300 rdm6300;
	if(rdm6300.attachTo(SERIAL3,BAUD_9600)){
		serial0->printf("Attach ok\r\n");
	}
	//yanujz::vector<uint8_t> data;
	uint8_t buff[20];
	Pin pin(13,OUTPUT);
	pin.setPWM(1000,0);
	while(1){
		if(rdm6300.isNewCard()){
			serial0->printf("New Card found!\r\n");
			rdm6300.getData(buff);
			serial0->printf("%s\r\n",buff);
			pin.setPWM(1000,20);
			_delay_ms(250);
			pin.setPWM(3000,20);
			_delay_ms(250);
			pin.setDuty(0);
			_delay_ms(1000);
		}
		_delay_ms(10);
	}
}
