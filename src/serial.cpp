#include "serial.h"

//----------SERIAL 0----------//
//----------Interrupts---------//
/*ISR(USART0_RX_vect){
	char ReceivedByte;
	ReceivedByte = UDR0; // Fetch the received byte value into the variable "ByteReceived"
	UDR0 = ReceivedByte;
}*/
//--------End Interrupts-------//
//----------Public methods----------//
void Serial0::init(UART baud){
	UBRR0H=MYUBRR(baud)>>8;

	UBRR0L = (unsigned char)(MYUBRR(baud));
	/* Enable receiver and transmitter */
	UCSR0B = (1<<RXEN0)|(1<<TXEN0);
	/* Set frame format: 8data, 1stop bit */
	UCSR0C = (1<<UCSZ01)|(1<<UCSZ00);
}

void Serial0::printf(const char *fmt,...)
{
	va_list arg;
	char buff[MAX_SERIAL_BUFFER];
	va_start(arg,fmt);
	vsprintf(buff,fmt,arg);
	va_end(arg);
	print(buff);
}

uint8_t Serial0::available()
{
	return (UCSR0A & (1<<RXC0))>>RXC0; // 01011101 RCXC0 1
}
void Serial0::setISRCallBack(bool state)
{
	if(state == 1){
		UCSR0B |= (state << RXCIE0);
		return;
	}
	UCSR0B &= ~(state << RXCIE0);

}

void Serial0::readUntil(char *buffer,char _char)
{

	register uint8_t i = 0;

	while (1) {
		char temp = this->receive();
		if(temp==_char){
			buffer[i]='\n';
			++i;
			buffer[i]='\r';
			++i;
			buffer[i]='\0';
			break;
		}
		buffer[i]=temp;
		++i;
	}
	//this->print(buffer);

}

char Serial0::receive()
{
	while (!(UCSR0A & (1<<RXC0)));
	return UDR0;
}

//----------End Public methods----------//

//----------Private methods----------//

void Serial0::print(const char *str){
	register int i=0;
	while (str[i]!=0) {
		// Wait for empty transmit buffer
		while ( !( UCSR0A & (1<<UDRE0)) );
		UDR0=str[i];
		++i;
	}

}

//----------End private methods----------//

/*
void Serial0::print(double f, uint8_t digit)
{
	const uint32_t pow10[]={1,10,100,1000,10000,100000,1000000,10000000,100000000,1000000000};
	if(f<0){print("-");}
	char buff[digit];
	sprintf(buff,"%d.%lu\r\n",(int)(ABS(f)),(uint32_t)(ABS(f)*pow10[digit])%pow10[digit]);
	print(buff);
}

void Serial0::print(char c)
{
	while ( !( UCSR0A & (1<<UDRE0)) );
	UDR0=c;
}*/




//----------SERIAL 1----------//
//----------Public methods----------//

void Serial1::init(UART baud)
{
	UBRR1H	= MYUBRR(baud)>>8;

	UBRR1L	= (unsigned char)(MYUBRR(baud));
	/* Enable receiver and transmitter */
	UCSR1B	= (1<<RXEN1)|(1<<TXEN1);
	/* Set frame format: 8data, 1stop bit */
	UCSR1C	= (1<<UCSZ11)|(1<<UCSZ10);
}

void Serial1::print(const char *str)
{
	register int i=0;
	while (str[i]!=0) {
		// Wait for empty transmit buffer
		while ( !( UCSR1A & (1<<UDRE1)) );
		UDR1=str[i];
		++i;

	}
}

char Serial1::receive()
{

}

//----------End Public methods----------//


//----------Private methods----------//
void Serial1::printf(const char *fmt,...)
{
	va_list arg;
	char buff[MAX_SERIAL_BUFFER];
	va_start(arg,fmt);
	vsprintf(buff,fmt,arg);
	va_end(arg);
	print(buff);
}
//----------End Private methods----------//


//----------SERIAL 2----------//
//----------Public methods----------//
void Serial2::init(UART baud)
{
	UBRR2H=MYUBRR(baud)>>8;

	UBRR2L = (unsigned char)(MYUBRR(baud));
	// Enable receiver and transmitter
	UCSR2B = (1<<RXEN2)|(1<<TXEN2);
	// Set frame format: 8data, 1stop bit
	UCSR2C = (1<<UCSZ21)|(1<<UCSZ20);
}

void Serial2::print(const char *str)
{
	register int i=0;
	while (str[i]!=0) {
		// Wait for empty transmit buffer
		while ( !( UCSR2A & (1<<UDRE2)) );
		UDR2=str[i];
		++i;

	}
}

char Serial2::receive()
{

}
//----------End Public methods----------//

//----------Private methods----------//
void Serial2::printf(const char *fmt,...)
{
	va_list arg;
	char buff[MAX_SERIAL_BUFFER];
	va_start(arg,fmt);
	vsprintf(buff,fmt,arg);
	va_end(arg);
	print(buff);
}
//----------End Private methods----------//




//----------SERIAL 3----------//

//----------Public methods----------//
void Serial3::init(UART baud)
{
	UBRR3H=MYUBRR(baud)>>8;

	UBRR3L = (unsigned char)(MYUBRR(baud));
	// Enable receiver and transmitter
	UCSR3B = (1<<RXEN3)|(1<<TXEN3);
	// Set frame format: 8data, 1stop bit
	UCSR3C = (1<<UCSZ31)|(1<<UCSZ30);
}

void Serial3::print(const char *str)
{
	register int i=0;
	while (str[i]!=0) {
		// Wait for empty transmit buffer
		while ( !( UCSR3A & (1<<UDRE3)) );
		UDR3=str[i];
		++i;

	}
}

char Serial3::receive()
{

}
//----------End Public methods----------//

//----------Private Methods----------//
void Serial3::printf(const char *fmt,...)
{
	va_list arg;
	char buff[MAX_SERIAL_BUFFER];
	va_start(arg,fmt);
	vsprintf(buff,fmt,arg);
	va_end(arg);
	print(buff);
}

//----------End Private Methods----------//
