#ifndef SPIMASTER_H
#define SPIMASTER_H
//#include "../spi.h"
#include <spi.h>
#include <vector>
#pragma pack(1)
struct mSPIsetting_t
{

    mSPIsetting_t(SPI_CLKSEL clockSel = FOSC_BY_4, SPI_DORD dataOrder = MSB_FIRST,
                  SPI_CPOL clockPolarity = LR_TF, SPI_CPHA clockPhase = LS_TP){
        _clock          = clockSel;
        _dataOrder      = dataOrder;
        _clockPolarity	= clockPolarity;
        _clockPhase     = clockPhase;
    }
    SPI_CLKSEL	_clock;
    SPI_DORD    _dataOrder;
    SPI_CPOL    _clockPolarity;
    SPI_CPHA    _clockPhase;
};


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
        _ss = *ss;
    }
    volatile uint8_t *PINx;
    volatile uint8_t *DDRx;
    volatile uint8_t *PORTx;
    uint8_t bitMISO;
    uint8_t bitMOSI;
    uint8_t bitSCK;
    uint8_t bitSS;
    Pin _ss;
    std::vector<Pin> SS;
    mSPIsetting_t settings;
};

#pragma pop

class MasterSPI
{
public:
    MasterSPI(masterSPI_t data, mSPIsetting_t settings);

    void enable();
    void disable();

    void setClock(SPI_CLKSEL clock);
    SPI_CLKSEL getClock();

    void setDataOrder(SPI_DORD dataOrder);
    SPI_DORD getDataOrder();

    void setClockPolarity(SPI_CPOL clockPolarity);
    SPI_CPOL getClockPolarity();

    void setClockPhase(SPI_CPHA clockPhase);
    SPI_CPHA getClockPhase();

    void enableSlave(uint8_t slave);
    void disableSlave(uint8_t slave);

    void send(uint8_t data);
    void send(uint8_t *buff, size_t size);

    uint8_t receive();
    void receive(uint8_t *buff, size_t size);

    uint8_t sendReceive(uint8_t data);
    void sendReceive(uint8_t *dst, uint8_t *src, size_t size);

    bool isInitilizedSPI();

private:
    bool slaveIsValid(uint8_t slave);

    masterSPI_t self;
};




#endif // SPI_H
