#include "dht11.h"


Dht11::Dht11(Pin pin){

}

Dht11::Dht11(uint8_t pin)
{
    _selfPin = Pin(pin,INPUT_PULLUP);
}

Dht11::Dht11(dht11_t dht11)
{
    self = dht11;
}
