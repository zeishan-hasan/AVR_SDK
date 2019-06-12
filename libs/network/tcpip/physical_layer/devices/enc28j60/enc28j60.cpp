#include "enc28j60.h"


Enc28j60::Enc28j60(){

}

bool Enc28j60::init(std::string ip, std::vector<uint8_t> & mac)
{
    if (master->isInitilizedSPI() == false){
        setSPI(SPI_MISO, SPI_MOSI, SPI_SCK, SPI_SS);
    }
    reset();
    setMAC(mac);
    self.revisionID = _getRevisionID();
    self.fullDuplex =  true;
    initReceiveBuff();
    initTransmitBuff();

    // Bring MAC out of reset
    //writeReg(ENC28J60_MACON2,0x00);
    enableMacReceive();
    enableAutoPadCrc();

    // Sets MACON4 IEEE 802.3 conformance
    bitFieldSet(ENC28J60_MACON4,DEFER);

    // Set inter-frame gap (back-to-back)
    writeReg(ENC28J60_MABBIPG,self.fullDuplex ? 0x15 : 0x12);

    // Set inter-frame gap (non-back-to-back)
    writeReg(ENC28J60_MAIPGL,0x12);
    if(!self.fullDuplex)
        writeReg(ENC28J60_MAIPGH,0x0C);

    // Disable clock-out pin
    writeReg(ENC28J60_ECOCON, CLKOUT_DISABLED);

    // if(self.fullDuplex)
    //     _enc28j60_write_phy(ENC28J60_PHCON1,ENC28J60_PHCON1_PDPXMD);
    // else
    //     _enc28j60_write_phy(ENC28J60_PHCON2,ENC28J60_PHCON2_HDLDIS);

    // Switch to bank 0
    selectBank(0);

}

void Enc28j60::send()
{
    //master->enableSlave(0);
    //master->send(0x3A);
    //_delay_ms(1);
    //master->disableSlave(0);
}

uint8_t Enc28j60::readReg(uint8_t reg)
{
    return readOP(ENC28J60_ISA(OPCODE_RCR | reg));
}

void Enc28j60::writeReg(uint8_t reg, uint8_t data)
{
    writeOP(ENC28J60_ISA(data << 8 | (OPCODE_WCR | reg)));
}

void Enc28j60::readBuffMemory(std::vector<uint8_t> &buff, size_t size)
{
    for(size_t i = 0; i < size; ++i){
        buff.push_back(readOP(ENC28J60_ISA(OPCODE_RBM)));
    }
}

void Enc28j60::writeBuffMemory(std::vector<uint8_t> &buff)
{
    for(size_t i = 0; i < buff.size(); ++i){
        writeOP(ENC28J60_ISA((buff[i] << 8) | OPCODE_WBM));
    }
}

void Enc28j60::setSPI(uint8_t miso, uint8_t mosi, uint8_t sck, uint8_t ss)
{
    Pin _miso(miso, INPUT);
    Pin _mosi(mosi, OUTPUT);
    Pin _sck(sck, OUTPUT);
    Pin ss_default(ss,OUTPUT);
    // Setting slaves
    //Pin slave0(ss,OUTPUT);

    masterSPI_t data(_miso.getPINxAddr(),&_miso,&_mosi,&_sck,&ss_default);
    data.SS.push_back(ss_default);

    mSPIsetting_t settings(FOSC_BY_128, MSB_FIRST, LR_TF, LS_TP);

    data.settings = settings;

    this->master = new MasterSPI(data,settings);

    master->enable();
}

std::vector<uint8_t> Enc28j60::getMAC()
{
    std::vector<uint8_t> mac;
    selectBank(3);
    mac.push_back(readReg(ENC28J60_MAADR6));
    mac.push_back(readReg(ENC28J60_MAADR5));
    mac.push_back(readReg(ENC28J60_MAADR4));
    mac.push_back(readReg(ENC28J60_MAADR3));
    mac.push_back(readReg(ENC28J60_MAADR2));
    mac.push_back(readReg(ENC28J60_MAADR1));
    return mac;
}

void Enc28j60::setMAC(std::vector<uint8_t> &mac)
{
    selectBank(3);
    writeReg(ENC28J60_MAADR6, mac[0]);
    writeReg(ENC28J60_MAADR5, mac[1]);
    writeReg(ENC28J60_MAADR4, mac[2]);
    writeReg(ENC28J60_MAADR3, mac[3]);
    writeReg(ENC28J60_MAADR2, mac[4]);
    writeReg(ENC28J60_MAADR1, mac[5]);

}
void Enc28j60::writeOP(ENC28J60_ISA cmd)
{
    master->enableSlave(0);
    master->send(cmd.cmd.byte0.data);
    master->send(cmd.cmd.payload);
    master->disableSlave(0);
}

uint8_t Enc28j60::readOP(ENC28J60_ISA cmd)
{
    master->enableSlave(0);
    master->send(cmd.cmd.byte0.data);

    uint8_t data = master->sendReceive(0);
    if(cmd.cmd.byte0.data & 0x80){
        data = master->sendReceive(0);
    }

    master->disableSlave(0);
    return data;
}

void Enc28j60::selectBank(uint8_t bank)
{
    if(bank > 3){
        return;
    }

    writeReg(ENC28J60_ECON1, bank);
}

void Enc28j60::reset()
{
    writeOP(ENC28J60_ISA((0x00 << 8) | OPCODE_SRC));
    // Wait for the ENC28J60 to finish startup
    while(!(readReg(ENC28J60_COM_BANK_REG::ENC28J60_ESTAT) & CLKRDY));
}

void Enc28j60::initReceiveBuff()
{

    self.nextPacketPtr = ENC28J60_RX_BUFFER_START;
    writeReg(ENC28J60_ERXSTL,LO(ENC28J60_RX_BUFFER_START));
    writeReg(ENC28J60_ERXSTH,HI(ENC28J60_RX_BUFFER_START));
    writeReg(ENC28J60_ERXNDL,LO(ENC28J60_RX_BUFFER_END));
    writeReg(ENC28J60_ERXNDH,HI(ENC28J60_RX_BUFFER_END));
}

void Enc28j60::initTransmitBuff()
{
    writeReg(ENC28J60_ETXSTL,LO(ENC28J60_TX_BUFFER_START));
    writeReg(ENC28J60_ETXSTH,HI(ENC28J60_TX_BUFFER_START));
    writeReg(ENC28J60_ETXNDL,LO(ENC28J60_TX_BUFFER_END));
    writeReg(ENC28J60_ETXNDH,HI(ENC28J60_TX_BUFFER_END));
}

void Enc28j60::enableMacReceive()
{
    if(self.fullDuplex)
        writeReg(ENC28J60_BANK2_REG::ENC28J60_MACON1,MARXEN|TXPAUS|RXPAUS);
    else
        writeReg(ENC28J60_BANK2_REG::ENC28J60_MACON1,MARXEN);
}

void Enc28j60::enableAutoPadCrc()
{
    if(self.fullDuplex)
        bitFieldSet(ENC28J60_MACON3, PAD_FRAME_TO60B|TXCRCEN|FRMLNEN|FULDPX);
    else
        bitFieldSet(ENC28J60_MACON3, PAD_FRAME_TO60B|TXCRCEN|FRMLNEN);
}

void Enc28j60::setMaxPacketSize()
{
    // Set the maximum packet size which the controller will accept
    writeReg(ENC28J60_MAMXFLL,LO(ENC28J60_MAX_FRAMELENGTH));
    writeReg(ENC28J60_MAMXFLH,HI(ENC28J60_MAX_FRAMELENGTH));

}

uint8_t Enc28j60::_getRevisionID()
{

    return readReg(ENC28J60_EREVID);
}
