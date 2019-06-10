#ifndef F_CPU
#define F_CPU 16000000UL
#endif
#include "avr_sdk.h"
#include <vector>
#include <string>
//#include <iterator>

int main(){

	Serial *serial0 = SerialManager::getInstance(SERIAL0);
	serial0->init(BAUD_1000000);
	serial0->setRxISRCallBack(false);
	serial0->setEchoServer(false);
	serial0->clear();


	//Enc28j60 encj2860;
	//encj2860.init();
	//encj2860.setSPI(50,51,52,53);
	Rdm6300 rdm6300;
	rdm6300.setBuzzerPin(13);
	if(rdm6300.attachTo(SERIAL3,BAUD_9600)){
		serial0->printf("Attach ok\r\n");
	}

	std::vector<uint8_t> cardNum;

	while(1){
		//encj2860.send();
		//serial0->printf("Sending %s\r\n",ciao.c_str());
		//serial0->printf("%u\r\n",cardNum.size());
		if(rdm6300.isNewCard()){
			serial0->printf("New Card found!\r\n");
			cardNum = rdm6300.getData();
			for(uint8_t i = 0; i < cardNum.size();++i){
				serial0->printf("%c %x\r\n", cardNum[i], cardNum[i]);
			}

			_delay_ms(1000);
		}

		_delay_ms(10);
	}



}
