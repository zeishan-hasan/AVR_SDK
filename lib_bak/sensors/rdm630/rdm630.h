#ifndef RDM6300_H
#define RDM6300_H
#include "serial.h"
#include "vector.h"
#include "portmanager.h"
#include "macros.h"
#include "../std/vector"
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
    std::vector<uint8_t> getData();
    void setBuzzerPin(uint8_t pin);
private:
    //---- Methods ----//
    bool calcCrc(std::vector<uint8_t> &buff);
    bool isValidPacket(std::vector<uint8_t> &data);

    void buzzerIncoming();
    void buzzerOutcoming();
    void buzzerDenied();

    //---- Variables ----//
    Serial *serial;
    std::vector<uint8_t> lastCard;
    Pin buzzer;
};

#endif
