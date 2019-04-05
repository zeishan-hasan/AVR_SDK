#ifndef MACROS_H
#define MACROS_H
#ifndef F_CPU
#define F_CPU 16000000UL
#endif




#define SIZE_OF_ARRAY(x) sizeof(x)/sizeof(x[0])
#define BAUD 9600
#define MYUBRR(x) (F_CPU/16/x-1)

#define MAX_SERIAL_BUFFER 256
#define MAX_SPI_BUFFER 256

#define ABS(N) ((N<0)?(-N):(N))
#define ELEMENT_IN_ARRAY(x)  (*(&x + 1) - x)
#define is_bit_on(var, i) ((var)&(1<<(i)))





#define bitRead(value, bit) (((value) >> (bit)) & 0x01)
#define bitSet(value, bit) ((value) |= (1 << (bit)))
#define bitClear(value, bit) ((value) &= ~(1 << bit) )
#define bitWrite(value, bit, bitvalue) (bitvalue ? bitSet(value, bit) : bitClear(value, bit))

#endif
