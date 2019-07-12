#include "hardwareserial.h"
#include <math.h>
/*
HardwareSerial::HardwareSerial()
{

}
*/
int __vfprintf(volatile u8t *__stdout, const char *fmt, va_list arg);

SerialX::SerialX(UART baud)
{

	_UBRR0H(&UCSR0A) = HI(baud);
	//_UBRR0L(&UCSR0A) = (u8t)round((MYUBRR(baud)));
	_UBRR0L(&UCSR0A) = LO(baud);//(u8t)(MYUBRR(baud));

	// Enable receiver and transmitter //
	_UCSR0B(&UCSR0A) = (1<<RXEN0)|(1<<TXEN0);

	// Set frame format: 8data, 1stop bit //
	_UCSR0C(&UCSR0A) = (1<<UCSZ01)|(1<<UCSZ00);
	//UCSR0A = (1 << U2X0); // Clock multiplier

}

void SerialX::_printf(const char *fmt, ...)
{
	va_list arg;
	//char buff[32];
	va_start(arg,fmt);
	__vfprintf(&UCSR0A, fmt, arg);
	//vsnprintf(buff, 32, fmt, arg);
	va_end(arg);
	//_print(buff);

}
/*
void SerialX::_print(const char *str)
{
	register uint8_t i=0;
	while (str[i]!=0) {
			_putc(str[i++]);
	}

}

void SerialX::_putc(u8t c)
{
	loop_until_bit_is_set(UCSR0A, UDRE0);
	_UDR0(&UCSR0A) = c;
}

*/

#include <stdio.h>
#include <stdlib.h>
/*
// inline function to swap two numbers
inline void swap(char *x, char *y) {
	char t = *x; *x = *y; *y = t;
}

// function to reverse buffer[i..j]
char* reverse(char *buffer, int i, int j)
{
	while (i < j)
		swap(&buffer[i++], &buffer[j--]);

	return buffer;
}

// Iterative function to implement itoa() function in C
char* itoa(int value, char* buffer, int base)
{
	// invalid input
	if (base < 2 || base > 32)
		return buffer;

	// consider absolute value of number
	int n = ABS(value);

	int i = 0;
	while (n)
	{
		int r = n % base;

		if (r >= 10)
			buffer[i++] = 65 + (r - 10);
		else
			buffer[i++] = 48 + r;

		n = n / base;
	}

	// if number is 0
	if (i == 0)
		buffer[i++] = '0';

	// If base is 10 and value is negative, the resulting string
	// is preceded with a minus sign (-)
	// With any other base, value is always considered unsigned
	if (value < 0 && base == 10)
		buffer[i++] = '-';

	buffer[i] = '\0'; // null terminate string

	// reverse the string and return it
	return reverse(buffer, 0, i - 1);
}

*/


char *to_lower(char *str)
{
	while (*str) {
		tolower(*str++);
	}
	return str;
}


char *to_upper(char *str)
{
	while (*str) {
		toupper(*str++);
	}
	return str;
}

char* itoa(char *__dst, u8t size, int val, u8t  base){
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
}




char* ftoa(float n, char *__dst, int afterpoint){

	//const float pow10[] = { 1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000 };
	int iPart = toInt(n);
	int fPart = ((n - toInt(n)) * 10000);

	char * b = itoa(__dst, 32, ABS(fPart), 10);
	if(__dst+31 - b < afterpoint--){
		while (afterpoint--) {
			*(--b) = '0';
		}
	}
	*(--b) = '.';
	b = itoa(__dst, 31 - (__dst+30 - b  ), iPart , 10);

	return b;
}




void __putc(u8t c, volatile u8t* UCSRxA){
	loop_until_bit_is_set(*UCSRxA, UDRE0);
	_UDR0(UCSRxA) = c;
}

void __puts(const char *str, volatile u8t* UCSRxA){
	while (*str) {
		__putc(*str++, UCSRxA);
	}
}

inline int __vfprintf(volatile u8t* __stdout, const char *fmt, va_list arg)
{
	size_t length = 0;
	char ch, char_temp;
	char* string_temp;
	char buffer[32] = {0};
	//buffer[31] = 0;
	u8t i;
	//int int_temp;
	while ( ch = *fmt++) {
		if ( '%' == ch ) {
			switch (ch = *fmt++) {
			/* %% - print out a single %    */
			case '%':
				__putc('%', __stdout);
				length++;
				break;

				/* %c: print out a character    */
			case 'c':
				char_temp = va_arg(arg, int);
				__putc(char_temp, __stdout);
				length++;
				break;

				/* %s: print out a string       */
			case 's':
				string_temp = va_arg(arg, char*);
				__puts(string_temp, __stdout);
				length += strlen(string_temp);
				break;

				/* %d: print out an int         */
			case 'd':
				string_temp = itoa(buffer, SIZE_OF_ARRAY(buffer), va_arg(arg, int), 10);
				__puts(string_temp, __stdout);
				length += strlen(buffer);
				break;

				/* %x: print out an int in hex  */
			case 'x':
				string_temp = itoa(buffer, SIZE_OF_ARRAY(buffer), va_arg(arg, int), 16);
				__puts(string_temp, __stdout);
				length += strlen(buffer);
				break;
				/* %x: print out an int in hex  */
			case 'X':
				string_temp = itoa(buffer, SIZE_OF_ARRAY(buffer), va_arg(arg, int), 16);
				__puts(string_temp, __stdout);
				length += strlen(buffer);
				break;

			case 'p':
				string_temp = itoa(buffer, SIZE_OF_ARRAY(buffer), (uintptr_t)va_arg(arg, void*), 16);
				__puts(string_temp, __stdout);
				length += strlen(buffer);
				break;

			case 'f':
				string_temp = ftoa(va_arg(arg, double), buffer, 4);
				__puts(string_temp, __stdout);
				length += strlen(buffer);
				break;
			}
		}
		else {
			__putc(ch, __stdout);
			length++;
		}
	}
	return length;
}



