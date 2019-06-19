#include "enc28j60.h"

/*
Enc28j60::Enc28j60(){

}

bool Enc28j60::init()
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
    _spi_selectBank(2);
    _spi_writeReg(ENC28J60_MACON4, ENC28J60_MACON4_REG::DEFER);

    // Set inter-frame gap (back-to-back)
    _spi_writeReg(ENC28J60_MABBIPG, self.fullDuplex ? 0x15 : 0x12);

    // Set inter-frame gap (non-back-to-back)
    _spi_writeReg(ENC28J60_MAIPGL,0x12);
    if(!self.fullDuplex)
        _spi_writeReg(ENC28J60_MAIPGH,0x0C);

    // Disable clock-out pin
    _spi_selectBank(3);
    _spi_writeReg(ENC28J60_ECOCON, CLKOUT_DISABLED);

    if(self.fullDuplex)
        _spi_writePhy(ENC28J60_PHY_REG::ENC28J60_PHCON1, ENC28J60_PHCON1_REG::PDPXMD);
    else
        _spi_writePhy(ENC28J60_PHY_REG::ENC28J60_PHCON2,ENC28J60_PHCON2_REG::HDLDIS);

    // Switch to bank 0
    _spi_selectBank(0);

}
#define TXSTART_INIT (0x1FFF-0x0600)
void Enc28j60::send(u8t *ptr, u16t len)
{
    while (_spi_readReg(ENC28J60_COM_BANK_REG::ENC28J60_ECON1) & TXRTS) {
        if(_spi_readReg(ENC28J60_COM_BANK_REG::ENC28J60_EIR) & TXERIF) {
            _spi_bitFieldSet(ENC28J60_COM_BANK_REG::ENC28J60_ECON1, TXRST);
            _spi_bitFieldClear(ENC28J60_COM_BANK_REG::ENC28J60_ECON1, TXRST);
        }
    }
    _spi_selectBank(0);
    _spi_writeReg(ENC28J60_EWRPTL, LO(TXSTART_INIT));
    _spi_writeReg(ENC28J60_EWRPTH, HI(TXSTART_INIT));
    _spi_writeReg(ENC28J60_ETXNDL,(TXSTART_INIT+len)&0xFF);
    _spi_writeReg(ENC28J60_ETXNDH,(TXSTART_INIT+len)>>8);

    _spi_writeBuffMemory(ptr, len);
    _spi_bitFieldSet(ENC28J60_COM_BANK_REG::ENC28J60_ECON1, TXRST);
}

u16t Enc28j60::readPhy(ENC28J60_PHY_REG address)
{
    return _spi_readPhy(address);
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
    master->enableSlave(0);
    u8t dummy = master->transfer(OPCODE_RBM);
    for(size_t i = 0; i < size; ++i){
        buff.push_back(master->transfer(0));
    }
    master->disableSlave(0);
}

void Enc28j60::_spi_writeBuffMemory(std::vector<uint8_t> &buff)
{
    master->enableSlave(0);
    u8t dummy = master->transfer(OPCODE_WBM);
    for(size_t i = 0; i < buff.size(); ++i){
        dummy = master->transfer(buff[i]);
    }
    master->disableSlave(0);
}

u16t Enc28j60::_spi_readPhy(ENC28J60_PHY_REG address)
{
    _spi_selectBank(2);
    _spi_writeReg(ENC28J60_MIREGADR, toU8(address));
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
    _spi_writeReg(ENC28J60_MIREGADR, toU8(address));
    _spi_writeReg(ENC28J60_MIRDL, LO(data));
    _spi_writeReg(ENC28J60_MIRDH, HI(data));
    while(_spi_readReg(ENC28J60_MISTAT) & BUSY) _delay_us(15);
}

void Enc28j60::_spi_writeBuffMemory(u8t *buff, u16t len)
{
    master->enableSlave(0);
    u8t dummy = master->transfer(OPCODE_WBM);
    for(size_t i = 0; i < len; ++i){
        dummy = master->transfer(buff[i]);
    }
    master->disableSlave(0);
}

void Enc28j60::_spi_bitFieldSet(uint8_t reg, uint8_t bit)
{
    _spi_writeOP(ENC28J60_ISA(bit << 8 | (OPCODE_BFS | reg)));
}

void Enc28j60::_spi_bitFieldClear(uint8_t reg, uint8_t bit)
{
    _spi_writeOP(ENC28J60_ISA(bit << 8 | (OPCODE_BFC | reg)));
}

void Enc28j60::setSPI(u8t miso, u8t mosi, u8t sck, u8t ss)
{
    master = new MasterSPI(miso, mosi, sck, ss);
}

bool Enc28j60::isLinkUp()
{
    if(_spi_readPhy(ENC28J60_PHY_REG::ENC28J60_PHSTAT2) & ENC28J60_PHSTAT2_REG::LSTAT){
        return true;
    }
    return false;
}

bool Enc28j60::getDuplexStatus()
{
    if(_spi_readPhy(ENC28J60_PHY_REG::ENC28J60_PHSTAT2) & ENC28J60_PHSTAT2_REG::DPXSTAT){
        return true;
    }
    return false;
}

bool Enc28j60::getPolarityStatus()
{
    if(_spi_readPhy(ENC28J60_PHY_REG::ENC28J60_PHSTAT2) & ENC28J60_PHSTAT2_REG::PLRITY){
        return true;
    }
    return false;
}

bool Enc28j60::setMAC(u8t *mac)
{
    return _spi_setMAC(mac);
}

bool Enc28j60::isReceivingData()
{
    if(_spi_readPhy(ENC28J60_PHY_REG::ENC28J60_PHSTAT2) & ENC28J60_PHSTAT2_REG::RXSTAT){
        return true;
    }
    return false;
}

bool Enc28j60::isTrasmittingData()
{
    if(_spi_readPhy(ENC28J60_PHY_REG::ENC28J60_PHSTAT2) & ENC28J60_PHSTAT2_REG::TXSTAT){
        return true;
    }
    return false;
}

bool Enc28j60::getCollisionStatus()
{
    if(_spi_readPhy(ENC28J60_PHY_REG::ENC28J60_PHSTAT2) & ENC28J60_PHSTAT2_REG::COLSTAT){
        return true;
    }
    return false;
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

bool Enc28j60::setMAC(std::vector<uint8_t> &mac)
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

bool Enc28j60::setMAC(const char *mac)
{
    macaddr_t temp = __inet_eth_aton(mac);
    return _spi_setMAC(temp._mac);
}
/*
std::vector<u8t> Enc28j60::getMAC()
{
    u8t arr[6];
    _spi_getMAC(arr);
    std::vector<u8t> vect;
    vect.insert(vect.begin(), arr, (arr + SIZE_OF_ARRAY(arr)));
    return vect;
}
*/

/*
void Enc28j60::getMAC(u8t *arr)
{
    _spi_getMAC(arr);
}

macaddr_t Enc28j60::getMAC()
{
    macaddr_t mac;
    _spi_getMAC(mac._mac);
    return mac;
}

bool Enc28j60::setMAC(macaddr_t mac)
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
    if(self.fullDuplex)
        _spi_bitFieldSet(ENC28J60_MACON3, PAD_FRAME_TO60B|TXCRCEN|FRMLNEN|FULDPX);
    else
        _spi_bitFieldSet(ENC28J60_MACON3, PAD_FRAME_TO60B|TXCRCEN|FRMLNEN);
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

void Enc28j60::receive(std::vector<u8t> &buff)
{
    _spi_readBuffMemory(buff,buff.size());
}
*/
