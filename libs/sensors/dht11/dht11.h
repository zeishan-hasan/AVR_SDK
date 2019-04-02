#ifndef DHT11_H
#define DHT11_H
#include "portmanager.h"
#include "timer.h"
#ifndef F_CPU
#define F_CPU 16000000
#endif

#define bitRead(value, bit) (((value) >> (bit)) & 0x01)
#define bitSet(value, bit) ((value) |= (1UL << (bit)))
#define bitClear(value, bit) ((value) &= ~(1UL << (bit)))
#define bitWrite(value, bit, bitvalue) (bitvalue ? bitSet(value, bit) : bitClear(value, bit))

struct dht11_t
{
    Pin pin;
    uint8_t temperature;
    uint8_t humidity;
};
class Dht11
{
public:
    //-------- METHODS --------//
    Dht11(Pin pin);
    Dht11(uint8_t pin);
    Dht11(dht11_t dht11);

    uint8_t getTemperature();
    uint8_t getHumidity();

private:
    //-------- METHODS --------//
    bool checkCrc();
    void getData();
    inline bool startContition();

    //-------- VARIABLES --------//

    dht11_t self;
};

#endif
