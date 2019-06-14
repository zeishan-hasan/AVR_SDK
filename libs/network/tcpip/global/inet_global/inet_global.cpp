#include "inet_global.h"


//---- IPV4 ----//
/*
ipv4addr_t __inet_ipv4_aton(const std::string &ip)
{
    std::vector<std::string> octects = split(ip,'.');
    ipv4addr_t tmp;
    if(octects.size() != 4 ){
        return tmp;
    }
    for(u8t i = 0; i < octects.size(); ++i ){
        tmp.fields[i] = atoi(octects[i].c_str());
    }
    return tmp;

}
ipv4addr_t __inet_ipv4_aton(const char *ip)
{
    char *octects[4];
    ipv4addr_t tmp;

    if(split(ip, octects, (char*)".") != 4){
        return tmp;
    }
    for(u8t i = 0;  i < 4 ; ++i){
        tmp.fields[i] = atoi(octects[i]);
    }
    return tmp;
}

void __inet_ipv4_ntoa(char *dst,  ipv4addr_t ip)
{
    sprintf(dst,"%u.%u.%u.%u",ip.fields[0], ip.fields[1], ip.fields[2], ip.fields[3]);
}

string __inet_ipv4_ntoa(ipv4addr_t ip)
{
    std::string _ip;
    _ip.reserve(sizeof(ip.ip));
    sprintf(_ip.begin(),"%u.%u.%u.%u",ip.fields[0], ip.fields[1], ip.fields[2], ip.fields[3]);
    return _ip;
}

*/

//---- Ethernet ----//

macaddr_t __inet_eth_aton(const string &mac)
{
    std::vector<std::string> octects = split(mac,'.');
    macaddr_t tmp;
    if(octects.size() != 6 ){
        return tmp;
    }
    for(u8t i = 0; i < octects.size(); ++i ){
        tmp.mac[i] = atoi(octects[i].c_str());
    }
    return tmp;
}

macaddr_t __inet_eth_aton(const char *mac)
{
    char *octects[6];
    macaddr_t tmp;

    if(split(mac, octects, (char*)":-") != 4){
        return tmp;
    }
    for(u8t i = 0;  i < 6 ; ++i){
        tmp.mac[i] = atoi(octects[i]);
    }
    return tmp;
}

void __inet_eth_ntoa(char *dst, macaddr_t mac)
{
    sprintf(dst,"%u:%u:%u:%u:%u:%u", mac.mac[0], mac.mac[1], mac.mac[2], mac.mac[3], mac.mac[4], mac.mac[5]);
}

string __inet_eth_ntoa(macaddr_t mac)
{
    std::string _mac;
    _mac.reserve(sizeof(mac.mac));
    sprintf(_mac.begin(),"%u:%u:%u:%u:%u:%u", mac.mac[0], mac.mac[1], mac.mac[2], mac.mac[3], mac.mac[4], mac.mac[5]);
    return _mac;
}
