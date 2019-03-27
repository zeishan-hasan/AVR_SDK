#include "spimaster.h"


MasterSPI::MasterSPI(masterSPI_t data, SPI_CLKSEL clockSel, SPI_DORD dataOrder, SPI_CPOL clockPolarity, SPI_CPHA clockPhase)
{
    uint8_t i;
    self = data;

    SPCR = 0;

    // Set MOSI and SCK output SS output, all others input
    *self.DDRx |=  (1 << self.bitMOSI) | (1 << self.bitSCK);
    self._ss->setDirection(OUTPUT);
    self._ss->on();

    for(i = 0; i < self.SS.size(); ++i){
        self.SS[i].setDirection(OUTPUT);
        self.SS[i].on();                // Turning off all slave
    }


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
    Serial *serial0 = SerialManager::getInstance(SERIAL0);

    uint8_t i;
    for(i = 0;i < size;++i){
        serial0->printf("Sending : %d\r\n",buff[i]);
        send(buff[i]);
    }
}

uint8_t MasterSPI::receive()
{
    Serial *serial0 = SerialManager::getInstance(SERIAL0);
    SPDR = 0;
    // Wait for reception complete
    while(!(SPSR & (1<<SPIF))){
        serial0->printf("waiting data\r\n");
    }
    // Return Data Register
    return SPDR;
}

void MasterSPI::receive(uint8_t *buff, size_t size)
{
    uint8_t i;
    for(i = 0;i < size;++i){
        buff[i] = receive();
    }
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
