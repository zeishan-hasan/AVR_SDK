#include "mpu6050.h"

Mpu6050::Mpu6050(slave_t addr){
    self._addr = addr;
}
Mpu6050::Mpu6050(uint8_t writeAddr, uint8_t readAddr)
{
    self._addr.writeAddr = writeAddr;
    self._addr.readAddr = readAddr;
}

void Mpu6050::wakeUp()
{
    master.start(self._addr.writeAddr);
    master.send(PWR_MGMT_1); // PWR_MGMT_1 register
    master.send(0x00); // Setting 0 to wake up
    master.stop();
}

void Mpu6050::sleep()
{
    master.start(self._addr.writeAddr);
    master.send(PWR_MGMT_1);
    uint8_t data = master.receive(self._addr.readAddr);
    data |= (1<<SLEEP_BIT);
    master.send(data);
    master.stop();
}

mpu6050_d Mpu6050::getData()
{

    uint8_t *ptr =  (uint8_t*)&self.data;

    master.start(self._addr.writeAddr);
    master.send(ACCEL_XOUT_H);
    master.start(self._addr.readAddr);

    ptr[1] = master.read_sendAck();
    ptr[0] = master.read_sendAck();
    ptr[3] = master.read_sendAck();
    ptr[2] = master.read_sendAck();
    ptr[5] = master.read_sendAck();
    ptr[4] = master.read_sendAck();
    ptr[7] = master.read_sendAck();
    ptr[6] = master.read_sendAck();
    ptr[9] = master.read_sendAck();
    ptr[8] = master.read_sendAck();
    ptr[11] = master.read_sendAck();
    ptr[10] = master.read_sendAck();
    ptr[13] = master.read_sendAck();
    ptr[12] = master.read_sendNack();


    return self.data;
}




