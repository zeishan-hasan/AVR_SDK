#ifndef F_CPU
#define F_CPU 16000000UL
#endif
#include <avr_sdk.h>


using namespace std;

#define MISO 50
#define MOSI 51
#define SCK 52
#define SS 53

bool debug = true;

int main(){

	Serial *serial0 = SerialManager::getInstance(SERIAL0);
	serial0->init(BAUD_1000000);
	serial0->setRxISRCallBack(false);
	serial0->setEchoServer(false);
	serial0->clear();

	Enc28j60 encj2860;
	//encj2860.init("192.168.1.50");
	encj2860.setSPI(MISO,MOSI,SCK,SS);
	//encj2860.setMAC(std::vector<uint8_t>{0xAA,0xBB,0xCC,0xDD,0xEE,0xFF});
	//std::vector<uint8_t> a{0xA0,0xB1,0xC2,0xD3,0xE4,0xF5};
	u8t c[] = {0xA0,0xB1,0xC2,0xD3,0xE4,0xF5};

	if(encj2860._spi_setMAC(c)){
		serial0->printf("Set mac ok\r\n");
	}
	Rdm6300 rdm6300;
	if(rdm6300.setBuzzerPin(13)){
		serial0->printf("Buzzer ok!\r\n");
	}
	if(rdm6300.attachTo(SERIAL3, BAUD_9600)){
		serial0->printf("Attach ok\r\n");
	}

	//NetworkManager networkManager;
	//networkManager.setupNetwork(INTERFACE::ENC28J60, "192.168.1.200", "AA:BB:CC:DD:EE:FF");
	//networkManager.send("sucone", PROTOCOL_TYPE::TCP, "192.168.1.250", 8080);


	vector<uint8_t> cardNum;



	while(1){
		//serial0->printf("%s\r\n",a.c_str());
		//serial0->printf("%s\r\n",ltrim((char*)a.c_str()));
		//serial0->printf("Sending %s\r\n",ciao.c_str());
		//serial0->printf("%u\r\n",cardNum.size());
		if(rdm6300.isNewCard()){
			serial0->printf("New Card found!\r\n");
			encj2860.send();
			cardNum = rdm6300.getData();
			serial0->printf("ID: ");
			for(uint8_t i = 0; i < cardNum.size();++i){
				serial0->printf("%c", cardNum[i], cardNum[i]);
			}
			serial0->printf("\r\n");
			_delay_ms(1000);
		}

		_delay_ms(10);
	}



}
