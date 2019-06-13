#ifndef UTILS_H
#define UTILS_H
#include <vector>
#include <stdio.h>
#include <stdint.h>
#include <macros.h>

using namespace  std;


enum SWAP_SIZE{
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

void __fill(vector<uint8_t> &v, uint8_t fill_byte, size_t size);
void __fill(uint8_t &buff, uint8_t fill_byte, size_t currentSize, size_t size);

#endif
