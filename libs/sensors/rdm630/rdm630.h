#ifndef RDM6300_H
#define RDM6300_H
#include "serial.h"
#include "vector.h"


#pragma pack(1)
//struct rdm6300_t
//{
//    rdm6300_t(uint8_t start,) {
//
//    }
//    uint8_t start;
//    uint16_t data; // 10 Bits
//    uint16_t crc;
//    uint8_t stop;
//};
#pragma pop
class Rdm6300
{
public:
    Rdm6300();
    bool attachTo(enum SerialPort serial, enum UART baud);
    bool isNewCard();
    yanujz::vector<uint8_t> readData();
private:
    bool calcCrc(yanujz::vector<uint8_t> &buff);
    bool isValidPacket(yanujz::vector<uint8_t> &data);


    Serial *serial;
    Serial *serial0;
    yanujz::vector<uint8_t> lastCard;
};

#endif
