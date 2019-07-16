#include "hardwareserial.h"
/*
HardwareSerial::HardwareSerial()
{

}
*/

/*
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

void SerialX::printf(const char *fmt, ...)
{
	va_list arg;
	va_start(arg,fmt);
	__vfprintf(&UCSR0A, fmt, arg);
	va_end(arg);
}




*/





