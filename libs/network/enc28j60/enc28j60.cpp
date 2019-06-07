#include "enc28j60.h"


Enc28j60::Enc28j60(){

}

bool Enc28j60::init()
{


    return false;
}

void Enc28j60::send()
{
    master->enableSlave(0);
    master->send(0x3A);
    _delay_ms(1);
    master->disableSlave(0);
}

void Enc28j60::setSPI(uint8_t miso, uint8_t mosi, uint8_t sck, uint8_t ss)
{
    Pin _miso(miso, INPUT);
    Pin _mosi(mosi, OUTPUT);
    Pin _sck(sck, OUTPUT);
    Pin ss_default(ss,OUTPUT);
    // Setting slaves
    Pin slave0(ss,OUTPUT);

    masterSPI_t data(_miso.getPINxAddr(),&_miso,&_mosi,&_sck,&ss_default);
    data.SS.pushRight(slave0);

    mSPIsetting_t settings(FOSC_BY_128, MSB_FIRST, LR_TF, LS_TP);

    data.settings = settings;

    this->master = new MasterSPI(data,settings);

    master->enable();
}
