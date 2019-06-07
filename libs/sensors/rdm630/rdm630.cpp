#include "rdm630.h"



Rdm6300::Rdm6300(){

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

std::vector<uint8_t> Rdm6300::getData(uint8_t *arr)
{
    //FIXME i don't like this
    memcpy(arr,lastCard.begin()+1,10);
    arr[10] = '\0';
    //yanujz::vector<uint8_t> data = lastCard;
    return lastCard;
}

void Rdm6300::setBuzzerPin(uint8_t pin = 13)
{
    buzzer = Pin(pin,OUTPUT);
}

bool Rdm6300::calcCrc(std::vector<uint8_t> & buff)
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

bool Rdm6300::isValidPacket(std::vector<uint8_t> &data)
{


    if(*data.begin() == 0x02 && *data.end() == 0x03 &&
            (data.size() == 14)){
        if(calcCrc(data)){
            return true;

        }
    }
    return false;
}

void Rdm6300::buzzerIncoming()
{
    buzzer.setPWM(1000,70);
    _delay_ms(250);
    buzzer.setPWM(3000,70);
    _delay_ms(250);
    buzzer.setDuty(0);
}

void Rdm6300::buzzerOutcoming()
{
    buzzer.setPWM(3000,70);
    _delay_ms(250);
    buzzer.setPWM(1000,70);
    _delay_ms(250);
    buzzer.setDuty(0);
}


void Rdm6300::buzzerDenied()
{
    buzzer.setPWM(3000,70);
    _delay_ms(500);
    buzzer.setDuty(0);
}

bool Rdm6300::isNewCard()
{
    static uint16_t count = 0;

    uint8_t temp = 0;
    std::vector<uint8_t> data;
    if(++count == 3000){
        lastCard = data;
        _delay_ms(1000);
        count = 0;
    }

    if(serial->isAvailable()){
        temp = serial->receive();
        if(temp == 0x2){
            data.push_back(temp);
            while (1) {
                if(serial->isAvailable()){
                    temp = serial->receive();
                    data.push_back(temp);
                }
                if(data.size() >= 14){
                    break;
                }
            }
        }

    }
    if(isValidPacket(data)){
        if (data != lastCard){
            lastCard = data;
            buzzerIncoming();
            return true;
        }
        return true;
        buzzerDenied();
    }

    return false;
}
