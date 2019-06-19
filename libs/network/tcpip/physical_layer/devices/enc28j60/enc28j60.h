#ifndef ENC28J60_H
#define ENC28J60_H
#include <spimaster.h>
#include <string>
#include <macros.h>
#include <net_utils.h>
///@file


/**
 * @brief The ENC28J06_ECOCON_REG_BIT enum.
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=8'>Enc28j60 Datasheet</a>
 */
enum class ENC28J06_ECOCON_REG_BIT{
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
    CLKOUT_DIVIDED_BY_1 = (1 << toU8(ENC28J06_ECOCON_REG_BIT::COCON0)),
    CLKOUT_DIVIDED_BY_2 = (1 << toU8(ENC28J06_ECOCON_REG_BIT::COCON1)),
    CLKOUT_DIVIDED_BY_3 = (1 << toU8(ENC28J06_ECOCON_REG_BIT::COCON1)) | (1 << toU8(ENC28J06_ECOCON_REG_BIT::COCON0)),
    CLKOUT_DIVIDED_BY_4 = (1 << toU8(ENC28J06_ECOCON_REG_BIT::COCON2)),
    CLKOUT_DIVIDED_BY_8 = (1 << toU8(ENC28J06_ECOCON_REG_BIT::COCON2)) | (1 << toU8(ENC28J06_ECOCON_REG_BIT::COCON0))
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
enum class ENC28J60_ECON2_REG_BIT{
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
enum class ENC28J60_SPI_OPCODE{
    OPCODE_RCR = 0x00,    /*!< Read Control Register*/
    OPCODE_RBM = 0x3A,    /*!< Read Buffer Memory*/
    OPCODE_WCR = 0x40,    /*!< Write Control Register */
    OPCODE_WBM = 0x7A,    /*!< Write Buffer Memory */
    OPCODE_BFS = 0x80,    /*!< Bit Field Set */
    OPCODE_BFC = 0xA0,    /*!< Bit Field Clear */
    OPCODE_SRC = 0xFF     /*!< System Reset Command (Soft Reset) */
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
                }fields;
                uint8_t data;
            }byte0;

            uint8_t payload;
        } cmd;

        uint16_t packet;

    };
};





/**
 * @brief The ENC28J60_COM_BANK_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=14'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_COM_BANK_REG{
    ENC28J60_EIE     = 0x1B,
    ENC28J60_EIR     = 0x1C,
    ENC28J60_ESTAT   = 0x1D,
    ENC28J60_ECON2   = 0x1E,
    ENC28J60_ECON1   = 0x1F
};


/**
 * @brief The ENC28J60_BANK0_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=14'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_BANK0_REG {
    ENC28J60_ERDPTL    = 0x00,
    ENC28J60_ERDPTH    = 0x01,
    ENC28J60_EWRPTL    = 0x02,
    ENC28J60_EWRPTH    = 0x03,
    ENC28J60_ETXSTL    = 0x04,
    ENC28J60_ETXSTH    = 0x05,
    ENC28J60_ETXNDL    = 0x06,
    ENC28J60_ETXNDH    = 0x07,
    ENC28J60_ERXSTL    = 0x08,
    ENC28J60_ERXSTH    = 0x09,
    ENC28J60_ERXNDL    = 0x0A,
    ENC28J60_ERXNDH    = 0x0B,
    ENC28J60_ERXRDPTL  = 0x0C,
    ENC28J60_ERXRDPTH  = 0x0D,
    ENC28J60_ERXWRPTL  = 0x0E,
    ENC28J60_ERXWRPTH  = 0x0F,
    ENC28J60_EDMASTL   = 0x10,
    ENC28J60_EDMASTH   = 0x11,
    ENC28J60_EDMANDL   = 0x12,
    ENC28J60_EDMANDH   = 0x13,
    ENC28J60_EDMADSTL  = 0x14,
    ENC28J60_EDMADSTH  = 0x15,
    ENC28J60_EDMACSL   = 0x16,
    ENC28J60_EDMACSH   = 0x17
};

/**
 * @brief The ENC28J60_BANK1_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=14'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_BANK1_REG {
    ENC28J60_EHT0    = 0x00,
    ENC28J60_EHT1    = 0x01,
    ENC28J60_EHT2    = 0x02,
    ENC28J60_EHT3    = 0x03,
    ENC28J60_EHT4    = 0x04,
    ENC28J60_EHT5    = 0x05,
    ENC28J60_EHT6    = 0x06,
    ENC28J60_EHT7    = 0x07,
    ENC28J60_EPMM0   = 0x08,
    ENC28J60_EPMM1   = 0x09,
    ENC28J60_EPMM2   = 0x0A,
    ENC28J60_EPMM3   = 0x0B,
    ENC28J60_EPMM4   = 0x0C,
    ENC28J60_EPMM5   = 0x0D,
    ENC28J60_EPMM6   = 0x0E,
    ENC28J60_EPMM7   = 0x0F,
    ENC28J60_EPMCSL  = 0x10,
    ENC28J60_EPMCSH  = 0x11,
    ENC28J60_EPMOL   = 0x12,
    ENC28J60_EPMOH   = 0x13,
    ENC28J60_EWOLIE  = 0x14,
    ENC28J60_EWOLIR  = 0x15,
    ENC28J60_ERXFCON = 0x16,
    ENC28J60_EPKTCNT = 0x17
};

/**
 * @brief The ENC28J60_BANK2_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=14'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_BANK2_REG {
    ENC28J60_MACON1     = 0x00,
    ENC28J60_MACON3     = 0x02,
    ENC28J60_MACON4     = 0x03,
    ENC28J60_MABBIPG    = 0x04,
    ENC28J60_MAIPGL     = 0x06,
    ENC28J60_MAIPGH     = 0x07,
    ENC28J60_MACLCON1   = 0x08,
    ENC28J60_MACLCON2   = 0x09,
    ENC28J60_MAMXFLL    = 0x0A,
    ENC28J60_MAMXFLH    = 0x0B,
    ENC28J60_MICMD      = 0x12,
    ENC28J60_MIREGADR   = 0x14,
    ENC28J60_MIWRL      = 0x16,
    ENC28J60_MIWRH      = 0x17,
    ENC28J60_MIRDL      = 0x18,
    ENC28J60_MIRDH      = 0x19,
};


/**
 * @brief The ENC28J60_BANK3_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=14'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_BANK3_REG {
    ENC28J60_MAADR5  = 0x00,
    ENC28J60_MAADR6  = 0x01,
    ENC28J60_MAADR3  = 0x02,
    ENC28J60_MAADR4  = 0x03,
    ENC28J60_MAADR1  = 0x04,
    ENC28J60_MAADR2  = 0x05,
    ENC28J60_EBSTSD  = 0x06,
    ENC28J60_EBSTCON = 0x07,
    ENC28J60_EBSTCSL = 0x08,
    ENC28J60_EBSTCSH = 0x09,
    ENC28J60_MISTAT  = 0x0A,
    ENC28J60_EREVID  = 0x12,
    ENC28J60_ECOCON  = 0x15,
    ENC28J60_EFLOCON = 0x17,
    ENC28J60_EPAUSL  = 0x18,
    ENC28J60_EPAUSH  = 0x19
};


/**
 * @brief The ENC28J60_PHY_REG enum
 * See <a href='datasheets/enc28j60_datasheet.pdf#page=22'>Enc28j60 Datasheet</a>
 */
enum class ENC28J60_PHY_REG
{
    ENC28J60_PHCON1  = 0x00,
    ENC28J60_PHSTAT1 = 0x01,
    ENC28J60_PHID1   = 0x02,
    ENC28J60_PHID2   = 0x03,
    ENC28J60_PHCON2  = 0x10,
    ENC28J60_PHSTAT2 = 0x11,
    ENC28J60_PHIE    = 0x12,
    ENC28J60_PHIR    = 0x13,
    ENC28J60_PHLCON  = 0x14,
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
#define SPI_MISO 50
#define SPI_MOSI 51
#define SPI_SCK 52
#define SPI_SS 53
#endif



class Enc28j60
{
public:
    Enc28j60();
    bool init();

    void setSPI(u8t miso, u8t mosi, u8t sck, u8t ss);

    bool setMAC(u8t *mac);
    bool setMAC(macaddr_t mac);
    bool setMAC(std::vector<uint8_t> & mac);
    bool setMAC(const char* mac);

    //std::vector<u8t> getMAC();
    void getMAC(u8t *arr);
    macaddr_t getMAC();




    //---- PHCON1 ----//


    //---- End PHCON1 ----//

    //---- PHSTAT2 ----//
    /**
     * @brief isTrasmittingData
     * @return 1 = PHY is transmitting data 0 = PHY is not transmitting data
     */
    bool isTrasmittingData();

    /**
     * @brief isReceivingData
     * @return 1 = PHY is receiving data 0 = PHY is not receiving data
     */
    bool isReceivingData();

    /**
     * @brief getCollisionStatus
     * @return 1 = A collision is occuring 0 = A collision is not occuring
     */
    bool getCollisionStatus();

    /**
     * @brief isLinkUp
     * @return 1 = Link is up 0 = Link is down
     */
    bool isLinkUp();

    /**
     * @brief getDuplexStatus
     * @return  1 = PHY is configured for full-duplex operation (PHCON1<8> is set)
    0 = PHY is configured for half-duplex operation (PHCON1<8> is clear)
     */
    bool getDuplexStatus();

    /**
     * @brief getPolarityStatus
     * @return 1 = The polarity of the signal on TPIN+/TPIN- is reversed
    0 = The polarity of the signal on TPIN+/TPIN- is correct
     */
    bool getPolarityStatus();
    //---- End PHSTAT2 ----//







    //void send(std::vector<u8t> &packet);
    void send(u8t *ptr, u16t len);
    void receive(std::vector<u8t> & buff);


    u16t readPhy(ENC28J60_PHY_REG address);
    void readPhy(ENC28J60_PHY_REG address, u16t data);

private:
    //---- Methods ----//
    u8t _spi_readReg(u8t reg);
    void _spi_writeReg(uint8_t reg, uint8_t data);

    u16t _spi_readPhy(ENC28J60_PHY_REG address);
    void _spi_writePhy(ENC28J60_PHY_REG address, u16t data);

    void _spi_readBuffMemory(std::vector<u8t>&buff, size_t size);
    void _spi_writeBuffMemory(std::vector<u8t>&buff);
    void _spi_writeBuffMemory(u8t* buff, u16t len);

    void _spi_bitFieldSet(uint8_t reg, uint8_t bit);
    void _spi_bitFieldClear(uint8_t reg, uint8_t bit);

    void _spi_writeOP(ENC28J60_ISA cmd);
    uint8_t _spi_readOP(ENC28J60_ISA cmd);

    void _spi_selectBank(uint8_t bank);


    void _spi_reset();
    void _spi_initReceiveBuff();
    void _spi_initTransmitBuff();
    void _spi_enableMacReceive();
    void _spi_enableAutoPadCrc();
    void _spi_setMaxPacketSize();


    u8t _spi_getRevisionID();

    bool _spi_setMAC(u8t *mac);
    void _spi_getMAC(u8t *arr);

    //---- Variables ----//
    struct enc28j60_t
    {
        enc28j60_t() {}
        //std::vector<uint8_t> MACAddress[6];
        macaddr_t _macAddress;
        uint8_t revisionID;
        bool fullDuplex;
        uint8_t currentBank;
        uint16_t nextPacketPtr;
    }self;
    MasterSPI *master;


};

#endif







































