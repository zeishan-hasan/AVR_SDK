#ifndef SPIMASTER_H
#define SPIMASTER_H
#include "spi.h"

struct masterSPI_t
{
	masterSPI_t (volatile uint8_t *ddrx = nullptr, Pin *miso = nullptr, Pin *mosi = nullptr, Pin *sck = nullptr, Pin *ss = nullptr){
		if(ddrx != nullptr){
			DDRx	= ddrx;
			PORTx	= ddrx + 1;
		}
		bitMISO	= miso	== nullptr ? 0xFF : miso->getRegisterBit();
		bitMOSI	= mosi	== nullptr ? 0xFF : mosi->getRegisterBit();
		bitSCK	= sck		== nullptr ? 0xFF : sck->getRegisterBit();
		bitSS		= ss		== nullptr ? 0xFF : ss->getRegisterBit();
	}
	volatile uint8_t *DDRx;
	volatile uint8_t *PORTx;
	uint8_t bitMISO;
	uint8_t bitMOSI;
	uint8_t bitSCK;
	uint8_t bitSS;
	yanujz::vector<Pin> SS;
};

class MasterSPI
{
public:
	MasterSPI(masterSPI_t data, SPI_CLKSEL clockSel = FOSC_BY_16, SPI_DORD dataOrder = MSB_FIRST,
						SPI_CPOL clockPolarity = LR_TF, SPI_CPHA clockPhase = LS_TP);

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
