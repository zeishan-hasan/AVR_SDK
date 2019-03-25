#ifndef SPISLAVE_H
#define SPISLAVE_H
#include "spi.h"


struct slaveSPI_t
{
	slaveSPI_t (volatile uint8_t *ddrx = nullptr, Pin *miso = nullptr, Pin *mosi = nullptr, Pin *sck = nullptr,Pin *ss = nullptr){
		if(ddrx != nullptr){
			DDRx	= ddrx;
			PORTx	= ddrx + 1;
		}
		MISO	= miso	== nullptr ? 0xFF : miso->getRegisterBit();
		MOSI	= mosi	== nullptr ? 0xFF : mosi->getRegisterBit();
		SCK		= sck		== nullptr ? 0xFF : sck->getRegisterBit();
		SS		= ss		== nullptr ? 0xFF : ss->getRegisterBit();
	}
	volatile uint8_t *DDRx;
	volatile uint8_t *PORTx;
	uint8_t MISO;
	uint8_t MOSI;
	uint8_t SCK;
	uint8_t SS;
};



class SlaveSPI
{
public:
	SlaveSPI(slaveSPI_t data, SPI_DORD dataOrder = MSB_FIRST);

	void send(uint8_t data);
	void send(uint8_t *buff,size_t size);

	uint8_t receive();
	void receive(uint8_t *buff,size_t size);
private:
	slaveSPI_t self;
};

#endif // SPISLAVE_H
