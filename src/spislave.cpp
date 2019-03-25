#include "spislave.h"

SlaveSPI::SlaveSPI(slaveSPI_t data,SPI_DORD dataOrder)
{
	self = data;
	SPCR = 0;
	DDRB = 0;
	// Set MISO output, all others input
	*self.DDRx	= (1 << self.MISO) | (0<<self.MOSI) | (0<<self.SCK) | (0<<self.SS);
	*self.PORTx = (1 << self.MISO);

	SPCR |= (dataOrder << DORD );
	SPCR &= ~(1 <<	MSTR);

	SPCR |= (1 << SPE);
}

void SlaveSPI::send(uint8_t data)
{

}

void SlaveSPI::send(uint8_t *buff, size_t size)
{

}

uint8_t SlaveSPI::receive()
{
	// Wait for reception complete
	while(!(SPSR & (1<<SPIF)));

	// Return Data Register
	return SPDR;

}

void SlaveSPI::receive(uint8_t *buff, size_t size)
{
	for(uint8_t i = 0;i< size;++i){
		// Wait for reception complete
		while(!(SPSR & (1<<SPIF)));
		// Return Data Register
		*(buff + i) = SPDR;
	}
}
