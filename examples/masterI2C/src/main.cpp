#include "avr_sdk.h"
#include <math.h>
#define HMC5883L_WRITE 0x3C
#define HMC5883L_READ 0x3D

I2CMaster master;
char buffer[6];

int16_t raw_x = 0;
int16_t raw_y = 0;
int16_t raw_z = 0;
float headingDegrees = 0;

uint8_t test[6];


void init_HMC5883L(void){
	master.start(HMC5883L_WRITE);
	master.write(0x00); // set pointer to CRA
	master.write(0x70); // write 0x70 to CRA
	master.stop();

	master.start(HMC5883L_WRITE);
	master.write(0x01); // set pointer to CRB
	master.write(0xA0);
	master.stop();

	master.start(HMC5883L_WRITE);
	master.write(0x02); // set pointer to measurement mode
	master.write(0x00); // continous measurement
	master.stop();
}



float getHeading(void){

	if(master.start(HMC5883L_WRITE)){
		return 0;
	}
	master.write(0x03); // set pointer to X axis MSB
	//	/master.stop();

	//master.start(HMC5883L_READ);

	master.receive(HMC5883L_READ,test,SIZE_OF_ARRAY(test));

	//raw_x = ((uint8_t)master.read_sendAck())<<8;
	//raw_x |= master.read_sendAck();
	//
	//raw_z = ((uint8_t)master.read_sendAck())<<8;
	//raw_z |= master.read_sendAck();
	//
	//raw_y = ((uint8_t)master.read_sendAck())<<8;
	//raw_y |= master.read_sendNack();
	//
	//master.stop();

	//headingDegrees = atan2((double)raw_y,(double)raw_x) * 180 / 3.141592654 + 180;

	return 0;//headingDegrees;
}



int main(){

	Serial *serial0 = SerialManager::getInstance(SERIAL0);
	serial0->init(BAUD_1000000,_LOW_PRIORITY);
	serial0->setRxISRCallBack(false);
	serial0->setEchoServer(false);

	master.init(SCL_100KHZ);

	uint8_t i = 0;

	serial0->printf("Setup complete\r\n");


	init_HMC5883L();


	while (1) {
		serial0->clear();

		getHeading();
		serial0->printf("%d\r\n",(test[0] <<8) | test[1]);
		serial0->printf("%d\r\n",(test[2] <<8) | test[3]);
		serial0->printf("%d\r\n",(test[4] <<8) | test[5]);
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
