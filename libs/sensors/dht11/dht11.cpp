#include "dht11.h"


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
    double previous = 0, now = 0;

    if(!startContition()){
        serial1->printf("Start failed\r\n");
        _delay_ms(2000);
        return;
    }
    self.pin.setDirection(INPUT);

    serial1->printf("Reading\r\n");
    //Reading 5 bytes, bit by bit
    for (uint8_t i = 0 ; i < 5 ; i++){
        for (int8_t j = 7 ; j >= 0 ; j--)
        {
            //There is always a leading low level of 50 us
            //previous = Timer::now();
            //while(self.pin.digitalRead() == false){
            //    // serial1->printf("sucone\r\n");
            //    //now = Timer::now();
            //}
            //now = Timer::now() - previous;
            //serial1->printf("Prebit %lf\r\n",now);

            previous = Timer::now();
            while(self.pin.digitalRead()){
                // serial1->printf("sucone\r\n");
                //now = Timer::now();
            }
            now = Timer::now() - previous;
            serial1->printf("bit %lf\r\n",now);


            //if(now - previous > 80){
            //    return;
            //}

            //if (__DHT_STATUS == DHT_Ok)
            //{
            //We read data bit || 26-28us means '0' || 70us means '1'
            // _delay_us(35);  //Wait for more than 28us
            // if (self.pin.digitalRead())   //If HIGH
            //     bitSet(buffer[i], j);   //bit = '1'
            //
            // retries = 0;
            // while(self.pin.digitalRead())
            // {
            //     _delay_us(2);
            //     retries += 2;
            //     if (retries > 100)
            //     {
            //         //__DHT_STATUS = DHT_Error_Timeout; //Timeout error
            //         break;
            //     }
            // }
        }
        serial1->printf("\r\n");
    }

    if (((uint8_t)(buffer[0] + buffer[1] + buffer[2] + buffer[3])) != buffer[4]){
        serial1->printf("Checksum errato\r\n");
    }



    self.humidity = buffer[0];



}

bool Dht11::startContition()
{
    self.pin.setDirection(INPUT_PULLUP);
    //Serial *serial1 = SerialManager::getInstance(SERIAL1);
    double previous, now;

    self.pin.off();
    self.pin.setDirection(OUTPUT);
    previous = Timer::now();
    while (Timer::now() - previous < 20000);

    //Setup DHT_PIN as input with pull-up resistor so as to read data
    //self.pin.on();
    self.pin.setDirection(INPUT_PULLUP);

    previous = Timer::now();
    while (self.pin.digitalRead()){
        now = Timer::now();
    };

    if (now - previous > 40 ){
        // serial1->printf("error 40\r\n");
        return false;
    }
    //self.pin.setDirection(INPUT);
    //Response sequence began
    //Wait for the first response to finish (low for ~80us)
    previous = Timer::now();
    while (!self.pin.digitalRead()){
        //now = Timer::now();
    }

    if (Timer::now() - previous > 90){
        //serial1->printf("error 80 low\r\n");
        return false;
    }
    //Wait for the last response to finish (high for ~80us)
    previous = Timer::now();
    while (self.pin.digitalRead()){
        // now = Timer::now();
    }

    if (Timer::now() - previous > 90){
        //serial1->printf("error 80 high\r\n");
        return false;
    }

    return true;
}
