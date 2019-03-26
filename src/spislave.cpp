#include "spislave.h"

SlaveSPI::SlaveSPI(slaveSPI_t data, SPI_DORD dataOrder, SPI_CLKSEL clockSel, SPI_CPOL clockPolarity, SPI_CPHA clockPhase)
{
	self = data;
	SPCR = 0;
	DDRB = 0;
	SPSR = 0;
	// Set MISO output, all others input
	*self.DDRx	= ~((1 << self.MOSI) | (1 << self.SCK) | (1 << self.SS));
	*self.DDRx	|= (1 << self.MISO);
	*self.PORTx |= (1 << self.MISO);



	SPCR |=	(clockPolarity << CPOL) | (clockPhase << CPHA);
	SPSR |= ((clockSel & 4) >> 2) << SPI2X;
	SPCR |= (((clockSel & 2) >> 1) << SPR1) | ((clockSel & 1) << SPR0);
	SPCR |= (dataOrder << DORD );
	SPCR &= ~(1 <<	MSTR);
	SPCR |= (1 << SPE);
	//SPCR &= ~(1<<MSTR);                // Set as slave
	//SPCR |= (1<<SPR0)|(1<<SPR1);       // divide clock by 128
	//SPCR |= (1<<SPE);                  // Enable SPI
}

void SlaveSPI::setISR(bool value)
{
	if(value){
		SPCR |= (1 << SPIE);
		sei();
		return;
	}
	SPCR &= ~(1 << SPIE);
}

void SlaveSPI::send(uint8_t data)
{
	// Start transmission
	SPDR = data;
	// Wait for transmission complete
	while(!(SPSR & (1<<SPIF)));
}

void SlaveSPI::send(uint8_t *buff, size_t size)
{
	for(uint8_t i = 0;i< size;++i){
		send(buff[i]);
	}
}

uint8_t SlaveSPI::receive()
{
	//*self.PORTx &= ~(1 << self.MISO);
	// Wait for reception complete
	while(!(SPSR & (1<<SPIF)));
	// Return Data Register
	return SPDR;

}

void SlaveSPI::receive(uint8_t *buff, size_t size)
{
	for(uint8_t i = 0;i< size;++i){
		buff[i] = receive();
	}
}

bool SlaveSPI::busIsWritable()
{
	return !(((*(self.PINx) & self.SS) >> self.SS));
}

void SlaveSPI::registerCallback()
{

}

//-------ISR------/
ISR(SPI_STC_vect){
	volatile uint8_t a = SPDR;
	if(a == 0xAA){
		SPDR = 6;
	}
	//Serial *serial0 = SerialManager::getInstance(SERIAL0);
	//serial0->printf("ISR called data : %d\r\n",a);

	// Start transmission
	//SPDR = a;
	// Wait for transmission complete
	//while(!(SPSR & (1<<SPIF)));
}
