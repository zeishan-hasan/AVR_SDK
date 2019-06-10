#ifndef UTILS_H
#define UTILS_H
#include <vector>
#include <stdio.h>
#include <stdint.h>
#include <macros.h>

using namespace  std;

extern bool _debug;

//#define dbg(...) do { \
//	if (_debug) { \
//		printf(__VA_ARGS__); }\
//	} while (0)

enum SWAP_SIZE{
    NIBBLE,
    WORD = 2,
    DWORD = 4,
    QWORD = 8
};
void __swapBytes(vector<uint8_t> &v, size_t src, size_t dst);
void __swapEndian(vector<uint8_t> &v, size_t wordlen);
void __swapNibbles(vector<uint8_t> &v);
void __fill(vector<uint8_t> &v, uint8_t fill_byte, size_t size);
void __fill(uint8_t &buff, uint8_t fill_byte, size_t currentSize, size_t size);

#endif
