#include "hmc5883.h"
#define SIZE_OF_ARRAY(x) sizeof(x)/sizeof(x[0])

Hmc5883::Hmc5883(uint8_t writeAddr, uint8_t readAddr){
    self._addr.writeAddr = writeAddr;
    self._addr.readAddr = readAddr;
}

void Hmc5883::init()
{
    uint8_t valueRegA = (self._sample << 5) | (self._outRate << 2) | self._measureMode;


    master.start(self._addr.writeAddr);
    master.send(REG_A);     // set pointer to CRA
    master.send(valueRegA); // write 0x70 to CRA
    master.stop();

    master.start(self._addr.writeAddr);
    master.send(REG_B); // set pointer to CRB
    master.send(self._gain << 5);
    master.stop();

    master.start(self._addr.writeAddr);
    master.send(REG_MODE); // set pointer to measurement mode
    master.send(self._opMode); // continous measurement
    master.stop();
}

compass_t Hmc5883::getData()
{
    getHeading();
    return compass;
}

void Hmc5883::getHeading()
{
    uint8_t buff[6];
    master.readReg(self._addr.writeAddr,OUT_X_MSB,buff,SIZE_OF_ARRAY(buff));
    compass.raw_x = (buff[0] <<8) | buff[1];
    compass.raw_z = (buff[2] <<8) | buff[3];
    compass.raw_y = (buff[4] <<8) | buff[5];
    compass.headingDegrees =
            atan2((double)compass.raw_y,(double)compass.raw_x) * 180 / 3.141592654 + 180;
}
