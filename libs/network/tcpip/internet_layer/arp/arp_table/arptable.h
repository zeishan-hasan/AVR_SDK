#ifndef ARPTABLE_H
#define ARPTABLE_H
#include <stdint.h>
#include <macros.h>
#include <utils.h>
#include <ipv4.h>
#include <ethernet.h>


#pragma pack(1)
struct arp_table_t
{
    arp_table_t(u32t ip, u8t *mac){
        this->ip.ip = ip;
        memcpy(&this->mac.mac, &mac,6);
    }

    ipv4addr_t ip;
    macaddr_t mac;
};

#pragma pop



class ArpTable
{
public:
    ArpTable();
    void addRecord(arp_table_t entry);
    void addRecord(u32t ip, u8t *mac);

    void deleteRecord(u16t index);
    void deleteAllRecords();

    uint16_t getRecordNumber();

    arp_table_t getRecord(uint16_t index);

    std::vector<arp_table_t> getAllRecords();


private:
    std::vector<arp_table_t> arpTable;
};

#endif // ARPTABLE_H
