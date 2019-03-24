#include "spi.h"

SPI::SPI(SPI_MODE spiMode, SPI_CLKSEL clockSel, SPI_DORD dataOrder, SPI_CPOL clockPolarity, SPI_CPHA clockPhase)
{
	SPCR = 0;

	if(spiMode == SPI_MODE::MASTER){
		// Set MOSI and SCK output, all others input
		DDR_SPI = (1<<DD_MOSI) | (1<<DD_SCK);

		SPSR = ((clockSel & 4) >> 2) << SPI2X;

		SPCR |=	(clockPolarity << CPOL) | (clockPhase << CPHA) | (((clockSel & 2) >> 1) << SPR1) |
				((clockSel & 1) << SPR0);
	}
	else {
		DDR_SPI = (1<<DD_MISO);
	}
	SPCR |= (dataOrder << DORD ) | (spiMode <<	MSTR );
	// Set MISO output, all others input

	SPCR |= ( 1 << SPE);
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
	// Start transmission
	SPDR = cData;
	// Wait for transmission complete
	while(!(SPSR & (1<<SPIF)));
}

uint8_t SPI::receive()
{
	// Wait for reception complete
	while(!(SPSR & (1<<SPIF)));
	// Return Data Register
	return SPDR;
}




//-------ISR------/
ISR(SPI_STC_vect){
	UDR0 = 97;
}
