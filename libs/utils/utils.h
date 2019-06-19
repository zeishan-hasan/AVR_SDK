#ifndef UTILS_H
#define UTILS_H
#include <vector>
#include <stdio.h>
#include <macros.h>
///@file
//#include <string>
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

bool isInRange(size_t n, size_t first, size_t last);

//size_t __dicotomicSearch(void * );

#endif
