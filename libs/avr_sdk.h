#ifndef AVR_SDK_H
#define AVR_SDK_H
#include <gpio/portmanager/portmanager.h>
#include <gpio/interrupt/interrupt.h>
#include <core/vector.h>
#include <core/cppfix.h>
#include <core/macros.h>
#include <timer/timer.h>
#include <communication/spi/spi.h>
#include <communication/uart/serial.h>


#include <communication/spi/slave/spislave.h>
#include <communication/spi/master/spimaster.h>
#include <communication/i2c/master/i2cmaster.h>
#include <communication/i2c/slave/i2cslave.h>
#include <network/enc28j60/enc28j60.h>

#include <sensors/rdm630/rdm630.h>
#include <strutil/strutil.h>
//----- STL -----//
#include <vector>
#include <string>


#endif // AVR_SDK_H
