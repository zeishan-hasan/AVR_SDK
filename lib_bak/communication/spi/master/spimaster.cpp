#include "spimaster.h"


MasterSPI::MasterSPI(masterSPI_t data, mSPIsetting_t settings)
{
    Serial *serial0 = SerialManager::getInstance(SERIAL0);
    uint8_t i;
    self = data;
    //self.SS = data.SS;
    SPCR = 0;
    serial0->printf("pinx %p\r\n",self.SS[0].getPINxAddr());

    // Set MOSI and SCK output SS output, all others input
    *self.DDRx |=  (1 << self.bitMOSI) | (1 << self.bitSCK);

    // Prevent to autoselect HW slave mode
    self._ss.setDirection(OUTPUT);
    self._ss.on();

    // Initializing slaves
    for(i = 0; i < self.SS.size(); ++i){
        self.SS[i].setDirection(OUTPUT);
        self.SS[i].on();                // Turning off all slave
    }


    setClockPhase(settings._clockPhase);
    setClockPolarity(settings._clockPolarity);
    setClock(settings._clock);
    setDataOrder(settings._dataOrder);



    SPCR |= (1 << MSTR);

    enable();

}

void MasterSPI::enable()
{
    SPCR |= (1 << SPE);
}

void MasterSPI::disable()
{
    SPCR &= ~(1 << SPE);
}

void MasterSPI::setClock(SPI_CLKSEL clock)
{
    self.settings._clock = clock;
    SPCR &= ~((1 << SPR1) | (1 << SPR0));
    SPSR &= ~(1 << SPI2X);

    SPSR |= ((self.settings._clock & 4) >> 2) << SPI2X;
    SPCR |= (((self.settings._clock & 2) >> 1) << SPR1) | ((self.settings._clock & 1) << SPR0);


}

SPI_CLKSEL MasterSPI::getClock()
{
    return self.settings._clock;
}

void MasterSPI::setDataOrder(SPI_DORD dataOrder)
{
    self.settings._dataOrder = dataOrder;
    SPCR &= ~(1 << DORD);

    SPCR |= (self.settings._dataOrder << DORD );
}

SPI_DORD MasterSPI::getDataOrder()
{
    return self.settings._dataOrder;
}

void MasterSPI::setClockPolarity(SPI_CPOL clockPolarity)
{
    self.settings._clockPolarity = clockPolarity;
    SPCR &= ~(1 << CPOL);

    SPCR |= (self.settings._clockPolarity << CPOL);
}

SPI_CPOL MasterSPI::getClockPolarity()
{
    return self.settings._clockPolarity;
}

void MasterSPI::setClockPhase(SPI_CPHA clockPhase)
{
    self.settings._clockPhase = clockPhase;
    SPCR &= ~(1 << CPHA);


    SPCR |= (self.settings._clockPhase << CPHA);

}

SPI_CPHA MasterSPI::getClockPhase()
{
    return self.settings._clockPhase;
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

void MasterSPI::sendReceive(uint8_t *dst, uint8_t *src, size_t size)
{
    uint8_t i;
    for(i = 0; i < size; ++i){
        dst[i] = sendReceive(src[i]);
    }

}

bool MasterSPI::slaveIsValid(uint8_t slave)
{
    if((slave+1) <= self.SS.size()){
        return true;
    }
    return false;
}
