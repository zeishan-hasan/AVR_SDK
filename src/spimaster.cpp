#include "spimaster.h"
/*
SPI::SPI(SPI_MODE spiMode, SPI_CLKSEL clockSel, SPI_DORD dataOrder, SPI_CPOL clockPolarity, SPI_CPHA clockPhase)
{
        SPCR = 0;

        if(spiMode == SPI_MODE::MASTER){
                // Set MOSI and SCK output, all others input
                DDR_SPI = (0<< DD_MISO) | (1<<DD_MOSI) | (1<<DD_SCK) | (1<<DD_SS);
                PORT_SPI |= (1<<DD_SS);
                SPSR = ((clockSel & 4) >> 2) << SPI2X;

                SPCR |=	(clockPolarity << CPOL) | (clockPhase << CPHA);
                SPCR |= (((clockSel & 2) >> 1) << SPR1) | ((clockSel & 1) << SPR0);

        }
        else {
                // Set MISO output, all others input
                DDR_SPI		= (1 << DD_MISO) | (0<<DD_MOSI) | (0<<DD_SCK) | (0<<DD_SS);
                PORT_SPI	= (1 << DD_MISO);
        }

        SPCR |= (dataOrder << DORD ) | (spiMode <<	MSTR);

        SPCR |= (1 << SPE);
}

void SPI::setInterrupt(bool value)
{
        if(value){
                SPCR |= (1<<SPIE);
                return;
        }
        SPCR &= ~(1<<SPIE);
}

void SPI::send(uint8_t cData)
{
        PORT_SPI &= ~(1<<DD_SS);
        // Start transmission
        SPDR = cData;
        // Wait for transmission complete
        while(!(SPSR & (1<<SPIF)));

        PORT_SPI |= (1<<DD_SS);
}
//01100001
//11100011

uint8_t SPI::receive()
{
        // Wait for reception complete
        while(!(SPSR & (1<<SPIF)));
        // Return Data Register
        return SPDR;
}

*/
//-------ISR------/
ISR(SPI_STC_vect){
<<<<<<< Updated upstream
	UDR0 = 97;
}

MasterSPI::MasterSPI(masterSPI_t data, SPI_CLKSEL clockSel, SPI_DORD dataOrder, SPI_CPOL clockPolarity, SPI_CPHA clockPhase)
{
	uint8_t i;
	self = data;
	*self.DDRx = 0;
=======
        UDR0 = 97;
}*/

MasterSPI::MasterSPI(masterSPI_t data, SPI_CLKSEL clockSel, SPI_DORD dataOrder, SPI_CPOL clockPolarity, SPI_CPHA clockPhase)
{
    uint8_t i;
    self = data;
>>>>>>> Stashed changes

    SPCR = 0;

<<<<<<< Updated upstream
	// Set MOSI and SCK output, all others input
	*self.DDRx |=  (1 << self.bitMOSI) | (1 << self.bitSCK) | (1 << self.bitSS);

	for(i = 0; i < self.SS.size(); ++i){
		self.SS[i].setDirection(OUTPUT);
		self.SS[i].on();
	}
=======
    // Set MOSI and SCK output, all others input
    *self.DDRx |= (1 << self.MOSI) | (1 << self.SCK);
    for(i = 0; i < self.SS.size(); ++i){
        self.SS[i].setDirection(OUTPUT);
        self.SS[i].setState(true);
    }
>>>>>>> Stashed changes


    SPCR |= (clockPolarity << CPOL) | (clockPhase << CPHA);
    SPSR |= ((clockSel & 4) >> 2) << SPI2X;
    SPCR |= (((clockSel & 2) >> 1) << SPR1) | ((clockSel & 1) << SPR0);

    SPCR |= (dataOrder << DORD ) | (1 << MSTR);

    SPCR |= (1 << SPE);

}

void MasterSPI::enableSlave(uint8_t slave)
{
    if(slaveIsValid(slave) == false){
        return;
    }
    self.SS[slave].off();
}

void MasterSPI::disableSlave(uint8_t slave)
{
    if(slaveIsValid(slave) == false){
        return;
    }
    self.SS[slave].on();
}


void MasterSPI::send(uint8_t data)
{
    // Start transmission
    SPDR = data;
    // Wait for transmission complete
    while(!(SPSR & (1<<SPIF)));

}

void MasterSPI::send(uint8_t *buff, size_t size)
{

    uint8_t i;
    for(i = 0;i < size;++i){
        send(buff[i]);

    }
}

uint8_t MasterSPI::receive()
{

    // Wait for reception complete
    while(!(SPSR & (1<<SPIF)));
    // Return Data Register
    return SPDR;

}

void MasterSPI::receive(uint8_t *buff, size_t size)
{
<<<<<<< Updated upstream
	uint8_t i;
	for(i = 0;i < size;++i){
		buff[i] = receive();
	}
=======
    uint8_t i;
    for(i = 0;i < size;++i){
        *(buff + i) = receive();
    }
>>>>>>> Stashed changes
}

uint8_t MasterSPI::sendReceive(uint8_t data)
{
    // Start transmission
    SPDR = data;
    // Wait for transmission complete
    while(!(SPSR & (1<<SPIF)));
    return SPDR;
}

bool MasterSPI::slaveIsValid(uint8_t slave)
{
    if((slave+1) <= self.SS.size()){
        return true;
    }
    return false;
}
