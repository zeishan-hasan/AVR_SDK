#include "avr_sdk.h"

int main(){

	Serial *serial0 = SerialManager::getInstance(SERIAL0);
	serial0->init(BAUD_1000000);
	serial0->setRxISRCallBack(false);
	serial0->setEchoServer(false);
	serial0->clear();


	Rdm6300 rdm6300;
	if(rdm6300.attachTo(SERIAL3,BAUD_9600)){
		serial0->printf("Attach ok\r\n");
	}

	while(1){
		if(rdm6300.isNewCard()){
			serial0->printf("New Card found!\r\n");
			//yanujz::vector<uint8_t> data =	rdm6300.readData();
			//if(data.size()){
			//	for(uint16_t i = 1; i < data.size(); ++i){
			//		serial0->printf("Data %c 0x%02x\r\n",data[i],data[i]);
			//	}
			//	//for(auto e: data) serial0->printf("Da %c\r\n",e);
			//}
			_delay_ms(1000);
		}

		_delay_ms(10);
	}
}
