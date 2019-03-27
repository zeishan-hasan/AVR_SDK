#ifndef SPIMASTER_H
#define SPIMASTER_H
#include "spi.h"

struct masterSPI_t
{
    masterSPI_t (volatile uint8_t *pinx = nullptr, Pin *miso = nullptr,
                 Pin *mosi = nullptr, Pin *sck = nullptr, Pin *ss = nullptr){
        if(pinx != nullptr){
            PINx  = pinx;
            DDRx  = pinx + 1;
            PORTx = pinx + 2;
        }
        bitMISO	= miso	== nullptr ? 0xFF : miso->getRegisterBit();
        bitMOSI	= mosi	== nullptr ? 0xFF : mosi->getRegisterBit();
        bitSCK	= sck	== nullptr ? 0xFF : sck->getRegisterBit();
        bitSS	= ss	== nullptr ? 0xFF : ss->getRegisterBit();
        _ss = ss;
    }
    volatile uint8_t *PINx;
    volatile uint8_t *DDRx;
    volatile uint8_t *PORTx;
    uint8_t bitMISO;
    uint8_t bitMOSI;
    uint8_t bitSCK;
    uint8_t bitSS;
    Pin *_ss;
    yanujz::vector<Pin> SS;
};

class MasterSPI
{
public:
    MasterSPI(masterSPI_t data, SPI_CLKSEL clockSel = FOSC_BY_16,
              SPI_DORD dataOrder = MSB_FIRST, SPI_CPOL clockPolarity = LR_TF, SPI_CPHA clockPhase = LS_TP);

    void enableSlave(uint8_t slave);
    void disableSlave(uint8_t slave);

    void send(uint8_t data);
    void send(uint8_t *buff, size_t size);

    uint8_t receive();
    void receive(uint8_t *buff, size_t size);

    uint8_t sendReceive(uint8_t data);

private:
    bool slaveIsValid(uint8_t slave);
    masterSPI_t self;
};




#endif // SPI_H
