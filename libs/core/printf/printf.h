#ifndef PRINTF_H
#define PRINTF_H
#include <macros.h>
#include <avr/io.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>




char *strToUpper(char *str)
{
	char* init = str;
	while (*str) {
		if(*str >= 'a' && *str <= 'z'){
			*str -= 0x20;
		}
		str++;
	}
	return init;
}

char *strToLower(char *str)
{
	char* init = str;
	while (*str) {
		if(*str >= 'A'  && *str <= 'Z'){
			*str += 0x20;
		}
		str++;
	}
	return init;
}


namespace yanujz {
/*
inline char* itoa(char *__dst, u8t size, int val, u8t  base){
	u8t i = size-2;
	//__dst[size-1] = 0;
	bool neg = false;
	if(val < 0){
		val = ABS(val);
		neg = true;
	}

	do{
		__dst[i] = "0123456789abcdef"[val % base];
		--i;
	}while (val /= base);


	if(neg){
		__dst[i] = '-';
		return &__dst[i];
	}

	return &__dst[i+1];
}*/


inline char* itoa(char *__dst, u8t size, int val, u8t  base){


	u8t chr;

	u8t i = size-2;
	//__dst[size-1] = 0;
	bool neg = false;
	if(val < 0){
		val = toABS(val);
		neg = true;
	}

	do{
		chr = val % base;

		if (chr > 9) {
			chr = chr - 10 + 'a';
		} else {
			chr+= '0';
		}
		__dst[i] = (char) chr;

		--i;
	}while (val /= base);


	if(neg){
		__dst[i] = '-';
		return &__dst[i];
	}

	return &__dst[i+1];

}


inline char* ftoa(float n, char *__dst, int afterpoint){
	//const float pow10[] = { 1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000 };
	int iPart = toInt(n);
	unsigned int fPart = ((n - toInt(n)) * 10000);

	char * b = yanujz::itoa(__dst, 32, fPart, 10);
	if(__dst+31 - b < afterpoint--){
		while (afterpoint--) {
			*(--b) = '0';
		}
	}
	*(--b) = '.';
	b = yanujz::itoa(__dst, 31 - (__dst+30 - b), iPart , 10);

	return b;
}


#undef getc
inline u8t getc(volatile u8t* UCSRxA){
	loop_until_bit_is_set(*UCSRxA, RXC0);
	return _UDRx(UCSRxA);
}

#undef putc
inline void putc(u8t c, volatile u8t* UCSRxA){
	loop_until_bit_is_set(*UCSRxA, UDRE0);
	_UDRx(UCSRxA) = c;
}

#undef puts
inline void puts(const char *str, volatile u8t* UCSRxA){
	while (*str) {
		yanujz::putc(*str++, UCSRxA);
	}
}





inline int vfprintf(volatile u8t* __stdout, const char *fmt, va_list arg)
{
	char ch, char_temp;
	char* string_temp = nullptr;
	char buffer[32] = {0};
	//u8t i;
	//int int_temp;
	while ( (ch = *fmt++) ) {
		if ( '%' == ch ) {
			switch (ch = *fmt++) {
			case 'c':
				char_temp = va_arg(arg, int);
				yanujz::putc(char_temp, __stdout);
				continue;
			case 's':
				string_temp = va_arg(arg, char*);
				break;
			case 'd':
				string_temp = yanujz::itoa(buffer, SIZE_OF_ARRAY(buffer), va_arg(arg, int), 10);
				break;
			case 'u':
				string_temp = yanujz::itoa(buffer, SIZE_OF_ARRAY(buffer), va_arg(arg, unsigned int), 10);
				break;
			case 'x':
				string_temp = yanujz::itoa(buffer, SIZE_OF_ARRAY(buffer), va_arg(arg, int), 16);
				break;
			case 'X':
				string_temp = yanujz::itoa(buffer, SIZE_OF_ARRAY(buffer), va_arg(arg, unsigned int), 16);
				string_temp = strToUpper(string_temp);
				break;
			case 'p':
				string_temp = yanujz::itoa(buffer, SIZE_OF_ARRAY(buffer), (uintptr_t)va_arg(arg, void*), 16);
				break;
			case 'f':
				string_temp = yanujz::ftoa(va_arg(arg, double), buffer, 4);
				break;
			}
			yanujz::puts(string_temp, __stdout);
		}
		else {
			yanujz::putc(ch, __stdout);
		}
	}
	return 0;
}



inline void printf(const char* fmt, ...){
	va_list arg;
	va_start(arg,fmt);
	yanujz::vfprintf(&UCSR0A, fmt, arg);
	va_end(arg);
}


}

#endif // PRINTF_H
