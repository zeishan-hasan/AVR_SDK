#include "dht11.h"
#define bitRead(value, bit) (((value) >> (bit)) & 0x01)
#define bitSet(value, bit) ((value) |= (1UL << (bit)))
#define bitClear(value, bit) ((value) &= ~(1UL << (bit)))
#define bitWrite(value, bit, bitvalue) (bitvalue ? bitSet(value, bit) : bitClear(value, bit))

Dht11::Dht11(Pin pin){
    self.pin = pin;
}

Dht11::Dht11(uint8_t pin)
{
    self.pin =  Pin(pin,INPUT_PULLUP);
}

Dht11::Dht11(dht11_t dht11)
{
    self = dht11;
}

uint8_t Dht11::getTemperature()
{
    getData();
    return self.temperature;
}

uint8_t Dht11::getHumidity()
{
    getData();
    return self.humidity;
}

void Dht11::getData()
{
    Serial *serial1 = SerialManager::getInstance(SERIAL1);
    uint8_t buffer[5] = {0, 0, 0, 0, 0};
    uint8_t retries = 0;

    if(!startContition()){
        serial1->printf("Start failed\r\n");
        return;
    }


    //Reading 5 bytes, bit by bit
    for (uint8_t i = 0 ; i < 5 ; i++)
        for (int8_t j = 7 ; j >= 0 ; j--)
        {
            //There is always a leading low level of 50 us
            retries = 0;
            while(!self.pin.digitalRead())
            {
                _delay_us(2);
                retries += 2;
                if (retries > 70)
                {
                    // __DHT_STATUS = DHT_Error_Timeout;	//Timeout error
                    j = -1; //Break inner for-loop
                    i = 5;  //Break outer for-loop
                    break;  //Break while loop
                }
            }

            //if (__DHT_STATUS == DHT_Ok)
            //{
            //We read data bit || 26-28us means '0' || 70us means '1'
            _delay_us(35);  //Wait for more than 28us
            if (self.pin.digitalRead())   //If HIGH
                bitSet(buffer[i], j);   //bit = '1'

            retries = 0;
            while(self.pin.digitalRead())
            {
                _delay_us(2);
                retries += 2;
                if (retries > 100)
                {
                    //__DHT_STATUS = DHT_Error_Timeout; //Timeout error
                    break;
                }
            }
        }
    if (((uint8_t)(buffer[0] + buffer[1] + buffer[2] + buffer[3])) != buffer[4]){
        serial1->printf("Checksum errato\r\n");
    }



    self.humidity = buffer[0];



}

bool Dht11::startContition()
{
    Serial *serial1 = SerialManager::getInstance(SERIAL1);
    double previous;// = Timer::now();
    //self.pin.off();
    //_delay_ms(20);
    //self.pin.on();
    //_delay_us(40);
    //Request data
    self.pin.off();
    self.pin.setDirection(OUTPUT);
    _delay_ms(20);

    //Setup DHT_PIN as input with pull-up resistor so as to read data
    self.pin.on();
    self.pin.setDirection(INPUT);

    //Wait for response for 20-40us
    uint8_t retries = 0;
    while (self.pin.digitalRead())
    {
        _delay_us(2);
        retries += 2;
        if (retries > 60)
        {
            return false;
        }
    }
    serial1->printf("part 1 ok\r\n");
    //Response sequence began
    //Wait for the first response to finish (low for ~80us)
    retries = 0;
    while (!self.pin.digitalRead())
    {
        _delay_us(2);
        retries += 2;
        if (retries > 100)
        {
            return false;

        }
    }
    //Wait for the last response to finish (high for ~80us)
    retries = 0;
    while(self.pin.digitalRead())
    {
        _delay_us(2);
        retries += 2;
        if (retries > 100)
        {
            return false;
        }
    }
    serial1->printf("part 2 ok\r\n");

    return true;
}
