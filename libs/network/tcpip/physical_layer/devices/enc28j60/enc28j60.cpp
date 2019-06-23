#include "enc28j60.h"

Enc28j60::Enc28j60()
{

}

void Enc28j60::init()
{
    if (_spi->isInitilizedSPI() == false){
        setSPI(DEF_SPI_MISO, DEF_SPI_MOSI, DEF_SPI_SCK, DEF_SPI_SS);
    }
    _spi_reset();

}

void Enc28j60::setSPI(u8t miso, u8t mosi, u8t sck, u8t ss)
{
    _spi = new MasterSPI(miso, mosi, sck, ss);
}





//---- Private Methods ----//

//---- Raw Methods ----//
u8t Enc28j60::_spi_readControlReg(ENC28J60_REGS reg)
{
    _spi_selectBank(HI(reg));
    return _spi_readOpcode(SPI_OPCODE_RCR | LO(reg));
}

void Enc28j60::_spi_writeControlReg(ENC28J60_REGS reg, u8t data)
{
    _spi_selectBank(HI(reg));
    _spi_writeOpCode(SPI_OPCODE_WCR | LO(reg), &data, 1);
}

void Enc28j60::_spi_selectBank(u8t bank)
{
    if(bank > 3 || _self.currentBank == bank){
        return;
    }

    _self.currentBank = bank;
    _spi_writeControlReg(REG_ECON1, bank);
}

void Enc28j60::_spi_writeOpCode(u8t reg, u8t *buff, size_t size)
{
    _spi->enableSlave(0);

    u8t dummy = _spi->transfer(reg);
    if(buff != nullptr){
        for(size_t i = 0; i < size; ++i){
            dummy = _spi->transfer(*buff++);
        }
    }
    _spi->disableSlave(0);
}

u8t Enc28j60::_spi_readOpcode(u8t reg)
{
    _spi->enableSlave(0);
    u8t data = _spi->transfer(reg);

    data = _spi->transfer(0);
    if(reg & 0x80){
        data = _spi->transfer(0);
    }
    _spi->disableSlave(0);
    return data;
}

u16t Enc28j60::_spi_readPhy(ENC28J60_PHY_REG reg)
{
    _spi_writeControlReg(REG_MIREGADR, reg);
    _spi_writeControlReg(REG_MICMD, regBitToValue(ENC28J60_MICMD_REG_BIT::MIIRD));
    _delay_us(15);
    while(_spi_readControlReg(REG_MISTAT) & regBitToValue(ENC28J60_MISTAT_REG_BIT::BUSY));
    _spi_writeControlReg(REG_MICMD, 0x00);

    return (_spi_readControlReg(REG_MIRDH) << 8) | _spi_readControlReg(REG_MIRDL);
}

void Enc28j60::_spi_writePhy(ENC28J60_PHY_REG reg, u16t data)
{

    _spi_writeControlReg(REG_MIREGADR, reg);
    _spi_writeControlReg(REG_MIRDL, LO(data));
    _spi_writeControlReg(REG_MIRDH, HI(data));
    while(_spi_readControlReg(REG_MISTAT) & regBitToValue(ENC28J60_MISTAT_REG_BIT::BUSY)) _delay_us(15);
}

void Enc28j60::_spi_bitFieldSet(u8t reg, u8t data)
{
    _spi_selectBank(HI(reg));
    _spi_writeOpCode(SPI_OPCODE_BFS | LO(reg), &data, 1);
}

void Enc28j60::_spi_bitFieldClear(u8t reg, u8t data)
{
    _spi_selectBank(HI(reg));
    _spi_writeOpCode(SPI_OPCODE_BFC | LO(reg), &data, 1);
}

void Enc28j60::_spi_reset()
{
    _spi_writeOpCode(SPI_OPCODE_SRC, nullptr, 0);
    // Wait for the ENC28J60 to finish startup
    while(!(_spi_readControlReg(REG_ESTAT)) & regBitToValue(ENC28J60_ESTAT_REG_BIT::CLKRDY));
}

//---- End Raw Methods ----//


//---- Complex Methods ----//
void Enc28j60::_spi_setRxBufferSize(u16t size)
{
    if(size){
        _self.rxBuffEnd = size;
    }
    _spi_writeControlReg(REG_ERXSTH, HI(_self.rxBuffStart));
    _spi_writeControlReg(REG_ERXSTL, LO(_self.rxBuffEnd));

    _spi_writeControlReg(REG_ERXNDH, HI(_self.rxBuffEnd));
    _spi_writeControlReg(REG_ERXNDL, LO(_self.rxBuffEnd));
}

u16t Enc28j60::_spi_getRxBufferSize()
{
    return (_spi_readControlReg(REG_ERXNDH) << 8) | _spi_readControlReg(REG_ERXNDL);
}

void Enc28j60::_spi_setTxBufferSize(u16t size)
{
    _self.txBuffStart = _self.rxBuffEnd + 1;
    if(size){
        _self.txBuffEnd = _self.txBuffStart + size;
        if(_self.txBuffEnd > ENC28J60_TX_BUFFER_END){
            _self.txBuffEnd = ENC28J60_TX_BUFFER_END;
        }
    }
    else {
        _self.txBuffEnd = ENC28J60_TX_BUFFER_END;
    }

    _spi_writeControlReg(REG_ETXSTH, HI(_self.txBuffStart));
    _spi_writeControlReg(REG_ETXSTL, LO(_self.txBuffEnd));

    _spi_writeControlReg(REG_ETXNDH, HI(_self.txBuffEnd));
    _spi_writeControlReg(REG_ETXNDL, LO(_self.txBuffEnd));
}

u16t Enc28j60::_spi_getTxBufferSize()
{
    return (_spi_readControlReg(REG_ETXNDH) << 8) | _spi_readControlReg(REG_ETXNDL);
}

void Enc28j60::_spi_setMAC(u8t *mac)
{
    for(u8t i = 0; i < 6; ++i){
        if(mac[i] == nullptr){
            return;
        }
    }
    _spi_writeControlReg(REG_MAADR6, mac[0]);
    _spi_writeControlReg(REG_MAADR5, mac[1]);
    _spi_writeControlReg(REG_MAADR4, mac[2]);
    _spi_writeControlReg(REG_MAADR3, mac[3]);
    _spi_writeControlReg(REG_MAADR2, mac[4]);
    _spi_writeControlReg(REG_MAADR1, mac[5]);
}

void Enc28j60::_spi_getMAC(u8t *arr)
{
    arr[0] = _spi_readControlReg(REG_MAADR6);
    arr[1] = _spi_readControlReg(REG_MAADR5);
    arr[2] = _spi_readControlReg(REG_MAADR4);
    arr[3] = _spi_readControlReg(REG_MAADR3);
    arr[4] = _spi_readControlReg(REG_MAADR2);
    arr[5] = _spi_readControlReg(REG_MAADR1);
}


