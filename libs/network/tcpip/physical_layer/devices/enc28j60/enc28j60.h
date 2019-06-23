#ifndef ENC28J60_H
#define ENC28J60_H
#include <spimaster.h>
#include <string>
#include <macros.h>
#include <net_utils.h>
#include <serial.h>
///@file


/**
 * @brief The ENC28J06_ECOCON_REG_BIT enum.
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=8'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_ECOCON_REG_BIT{
    COCON0, /*!< Read & Write | Default = 0 */
    COCON1, /*!< Read & Write | Default = 0 */
    COCON2  /*!< Read & Write | Default = 0 */
};

/**
 * @brief The ENC28J60_ECOCON_REG enum.
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=8'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_ECOCON_REG_CFG {
    CLKOUT_DISABLED,
    CLKOUT_DIVIDED_BY_1 = regBitToValue(ENC28J60_ECOCON_REG_BIT::COCON0),
    CLKOUT_DIVIDED_BY_2 = regBitToValue(ENC28J60_ECOCON_REG_BIT::COCON1),
    CLKOUT_DIVIDED_BY_3 = regBitToValue(ENC28J60_ECOCON_REG_BIT::COCON1) | regBitToValue(ENC28J60_ECOCON_REG_BIT::COCON0),
    CLKOUT_DIVIDED_BY_4 = regBitToValue(ENC28J60_ECOCON_REG_BIT::COCON2),
    CLKOUT_DIVIDED_BY_8 = regBitToValue(ENC28J60_ECOCON_REG_BIT::COCON2) | regBitToValue(ENC28J60_ECOCON_REG_BIT::COCON0)
};


/**
 * @brief The ENC28J60_PHLCON_REG_BIT enum.
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=11'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_PHLCON_REG_BIT {
    STRCH  =  1, /*!< Read & Write | Default = 1 */
    LFRQ0  =  2, /*!< Read & Write | Default = 0 */
    LFRQ1  =  3, /*!< Read & Write | Default = 0 */
    LBCFG0 =  4, /*!< Read & Write | Default = 0 */
    LBCFG1 =  5, /*!< Read & Write | Default = 1 */
    LBCFG2 =  6, /*!< Read & Write | Default = 0 */
    LBCFG3 =  7, /*!< Read & Write | Default = 0 */
    LACFG0 =  8, /*!< Read & Write | Default = 0 */
    LACFG1 =  9, /*!< Read & Write | Default = 0 */
    LACFG2 = 10, /*!< Read & Write | Default = 1 */
    LACFG3 = 11  /*!< Read & Write | Default = 0 */
};

/**
 * @brief The ENC28J60_PHLCON_REG_CFG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=11'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_PHLCON_REG_CFG {
    STRETCH_LED_EVENTS_BY_TNSTRCH                       = (0x00 << 2),
    STRETCH_LED_EVENTS_BY_TMSTRCH                       = (0x01 << 2),
    STRETCH_LED_EVENTS_BY_TLSTRCH                       = (0x10 << 2),
    LEDB_DISPLAY_TRANSMIT_ACTIVITY                      = (0x01 << 4),
    LEDB_DISPLAY_RECEIVE_ACTIVITY                       = (0x02 << 4),
    LEDB_DISPLAY_COLLISION_ACTIVITY                     = (0x03 << 4),
    LEDB_DISPLAY_LINK_STATUS                            = (0x04 << 4),
    LEDB_DISPLAY_DUPLEX_STATUS                          = (0x05 << 4),
    LEDB_DISPLAY_TRANSMIT_RECEIVE_ACTIVITY              = (0x07 << 4),
    LEDB_ON                                             = (0x08 << 4),
    LEDB_OFF                                            = (0x09 << 4),
    LEDB_BLINK_FAST                                     = (0x0A << 4),
    LEDB_BLINK_SLOW                                     = (0x0B << 4),
    LEDB_DISPLAY_LINK_STATUS_RECEIVE_ACTIVITY           = (0x0C << 4),
    LEDB_DISPLAY_LINK_STATUS_TRANSMIT_RECEIVE_ACTIVITY  = (0x0D << 4),
    LEDB_DISPLAY_DUPLEX_STATUS_COLLISION_ACTIVITY       = (0x0E << 4),
    LEDA_DISPLAY_TRANSMIT_ACTIVITY                      = (0x01 << 8),
    LEDA_DISPLAY_RECEIVE_ACTIVITY                       = (0x02 << 8),
    LEDA_DISPLAY_COLLISION_ACTIVITY                     = (0x03 << 8),
    LEDA_DISPLAY_LINK_STATUS                            = (0x04 << 8),
    LEDA_DISPLAY_DUPLEX_STATUS                          = (0x05 << 8),
    LEDA_DISPLAY_TRANSMIT_RECEIVE_ACTIVITY              = (0x07 << 8),
    LEDA_ON                                             = (0x08 << 8),
    LEDA_OFF                                            = (0x09 << 8),
    LEDA_BLINK_FAST                                     = (0x0A << 8),
    LEDA_BLINK_SLOW                                     = (0x0B << 8),
    LEDA_DISPLAY_LINK_STATUS_RECEIVE_ACTIVITY           = (0x0C << 8),
    LEDA_DISPLAY_LINK_STATUS_TRANSMIT_RECEIVE_ACTIVITY  = (0x0D << 8),
    LEDA_DISPLAY_DUPLEX_STATUS_COLLISION_ACTIVITY       = (0x0E << 8)
};

/**
 * @brief The ENC28J60_ECON1_REG_BIT enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=17'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_ECON1_REG_BIT {
    BSEL0, /*!< Read & Write | Default  = 0 */
    BSEL1, /*!< Read & Write | Default  = 0 */
    RXEN,  /*!< Read & Write | Default  = 0 */
    TXRTS, /*!< Read & Write | Default  = 0 */
    CSUMEN,/*!< Read & Write | Default  = 0 */
    DMAST, /*!< Read & Write | Default  = 0 */
    RXRST, /*!< Read & Write | Default  = 0 */
    TXRST  /*!< Read & Write | Default  = 0 */
};
/**
 * @brief The ENC28J60_ECON1_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=17'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_ECON1_REG_CFG {
    SPI_BANK0,
    SPI_BANK1,
    SPI_BANK2,
    SPI_BANK3,
    RXEN   = (1 << 2),
    TXRTS  = (1 << 3),
    CSUMEN = (1 << 4),
    DMAST  = (1 << 5),
    RXRST  = (1 << 6),
    TXRST  = (1 << 7)

};

/**
 * @brief The ENC28J60_ECON2_REG_BIT enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=18'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_ECON2_REG_BIT {
    VRPS    = 3, /*!< Read & Write | Default  = 0 */
    PWRSV   = 5, /*!< Read & Write | Default  = 0 */
    PKTDEC  = 6, /*!< Read & Write | Default  = 0 */
    AUTOINC = 7  /*!< Read & Write | Default  = 1 */
};

/**
 * @brief The ENC28J60_ECON2_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=18'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_ECON2_REG_CFG {
    VRPS    = (1 << 3),
    PWRSV   = (1 << 5),
    PKTDEC  = (1 << 6),
    AUTOINC = (1 << 7)
};

/**
 * @brief The ENC28J60_MICMD_REG_BIT enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=23'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_MICMD_REG_BIT {
    MIIRD,   /*!< Read & Write | Default  = 0 */
    MIISCAN  /*!< Read & Write | Default  = 0 */
};


/**
 * @brief The ENC28J60_MISTAT_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=23'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_MISTAT_REG_BIT {
    BUSY,  /*!< Read Only | Default  = 0 */
    SCAN,  /*!< Read Only | Default  = 0 */
    NVALID /*!< Read Only | Default  = 0 */
};


/**
 * @brief The ENC28J60_PHSTAT1_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=25'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_PHSTAT1_REG_BIT {
    JBSTAT  = 1,  /*!< Read & Latches High  | Default  = 0 */
    LLSTAT  = 2,  /*!< Read & Latches Low   | Default  = 0 */
    PHDPX   = 11, /*!< Read Only            | Default  = 1 */
    PFDPX   = 12  /*!< Read Only            | Default  = 1 */
};


/**
 * @brief The ENC28J60_PHSTAT2_REG_BIT enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=26'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_PHSTAT2_REG_BIT {
    PLRITY  = 5,  /*!< Read Only | Default  = 0 */
    DPXSTAT = 9,  /*!< Read Only | Default  = Unknown */
    LSTAT   = 10, /*!< Read Only | Default  = 0 */
    COLSTAT = 11, /*!< Read Only | Default  = 0 */
    RXSTAT  = 12, /*!< Read Only | Default  = 0 */
    TXSTAT  = 13  /*!< Read Only | Default  = 0 */
};

/**
 * @brief The ENC28J60_SPI_OPCODE enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=28'>Enc28j60 Datasheet</a>
 */
enum ENC28J60_SPI_OPCODE {
    SPI_OPCODE_RCR = 0x00,    /*!< Read Control Register*/
    SPI_OPCODE_RBM = 0x3A,    /*!< Read Buffer Memory*/
    SPI_OPCODE_WCR = 0x40,    /*!< Write Control Register */
    SPI_OPCODE_WBM = 0x7A,    /*!< Write Buffer Memory */
    SPI_OPCODE_BFS = 0x80,    /*!< Bit Field Set */
    SPI_OPCODE_BFC = 0xA0,    /*!< Bit Field Clear */
    SPI_OPCODE_SRC = 0xFF     /*!< System Reset Command (Soft Reset) */
};


/**
 * @brief The ENC28J60_ISA struct
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=28'>Enc28j60 Datasheet</a>
 */
struct ENC28J60_ISA
{
    ENC28J60_ISA(uint16_t packet = 0) {
        this->packet = packet;
    }

    union {
        struct
        {
            union {
                struct
                {
                    uint8_t opcode:3;
                    uint8_t argument:5;
                } fields;
                uint8_t data;
            } byte0;

            uint8_t payload;
        } cmd;

        uint16_t packet;

    };
};





/**
 * @brief The ENC28J60_COM_BANK_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=14'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_COM_BANK_REG {
    EIE     = 0x1B,
    EIR     = 0x1C,
    ESTAT   = 0x1D,
    ECON2   = 0x1E,
    ECON1   = 0x1F
};


/**
 * @brief The ENC28J60_BANK0_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=14'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_BANK0_REG {
    ERDPTL    = 0x00,
    ERDPTH    = 0x01,
    EWRPTL    = 0x02,
    EWRPTH    = 0x03,
    ETXSTL    = 0x04,
    ETXSTH    = 0x05,
    ETXNDL    = 0x06,
    ETXNDH    = 0x07,
    ERXSTL    = 0x08,
    ERXSTH    = 0x09,
    ERXNDL    = 0x0A,
    ERXNDH    = 0x0B,
    ERXRDPTL  = 0x0C,
    ERXRDPTH  = 0x0D,
    ERXWRPTL  = 0x0E,
    ERXWRPTH  = 0x0F,
    EDMASTL   = 0x10,
    EDMASTH   = 0x11,
    EDMANDL   = 0x12,
    EDMANDH   = 0x13,
    EDMADSTL  = 0x14,
    EDMADSTH  = 0x15,
    EDMACSL   = 0x16,
    EDMACSH   = 0x17
};

/**
 * @brief The ENC28J60_BANK1_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=14'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_BANK1_REG {
    EHT0    = 0x00,
    EHT1    = 0x01,
    EHT2    = 0x02,
    EHT3    = 0x03,
    EHT4    = 0x04,
    EHT5    = 0x05,
    EHT6    = 0x06,
    EHT7    = 0x07,
    EPMM0   = 0x08,
    EPMM1   = 0x09,
    EPMM2   = 0x0A,
    EPMM3   = 0x0B,
    EPMM4   = 0x0C,
    EPMM5   = 0x0D,
    EPMM6   = 0x0E,
    EPMM7   = 0x0F,
    EPMCSL  = 0x10,
    EPMCSH  = 0x11,
    EPMOL   = 0x12,
    EPMOH   = 0x13,
    EWOLIE  = 0x14,
    EWOLIR  = 0x15,
    ERXFCON = 0x16,
    EPKTCNT = 0x17
};

/**
 * @brief The ENC28J60_BANK2_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=14'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_BANK2_REG {
    MACON1     = 0x00,
    MACON3     = 0x02,
    MACON4     = 0x03,
    MABBIPG    = 0x04,
    MAIPGL     = 0x06,
    MAIPGH     = 0x07,
    MACLCON1   = 0x08,
    MACLCON2   = 0x09,
    MAMXFLL    = 0x0A,
    MAMXFLH    = 0x0B,
    MICMD      = 0x12,
    MIREGADR   = 0x14,
    MIWRL      = 0x16,
    MIWRH      = 0x17,
    MIRDL      = 0x18,
    MIRDH      = 0x19,
};


/**
 * @brief The ENC28J60_BANK3_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=14'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_BANK3_REG {
    MAADR5  = 0x00,
    MAADR6  = 0x01,
    MAADR3  = 0x02,
    MAADR4  = 0x03,
    MAADR1  = 0x04,
    MAADR2  = 0x05,
    EBSTSD  = 0x06,
    EBSTCON = 0x07,
    EBSTCSL = 0x08,
    EBSTCSH = 0x09,
    MISTAT  = 0x0A,
    EREVID  = 0x12,
    ECOCON  = 0x15,
    EFLOCON = 0x17,
    EPAUSL  = 0x18,
    EPAUSH  = 0x19
};


/**
 * @brief The ENC28J60_PHY_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=22'>Enc28j60 Datasheet</a>
 */
enum ENC28J60_PHY_REG {
    REG_PHCON1  = 0x00,
    REG_PHSTAT1 = 0x01,
    REG_PHID1   = 0x02,
    REG_PHID2   = 0x03,
    REG_PHCON2  = 0x10,
    REG_PHSTAT2 = 0x11,
    REG_PHIE    = 0x12,
    REG_PHIR    = 0x13,
    REG_PHLCON  = 0x14,
};

/**
 * @brief The ENC28J60_MACON1_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=36'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_MACON1_REG_BIT {
    MARXEN , /*!< Read & Write | Default  = 0 */
    PASSALL, /*!< Read & Write | Default  = 0 */
    RXPAUS , /*!< Read & Write | Default  = 0 */
    TXPAUS   /*!< Read & Write | Default  = 0 */
};

/**
 * @brief The ENC28J60_MACON3_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=37'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_MACON3_REG_BIT {
    FULDPX,  /*!< Read & Write | Default  = 0 */
    FRMLNEN, /*!< Read & Write | Default  = 0 */
    HFRMEN,  /*!< Read & Write | Default  = 0 */
    PHDREN,  /*!< Read & Write | Default  = 0 */
    TXCRCEN, /*!< Read & Write | Default  = 0 */
    PADCFG0, /*!< Read & Write | Default  = 0 */
    PADCFG1, /*!< Read & Write | Default  = 0 */
    PADCFG2  /*!< Read & Write | Default  = 0 */
};

/**
 * @brief The ENC28J60_MACON3_REG_CFG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=37'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_MACON3_REG_CFG {
    PAD_FRAME_TO60B     = (1 << 5),
    NO_AUTOPAD          = (2 << 5),
    PAD_FRAME_TO64B     = (3 << 5),
    AUTO_DETECT_VLAN    = (5 << 5),
};

/**
 * @brief The ENC28J60_MACON4_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=38'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_MACON4_REG_BIT {
    NOBKOFF = 4, /*!< Read & Write | Default  = 0 */
    BPEN    = 5, /*!< Read & Write | Default  = 0 */
    DEFER   = 6  /*!< Read & Write | Default  = 0 */
};

/**
 * @brief The ENC28J60_MBBIPG_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=38'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_MBBIPG_REG_BIT {
    BBIPG0, /*!< Read & Write | Default  = 0 */
    BBIPG1, /*!< Read & Write | Default  = 0 */
    BBIPG2, /*!< Read & Write | Default  = 0 */
    BBIPG3, /*!< Read & Write | Default  = 0 */
    BBIPG4, /*!< Read & Write | Default  = 0 */
    BBIPG5, /*!< Read & Write | Default  = 0 */
    BBIPG6  /*!< Read & Write | Default  = 0 */
};

/**
 * @brief The ENC28J60_MBBIPG_REG_BIT enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=38'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_MBBIPG_REG_CFG {
    WITH_FULDX_OFF = 0x12,
    WITH_FULDX_ON = 0x15
};

/**
 * @brief The ENC28J60_PHCON2_REG_BIT enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=39'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_PHCON2_REG_BIT {
    HDLDIS  = 8,  /*!< Read & Write | Default  = 0 */
    JABBER  = 10, /*!< Read & Write | Default  = 0 */
    TXDIS   = 13, /*!< Read & Write | Default  = 0 */
    FRCLNK  = 14  /*!< Read & Write | Default  = 0 */
};

/**
 * @brief The ENC28J60_ERXFCON_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=50'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_ERXFCON_REG_BIT {
    BCEN,  /*!< Read & Write | Default  = 1 */
    MCEN,  /*!< Read & Write | Default  = 0 */
    HTEN,  /*!< Read & Write | Default  = 0 */
    MPEN,  /*!< Read & Write | Default  = 0 */
    PMEN,  /*!< Read & Write | Default  = 0 */
    CRCEN, /*!< Read & Write | Default  = 1 */
    ANDOR, /*!< Read & Write | Default  = 0 */
    UCEN   /*!< Read & Write | Default  = 1 */
};

/**
 * @brief The ENC28J60_EFLOCON_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=58'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_EFLOCON_REG_BIT {
    FCEN0,  /*!< Read & Write | Default  = 0 */
    FCEN1,  /*!< Read & Write | Default  = 0 */
    FULDPXS /*!< Read Only    | Default  = 0 */
};

/**
 * @brief The ENC28J60_PHCON1_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=63'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_PHCON1_REG_BIT {
    PDPXMD  =   8, /*!< Read & Write | Default  = 0 */
    PPWRSV  =  11, /*!< Read & Write | Default  = 0 */
    PLOOPBK =  14, /*!< Read & Write | Default  = 0 */
    PRST    =  15  /*!< Read & Write | Default  = 0 */
};

/**
 * @brief The ENC28J60_ESTAT_REG_BIT enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=66'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_ESTAT_REG_BIT {
    CLKRDY  = 0,  /*!< Read & Write      | Default = 0 */
    TXABRT  = 1,  /*!< Read & Clearable  | Default = 0 */
    RXBUSY  = 2,  /*!< Read Only         | Default = 0 */
    LATECOL = 4,  /*!< Read & Clearable  | Default = 0 */
    BUFER   = 6,  /*!< Read & Clearable  | Default = 0 */
    INT     = 7   /*!< Read Only         | Default = 0 */
};

/**
 * @brief The ENC28J60_EIE_REG_BIT enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=67'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_EIE_REG_BIT {
    RXERIE  = 0, /*!< Read  & Write | Default = 0 */
    TXERIE  = 1, /*!< Read  & Write | Default = 0 */
    TXIE    = 3, /*!< Read  & Write | Default = 0 */
    LINKIE  = 4, /*!< Read  & Write | Default = 0 */
    DMAIE   = 5, /*!< Read  & Write | Default = 0 */
    PKTIE   = 6, /*!< Read  & Write | Default = 0 */
    INTIE   = 7  /*!< Read  & Write | Default = 0 */
};

/**
 * @brief The ENC28J60_EIR enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=68'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_EIR_REG_BIT {
    RXERIF  = 0, /*!< Read & Clearable  | Default = 0 */
    TXERIF  = 1, /*!< Read & Clearable  | Default = 0 */
    TXIF    = 3, /*!< Read & Clearable  | Default = 0 */
    LINKIF  = 4, /*!< Read Only         | Default = 0 */
    DMAIF   = 5, /*!< Read & Clearable  | Default = 0 */
    PKTIF   = 6, /*!< Read Only         | Default = 0 */
};

/**
 * @brief The ENC28J60_PHIE enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=69'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_PHIE_REG_BIT {
    PGEIE  = 1, /*!< Read & Write | Default = 0 */
    PLNKIE = 4  /*!< Read & Write | Default = 0 */
};

/**
 * @brief The ENC28J60_PHIR_REG_BIT enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=69'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_PHIR_REG_BIT {
    PGIF    =  2, /*!< Read & Self Clearing | Default = 0*/
    PLNKIF  =  4  /*!< Read & Self Clearing | Default = 0*/
};

/**
 * @brief The ENC28J60_EBSTCON_REG_BIT enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=77'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_EBSTCON_REG_BIT{
    BISTST,/*!< Read & Write | Default = 0 */
    TME,   /*!< Read & Write | Default = 0 */
    TMSEL0,/*!< Read & Write | Default = 0 */
    TMSEL1,/*!< Read & Write | Default = 0 */
    PSEL,  /*!< Read & Write | Default = 0 */
    PSV0,  /*!< Read & Write | Default = 0 */
    PSV1,  /*!< Read & Write | Default = 0 */
    PSV2,  /*!< Read & Write | Default = 0 */
};

/**
 * @brief The ENC28J60_EBSTCON enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=77'>Enc28j60 Datasheet</a>
 */
enum ENC28J60_EBSTCON_REG_CFG {
    /// \todo Some (optional) text

    //BISTST             = (1 << 0),
    //TME                = (1 << 1),
    //RANDOM_DATA_FILL   = (0 << 2),
    //ADDRESS_FILL       = (1 << 2),
    //PATTERN_SHIFT_FILL = (2 << 2),
    //PSEL               = (1 << 4)
};
#define ENC28J60_RX_BUFFER_START 0x0000
#define ENC28J60_RX_BUFFER_END 0x19FF
#define ENC28J60_TX_BUFFER_START 0x1A00
#define ENC28J60_TX_BUFFER_END 0x1FFF
#define ENC28J60_MAX_FRAMELENGTH 1518


#if defined(__AVR_ATmega640__) || defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)
#define DEF_SPI_MISO 50
#define DEF_SPI_MOSI 51
#define DEF_SPI_SCK 52
#define DEF_SPI_SS 53
#endif

enum ENC28J60_REGS {
    REG_ERDPTL    = 0xB000,
    REG_ERDPTH    = 0xB001,
    REG_EWRPTL    = 0xB002,
    REG_EWRPTH    = 0xB003,
    REG_ETXSTL    = 0xB004,
    REG_ETXSTH    = 0xB005,
    REG_ETXNDL    = 0xB006,
    REG_ETXNDH    = 0xB007,
    REG_ERXSTL    = 0xB008,
    REG_ERXSTH    = 0xB009,
    REG_ERXNDL    = 0xB00A,
    REG_ERXNDH    = 0xB00B,
    REG_ERXRDPTL  = 0xB00C,
    REG_ERXRDPTH  = 0xB00D,
    REG_ERXWRPTL  = 0xB00E,
    REG_ERXWRPTH  = 0xB00F,
    REG_EDMASTL   = 0xB010,
    REG_EDMASTH   = 0xB011,
    REG_EDMANDL   = 0xB012,
    REG_EDMANDH   = 0xB013,
    REG_EDMADSTL  = 0xB014,
    REG_EDMADSTH  = 0xB015,
    REG_EDMACSL   = 0xB016,
    REG_EDMACSH   = 0xB017,
    REG_EIE       = 0xB01B,
    REG_EIR       = 0xB01C,
    REG_ESTAT     = 0xB01D,
    REG_ECON2     = 0xB01E,
    REG_ECON1     = 0xB01F,
    REG_EHT0      = 0xB100,
    REG_EHT1      = 0xB101,
    REG_EHT2      = 0xB102,
    REG_EHT3      = 0xB103,
    REG_EHT4      = 0xB104,
    REG_EHT5      = 0xB105,
    REG_EHT6      = 0xB106,
    REG_EHT7      = 0xB107,
    REG_EPMM0     = 0xB108,
    REG_EPMM1     = 0xB109,
    REG_EPMM2     = 0xB10A,
    REG_EPMM3     = 0xB10B,
    REG_EPMM4     = 0xB10C,
    REG_EPMM5     = 0xB10D,
    REG_EPMM6     = 0xB10E,
    REG_EPMM7     = 0xB10F,
    REG_EPMCSL    = 0xB110,
    REG_EPMCSH    = 0xB111,
    REG_EPMOL     = 0xB112,
    REG_EPMOH     = 0xB113,
    REG_EWOLIE    = 0xB114,
    REG_EWOLIR    = 0xB115,
    REG_ERXFCON   = 0xB116,
    REG_EPKTCNT   = 0xB117,
    REG_MACON1    = 0xB200,
    REG_MACON3    = 0xB202,
    REG_MACON4    = 0xB203,
    REG_MABBIPG   = 0xB204,
    REG_MAIPGL    = 0xB206,
    REG_MAIPGH    = 0xB207,
    REG_MACLCON1  = 0xB208,
    REG_MACLCON2  = 0xB209,
    REG_MAMXFLL   = 0xB20A,
    REG_MAMXFLH   = 0xB20B,
    REG_MICMD     = 0xB212,
    REG_MIREGADR  = 0xB214,
    REG_MIWRL     = 0xB216,
    REG_MIWRH     = 0xB217,
    REG_MIRDL     = 0xB218,
    REG_MIRDH     = 0xB219,
    REG_MAADR5    = 0xB300,
    REG_MAADR6    = 0xB301,
    REG_MAADR3    = 0xB302,
    REG_MAADR4    = 0xB303,
    REG_MAADR1    = 0xB304,
    REG_MAADR2    = 0xB305,
    REG_EBSTSD    = 0xB306,
    REG_EBSTCON   = 0xB307,
    REG_EBSTCSL   = 0xB308,
    REG_EBSTCSH   = 0xB309,
    REG_MISTAT    = 0xB30A,
    REG_EREVID    = 0xB312,
    REG_ECOCON    = 0xB315,
    REG_EFLOCON   = 0xB317,
    REG_EPAUSL    = 0xB318,
    REG_EPAUSH    = 0xB319
};

class Enc28j60
{

public:

    Enc28j60();
    void init();
    void setSPI(u8t miso = DEF_SPI_MISO, u8t mosi = DEF_SPI_MOSI, u8t sck = DEF_SPI_SCK, u8t ss = DEF_SPI_SS);



private:
    MasterSPI *_spi;

    struct enc28j60_t
    {
        enc28j60_t() {
            macAddress._mac[0] = 0xA0;
            macAddress._mac[1] = 0xB1;
            macAddress._mac[2] = 0xC2;
            macAddress._mac[3] = 0xD3;
            macAddress._mac[4] = 0xE4;
            macAddress._mac[5] = 0xF5;
            revisionID = 0;
            fullDuplex = true;
            currentBank = 0;

            rxBuffStart = ENC28J60_RX_BUFFER_START;
            rxBuffEnd   = ENC28J60_RX_BUFFER_END;
            txBuffStart = ENC28J60_TX_BUFFER_START;
            txBuffEnd   = ENC28J60_TX_BUFFER_END;

        }
        macaddr_t macAddress;
        u8t revisionID;
        bool fullDuplex;
        u8t currentBank;
        u16t nextPacketPtr;

        u16t rxBuffStart;
        u16t rxBuffEnd;
        u16t txBuffStart;
        u16t txBuffEnd;
    } _self;

    //---- Raw methods ----//
    u8t _spi_readControlReg(ENC28J60_REGS reg);
    void _spi_writeControlReg(ENC28J60_REGS reg, u8t data);

    void _spi_selectBank(u8t bank);

    void _spi_writeOpCode(u8t reg, u8t *buff, size_t size);
    u8t _spi_readOpcode(u8t reg);

    u16t _spi_readPhy(ENC28J60_PHY_REG reg);
    void _spi_writePhy(ENC28J60_PHY_REG reg, u16t data);

    void _spi_bitFieldSet(u8t reg, u8t data);
    void _spi_bitFieldClear(u8t reg, u8t data);

    void _spi_reset();

    //---- Complex Methods ----//
    void _spi_setRxBufferSize(u16t size);
    u16t _spi_getRxBufferSize();

    void _spi_setTxBufferSize(u16t size);
    u16t _spi_getTxBufferSize();
};
#endif






