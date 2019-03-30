#ifndef HMC5883_H
#define HMC5883_H
#include "avr_sdk.h"




//Configuration Register A
/*
The configuration register is used to configure the device for setting the data     output rate and measurement configuration.

CRA0 through CRA7 indicate bit locations, with CRA denoting the bits that are in the configuration register.

CRA7 denotes the first bit of the data stream. The number in parenthesis indicates the default value of that bit.CRA default is 0x10.

+------+--------+--------+--------+--------+--------+--------+--------+
| CRA7 |  CRA6  |  CRA5  |  CRA4  |  CRA3  |  CRA2  |  CRA1  |  CRA0  |
+------+--------+--------+--------+--------+--------+--------+--------+
| (0)  | MA1(0) | MA0(0) | DO2(1) | DO2(1) | DO2(1) | MS1(0) | MS0(0) |
+------+--------+--------+--------+--------+--------+--------+--------+

+--------------+------------+------------------------------------------------------+
|   Location   |    Name    |                   Description                        |
+--------------+------------+------------------------------------------------------+
| CRA7         | CRA7       | Bit CRA7 is reserved for future function.            |
|              |            | Set to 0 when configuring CRA.                       |
+--------------+------------+------------------------------------------------------+
| CRA6 to CRA5 | MA1 to MA0 | Select number of samples averaged (1 to 8) per       |
|              |            | measurement output.                                  |
|              |            | 00 = 1(Default); 01 = 2; 10 = 4; 11 = 8              |
+--------------+------------+------------------------------------------------------+
| CRA4 to CRA2 | DO2 to DO0 | Data Output Rate Bits.                               |
|              |            | These bits set the rate at which data                |
|              |            | is written to all three data output registers.       |
+--------------+------------+------------------------------------------------------+
| CRA1 to CRA0 | MS1 to MS0 | Measurement Configuration Bits.                      |
|              |            | These bits define themeasurement flow of the device, |
|              |            | specifically whether or not to incorporate           |
|              |            | an applied bias into the measurement.                |
|              |            |                                                      |
|              |            |                                                      |
+--------------+------------+------------------------------------------------------+

+-----+-----+-----+------------------+
| DO2 | DO1 | DO0 | Output Rate (Hz) |
+-----+-----+-----+------------------+
| 0   | 0   | 0   | 0.75             |
| 0   | 0   | 1   | 1.5              |
| 0   | 1   | 0   | 3                |
| 0   | 1   | 1   | 7.5              |
| 1   | 0   | 0   | 15               |
| 1   | 0   | 1   | 30               |
| 1   | 1   | 0   | 75               |
+-----+-----+-----+------------------+

+-----+-----+------------------------------------------------------------+
| MS1 | MS0 | Measurament Mode                                           |
+-----+-----+------------------------------------------------------------+
| 0   | 0   | Normal measurement configuration (Default).                |
|     |     | In normal measurement configuration the device             |
|     |     | follows normal measurement flow.                           |
|     |     | The positive and negative pins of the                      |
|     |     | resistive load are left floating and high impedance.       |
+-----+-----+------------------------------------------------------------+
| 0   | 1   | Positive bias configuration for X, Y, and Z axes.          |
|     |     | In this configuration, a positive current is forced across |
|     |     | the resistive load for all three axes.                     |
+-----+-----+------------------------------------------------------------+
| 1   | 1   | Negative bias configuration for X, Y and Z axes.           |
|     |     | In this configuration, a negative current is forced        |
|     |     | across the resistive load for all three axes.              |
+-----+-----+------------------------------------------------------------+
*/


enum SAMPLE_MEASUREMENT : uint8_t{
    AVG_1,
    AVG_2,
    AVG_4,
    AVG_8,
};

enum OUTPUT_RATE : uint8_t{
    RATE_0_75Hz,
    RATE_1_5Hz,
    RATE_3Hz,
    RATE_7_5Hz,
    RATE_15Hz,
    RATE_30Hz,
    RATE_75Hz,
};






struct address_t
{
    uint8_t writeAddress;
    uint8_t readAddress;
};


class Hmc5883
{
public:
    Hmc5883(uint8_t writeAddr, uint8_t readAddr);
    address_t self;
};

#endif
