#include "avr_sdk.h"

bool debug = false;




int main(){

	Serial *serial  = SerialManager::getInstance(SERIAL0);
	serial->init(BAUD_1000000);
	serial->setRxISRCallBack(false);
	serial->setEchoServer(false);



	while(1){

		int32_t var =  adc_compare(ADC_COMPARE::A0_A1_GAIN1);

		serial->printf("ADC value : %ld mV\r\n", var, var);
		_delay_ms(100);
	}


}
