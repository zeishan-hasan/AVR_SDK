#ifndef MACROS_H
#define MACROS_H
#ifndef F_CPU
#define F_CPU 16000000UL
#endif
#include <stdint.h>

typedef uint8_t u8t;
typedef uint16_t u16t;
typedef uint32_t u32t;
typedef uint64_t u64t;
extern bool debug;

#define dbg_ser(x) do{ \
    if(debug) { \
    Serial *serial = SerialManager::getInstance(x); } \
    } while (0)

#define dbg(x, ... ) do { \
    if (debug) { \
    Serial *serial = SerialManager::getInstance(x); \
    serial->printf(__VA_ARGS__); }\
    } while (0)



#define SIZE_OF_ARRAY(x) sizeof(x)/sizeof(x[0])
#define MYUBRR(x) (F_CPU/16/(float)x-1)
#define ELEMENT_IN_ARRAY(x)  (*(&x + 1) - x)

#define BAUD 9600
#define MAX_SERIAL_BUFFER   256
#define MAX_SPI_BUFFER      256



#define ABS(N) ((N<0)?(-N):(N))


// Returns low part of 16 bit value
#define LO(x) (x & 0xFF)
// Returns high part of 16 bit value
#define HI(x) ((x >> 8) & 0xFF)



//-------- Casting types --------//
#define toU8(x) (static_cast<u8t> (x))
#define toU16(x) (static_cast<u16t>(x))
#define toU32(x) (static_cast<u32t>(x))
#define toU64(x) (static_cast<u64>(x))
#define toFloat(x) (static_cast<float>(x))
#define toDouble(x) (static_cast<double>(x))

//-------- Bit Manipulation --------//
#define is_bit_on(var, i) ((var)&(1<<(i)))
#define bitRead(value, bit) (((value) >> (bit)) & 0x01)
#define bitSet(value, bit) ((value) |= (1 << (bit)))
#define bitClear(value, bit) ((value) &= ~(1 << bit) )
#define bitWrite(value, bit, bitvalue) (bitvalue ? bitSet(value, bit) : bitClear(value, bit))


#endif
