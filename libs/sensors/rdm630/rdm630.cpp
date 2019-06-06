#include "rdm630.h"
#include "macros.h"

Rdm6300::Rdm6300(){

    //serial0 = SerialManager::getInstance(SERIAL0);

}

bool Rdm6300::attachTo(SerialPort serial, UART baud)
{
    this->serial = SerialManager::getInstance(serial);
    this->serial->init(baud);
    this->serial->setRxISRCallBack(false);
    this->serial->setEchoServer(false);
    //ser_cb_t *ptr = (ser_cb_t*)isNewCard();
    //this->serial->registerCallback((ser_cb_t*)isNewCard());
    return true;
}

void Rdm6300::getData(uint8_t *arr)
{
    //yanujz::vector<uint8_t> data;
    //uint8_t i = 0;

    memcpy(arr,lastCard.begin()+1,10);
    arr[10] = '\0';
    //data.pushRight(50);
    //memcpy(data.begin(),lastCard.begin()+1,10);
    //data.insert(data.begin(),lastCard.begin()+1,lastCard.end()-1);

    //return data;
}

bool Rdm6300::calcCrc(yanujz::vector<uint8_t> & buff)
{
    uint8_t crc = 0;
    for(uint8_t i = 2; i < 12; i+=2){
        uint8_t byte = ((buff[i-1] & 0xF) <<4) | (buff[i] & 0xF);
        crc^= byte;
    }
    if(crc == ((buff[11] & 0xF) << 4) | (buff[12] & 0xF)){
        return true;
    }
    return false;
}

bool Rdm6300::isValidPacket(yanujz::vector<uint8_t> &data)
{
    if((data.first() == 0x02) && (data.last() == 0x03) &&
            (data.size() == 14)){
        if(calcCrc(data)){
            return true;

        }
    }
    return false;
}

bool Rdm6300::isNewCard()
{
    static uint16_t count = 0;

    uint8_t temp = 0;
    yanujz::vector<uint8_t> data;
    if(++count == 3000){
        lastCard = data;
        _delay_ms(1000);
        count = 0;
    }

    if(serial->isAvailable()){
        temp = serial->receive();
        if(temp == 0x2){
            data.pushRight(temp);
           // serial0->printf("start frame\r\n");
            while (1) {
                if(serial->isAvailable()){
                    temp = serial->receive();
                    data.pushRight(temp);
                    //serial0->printf("Reading byte\r\n");
                }
                if(data.size() >= 14){
                    break;
                }
            }
            //serial0->printf("stop frame\r\n");
        }

    }
    if(isValidPacket(data)){
        Pin pin(13,OUTPUT);
        //serial0->printf("packet is valid\r\n");
        if (data != lastCard){
            //   serial0->printf("new card\r\n");
            lastCard = data;
            return true;
        }
        //else if(data == lastCard && minTimeElapsed){
        //
        //}
        pin.setPWM(3000,20);
        _delay_ms(250);
        //pin.setPWM(1000,50);
        //_delay_ms(250);
        pin.setDuty(0);

        //serial0->printf("card present\r\n");
    }
    //serial0->printf("leaving\r\n");

    return false;
}
