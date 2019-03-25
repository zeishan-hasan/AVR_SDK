#ifndef SPIMASTER_H
#define SPIMASTER_H
#include "spi.h"

struct masterSPI_t
{
	masterSPI_t (volatile uint8_t *ddrx = nullptr, Pin *miso = nullptr, Pin *mosi = nullptr, Pin *sck = nullptr){
		if(ddrx != nullptr){
			DDRx	= ddrx;
			PORTx	= ddrx + 1;
		}
		MISO	= miso	== nullptr ? 0xFF : miso->getRegisterBit();
		MOSI	= mosi	== nullptr ? 0xFF : mosi->getRegisterBit();
		SCK		= sck		== nullptr ? 0xFF : sck->getRegisterBit();
	}
	volatile uint8_t *DDRx;
	volatile uint8_t *PORTx;
	uint8_t MISO;
	uint8_t MOSI;
	uint8_t SCK;
	yanujz::vector<Pin> SS;
};

class MasterSPI
{
public:
	MasterSPI(masterSPI_t data, SPI_CLKSEL clockSel = FOSC_BY_16, SPI_DORD dataOrder = MSB_FIRST,
						SPI_CPOL clockPolarity = LR_TF, SPI_CPHA clockPhase = LS_TP);


	void send(uint8_t slave, uint8_t data);
	void send(uint8_t slave, uint8_t *buff, size_t size);

	uint8_t receive(uint8_t slave);
	void receive(uint8_t slave, uint8_t *buff, size_t size);
private:
	bool slaveIsValid(uint8_t slave);
	masterSPI_t self;
};




#endif // SPI_H
