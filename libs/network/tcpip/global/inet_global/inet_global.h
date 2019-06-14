#ifndef INET_GLOBAL_H
#define INET_GLOBAL_H
#include <macros.h>
#include <utils.h>
#include <strutil.h>

#pragma pack(1)
//---- IPV4 ----//
struct ipv4_header_t
{
    ipv4_header_t() {}
    u8t version:4;
    u8t headerLength:4;
    u8t diffServices;
    u32t total_length;
    u16t identificaton;
    u8t flags:3;
    u16t fragmentOffset:13;
    u8t TTL;
    u8t protocol;
    u32t headerCRC;
    u32t sourceAddress;
    u32t destinationAddress;
    u8t option;
    u8t padding[3];
    std::vector<u8t> payload;

};
typedef union{
    u8t fields[4];
    u32t ip;
}ipv4addr_t;

//ipv4addr_t __inet_ipv4_aton(const std::string &ip);
//ipv4addr_t __inet_ipv4_aton(const char *ip);
//void __inet_ipv4_ntoa(char *dst, ipv4addr_t ip);
//std::string  __inet_ipv4_ntoa(ipv4addr_t ip);

//---- End IPV4 ----//

//---- Ethernet ----//
struct macaddr_t
{
    macaddr_t(u8t* mac = nullptr) {
        if(mac != nullptr){
            memcpy(&this->mac,mac,6);
        }
    }
    uint8_t mac[6];

};

struct eth_frame_t
{
    eth_frame_t(macaddr_t dstMAC = macaddr_t(), macaddr_t srcMAC = macaddr_t(), u16t etherType = 0,
                u32t crc = 0, u8t* interpacket_gap = nullptr) {
        this->dstMAC = dstMAC;
        this->srcMAC = srcMAC;
        this->etherType = etherType;
        //this->payload = payload;
        this->crc = crc;
        if(interpacket_gap != nullptr){
            memcpy(interpacket_gap, interpacket_gap, 12);
        }
    }

    u8t preamble[7] = {0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55};
    u8t SFD = 0xD5;
    macaddr_t dstMAC;
    macaddr_t srcMAC;
    u16t etherType;
    std::vector<u8t> payload;
    u32t crc;
    u8t interpacket_gap[12];

};

struct eth_vlan_frame_t // IEE802.3 and IEE802.1Q
{
    eth_vlan_frame_t(macaddr_t dstMAC = macaddr_t(), macaddr_t srcMAC = macaddr_t(), u32t vlanTag = 0,
                     u16t etherType = 0, u32t crc = 0, u8t* interpacket_gap = nullptr) {
        this->dstMAC = dstMAC;
        this->srcMAC = srcMAC;
        this->vlanTag = vlanTag;
        this->etherType = etherType;
        //this->payload = payload;
        this->crc = crc;
        if(interpacket_gap != nullptr){
            memcpy(this->interpacket_gap, interpacket_gap, 12);
        }
    }
    u8t preamble[7] = {0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55};
    u8t SFD = 0xD5;
    macaddr_t dstMAC;
    macaddr_t srcMAC;
    u32t vlanTag;
    u16t etherType;
    std::vector<uint8_t> payload;
    u32t crc;
    u8t interpacket_gap[12];

};


macaddr_t __inet_eth_aton(const std::string &mac);
macaddr_t __inet_eth_aton(const char *mac);
void __inet_eth_ntoa(char *dst, macaddr_t mac);
std::string  __inet_eth_ntoa(macaddr_t mac);
//---- End Ethernet ----//

#pragma pop
#endif // INET_GLOBAL_H
