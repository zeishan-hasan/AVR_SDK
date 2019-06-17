#include "enc28j60.h"


Enc28j60::Enc28j60(){

}

bool Enc28j60::init(std::string ip, std::vector<uint8_t> & mac)
{
    if (master->isInitilizedSPI() == false){
        setSPI(SPI_MISO, SPI_MOSI, SPI_SCK, SPI_SS);
    }
    _spi_reset();
    //setMAC(mac);
    self.revisionID = _spi_getRevisionID();
    self.fullDuplex =  true;
    _spi_initReceiveBuff();
    _spi_initTransmitBuff();

    // Bring MAC out of reset
    //writeReg(ENC28J60_MACON2,0x00);
    _spi_enableMacReceive();
    _spi_enableAutoPadCrc();

    // Sets MACON4 IEEE 802.3 conformance
    //bitFieldSet(ENC28J60_MACON4,DEFER);

    // Set inter-frame gap (back-to-back)
    _spi_writeReg(ENC28J60_MABBIPG,self.fullDuplex ? 0x15 : 0x12);

    // Set inter-frame gap (non-back-to-back)
    _spi_writeReg(ENC28J60_MAIPGL,0x12);
    if(!self.fullDuplex)
        _spi_writeReg(ENC28J60_MAIPGH,0x0C);

    // Disable clock-out pin
    _spi_writeReg(ENC28J60_ECOCON, CLKOUT_DISABLED);

    // if(self.fullDuplex)
    //     _enc28j60_write_phy(ENC28J60_PHCON1,ENC28J60_PHCON1_PDPXMD);
    // else
    //     _enc28j60_write_phy(ENC28J60_PHCON2,ENC28J60_PHCON2_HDLDIS);

    // Switch to bank 0
    _spi_selectBank(0);

}

void Enc28j60::send()
{
    //master->enableSlave(0);
    //master->send(0x3A);
    //_delay_ms(1);
    //master->disableSlave(0);
}

u8t Enc28j60::_spi_readReg(u8t reg)
{
    return _spi_readOP(ENC28J60_ISA(OPCODE_RCR | reg));
}

void Enc28j60::_spi_writeReg(uint8_t reg, uint8_t data)
{
    _spi_writeOP(ENC28J60_ISA(data << 8 | (OPCODE_WCR | reg)));
}

void Enc28j60::_spi_readBuffMemory(std::vector<uint8_t> &buff, size_t size)
{
    for(size_t i = 0; i < size; ++i){
        buff.push_back(_spi_readOP(ENC28J60_ISA(OPCODE_RBM)));
    }
}

void Enc28j60::_spi_writeBuffMemory(std::vector<uint8_t> &buff)
{
    for(size_t i = 0; i < buff.size(); ++i){
        _spi_writeOP(ENC28J60_ISA((buff[i] << 8) | OPCODE_WBM));
    }
}

u16t Enc28j60::_spi_readPhy(ENC28J60_PHY_REG address)
{
    _spi_selectBank(2);
    _spi_writeReg(ENC28J60_MIREGADR, address);
    _spi_writeReg(ENC28J60_MICMD,MIIRD);
    _delay_us(15);
    _spi_selectBank(3);
    while(_spi_readReg(ENC28J60_MISTAT) & BUSY);
    _spi_selectBank(2);
    _spi_writeReg(ENC28J60_MICMD, CLEAR);
    return( (_spi_readReg(ENC28J60_MIRDH) << 8) | _spi_readReg(ENC28J60_MIRDL));
}

void Enc28j60::_spi_writePhy(ENC28J60_PHY_REG address, u16t data)
{
    _spi_selectBank(2);
    _spi_writeReg(ENC28J60_MIREGADR, address);
    _spi_writeReg(ENC28J60_MIRDL, LO(data));
    _spi_writeReg(ENC28J60_MIRDH, HI(data));
     while(ENC28J60_Read(ENC28J60_MISTAT) & BUSY) _delay_us(15);
}

void Enc28j60::setSPI(u8t miso, u8t mosi, u8t sck, u8t ss)
{
    master = new MasterSPI(miso, mosi, sck, ss);
}

void Enc28j60::_spi_getMAC(u8t *arr){
    _spi_selectBank(3);
    arr[0] = _spi_readReg(ENC28J60_MAADR6);
    arr[1] = _spi_readReg(ENC28J60_MAADR5);
    arr[2] = _spi_readReg(ENC28J60_MAADR4);
    arr[3] = _spi_readReg(ENC28J60_MAADR3);
    arr[4] = _spi_readReg(ENC28J60_MAADR2);
    arr[5] = _spi_readReg(ENC28J60_MAADR1);
}

bool Enc28j60::_spi_setMAC(std::vector<uint8_t> &mac)
{
    return _spi_setMAC(mac.begin());
}

bool Enc28j60::_spi_setMAC(u8t *mac)
{
    _spi_selectBank(3);
    _spi_writeReg(ENC28J60_MAADR6, mac[0]);
    _spi_writeReg(ENC28J60_MAADR5, mac[1]);
    _spi_writeReg(ENC28J60_MAADR4, mac[2]);
    _spi_writeReg(ENC28J60_MAADR3, mac[3]);
    _spi_writeReg(ENC28J60_MAADR2, mac[4]);
    _spi_writeReg(ENC28J60_MAADR1, mac[5]);
    u8t tmp[MACADDR_N_OCTECTS];
    _spi_getMAC(tmp);
    if(memcmp(tmp, mac, MACADDR_N_OCTECTS) == 0){
        return true;
    }
    return false;
}

bool Enc28j60::_spi_setMAC(const char *mac)
{
    macaddr_t temp = __inet_eth_aton(mac);
    return _spi_setMAC(temp._mac);
}

bool Enc28j60::_spi_setMAC(macaddr_t mac)
{
    return _spi_setMAC(mac._mac);
}
void Enc28j60::_spi_writeOP(ENC28J60_ISA cmd)
{
    master->enableSlave(0);
    u8t dummy = master->transfer(cmd.cmd.byte0.data);
    dummy = master->transfer(cmd.cmd.payload);
    master->disableSlave(0);
}

uint8_t Enc28j60::_spi_readOP(ENC28J60_ISA cmd)
{
    master->enableSlave(0);
    u8t dummy = master->transfer(cmd.cmd.byte0.data);

    uint8_t data = master->sendReceive(0);
    if(cmd.cmd.byte0.data & 0x80){
        data = master->sendReceive(0);
    }

    master->disableSlave(0);
    return data;
}

void Enc28j60::_spi_selectBank(uint8_t bank)
{
    if(bank > 3){
        return;
    }

    _spi_writeReg(ENC28J60_ECON1, bank);
}

void Enc28j60::_spi_reset()
{
    _spi_writeOP(ENC28J60_ISA((0x00 << 8) | OPCODE_SRC));
    // Wait for the ENC28J60 to finish startup
    while(!(_spi_readReg(ENC28J60_COM_BANK_REG::ENC28J60_ESTAT) & CLKRDY));
}

void Enc28j60::_spi_initReceiveBuff()
{

    self.nextPacketPtr = ENC28J60_RX_BUFFER_START;
    _spi_writeReg(ENC28J60_ERXSTL,LO(ENC28J60_RX_BUFFER_START));
    _spi_writeReg(ENC28J60_ERXSTH,HI(ENC28J60_RX_BUFFER_START));
    _spi_writeReg(ENC28J60_ERXNDL,LO(ENC28J60_RX_BUFFER_END));
    _spi_writeReg(ENC28J60_ERXNDH,HI(ENC28J60_RX_BUFFER_END));
}

void Enc28j60::_spi_initTransmitBuff()
{
    _spi_writeReg(ENC28J60_ETXSTL,LO(ENC28J60_TX_BUFFER_START));
    _spi_writeReg(ENC28J60_ETXSTH,HI(ENC28J60_TX_BUFFER_START));
    _spi_writeReg(ENC28J60_ETXNDL,LO(ENC28J60_TX_BUFFER_END));
    _spi_writeReg(ENC28J60_ETXNDH,HI(ENC28J60_TX_BUFFER_END));
}

void Enc28j60::_spi_enableMacReceive()
{
    if(self.fullDuplex)
        _spi_writeReg(ENC28J60_BANK2_REG::ENC28J60_MACON1,MARXEN|TXPAUS|RXPAUS);
    else
        _spi_writeReg(ENC28J60_BANK2_REG::ENC28J60_MACON1,MARXEN);
}

void Enc28j60::_spi_enableAutoPadCrc()
{
    //if(self.fullDuplex)
    //    _spi_bitFieldSet(ENC28J60_MACON3, PAD_FRAME_TO60B|TXCRCEN|FRMLNEN|FULDPX);
    //else
    //    _spi_bitFieldSet(ENC28J60_MACON3, PAD_FRAME_TO60B|TXCRCEN|FRMLNEN);
}

void Enc28j60::_spi_setMaxPacketSize()
{
    // Set the maximum packet size which the controller will accept
    _spi_writeReg(ENC28J60_MAMXFLL,LO(ENC28J60_MAX_FRAMELENGTH));
    _spi_writeReg(ENC28J60_MAMXFLH,HI(ENC28J60_MAX_FRAMELENGTH));

}

u8t Enc28j60::_spi_getRevisionID()
{

    return _spi_readReg(ENC28J60_EREVID);
}
