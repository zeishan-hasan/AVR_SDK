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
	while(1){
		if(rdm6300.isNewCard()){
			serial0->printf("New Card found!\r\n");
			rdm6300.getData(buff);
			serial0->printf("%s\r\n",buff);
			//serial0->printf("size : %u\r\n",data.size());
			//if(data.empty() == false){
			//	serial0->printf("ID:");
			//	for(uint8_t i = 0; i < data.size(); ++i){
			//		serial0->printf("%x",data.at(i));
			//	}
			//	serial0->printf("\r\n");
			for(uint8_t i = 0; i < 10; ++i){
				pin.toggle();
				_delay_ms(250);
			}
			_delay_ms(1000);
			//}
		}
		_delay_ms(10);
	}
}
