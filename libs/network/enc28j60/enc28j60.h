#ifndef ENC28J60_H
#define ENC28J60_H
#include <spimaster.h>
#include <string>
/*Legend:
+-------------------------------------------------------------------------+
|R = Readable bit   W = Writable bit    U = Unimplemented bit, read as ‘0’|
|-n = Value at POR  ‘1’ = Bit is set    ‘0’ = Bit is cleared              |
|                   x = Bit is unknown                                    |
+-------------------------------------------------------------------------+
*/

/*  ECOCON: CLOCK OUTPUT CONTROL REGISTER
+-----+-----+-----+-----+-----+--------+--------+--------+
|  7  |  6  |  5  |  4  |  3  |   2    |   1    |   0    |
+-----+-----+-----+-----+-----+--------+--------+--------+
| U-0 | U-0 | U-0 | U-0 | U-0 | R/W-1  | R/W-0  | R/W-0  |
+-----+-----+-----+-----+-----+--------+--------+--------+
| -   | -   | -   | -   | -   | COCON2 | COCON1 | COCON0 |
+-----+-----+-----+-----+-----+--------+--------+--------+
bit 7-3 Unimplemented: Read as 0

bit 2-0 COCON2:COCON0: Clock Output Configuration bits
    11x = Reserved for factory test. Do not use. Glitch prevention not assured.
    101 = CLKOUT outputs main clock divided by 8 (3.125 MHz)
    100 = CLKOUT outputs main clock divided by 4 (6.25 MHz)
    011 = CLKOUT outputs main clock divided by 3 (8.333333 MHz)
    010 = CLKOUT outputs main clock divided by 2 (12.5 MHz)
    001 = CLKOUT outputs main clock divided by 1 (25 MHz)
    000 = CLKOUT is disabled. The pin is driven low.
*/
enum ENC28J60_ECOCON {
    CLKOUT_DISABLED,
    CLKOUT_DIVIDED_BY_1,
    CLKOUT_DIVIDED_BY_2,
    CLKOUT_DIVIDED_BY_3,
    CLKOUT_DIVIDED_BY_4,
    CLKOUT_DIVIDED_BY_8,
};

/* PHLCON: PHY MODULE LED CONTROL REGISTER
+--------+--------+--------+--------+--------+--------+--------+--------+
|   15   |   14   |   13   |   12   |   11   |   10   |   9    |   8    |
+--------+--------+--------+--------+--------+--------+--------+--------+
| R/W-0  | R/W-0  | R/W-1  | R/W-0  | R/W-0  | R/W-0  | R/W-1  | R/W-x  |
+--------+--------+--------+--------+--------+--------+--------+--------+
| r      | r      | r      | r      | LACFG3 | LACFG2 | LACFG1 | LACFG0 |
+--------+--------+--------+--------+--------+--------+--------+--------+
bit 15-14 Reserved: Write as 0

bit 13-12 Reserved: Write as 1

bit 11-8 LACFG3:LACFG0: LEDA Configuration bits
    1111 = Reserved
    1110 = Display duplex status and collision activity (always stretched)
    1101 = Display link status and transmit/receive activity (always stretched)
    1100 = Display link status and receive activity (always stretched)
    1011 = Blink slow
    1010 = Blink fast
    1001 = Off
    1000 = On
    0111 = Display transmit and receive activity (stretchable)
    0110 = Reserved
    0101 = Display duplex status
    0100 = Display link status
    0011 = Display collision activity (stretchable)
    0010 = Display receive activity (stretchable)
    0001 = Display transmit activity (stretchable)
    0000 = Reserved
+--------+--------+--------+--------+--------+--------+--------+--------+
| 7      | 6      | 5      | 4      | 3      | 2      | 1      | 0      |
+--------+--------+--------+--------+--------+--------+--------+--------+
| R/W-0  | R/W-0  | R/W-1  | R/W-0  | R/W-0  | R/W-0  | R/W-1  | R/W-x  |
+--------+--------+--------+--------+--------+--------+--------+--------+
| LBCFG3 | LBCFG2 | LBCFG1 | LBCFG0 | LFRQ1  | LFRQ0  | STRCH  | r      |
+--------+--------+--------+--------+--------+--------+--------+--------+
bit 7-4 LBCFG3:LBCFG0: LEDB Configuration bits
    1110 = Display duplex status and collision activity (always stretched)
    1101 = Display link status and transmit/receive activity (always stretched)
    1100 = Display link status and receive activity (always stretched)
    1011 = Blink slow
    1010 = Blink fast
    1001 = Off
    1000 = On
    0111 = Display transmit and receive activity (stretchable)
    0110 = Reserved
    0101 = Display duplex status
    0100 = Display link status
    0011 = Display collision activity (stretchable)
    0010 = Display receive activity (stretchable)
    0001 = Display transmit activity (stretchable)
    0000 = Reserved

bit 3-2 LFRQ1:LFRQ0: LED Pulse Stretch Time Configuration bits (see Table 2-1)
    11 = Reserved
    10 = Stretch LED events by TLSTRCH
    01 = Stretch LED events by TMSTRCH
    00 = Stretch LED events by TNSTRCH

bit 1 STRCH: LED Pulse Stretching Enable bit
    1 = Stretchable LED events will cause lengthened LED pulses based on LFRQ1:LFRQ0 configuration
    0 = Stretchable LED events will only be displayed while they are occurring

bit 0 Reserved: Write as 0
*/
enum ENC28J60_PHLCON_LDEA {
    //TODO
};
enum ENC28J60_PHLCON_LDEB {
    //TODO
};

/* ECON1 REGISTER

The ECON1 register, shown in Register 3-1, is used to
control the main functions of the ENC28J60. Receive
enable, transmit request, DMA control and bank select
bits can all be found in ECON1.

+-------+-------+-------+--------+--------+--------+--------+--------+
| 7     | 6     | 5     | 4      | 3      | 2      | 1      | 0      |
+-------+-------+-------+--------+--------+--------+--------+--------+
| R/W-0 | R/W-0 | R/W-0 | R/W-0  | R/W-0  | R/W-0  | R/W-0  | R/W-0  |
+-------+-------+-------+--------+--------+--------+--------+--------+
| TXRST | RXRST | DMAST | CSUMEN | TXRTS  | RXEN   | BSEL1  | BSEL0  |
+-------+-------+-------+--------+--------+--------+--------+--------+

bit 7 TXRST: Transmit Logic Reset bit
    1 = Transmit logic is held in Reset
    0 = Normal operation
bit 6 RXRST: Receive Logic Reset bit
    1 = Receive logic is held in Reset
    0 = Normal operations
bit 5 DMAST: DMA Start and Busy Status bit
    1 = DMA copy or checksum operation is in progress
    0 = DMA hardware is Idle
bit 4 CSUMEN: DMA Checksum Enable bit
    1 = DMA hardware calculates checksums
    0 = DMA hardware copies buffer memory
bit 3 TXRTS: Transmit Request to Send bit
    1 = The transmit logic is attempting to transmit a packet
    0 = The transmit logic is Idle
bit 2 RXEN: Receive Enable bit
    1 = Packets which pass the current filter configuration will be written into the
        receive buffer
    0 = All packets received will be ignored
bit 1-0 BSEL1:BSEL0: Bank Select bits
    11 = SPI accesses registers in Bank 3
    10 = SPI accesses registers in Bank 2
    01 = SPI accesses registers in Bank 1
    00 = SPI accesses registers in Bank 0
 */
enum ECON1 {
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

/* ECON2 REGISTER
The ECON2 register, shown in Register 3-2, is used to
control other main functions of the ENC28J60.
+---------+----------+-------+-------+--------+--------+--------+--------+
| 7       | 6        | 5     | 4     | 3      | 2      | 1      | 0      |
+---------+----------+-------+-------+--------+--------+--------+--------+
| R/W-1   | R/W-0(1) | R/W-0 | R/W-0 | R/W-0  | U-0    | U-0    | U-0    |
+---------+----------+-------+-------+--------+--------+--------+--------+
| AUTOINC | PKTDEC   | PWRSV | r     | VRPS   | —      |  —     | —      |
+---------+----------+-------+-------+--------+--------+--------+--------+

bit 7 AUTOINC: Automatic Buffer Pointer Increment Enable bit
    1 = Automatically increment ERDPT or EWRPT on reading from or writing to EDATA
    0 = Do not automatically change ERDPT and EWRPT after the buffer is accessed
bit 6 PKTDEC: Packet Decrement bit
    1 = Decrement the EPKTCNT register by one
    0 = Leave EPKTCNT unchanged
bit 5 PWRSV: Power Save Enable bit
    1 = MAC, PHY and control logic are in Low-Power Sleep mode
    0 = Normal operation
bit 4 Reserved: Maintain as ‘0’

bit 3 VRPS: Voltage Regulator Power Save Enable bit
    When PWRSV = 1:
    1 = Internal voltage regulator is in Low-Current mode
    0 = Internal voltage regulator is in Normal Current mode
    When PWRSV = 0:
    The bit is ignored; the regulator always outputs as much current as the device requires.
bit 2-0 Unimplemented: Read as ‘0’

Note 1: This bit is automatically cleared once it is set.

*/
enum ENC28J60_ECON2 {
    VRPS    = (1 << 3),
    PWRSV   = (1 << 5),
    PKTDEC  = (1 << 6),
    AUTOINC = (1 << 7)
};

/* MICMD: MII COMMAND REGISTER
+-------+-------+-------+-------+--------+--------+---------+--------+
| 7     | 6     | 5     | 4     | 3      | 2      | 1       | 0      |
+-------+-------+-------+-------+--------+--------+---------+--------+
| U-0   | U-0   | U-0   | U-0   | U-0    | U-0    | R/W-0   | R/W-0  |
+-------+-------+-------+-------+--------+--------+---------+--------+
| —     | —     | —     | —     | —      | —      | MIISCAN | MIIRD  |
+-------+-------+-------+-------+--------+--------+---------+--------+

bit 7-2 Unimplemented: Read as ‘0’

bit 1 MIISCAN: MII Scan Enable bit
    1 = PHY register at MIREGADR is continuously read and the data is placed in MIRD
    0 = No MII Management scan operation is in progress
bit 0 MIIRD: MII Read Enable bit
    1 = PHY register at MIREGADR is read once and the data
    0 = No MII Management read operation is in progress
*/
enum ENC28J60_MICMD{
    MIIRD = 1,
    MIISCAN
};

/* MISTAT: MII STATUS REGISTER
+-------+-------+-------+-------+--------+--------+--------+--------+
| 7     | 6     | 5     | 4     | 3      | 2      | 1      | 0      |
+-------+-------+-------+-------+--------+--------+--------+--------+
| U-0   | U-0   | U-0   | U-0   | R-0    | R-0    | R-0    | R-0    |
+-------+-------+-------+-------+--------+--------+--------+--------+
| —     | —     | —     | —     | r      | NVALID | SCAN   | BUSY   |
+-------+-------+-------+-------+--------+--------+--------+--------+

bit 7-4 Unimplemented: Read as ‘0’

bit 3 Reserved: Maintain as ‘0’

bit 2 NVALID: MII Management Read Data Not Valid bit
    1 = The contents of MIRD are not valid yet
    0 = The MII Management read cycle has completed and MIRD has been updated
bit 1 SCAN: MII Management Scan Operation bit
    1 = MII Management scan operation is in progress
    0 = No MII Management scan operation is in progress
bit 0 BUSY: MII Management Busy bit
    1 = A PHY register is currently being read or written to
    0 = The MII Management interface is Idle
*/
enum ENC28J60_MISTAT{
    BUSY = 1,
    SCAN,
    NVALID
};

/* PHSTAT1: PHYSICAL LAYER STATUS REGISTER 1
+-----+-----+-----+-------+-------+--------+--------+-----+
| 15  | 14  | 13  |  12   |  11   |   10   |   9    |  8  |
+-----+-----+-----+-------+-------+--------+--------+-----+
| U-0 | U-0 | U-0 | R-1   | R-1   | U-0    | U-0    | U-0 |
+-----+-----+-----+-------+-------+--------+--------+-----+
| —   | —   | —   | PFDPX | PHDPX | —      | —      | —   |
+-----+-----+-----+-------+-------+--------+--------+-----+

+-----+-----+-----+-------+-------+--------+--------+-----+
| 7   | 6   | 5   | 4     | 3     | 2      | 1      | 0   |
+-----+-----+-----+-------+-------+--------+--------+-----+
| U-0 | U-0 | U-0 | U-0   | U-0   | R/LL-0 | R/LH-0 | U-0 |
+-----+-----+-----+-------+-------+--------+--------+-----+
| —   | —   | —   | —     | —     | LLSTAT | JBSTAT | —   |
+-----+-----+-----+-------+-------+--------+--------+-----+

bit 15-13 Unimplemented: Read as ‘0’

bit 12 PFDPX: PHY Full-Duplex Capable bit
    1 = PHY is capable of operating at 10 Mbps in Full-Duplex mode (this bit is always set)

bit 11 PHDPX: PHY Half-Duplex Capable bit
    1 = PHY is capable of operating at 10 Mbps in Half-Duplex mode (this bit is always set)

bit 10-3 Unimplemented: Read as ‘0’

bit 2 LLSTAT: PHY Latching Link Status bit
    1 = Link is up and has been up continously since PHSTAT1 was last read
    0 = Link is down or was down for a period since PHSTAT1 was last read

bit 1 JBSTAT: PHY Latching Jabber Status bit
    1 = PHY has detected a transmission meeting the jabber criteria since PHSTAT1 was last read
    0 = PHY has not detected any jabbering transmissions since PHSTAT1 was last read

bit 0 Unimplemented: Read as ‘0’
*/
enum ENC28J60_PHSTAT1{
    JBSTAT  = (1 << 1),
    LLSTAT  = (1 << 2),
    PHDPX   = (1 << 11),
    PFDPX   = (1 << 12),
};

/* PHSTAT2: PHYSICAL LAYER STATUS REGISTER 2
+-----+-----+--------+--------+---------+--------+------------+-----+
| 15  | 14  |   13   |   12   |   11    |   10   |     9      |  8  |
+-----+-----+--------+--------+---------+--------+------------+-----+
| U-0 | U-0 | R-0    | R-0    | R-0     | R-0    | R-x        | U-0 |
| —   | —   | TXSTAT | RXSTAT | COLSTAT | LSTAT  | DPXSTAT(1) | —   |
+-----+-----+--------+--------+---------+--------+------------+-----+
+-----+-----+--------+--------+---------+--------+------------+-----+
| 7   | 6   | 5      | 4      | 3       | 2      | 1          | 0   |
+-----+-----+--------+--------+---------+--------+------------+-----+
| U-0 | U-0 | R-0    | U-0    | U-0     |  U-0   | U-0        | U-0 |
+-----+-----+--------+--------+---------+--------+------------+-----+
| —   | —   | PLRITY | —      | —       |  —     | —          | —   |
+-----+-----+--------+--------+---------+--------+------------+-----+
bit 15-14 Unimplemented: Read as ‘0’

bit 13 TXSTAT: PHY Transmit Status bit
    1 = PHY is transmitting data
    0 = PHY is not transmitting data

bit 12 RXSTAT: PHY Receive Status bit
    1 = PHY is receiving data
    0 = PHY is not receiving data

bit 11 COLSTAT: PHY Collision Status bit
    1 = A collision is occuring
    0 = A collision is not occuring

bit 10 LSTAT: PHY Link Status bit (non-latching)
    1 = Link is up
    0 = Link is down

bit 9 DPXSTAT: PHY Duplex Status bit (1)
    1 = PHY is configured for full-duplex operation (PHCON1<8> is set)
    0 = PHY is configured for half-duplex operation (PHCON1<8> is clear)

bit 8-6 Unimplemented: Read as ‘0’

bit 5 PLRITY: Polarity Status bit
    1 = The polarity of the signal on TPIN+/TPIN- is reversed
    0 = The polarity of the signal on TPIN+/TPIN- is correct

bit 4-0 Unimplemented: Read as ‘0’

Note 1: reset values of the Duplex mode/status bit depends on the connection of the LED
    to the LEDB pin (see Section 2.6 “LED Configuration” for additional details).
 */
enum ENC28J60_PHSTAT2 {
    PLRITY  = (1 << 5),
    DPXSTAT = (1 << 9),
    LSTAT   = (1 << 10),
    COLSTAT = (1 << 11),
    RXSTAT  = (1 << 12),
    TXSTAT  = (1 << 13),
};

// SPI Instruction Set
enum ENC28J60_SPI_OPCODE{
    RCR = 0x00,    // Read Control Register
    RBM = 0x3A,    // Read Buffer Memory
    WCR = 0x40,    // Write Control Register
    WBM = 0x7A,    // Write Buffer Memory
    BFS = 0x80,    // Bit Field Set
    BFC = 0xA0,    // Bit Field Clear
    SRC = 0xFF     // System Reset Command (Soft Reset)
};

typedef union {
    struct
    {
        uint8_t opcode:3;
        uint8_t argument:5;
        uint8_t payload;
    };
    uint16_t packet;

} ENC28J60_ISA;

// Control register

// All-bank registers
enum ENC28J60_COM_BANK_REG{
    ENC28J60_EIE     = 0x1B,
    ENC28J60_EIR     = 0x1C,
    ENC28J60_ESTAT   = 0x1D,
    ENC28J60_ECON2   = 0x1E,
    ENC28J60_ECON1   = 0x1F
};

enum ENC28J60_BANK0_REG {
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

enum ENC28J60_BANK1_REG {
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

enum ENC28J60_BANK2_REG {
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

enum ENC28J60_BANK3_REG {
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

/* MACON1: MAC CONTROL REGISTER 1
+-----+-----+--------+--------+---------+--------+------------+--------+
| 7   | 6   | 5      | 4      | 3       | 2      | 1          | 0      |
+-----+-----+--------+--------+---------+--------+------------+--------+
| U-0 | U-0 | U-0    | R-0    | R/W-0   | R/W-0  | R/W-0      | R/W-0  |
+-----+-----+--------+--------+---------+--------+------------+--------+
| —   | —   | —      | r      | TXPAUS  | RXPAUS | PASSALL    | MARXEN |
+-----+-----+--------+--------+---------+--------+------------+--------+

bit 7-5 Unimplemented: Read as ‘0’

bit 4 Reserved: Maintain as ‘0’

bit 3 TXPAUS: Pause Control Frame Transmission Enable bit
    1 = Allow the MAC to transmit pause control frames (needed for flow control in full duplex)
    0 = Disallow pause frame transmissions

bit 2 RXPAUS: Pause Control Frame Reception Enable bit
    1 = Inhibit transmissions when pause control frames are received (normal operation)
    0 = Ignore pause control frames which are received

bit 1 PASSALL: Pass All Received Frames Enable bit
    1 = Control frames received by the MAC will be written into the receive buffer if not filtered out
    0 = Control frames will be discarded after being processed by the MAC (normal operation)

bit 0 MARXEN: MAC Receive Enable bit
    1 = Enable packets to be received by the MAC
    0 = Disable packet reception
*/
enum ENC28J60_MACON1{
    MARXEN  = (1 << 0),
    PASSALL = (1 << 1),
    RXPAUS  = (1 << 2),
    TRXPAUS = (1 << 3)
};

/* MACON3: MAC CONTROL REGISTER 3
+---------+---------+---------+---------+---------+--------+------------+--------+
| 7       | 6       | 5       | 4       | 3       | 2      | 1          | 0      |
+---------+---------+---------+---------+---------+--------+------------+--------+
| R/W-0   | R/W-0   | R/W-0   | R/W-0   | R/W-0   | R/W-0  | R/W-0      | R/W-0  |
+---------+---------+---------+---------+---------+--------+------------+--------+
| PADCFG2 | PADCFG1 | PADCFG0 | TXCRCEN | PHDREN  | HFRMEN | FRMLNEN    | FULDPX |
+---------+---------+---------+---------+---------+--------+------------+--------+

bit 7-5 PADCFG2:PADCFG0: Automatic Pad and CRC Configuration bits
    111 = All short frames will be zero padded to 64 bytes and a valid CRC will then be appended
    110 = No automatic padding of short frames
    101 = MAC will automatically detect VLAN Protocol frames which have a 8100h type field and
          automatically pad to 64 bytes. If the frame is not a VLAN frame,
          it will be padded to 60 bytes. After padding, a valid CRC will be appended.
    100 = No automatic padding of short frames
    011 = All short frames will be zero padded to 64 bytes and a valid CRC will then be appended
    010 = No automatic padding of short frames
    001 = All short frames will be zero padded to 60 bytes and a valid CRC will then be appended
    000 = No automatic padding of short frames

bit 4 TXCRCEN: Transmit CRC Enable bit
    1 = MAC will append a valid CRC to all frames transmitted regardless of PADCFG bits.
        TXCRCEN must be set if the PADCFG bits specify that a valid CRC will be appended.
    0 = MAC will not append a CRC. The last 4 bytes will be checked and if it is an invalid CRC,
        it will be reported in the transmit status vector.

bit 3 PHDREN: Proprietary Header Enable bit
    1 = Frames presented to the MAC contain a 4-byte proprietary header
        which will not be used when calculating the CRC
    0 = No proprietary header is present. The CRC will cover all data (normal operation).

bit 2 HFRMEN: Huge Frame Enable bit
    1 = Frames of any size will be allowed to be transmitted and received
    0 = Frames bigger than MAMXFL will be aborted when transmitted or received

bit 1 FRMLNEN: Frame Length Checking Enable bit
    1 = The type/length field of transmitted and received frames will be checked. If it represents a length, the
    frame size will be compared and mismatches will be reported in the transmit/receive status vector.
    0 = Frame lengths will not be compared with the type/length field

bit 0 FULDPX: MAC Full-Duplex Enable bit
    1 = MAC will operate in Full-Duplex mode. PDPXMD bit must also be set.
    0 = MAC will operate in Half-Duplex mode. PDPXMD bit must also be clear.
*/
enum ENC28J60_MACON3 {
    FULDPX  = (1 << 0),
    FRMLNEN = (1 << 1),
    HFRMEN  = (1 << 2),
    PHDREN  = (1 << 3),
    TXCRCEN = (1 << 4),
    PAD_FRAME_TO60B     = (1 << 5),
    NO_AUTOPAD          = (2 << 5),
    PAD_FRAME_TO64B     = (3 << 5),
    AUTO_DETECT_VLAN    = (5 << 5), // Read above before use
};

/* MACON4: MAC CONTROL REGISTER 4
+-----+-------+--------+---------+---------+-------+------------+-----+
| 7   | 6     | 5      | 4       | 3       | 2     | 1          | 0   |
+-----+-------+--------+---------+---------+-------+------------+-----+
| U-0 | R/W-0 | R/W-0  | R/W-0   | U-0     | U-0   | R-0        | R-0 |
+-----+-------+--------+---------+---------+-------+------------+-----+
| —   | DEFER | BPEN   | NOBKOFF | —       | —     | r          | r   |
+-----+-------+--------+---------+---------+-------+------------+-----+

bit 7 Unimplemented: Read as ‘0’

bit 6 DEFER: Defer Transmission Enable bit (applies to half duplex only)
    1 = When the medium is occupied, the MAC will wait indefinitely for it to become
        free when attempting to transmit (use this setting for IEEE 802.3TM compliance)
    0 = When the medium is occupied, the MAC will abort the transmission after
        the excessive deferral limit is reached

bit 5 BPEN: No Backoff During Backpressure Enable bit (applies to half duplex only)
    1 = After incidentally causing a collision during backpressure,
        the MAC will immediately begin retransmitting
    0 = After incidentally causing a collision during backpressure,
        the MAC will delay using the Binary Exponential Backoff algorithm before
        attempting to retransmit (normal operation)

bit 4 NOBKOFF: No Backoff Enable bit (applies to half duplex only)
    1 = After any collision, the MAC will immediately begin retransmitting
    0 = After any collision, the MAC will delay using the Binary Exponential Backoff
        algorithm before attempting to retransmit (normal operation)

bit 3-2 Unimplemented: Read as ‘0’

bit 1-0 Reserved: Maintain as '0'
*/
enum ENC28J60_MACON4 {
    NOBKOFF = (1 << 4),
    BPEN    = (1 << 5),
    DEFER   = (1 << 6),
};

/* MABBIPG: MAC BACK-TO-BACK INTER-PACKET GAP REGISTER
+-----+--------+--------+--------+---------+--------+------------+--------+
| 7   | 6      | 5      | 4      | 3       | 2      | 1          | 0      |
+-----+--------+--------+--------+---------+--------+------------+--------+
| U-0 | R/W-0  | R/W-0  | R/W-0  | R/W-0   | R/W-0  | R/W-0      | R/W-0  |
+-----+--------+--------+--------+---------+--------+------------+--------+
| —   | BBIPG6 | BBIPG5 | BBIPG4 | BBIPG3  | BBIPG2 | BBIPG1     | BBIPG0 |
+-----+--------+--------+--------+---------+--------+------------+--------+

bit 7 Unimplemented: Read as ‘0’

bit 6-0 BBIPG6:BBIPG0: Back-to-Back Inter-Packet Gap Delay Time bits
    When FULDPX (MACON3<0>) = 1:
    Nibble time offset delay between the end of one transmission and the beginning
    of the next in a back-to-back sequence. The register value should be programmed
    to the desired period in nibble times minus 3. The recommended setting is 15h
    which represents the minimum IEEE specified Inter-Packet Gap (IPG) of 9.6 μs.

    When FULDPX (MACON3<0>) = 0:
    Nibble time offset delay between the end of one transmission and the beginning
    of the next in a back-to-back sequence. The register value should be programmed
    to the desired period in nibble times minus 6. The recommended setting is 12h
    which represents the minimum IEEE specified Inter-Packet Gap (IPG) of 9.6 μs.
*/
enum ENC28J60_MBBIPG {
    // TODO
};

/* PHCON2: PHY CONTROL REGISTER 2
+-------+--------+-------+-------+-------+--------+-------+--------+
|  15   |   14   |  13   |  12   |  11   |   10   |   9   |   8    |
+-------+--------+-------+-------+-------+--------+-------+--------+
| U-0   | R/W-0  | R/W-0 | R/W-0 | R/W-0 | R/W-0  | R/W-0 | R/W-0  |
+-------+--------+-------+-------+-------+--------+-------+--------+
| —     | FRCLNK | TXDIS | r     | r     | JABBER | r     | HDLDIS |
+-------+--------+-------+-------+-------+--------+-------+--------+
+-------+--------+-------+-------+-------+--------+-------+--------+
| 7     | 6      | 5     | 4     | 3     | 2      | 1     | 0      |
+-------+--------+-------+-------+-------+--------+-------+--------+
| R/W-0 | R/W-0  | R/W-0 | R/W-0 | R/W-0 | R/W-0  | R/W-0 | R/W-0  |
+-------+--------+-------+-------+-------+--------+-------+--------+
| r     | r      | r     | r     | r     | r      | r     | r      |
+-------+--------+-------+-------+-------+--------+-------+--------+

bit 15 Unimplemented: Read as ‘0’

bit 14 FRCLNK: PHY Force Linkup bit
    1 = Force linkup even when no link partner is detected
    0 = Normal operation

bit 13 TXDIS: Twisted-Pair Transmitter Disable bit
    1 = Disable twisted-pair transmitter
    0 = Normal operation

bit 12-11 Reserved: Write as ‘0’

bit 10 JABBER: Jabber Correction Disable bit
    1 = Disable jabber correction
    0 = Normal operation

bit 9 Reserved: Write as ‘0’

bit 8 HDLDIS: PHY Half-Duplex Loopback Disable bit
    When PHCON1<8> = 1 or PHCON1<14> = 1:
        This bit is ignored.
    When PHCON1<8> = 0 and PHCON1<14> = 0:
        1 = Transmitted data will only be sent out on the twisted-pair interface
        0 = Transmitted data will be looped back to the MAC and sent out on the
            twisted-pair interface

bit 7-0 Reserved: Write as ‘0’
*/
enum ENC28J60_PHCON2{
    HDLDIS  = (1 << 8),
    JABBER  = (1 << 10),
    TXDIS   = (1 << 13),
    FRCLNK  = (1 << 14),
};

/* ERXFCON: ETHERNET RECEIVE FILTER CONTROL REGISTER
+-------+--------+-------+-------+-------+--------+-------+--------+
| 7     | 6      | 5     | 4     | 3     | 2      | 1     | 0      |
+-------+--------+-------+-------+-------+--------+-------+--------+
| R/W-1 | R/W-0  | R/W-1 | R/W-0 | R/W-0 | R/W-0  | R/W-0 | R/W-1  |
+-------+--------+-------+-------+-------+--------+-------+--------+
| UCEN  | ANDOR  | CRCEN | PMEN  | MPEN  | HTEN   | MCEN  | BCEN   |
+-------+--------+-------+-------+-------+--------+-------+--------+

bit 7 UCEN: Unicast Filter Enable bit
    When ANDOR = 1:
        1 = Packets not having a destination address matching the local MAC address will be discarded
        0 = Filter disabled
    When ANDOR = 0:
        1 = Packets with a destination address matching the local MAC address will be accepted
        0 = Filter disabled

bit 6 ANDOR: AND/OR Filter Select bit
    1 = AND: Packets will be rejected unless all enabled filters accept the packet
    0 = OR: Packets will be accepted unless all enabled filters reject the packet

bit 5 CRCEN: Post-Filter CRC Check Enable bit
    1 = All packets with an invalid CRC will be discarded
    0 = The CRC validity will be ignored

bit 4 PMEN: Pattern Match Filter Enable bit
    When ANDOR = 1:
        1 = Packets must meet the Pattern Match criteria or they will be discarded
        0 = Filter disabled
    When ANDOR = 0:
        1 = Packets which meet the Pattern Match criteria will be accepted
        0 = Filter disabled

bit 3 MPEN: Magic PacketTM Filter Enable bit
    When ANDOR = 1:
        1 = Packets must be Magic Packets for the local MAC address or they will be discarded
        0 = Filter disabled
    When ANDOR = 0:
        1 = Magic Packets for the local MAC address will be accepted
        0 = Filter disabled

bit 2 HTEN: Hash Table Filter Enable bit
    When ANDOR = 1:
        1 = Packets must meet the Hash Table criteria or they will be discarded
        0 = Filter disabled
    When ANDOR = 0:
        1 = Packets which meet the Hash Table criteria will be accepted
        0 = Filter disabled

bit 1 MCEN: Multicast Filter Enable bit
    When ANDOR = 1:
        1 = Packets must have the Least Significant bit set in the destination address or they will be discarded
        0 = Filter disabled
    When ANDOR = 0:
        1 = Packets which have the Least Significant bit set in the destination address will be accepted
        0 = Filter disabled

bit 0 BCEN: Broadcast Filter Enable bit
    When ANDOR = 1:
        1 = Packets must have a destination address of FF-FF-FF-FF-FF-FF or they will be discarded
        0 = Filter disabled
    When ANDOR = 0:
        1 = Packets which have a destination address of FF-FF-FF-FF-FF-FF will be accepted
        0 = Filter disabled
*/
enum ENC28J60_ERXFCON {
    BCEN    =  (1 << 0),
    MCEN    =  (1 << 1),
    HTEN    =  (1 << 2),
    MPEN    =  (1 << 3),
    PMEN    =  (1 << 4),
    CRCEN   =  (1 << 5),
    ANDOR   =  (1 << 6),
    UCEN    =  (1 << 7),
};

/* EFLOCON: ETHERNET FLOW CONTROL REGISTER
+-----+--------+-------+-------+-------+---------+-------+--------+
| 7   | 6      | 5     | 4     | 3     | 2       | 1     | 0      |
+-----+--------+-------+-------+-------+---------+-------+--------+
| U-0 | U-0    | U-0   | U-0   | U-0   | R-0     | R/W-0 | R/W-0  |
+-----+--------+-------+-------+-------+---------+-------+--------+
| —   | —      | —     | —     | —     | FULDPXS | FCEN1 | FCEN0  |
+-----+--------+-------+-------+-------+---------+-------+--------+

bit 7-3 Unimplemented: Read as ‘0’

bit 2 FULDPXS: Read-Only MAC Full-Duplex Shadow bit
    1 = MAC is configured for Full-Duplex mode, FULDPX (MACON3<0>) is set
    0 = MAC is configured for Half-Duplex mode, FULDPX (MACON3<0>) is clear

bit 1-0 FCEN1:FCEN0: Flow Control Enable bits
    When FULDPXS = 1:
        11 = Send one pause frame with a ‘0’ timer value and then turn flow control off
        10 = Send pause frames periodically
        01 = Send one pause frame then turn flow control off
        00 = Flow control off
    When FULDPXS = 0:
        11 = Flow control on
        10 = Flow control off
        01 = Flow control on
        00 = Flow control off
*/
enum EFLOCON {
    FLOW_CTRL_OFF = 0,
    FLOW_CTRL_ON  = 1,
    SEND_PAUSE_OFF_FLOWCTRL = 1,
    SEND_PAUSE_PERIODICALLY = 2,
    SEND_PAUSE_WITH_0_OFF_FLOWCTRL = 3,
    FULDPXS = (1 << 2)
};

/* PHCON1: PHY CONTROL REGISTER 1
+-------+---------+-----+-----+--------+-------+-----+-----------+
|  15   |   14    | 13  | 12  |   11   |  10   |  9  |     8     |
+-------+---------+-----+-----+--------+-------+-----+-----------+
| R/W-0 | R/W-0   | U-0 | U-0 | R/W-0  | R/W-0 | U-0 | R/W-0     |
+-------+---------+-----+-----+--------+-------+-----+-----------+
| PRST  | PLOOPBK | —   | —   | PPWRSV | r     | —   | PDPXMD(1) |
+-------+---------+-----+-----+--------+-------+-----+-----------+
+-------+---------+-----+-----+--------+-------+-----+-----------+
| 7     | 6       | 5   | 4   | 3      | 2     | 1   | 0         |
+-------+---------+-----+-----+--------+-------+-----+-----------+
| R/W-0 | U-0     | U-0 | U-0 | U-0    | U-0   | U-0 | U-0       |
+-------+---------+-----+-----+--------+-------+-----+-----------+
| r     | —       | —   | —   | —      | —     | —   | —         |
+-------+---------+-----+-----+--------+-------+-----+-----------+

bit 15 PRST: PHY Software Reset bit
    1 = PHY is processing a Software Reset (automatically resets to ‘0’ when done)
    0 = Normal operation

bit 14 PLOOPBK: PHY Loopback bit
    1 = All data transmitted will be returned to the MAC. The twisted-pair interface will be disabled.
    0 = Normal operation

bit 13-12 Unimplemented: Read as ‘0’

bit 11 PPWRSV: PHY Power-Down bit
    1 = PHY is shut down
    0 = Normal operation

bit 10 Reserved: Maintain as ‘0’

bit 9 Unimplemented: Read as ‘0’

bit 8 PDPXMD: PHY Duplex Mode bit (1)
    1 = PHY operates in Full-Duplex mode
    0 = PHY operates in Half-Duplex mode

bit 7 Reserved: Maintain as ‘0’

bit 6-0 Unimplemented: Read as ‘0’
Note 1: Reset values of the Duplex mode/status bits depend on the connection
        of the LED to the LEDB pin (see Section 2.6 “LED Configuration” for additional details).
*/
enum ENC28J60_PHCON1 {
    PDPXMD  = (1 <<  8),
    PPWRSV  = (1 << 11),
    PLOOPBK = (1 << 14),
    PRST    = (1 << 15)
};

/* ESTAT: ETHERNET STATUS REGISTER
+-------+---------+-----+---------+--------+--------+--------+-----------+
| 7     | 6       | 5   | 4       | 3      | 2      | 1      | 0         |
+-------+---------+-----+---------+--------+--------+--------+-----------+
| R-0   | R/C-0   | R-0 | R/C-0   | U-0    | R-0    | R/C-0  | R/W-0     |
+-------+---------+-----+---------+--------+--------+--------+-----------+
| INT   | BUFER   | r   | LATECOL | —      | RXBUSY | TXABRT | CLKRDY(1) |
+-------+---------+-----+---------+--------+--------+--------+-----------+

bit 7 INT: INT Interrupt Flag bit
    1 = INT interrupt is pending
    0 = No INT interrupt is pending

bit 6 BUFER: Ethernet Buffer Error Status bit
    1 = An Ethernet read or write has generated a buffer error (overrun or underrun)
    0 = No buffer error has occurred

bit 5 Reserved: Read as ‘0’

bit 4 LATECOL: Late Collision Error bit
    1 = A collision occurred after 64 bytes had been transmitted
    0 = No collisions after 64 bytes have occurred

bit 3 Unimplemented: Read as ‘0’

bit 2 RXBUSY: Receive Busy bit
    1 = Receive logic is receiving a data packet
    0 = Receive logic is Idle

bit 1 TXABRT: Transmit Abort Error bit
    1 = The transmit request was aborted
    0 = No transmit abort error

bit 0 CLKRDY: Clock Ready bit (1)
    1 = OST has expired; PHY is ready
    0 = OST is still counting; PHY is not ready
Note 1:CLKRDY resets to ‘0’ on Power-on Reset but is unaffected on all other Resets.
*/
enum ENC28J60_ESTAT {
    CLKRDY  = (1 << 0),
    TXABRT  = (1 << 1),
    RXBUSY  = (1 << 2),
    LATECOL = (1 << 4),
    BUFER   = (1 << 6),
    INT     = (1 << 7)
};

/* EIE: ETHERNET INTERRUPT ENABLE REGISTER
+-------+---------+-------+--------+--------+-------+--------+-----------+
| 7     | 6       | 5     | 4      | 3      | 2     | 1      | 0         |
+-------+---------+-------+--------+--------+-------+--------+-----------+
| R/W-0 | R/W-0   | R/W-0 | R/W-0  | R/W-0  | R/W-0 | R/W-0  | R/W-0     |
+-------+---------+-------+--------+--------+-------+--------+-----------+
| INTIE | PKTIE   | DMAIE | LINKIE | TXIE   | r     | TXERIE | RXERIE    |
+-------+---------+-------+--------+--------+-------+--------+-----------+

bit 7 INTIE: Global INT Interrupt Enable bit
    1 = Allow interrupt events to drive the INT pin
    0 = Disable all INT pin activity (pin is continuously driven high)

bit 6 PKTIE: Receive Packet Pending Interrupt Enable bit
    1 = Enable receive packet pending interrupt
    0 = Disable receive packet pending interrupt

bit 5 DMAIE: DMA Interrupt Enable bit
    1 = Enable DMA interrupt
    0 = Disable DMA interrupt

bit 4 LINKIE: Link Status Change Interrupt Enable bit
    1 = Enable link change interrupt from the PHY
    0 = Disable link change interrupt

bit 3 TXIE: Transmit Enable bit
    1 = Enable transmit interrupt
    0 = Disable transmit interrupt

bit 2 Reserved: Maintain as ‘0’

bit 1 TXERIE: Transmit Error Interrupt Enable bit
    1 = Enable transmit error interrupt
    0 = Disable transmit error interrupt

bit 0 RXERIE: Receive Error Interrupt Enable bit
    1 = Enable receive error interrupt
    0 = Disable receive error interrupt
*/
enum ENC28J60_EIE{
    RXERIE  = (1 << 0),
    TXERIE  = (1 << 1),
    TXIE    = (1 << 3),
    LINKIE  = (1 << 4),
    DMAIE   = (1 << 5),
    PKTIE   = (1 << 6),
    INTIE   = (1 << 7)
};

/* EIR: ETHERNET INTERRUPT REQUEST (FLAG) REGISTER
+-------+---------+-------+--------+--------+-------+--------+-----------+
| 7     | 6       | 5     | 4      | 3      | 2     | 1      | 0         |
+-------+---------+-------+--------+--------+-------+--------+-----------+
| U-0   | R-0     | R/C-0 | R-0    | R/C-0  | R-0   | R/C-0  | R/C-0     |
+-------+---------+-------+--------+--------+-------+--------+-----------+
| —     | PKTIF   | DMAIF | LINKIF | TXIF   | r     | TXERIF | RXERIF    |
+-------+---------+-------+--------+--------+-------+--------+-----------+

bit 7 Unimplemented: Read as ‘0’

bit 6 PKTIF: Receive Packet Pending Interrupt Flag bit
    1 = Receive buffer contains one or more unprocessed packets; cleared when PKTDEC is set
    0 = Receive buffer is empty

bit 5 DMAIF: DMA Interrupt Flag bit
    1 = DMA copy or checksum calculation has completed
    0 = No DMA interrupt is pending

bit 4 LINKIF: Link Change Interrupt Flag bit
    1 = PHY reports that the link status has changed; read PHIR register to clear
    0 = Link status has not changed

bit 3 TXIF: Transmit Interrupt Flag bit
    1 = Transmit request has ended
    0 = No transmit interrupt is pending

bit 2 Reserved: Maintain as ‘0’

bit 1 TXERIF: Transmit Error Interrupt Flag bit
    1 = A transmit error has occurred
    0 = No transmit error has occurred

bit 0 RXERIF: Receive Error Interrupt Flag bit
    1 = A packet was aborted because there is insufficient buffer space or the packet count is 255
    0 = No receive error interrupt is pending
*/
enum ENC28J60_EIR{
    RXERIF  = (1 << 0),
    TXERIF  = (1 << 1),
    TXIF    = (1 << 3),
    LINKIF  = (1 << 4),
    DMAIF   = (1 << 5),
    PKTIF   = (1 << 6),
    INTIF   = (1 << 7)
};

/* PHIE: PHY INTERRUPT ENABLE REGISTER
+-----+-----+-------+--------+-----+-----+-------+-------+
| 15  | 14  |  13   |   12   | 11  | 10  |   9   |   8   |
+-----+-----+-------+--------+-----+-----+-------+-------+
| R-0 | R-0 | R-0   | R-0    | R-0 | R-0 | R-0   | R-0   |
+-----+-----+-------+--------+-----+-----+-------+-------+
| r   | r   | r     |  r     | r   | r   | r     | r     |
+-----+-----+-------+--------+-----+-----+-------+-------+

+-----+-----+-------+--------+-----+-----+-------+-------+
| 7   | 6   | 5     | 4      | 3   | 2   | 1     | 0     |
+-----+-----+-------+--------+-----+-----+-------+-------+
| R-0 | R-0 | R/W-0 | R/W-0  | R-0 | R-0 | R/W-0 | R/W-0 |
+-----+-----+-------+--------+-----+-----+-------+-------+
| r   | r   | r     | PLNKIE | r   | r   | PGEIE | r     |
+-----+-----+-------+--------+-----+-----+-------+-------+

bit 15-6 Reserved: Write as ‘0’, ignore on read

bit 5 Reserved: Maintain as ‘0’

bit 4 PLNKIE: PHY Link Change Interrupt Enable bit
    1 = PHY link change interrupt is enabled
    0 = PHY link change interrupt is disabled

bit 3-2 Reserved: Write as ‘0’, ignore on read

bit 1 PGEIE: PHY Global Interrupt Enable bit
    1 = PHY interrupts are enabled
    0 = PHY interrupts are disabled

bit 0 Reserved: Maintain as ‘0
*/
enum ENC28J60_PHIE {
    PGEIE  = (1 << 1) ,
    PLNKIE = (1 << 4)
};

/* PHIR: PHY INTERRUPT REQUEST (FLAG) REGISTER
+-----+------+-----+--------+-----+--------+-----+-----+
| 15  |  14  | 13  |   12   | 11  |   10   |  9  |  8  |
+-----+------+-----+--------+-----+--------+-----+-----+
| R-x | R-x  | R-x | R-x    | R-x | R-x    | R-x | R-x |
+-----+------+-----+--------+-----+--------+-----+-----+
| r   | r    | r   |  r     | r   | r      | r   | r   |
+-----+------+-----+--------+-----+--------+-----+-----+

+-----+------+-----+--------+-----+--------+-----+-----+
| 7   | 6    | 5   | 4      | 3   | 2      | 1   | 0   |
+-----+------+-----+--------+-----+--------+-----+-----+
| R-x | R-x  | R-0 | R/SC-0 | R-0 | R/SC-0 | R-x | R-0 |
+-----+------+-----+--------+-----+--------+-----+-----+
| r   | r    | r   | PLNKIF | r   | PGIF   | r   | r   |
+-----+------+-----+--------+-----+--------+-----+-----+

bit 15-6 Reserved: Do not modify

bit 5 Reserved: Read as ‘0’

bit 4 PLNKIF: PHY Link Change Interrupt Flag bit
    1 = PHY link status has changed since PHIR was last read; resets to ‘0’ when read
    0 = PHY link status has not changed since PHIR was last read

bit 3 Reserved: Read as ‘0’

bit 2 PGIF: PHY Global Interrupt Flag bit
    1 = One or more enabled PHY interrupts have occurred since PHIR was last read; resets to ‘0’ when read
    0 = No PHY interrupts have occurred

bit 1 Reserved: Do not modify

bit 0 Reserved: Read as ‘0’
*/
enum ENC28J60_PHIR{
    PGIF    = (1 << 2),
    PLNKIF  = (1 << 4)
};


/* EBSTCON: ETHERNET SELF-TEST CONTROL REGISTER
+-------+-------+-------+-------+--------+--------+-------+--------+
| 7     | 6     | 5     | 4     | 3      | 2      | 1     | 0      |
+-------+-------+-------+-------+--------+--------+-------+--------+
| R/W-0 | R/W-0 | R/W-0 | R/W-0 | R/W-0  | R/W-0  | R/W-0 | R/W-0  |
+-------+-------+-------+-------+--------+--------+-------+--------+
| PSV2  | PSV1  | PSV0  | PSEL  | TMSEL1 | TMSEL0 | TME   | BISTST |
+-------+-------+-------+-------+--------+--------+-------+--------+

bit 7-5 PSV2:PSV0: Pattern Shift Value bits
    When TMSEL<1:0> = 10:
        The bits in EBSTSD will shift left by this amount after writing to each memory location.
    When TMSEL<1:0> = 00, 01 or 11:
        This value is ignored.

bit 4 PSEL: Port Select bit
    1 = DMA and BIST modules will swap ports when accessing the memory
    0 = Normal configuration

bit 3-2 TMSEL1:TMSEL0: Test Mode Select bits
    11 = Reserved
    10 = Pattern shift fill
    01 = Address fill
    00 = Random data fill

bit 1 TME: Test Mode Enable bit
    1 = Enable Test mode
    0 = Disable Test mode

bit 0 BISTST: Built-in Self-Test Start/Busy bit
    1 = Test in progress; cleared automatically when test is done
    0 = No test running
*/
enum ENC28J60_EBSTCON{
    BISTST             = (1 << 0),
    TME                = (1 << 1),
    RANDOM_DATA_FILL   = (0 << 2),
    ADDRESS_FILL       = (1 << 2),
    PATTERN_SHIFT_FILL = (2 << 2),
    PSEL               = (1 << 4)
};






class Enc28j60
{
public:
    Enc28j60();
    bool init(std::string ip);
    void send();
    void setSPI(uint8_t miso, uint8_t mosi, uint8_t sck, uint8_t ss);

private:
    MasterSPI *master;


};

#endif







































