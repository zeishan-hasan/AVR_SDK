#include "serial.h"
#include <string.h>


void Serial::init(UART baud, SerialPriority priority)
{
	*self.UBRRxH = MYUBRR(baud)>>8;
	*self.UBRRxL = (uint8_t)(MYUBRR(baud));
	// Enable receiver and transmitter //
	*self.UCSRxB = (1<<RXEN0)|(1<<TXEN0);
	// Set frame format: 8data, 1stop bit //
	*self.UCSRxC = (1<<UCSZ01)|(1<<UCSZ00);
	//UCSR0A = (1<<U2X0);						/// moltiplicatore
	this->priority =  priority;
	memset(USART_BUFF,0xFF,MAX_SERIAL_BUFFER);
	_read  = USART_BUFF;
	_write = USART_BUFF;
	bufferReadable = true;
	registerCallback();
}

void Serial::printf(const char *fmt,...)
{
	va_list arg;
	char buff[MAX_SERIAL_BUFFER];
	va_start(arg,fmt);
	vsprintf(buff,fmt,arg);
	va_end(arg);
	print(buff);
}

void Serial::readUntil(char *buffer, char chr)
{
	register uint8_t i = 0;

	while (1) {
		char temp = receive();
		if(temp == chr){
			buffer[i] ='\n';
			++i;
			buffer[i] ='\r';
			++i;
			buffer[i] ='\0';
			break;
		}
		buffer[i] = temp;
		++i;
	}
}

void Serial::flush()
{
	uint8_t dummy;
	while(*self.UCSRxA & (1<<RXC0))
		dummy = *self.UDRx;
}

void Serial::setRxISRCallBack(bool state)
{
	if(state == true){
		*self.UCSRxB |= (1 << RXCIE0);
		sei();
		return;
	}
	*self.UCSRxB &= ~(1 << RXCIE0);
}

void Serial::setEchoServer(bool state)
{
	echoServer = state;
}

void Serial::insertData(uint8_t data)
{
	bool bufferIsWritable = true;
	if( ++_write > (uint8_t*)(&USART_BUFF+1)-1){
		_write = USART_BUFF;
	}
	if(_write == _read){

		bufferIsWritable = false;
		--_write;
		if(_write < USART_BUFF){
			_write = (uint8_t*)(&USART_BUFF+1)-1;
		}
	}
	if(bufferIsWritable){
		*_write = data;
	}
}

void Serial::incReadData(uint8_t value)
{
	//WARNING Not Tested
	_read = (_read+value);
}

void Serial::enableShell(bool value)
{
	shellEnabled = value;
	setRxISRCallBack(true);
}

void Serial::registerCallback(ser_cb_t *cb)
{
	callback = cb;
}

void Serial::rxCallBack()
{
	if(callback != nullptr){
		callback();
	}
}

bool Serial::shellIsEnabled()
{
	return shellEnabled;
}

bool Serial::bufferIsReadable()
{
	if(_read == _write){
		return false;
	}

	return true;

}

bool Serial::isAvailable()
{
	return (*self.UCSRxA & (1<<RXC0))>>RXC0; // Return true means is available
}

bool Serial::echoIsEnabled()
{
	if(echoServer){
		return true;
	}
	return false;
}

uint8_t Serial::receive()
{
	while (!(*self.UCSRxA & (1<<RXC0)));
	return *self.UDRx;
}

uint8_t Serial::readData()
{
	bufferReadable = false;

	if( ++_read > (uint8_t*)(&USART_BUFF+1)-1){
		_read = USART_BUFF;
	}
	if(_read != _write){
		bufferReadable = true;
	}
	uint8_t temp = *_read;
	return temp;
}

SerialPriority Serial::getPriority()
{
	return priority;
}

void Serial::print(const char *str)
{
	register uint8_t i=0;
	while (str[i]!=0) {
		// Wait for empty transmit buffer
		while ( !( *self.UCSRxA & (1<<UDRE0)) );
		*self.UDRx = str[i];
		++i;
	}
}





ISR(USART0_RX_vect){
	Serial *serial0 = SerialManager::getInstance(SERIAL0);
	char temp = UDR0;
	serial0->insertData(temp);
	if(serial0->echoIsEnabled()){
		UDR0 = temp;
	}
	serial0->rxCallBack();


}
ISR(USART1_RX_vect){
	Serial *serial1 = SerialManager::getInstance(SERIAL1);
	char temp = UDR1;
	serial1->insertData(temp);
	if(serial1->echoIsEnabled()){
		UDR1 = temp;
	}
	serial1->rxCallBack();

}
ISR(USART2_RX_vect){
	Serial *serial2 = SerialManager::getInstance(SERIAL2);
	char temp = UDR2;
	serial2->insertData(temp);
	if(serial2->echoIsEnabled()){
		UDR2 = temp;
	}
	serial2->rxCallBack();

}
ISR(USART3_RX_vect){
	Serial *serial3 = SerialManager::getInstance(SERIAL3);
	char temp = UDR3;
	serial3->insertData(temp);
	if(serial3->echoIsEnabled()){
		UDR3 = temp;
	}
	serial3->rxCallBack();

}


