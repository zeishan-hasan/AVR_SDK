#include "avr_sdk.h"

int main(){

	Serial *serial1 = SerialManager::getInstance(SERIAL1);
	serial1->init(BAUD_1000000,_LOW_PRIORITY);
	serial1->setRxISRCallBack(false);
	serial1->setEchoServer(false);

	I2CMaster master;
	master.enable(SCL_100KHZ);


	uint8_t i = 0;

	serial1->printf("Setup complete\r\n");


	//init_HMC5883L();

	slave_t asd;
	Hmc5883 hmc5883;
	hmc5883.init();
	compass_t compass;
	while (1) {
		serial1->clear();
		compass = hmc5883.getData();
		//getHeading();
		serial1->printf("X : %d\r\n",compass.raw_x);
		serial1->printf("Y : %d\r\n",compass.raw_y);
		serial1->printf("Z : %d\r\n",compass.raw_z);
		serial1->printf("Deg : %f\r\n",compass.headingDegrees);
		//		itoa(raw_x, buffer, 10);
		//		serial0->printf("%s",buffer);
		//		serial0->printf("  ");
		//		//for (i = 0; i< SIZE_OF_ARRAY(buffer); ++i) {
		//		//}

		//		itoa(raw_y, buffer, 10);
		//		serial0->printf("%s",buffer);
		//		serial0->printf("  ");

		//		itoa(raw_z, buffer, 10);
		//		serial0->printf("%s",buffer);
		//		serial0->printf("  ");

		//		dtostrf(headingDegrees, 6, 2, buffer);
		//		serial0->printf("%s",buffer);
		//		serial0->printf("  \r\n");

		_delay_ms(10);
	}

	return 0;
}
