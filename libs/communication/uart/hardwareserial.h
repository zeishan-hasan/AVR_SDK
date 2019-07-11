#ifndef HARDWARESERIAL_H
#define HARDWARESERIAL_H
#include <macros.h>
#include <serial.h>
#include <avr/io.h>
//#include <stdio.h>
#include <string.h>
//#include <math.h>



#define _UCSR0B(x) (*(x  + 1))
#define _UCSR0C(x) (*(x  + 2))
#define _UBRR0L(x)  (*(x  + 4))
#define _UBRR0H(x)  (*(x  + 5))
#define _UDR0(x)   (*(x  + 6))


/*
extern Serial* __hw_serial[4];

class HardwareSerial
{
public:
	HardwareSerial();
};

class Serial0
{
public:
	Serial0(UART baud);
	void _printf(const char *fmt,...);
	void _print(const char *str);
private:
};

*/



class SerialX
{
public:
	SerialX(UART baud);
	void _printf(const char *fmt,...);
	//void _print(const char *str);
	//void _putc(u8t c);
private:
	//int _vfprintf(char const *fmt, va_list arg);

};
#endif // HARDWARESERIAL_H
