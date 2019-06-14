#ifndef AVR_SDK_H
#define AVR_SDK_H
#include <portmanager.h>
#include <interrupt.h>
#include <vector.h>
//#include <cppfix.h>
#include <macros.h>
#include <timer.h>
#include <spi.h>
#include <serial.h>


#include <spislave.h>
#include <spimaster.h>
#include <i2cmaster.h>
#include <i2cslave.h>


#include <rdm630.h>
#include <strutil.h>


//---- TCP/IP ----//

//---- APP_LAYER ----//

//---- TRANSPORT_LAYER	----//

//---- INTERNET_LAYER	----//
#include <ipv4.h>
#include <net_utils.h>
#include <arp.h>
#include <arptable.h>
//---- PHYSICAL_LAYER	----//
#include <ethernet.h>
#include <enc28j60.h>

//----- STL -----//
#include <vector>
#include <string>


#endif // AVR_SDK_H
