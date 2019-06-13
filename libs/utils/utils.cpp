#include "utils.h"

void __swapBytes(vector<uint8_t> &v, size_t src, size_t dst)
{
    uint8_t tmp = v[src];
    v[src] = v[dst];
    v[dst] = tmp;
}

void __swapEndian(vector<uint8_t> &v, size_t wordlen)
{
    for(size_t idx = 0; idx < v.size()/wordlen; idx++) {
        for(size_t j = 0; j<wordlen/2; j++) {
            size_t src = (wordlen*idx)+j;
            size_t dst = (wordlen*idx)+(wordlen-1)-j;
            __swapBytes(v, src, dst);
        }
    }
}


void __swapBytes(u8t *v, size_t src, size_t dst)
{
    u8t tmp = v[src];
    v[src] = v[dst];
    v[dst] = tmp;
}

void __swapEndian(u8t *v, size_t size, size_t wordlen)
{
    for(size_t idx = 0; idx < size/wordlen; idx++) {
        for(size_t j = 0; j<wordlen/2; j++) {
            size_t src = (wordlen*idx)+j;
            size_t dst = (wordlen*idx)+(wordlen-1)-j;
            __swapBytes(v, src, dst);
        }
    }
}


void __swapNibbles(vector<uint8_t> &v){
    for(size_t i = 0; i < v.size(); i++) {
        v[i] = ( (v[i] & 0x0F) << 4 | (v[i] & 0xF0) >> 4 );
    }

}

void __fill(vector<uint8_t> &v, uint8_t fill_byte, size_t size)
{
    for (size_t i = 0;i < size ;++i) {
        v.push_back(fill_byte);
    }
}
void __fill(uint8_t &buff, uint8_t fill_byte, size_t currentSize,size_t size){
    size_t lastIndex = currentSize;
    buff = *(uint8_t*) realloc(&buff, size);
    size_t newIndex = (lastIndex+size);
    for(size_t i = lastIndex; i < newIndex; ++i ){
        *(&buff+i) = fill_byte;
    }
}
/*
ipv4addr_u_t __inet_aton(const std::string &ip)
{
    std::vector<std::string> octects = split(ip,'.');
    ipv4addr_u_t tmp;
    if(octects.size() != 4 ){
        return tmp;
    }
    for(u8t i = 0; i < octects.size(); ++i ){
        tmp.fields[i] = atoi(octects[i].c_str());
    }
    return tmp;

}

ipv4addr_u_t __inet_aton(char *ip)
{
    char *octects[4];
    ipv4addr_u_t tmp;

    //dbg(SERIAL0,"n split %u\r\n", split(ip, octects, "."));
    if(split(ip, octects, (char*)".") != 4){
         return tmp;
     }
    for(u8t i = 0;  i < 4 ; ++i){
        tmp.fields[i] = atoi(octects[i]);
    }
    return tmp;
}
*/
void __swapNibbles(u8t *src, size_t size)
{

}
