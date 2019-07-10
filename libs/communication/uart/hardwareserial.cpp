#include "hardwareserial.h"
/*
HardwareSerial::HardwareSerial()
{

}

Serial0::Serial0(UART baud)
{
	_UBRR0H(&UCSR0A) = (u8t)MYUBRR(baud) >> 8;
	//_UBRR0L(&UCSR0A) = (u8t)round((MYUBRR(baud)));
	_UBRR0L(&UCSR0A) = (u8t)(MYUBRR(baud));

	// Enable receiver and transmitter //
	_UCSR0B(&UCSR0A) = (1<<RXEN0)|(1<<TXEN0);

	// Set frame format: 8data, 1stop bit //
	_UCSR0C(&UCSR0A) = (1<<UCSZ01)|(1<<UCSZ00);
	//UCSR0A = (1<<U2X0); // Clock multiplier
}

void Serial0::_printf(const char *fmt, ...)
{
	//va_list arg;
	//char buff[32];
	//va_start(arg,fmt);
	//vsprintf(buff, fmt, arg);
	//printf()
	//va_end(arg);
	//_print(buff);
}

void Serial0::_print(const char *str)
{
	register uint8_t i=0;
	while (str[i]!=0) {
		// Wait for empty transmit buffer
		while ( !( *(&UCSR0A) & (1<<UDRE0)) );
		_UDR0(&UCSR0A) = str[i];
		++i;
	}
}


*/

