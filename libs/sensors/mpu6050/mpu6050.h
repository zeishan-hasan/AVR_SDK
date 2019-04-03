#ifndef MPU6050_H
#define MPU6050_H
#include "i2cmaster.h"
#define SIZE_OF_ARRAY(x) sizeof(x)/sizeof(x[0])


#define SLEEP_BIT 6



enum MPU_REG :uint8_t{
    ACCEL_XOUT_H = 0x3B, ACCEL_XOUT_L = 0x3C,
    ACCEL_YOUT_H = 0x3D, ACCEL_YOUT_L = 0x3E,
    ACCEL_ZOUT_H = 0x3F, ACCEL_ZOUT_L = 0x40,
    TEMP_OUT_H = 0x41,  TEMP_OUT_L = 0x42,
    GYRO_XOUT_H = 0x43, GYRO_XOUT_L = 0x44,
    GYRO_YOUT_H = 0x45, GYRO_YOUT_L = 0x46,
    GYRO_ZOUT_H = 0x47, GYRO_ZOUT_L = 0x48,
    PWR_MGMT_1 = 0x6B
};


#pragma pack(1)
struct mpu6050_d
{
    mpu6050_d(){
        accelX= 0;
        accelY= 0;
        accelZ= 0;
        temp  = 0;
        gyroX = 0;
        gyroY = 0;
        gyroZ = 0;
    }
    int16_t accelX;
    int16_t accelY;
    int16_t accelZ;
    int16_t temp;
    int16_t gyroX;
    int16_t gyroY;
    int16_t gyroZ;

};

struct mpu6050_t
{   mpu6050_t(slave_t addr = slave_t()){
        if(addr.readAddr == 0){
            _addr.writeAddr = 0xd0;
            _addr.readAddr = 0xd1;
        }
        else {
            _addr = addr;
        }
    }
    slave_t _addr;
    mpu6050_d data;

};
#pragma pop

class Mpu6050
{
public:
    Mpu6050(slave_t addr);
    Mpu6050(uint8_t writeAddr =  0xD0, uint8_t readAddr = 0xD1);
    mpu6050_d getData();

    void wakeUp();
    void sleep();
private:
    I2CMaster master;
    mpu6050_t self;

};

#endif
