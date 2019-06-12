#ifndef ETHERNET_H
#define ETHERNET_H
#include <stdint.h>
#include <macros.h>
#include <utils.h>

#pragma pack(1)

typedef union{
    uint8_t fields[6];
    u32t mac;
} macaddr_t;

#pragma pop

class Ethernet
{
public:
    Ethernet();
};

#endif // ETHERNET_H
