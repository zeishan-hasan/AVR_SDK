#include <avr/io.h>
//#include <util/delay.h>
#include <portmanager.h>
//#include <serial.h>
//#include <cppfix.h>
//#include <avr_sdk.h>
int main(){

	//Serial *serial0 = SerialManager::getInstance(SERIAL0);
	//serial0->init(BAUD_1000000,_LOW_PRIORITY);
	//serial0->setRxISRCallBack(false);
	//serial0->setEchoServer(false);
	Pin pin(13,OUTPUT);
	//pin.setPWM(2000, 50);
	//DDRB = 0xFF;


	while(1){
		pin.toggle();
		//	PORTB ^= bitValue(5);

		//serial0->printf("bla blas\r\n");
		//_delay_ms(500);
	}

}
