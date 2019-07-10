#ifndef MACROS_H
#define MACROS_H
#include <stdint.h>
///@file

/**
 * @brief Shortname of uint8_t
 */
typedef uint8_t u8t;

/**
 * @brief Shortname of uint16_t
 */
typedef uint16_t u16t;

/**
 * @brief Shortname of uint32_t
 */
typedef uint32_t u32t;

/**
 * @brief Shortname of uint64_t
 */
typedef uint64_t u64t;

/**
 * @brief debug
 */
extern bool debug;

#define dbg( ... ) do{ \
    if (debug) { \
				serial->printf(__VA_ARGS__); } \
				} while (0)

#define ROUND(x) ((x)>=0?(long)((x)+0.5):(long)((x)-0.5))


#define CALCULATE_PWM_TICKS(freq) (1.0/freq)/(1.0/F_CPU)
#define CALCULATE_DUTY_16BIT(freq, duty) (CALCULATE_PWM_TICKS(freq)-(CALCULATE_PWM_TICKS(freq)*((float)duty/100)))
#define CALCULATE_DUTY_8BIT(duty) ((-2.55*duty) + 255)

#define SIZE_OF_ARRAY(x) sizeof(x)/sizeof(x[0])

#define ELEMENT_IN_ARRAY(x)  (*(&x + 1) - x)


#define MYUBRR(x) (ROUND((F_CPU/16/(float)x-1)))

#define BAUD 9600
#define MAX_SERIAL_BUFFER   256
#define MAX_SPI_BUFFER      256


/**
  *@return Absolute value
  */
#define ABS(N) ((N<0)?(-N):(N))


/**
  * @return LSB of 16 bit value
  */
#define LO(x) (x & 0xFF)

/**
  * @return MSB of 16 bit value
  */
#define HI(x) ((x >> 8) & 0xFF)



//-------- Casting types --------//
#define toU8(x) (static_cast<u8t> (x))
#define toU16(x) (static_cast<u16t>(x))
#define toU32(x) (static_cast<u32t>(x))
#define toU64(x) (static_cast<u64>(x))
#define toChar(x) (static_cast<char>(x))
#define toShort(x) (static_cast<short>(x))
#define toInt(x) (static_cast<int>(x))
#define toFloat(x) (static_cast<float>(x))
#define toDouble(x) (static_cast<double>(x))

#define toU8Ptr(x) (reinterpret_cast<u8t*> (x))
#define toU16Ptr(x) (reinterpret_cast<u16t*>(x))
#define toU32Ptr(x) (reinterpret_cast<u32t*>(x))
#define toU64Ptr(x) (reinterpret_cast<u64*>(x))
#define toCharPtr(x) (reinterpret_cast<char*>(x))
#define toShortPtr(x) (reinterpret_cast<short*>(x))
#define toIntPtr(x) (reinterpret_cast<int*>(x))
#define toFloatPtr(x) (reinterpret_cast<float*>(x))
#define toDoublePtr(x) (reinterpret_cast<double*>(x))


//-------- Bit Manipulation --------//
/**
  * @brief Checks if a bit in a var is set to 1
  * @param[in] var The variable to test
  * @param[in] bit The bit you want to test in var
  * @return If the bit is on, it return the corresponding bit value into var. If the bit if off it retuns 0
  */
#define is_bit_on(var, bit) ((var)&(1<<(bit)))

/**
  * @brief Reads bit value in a var
  * @param[in] var The variable to read
  * @param[in] bit The bit you want to read
  * @return If bit is on 1, else 0
  */
#define bitRead(value, bit) (((value) >> (bit)) & 0x01)

/**
  *@brief Sets a bit into a var
  * @param[in] value The input variable
  * @param[in] bit The bit you want to set
  */
#define bitSet(value, bit) ((value) |= (1 << (bit)))

/**
  *@brief Clears a bit into a variable
  * @param[in] value The input variable
  * @param[in] bit The bit you want to clear
  */
#define bitClear(value, bit) ((value) &= ~(1 << bit) )

/**
  *@brief Writes a bit value into a variable
  * @param[in] value The input variable
  * @param[in] bit The bit you want to write
  * @param[in] bitvalue The bit value you want to write
  */
#define bitWrite(value, bit, bitvalue) (bitvalue ? bitSet(value, bit) : bitClear(value, bit))


#define regBitToValue(x) (1 << toU8(x))
#define bitValue(x) (1 << x)

#define valueFromMask(var, mask) (var & mask)
#endif
