#ifndef MACROS_H
#define MACROS_H
#ifndef F_CPU
#define F_CPU 16000000UL
#endif


#define u8t uint8_t
#define u16t uint16_t
#define u32t uint32_t
#define u64t uint64_t




#define SIZE_OF_ARRAY(x) sizeof(x)/sizeof(x[0])
#define MYUBRR(x) (F_CPU/16/(float)x-1)
#define ELEMENT_IN_ARRAY(x)  (*(&x + 1) - x)

#define BAUD 9600
#define MAX_SERIAL_BUFFER   256
#define MAX_SPI_BUFFER      256



#define ABS(N) ((N<0)?(-N):(N))


//-------- Casting types --------//
#define toU8(x) (static_cast<uint8_t> (x))
#define toU16(x) (static_cast<uint16_t>(x))
#define toU32(x) (static_cast<uint32_t>(x))
#define toU64(x) (static_cast<uint64_t>(x))
#define toFloat(x) (static_cast<float>   (x))
#define toDouble(x) (static_cast<double>  (x))

//-------- Bit Manipulation --------//
#define is_bit_on(var, i) ((var)&(1<<(i)))
#define bitRead(value, bit) (((value) >> (bit)) & 0x01)
#define bitSet(value, bit) ((value) |= (1 << (bit)))
#define bitClear(value, bit) ((value) &= ~(1 << bit) )
#define bitWrite(value, bit, bitvalue) (bitvalue ? bitSet(value, bit) : bitClear(value, bit))

#endif
