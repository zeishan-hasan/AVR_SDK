#ifndef UTILS_H
#define UTILS_H
#include <vector>
#include <stdio.h>
#include <stdint.h>
#include <macros.h>
#include <string>
using namespace  std;


enum class SWAP_SIZE{
    NIBBLE,
    WORD = 2,
    DWORD = 4,
    QWORD = 8
};
void __swapBytes(vector<uint8_t> &v, size_t src, size_t dst);
void __swapEndian(vector<uint8_t> &v, size_t wordlen);


void __swapBytes(u8t *v, size_t src, size_t dst);
void __swapEndian(u8t *v, size_t size, size_t wordlen);

void __swapNibbles(vector<uint8_t> &v);
void __swapNibbles(u8t* src, size_t size);

void __fill(vector<uint8_t> &v, uint8_t fill_byte, size_t size);
void __fill(uint8_t &buff, uint8_t fill_byte, size_t currentSize, size_t size);

//ipv4addr_u_t __inet_aton(const std::string &ip);
//ipv4addr_u_t __inet_aton(char *ip);

#endif
