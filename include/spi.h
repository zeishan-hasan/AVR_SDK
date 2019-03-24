#ifndef SPI_H
#define SPI_H
#include <avr/io.h>
#include <avr/interrupt.h>

#define DDR_SPI DDRB
#define DD_SS		0
#define DD_SCK	1
#define DD_MOSI 1
#define DD_MISO 3


enum SPI_MODE: uint8_t{
	SLAVE,
	MASTER,
};
enum SPI_DORD: uint8_t{ // Data Order
	MSB_FIRST,
	LSB_FIRST,
};
enum SPI_CPOL: uint8_t{ // Clock Polarity
	LR_TF,	// Leading Edge Rising	- Trailing Edge Falling
	LF_TR,	// Leading Edge Falling	- Trailing Edge Rising
};
enum SPI_CPHA:uint8_t{ // Clock Phase
	LS_TP,	// Leading Edge Sample - Trailing Edge Setup
	LP_TS,	// Leading Edge Setup	- Trailing Edge Sample
};


/*
SPI Clock Rate Select
+-------+------+------+---------------+
| SPI2X | SPR1 | SPR0 | SCK Frequency |
+-------+------+------+---------------+
|		0		|		0	 |	 0	|			fosc/4		|
+-------+------+------+---------------+
|		0		|		0	 |	 1	|			fosc/16		|
+-------+------+------+---------------+
|		0		|		1	 |	 0	|			fosc/64		|
+-------+------+------+---------------+
|		0		|		1	 |	 1	|			fosc/128	|
+-------+------+------+---------------+
|		1		|		0	 |	 0	|			fosc/2		|
+-------+------+------+---------------+
|		1		|		0	 |	 1	|			fosc/8		|
+-------+------+------+---------------+
|		1		|		1	 |	 0	|			fosc/32		|
+-------+------+------+---------------+
|		1		|		1	 |	 1	|			fosc/64		|
+-------+------+------+---------------+
*/
enum SPI_CLKSEL: uint8_t{
	FOSC_BY_4			,
	FOSC_BY_16		,
	FOSC_BY_64		,
	FOSC_BY_128		,
	FOSC_BY_2_x2	,
	FOSC_BY_8_x2	,
	FOSC_BY_32_x2	,
	FOSC_BY_64_x2	,
};


class SPI
{
public:
	SPI(SPI_MODE spiMode = SLAVE,SPI_CLKSEL clockSel = FOSC_BY_4, SPI_DORD dataOrder = MSB_FIRST, SPI_CPOL clockPolarity = LR_TF, SPI_CPHA clockPhase = LS_TP);

	void setInterrupt(bool value = false);

	void send(uint8_t cData);
	uint8_t receive();
};





#endif // SPI_H
