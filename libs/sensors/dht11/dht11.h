#ifndef DHT11_H
#define DHT11_H
#include "portmanager.h"
#include "timer.h"

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
