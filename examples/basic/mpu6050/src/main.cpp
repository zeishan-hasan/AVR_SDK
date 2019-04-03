#include "avr_sdk.h"

int main(){

	Mpu6050 mpu6050;
	Serial *serial1 = SerialManager::getInstance(SERIAL1);
	serial1->init(BAUD_1000000,_LOW_PRIORITY);
	serial1->setRxISRCallBack(false);
	serial1->setEchoServer(false);

	//I2CMaster master;
	//master.enable(SCL_100KHZ);

	//slave_t slave = master.scan();
	mpu6050_d data;
	serial1->clear();
	serial1->printf("Setup complete\r\n");
	//	serial1->printf("Slave addr : r 0x%x, w 0x%x\r\n ",slave.readAddr,slave.writeAddr);
	mpu6050.wakeUp();
	while (1) {
		serial1->clear();
		data = mpu6050.getData();
		//serial1->printf("accel :%d\r\n",data.accelX);
		serial1->printf("temp :%.02f giroX: %d\r\n",data.temp/340.00+36.53, data.gyroX);
		_delay_ms(10);
	}

	return 0;
}
