#ifndef SPI_H
#define SPI_H
//#include <avr/io.h>
#include <avr/interrupt.h>
//#include <avr/iom2560.h>
//#include "vector.h"
#include "portmanager.h"
///@file

/**
 * @brief The SPI_MODE enum
 */
enum SPI_MODE: uint8_t{
    SLAVE,
    MASTER,
};

/**
 * @brief The SPI Data Order enum
 */
enum SPI_DORD: uint8_t{
    MSB_FIRST,
    LSB_FIRST
};

/**
 * @brief The SPI Clock Polarity enum
 * @verbatim
╔═══════╦═════════════════════════════════════════════╗
║ LR_TF ║ Leading Edge Rising - Trailing Edge Falling ║
╠═══════╬═════════════════════════════════════════════╣
║ LF_TR ║ Leading Edge Falling - Trailing Edge Rising ║
╚═══════╩═════════════════════════════════════════════╝
 */
enum SPI_CPOL: uint8_t{
    LR_TF,
    LF_TR
};

/**
 * @brief The SPI Clock Phase enum
 * @verbatim
╔═══════╦═══════════════════════════════════════════╗
║ LS_TP ║ Leading Edge Sample - Trailing Edge Setup ║
╠═══════╬═══════════════════════════════════════════╣
║ LP_TS ║ Leading Edge Setup - Trailing Edge Sample ║
╚═══════╩═══════════════════════════════════════════╝
  @endverbatim
 */
enum SPI_CPHA:uint8_t{
    LS_TP,
    LP_TS
};


/**
 * @brief The SPI Clock Rate Select enum
 * @verbatim
╔═══════╦══════╦══════╦═══════════════╗
║ SPI2X ║ SPR1 ║ SPR0 ║ SCK Frequency ║
╠═══════╬══════╬══════╬═══════════════╣
║   0   ║   0  ║   0  ║     fosc/4    ║
╠═══════╬══════╬══════╬═══════════════╣
║   0   ║   0  ║   1  ║    fosc/16    ║
╠═══════╬══════╬══════╬═══════════════╣
║   0   ║   1  ║   0  ║    fosc/64    ║
╠═══════╬══════╬══════╬═══════════════╣
║   0   ║   1  ║   1  ║    fosc/128   ║
╠═══════╬══════╬══════╬═══════════════╣
║   1   ║   0  ║   0  ║     fosc/2    ║
╠═══════╬══════╬══════╬═══════════════╣
║   1   ║   0  ║   1  ║     fosc/8    ║
╠═══════╬══════╬══════╬═══════════════╣
║   1   ║   1  ║   0  ║    fosc/32    ║
╠═══════╬══════╬══════╬═══════════════╣
║   1   ║   1  ║   1  ║    fosc/64    ║
╚═══════╩══════╩══════╩═══════════════╝
@endverbatim
 */
enum SPI_CLKSEL: uint8_t{
    FOSC_BY_4	,
    FOSC_BY_16	,
    FOSC_BY_64	,
    FOSC_BY_128	,
    FOSC_BY_2	,
    FOSC_BY_8	,
    FOSC_BY_32	,
};














#endif // SPI_H

