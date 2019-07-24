#include "serial.h"

Serial::Serial(volatile u8t *UCSRxA, HW_UART baud) {
	_UBRRxH(UCSRxA) = HI(toU16(baud));
	_UBRRxL(UCSRxA) = LO(toU16(baud));

	// Enable receiver and transmitter //
	_UCSRxB(UCSRxA) = (1<<RXEN0)|(1<<TXEN0);

	// Set frame format: 8data, 1stop bit //
	_UCSRxC(UCSRxA) = (1<<UCSZ01)|(1<<UCSZ00);
}

void Serial::init(HW_UART baud)
{
	_UBRRxH(UCSRxA) = HI(toU16(baud));
	_UBRRxL(UCSRxA) = LO(toU16(baud));

	// Enable receiver and transmitter //
	_UCSRxB(UCSRxA) = (1<<RXEN0)|(1<<TXEN0);

	// Set frame format: 8data, 1stop bit //
	_UCSRxC(UCSRxA) = (1<<UCSZ01)|(1<<UCSZ00);
	//UCSR0A = (1<<U2X0); // Clock multiplier


	//memset(USART_BUFF,0xFF,MAX_SERIAL_BUFFER);
	_read  = USART_BUFF;
	_write = USART_BUFF;

	_bufferReadable = true;

}

void Serial::printf(const char *fmt, ...)
{
	va_list arg;
	va_start(arg,fmt);
	yanujz::vfprintf(UCSRxA, fmt, arg);
	va_end(arg);
}

void Serial::readUntil(char *buffer, char chr)
{
	u8t i = 0;
	while (1) {
		char temp = receive();
		if(temp == chr){
			buffer[++i] ='\0';
			break;
		}
		buffer[i++] = temp;
	}
}

void Serial::flush()
{

	u8t dummy;
	while(*UCSRxA & (1<<RXC0)){
		dummy = _UDRx(UCSRxA);
	}
}

void Serial::setRxISRCallBack(bool state)
{
	if(state) {
		_UCSRxB(UCSRxA) |= (1 << RXCIE0);
		sei();
		return;
	}
	_UCSRxB(UCSRxA) &= ~(1 << RXCIE0);
}

void Serial::setEchoServer(bool state)
{
	_echoServer = state;
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


bool Serial::bufferIsReadable()
{
	if(_read == _write){
		return false;
	}

	return true;

}

bool Serial::isAvailable()
{
	return ((*UCSRxA & (1 << RXC0)) >> RXC0); // Return true means is available
}

bool Serial::echoIsEnabled()
{
	return true;
	if(_echoServer){
	}
	return false;
}

uint8_t Serial::receive()
{
	return yanujz::getc(UCSRxA);
}

uint8_t Serial::readData()
{
	_bufferReadable = false;

	if( ++_read > (uint8_t*)(&USART_BUFF+1)-1){
		_read = USART_BUFF;
	}
	if(_read != _write){
		_bufferReadable = true;
	}
	uint8_t temp = *_read;
	return temp;
}

void Serial::clear()
{
	yanujz::puts("\e[1;1H\e[2J", UCSRxA);
}








Serial *SerialManager::getInstance(u8t port, HW_UART baud, bool setRxIrq, bool setEcho) {
	Serial* ptr = _getPtr(port);
	switch (port) {
	case 0:
		if(ptr ==  nullptr){
			__hw_serial[0] = new Serial0(baud, setRxIrq, setEcho);
		}
		break;
	case 1:
		if(ptr ==  nullptr){
			__hw_serial[1] = new Serial1(baud, setRxIrq, setEcho);
		}
		break;
		//case 2:
		//	if(ptr == nullptr){
		//		__hw_serial[port] = new Serial2(baud, setRxIrq, setEcho);
		//	}
		//	break;
		//case 3:
		//	if(ptr == nullptr){
		//		__hw_serial[port] = new Serial3(baud, setRxIrq, setEcho);
		//	}
		//	break;
	}
	return __hw_serial[port];
}







#if defined(__AVR_ATmega640__) || defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)
#endif

ISR(USART0_RX_vect){
	char temp = UDR0;
	//__hw_serial[0]->insertData(temp);
	if(__hw_serial[0]->echoIsEnabled()){
		UDR0 = temp;
	}
	if(__hw_serial_cb[0].user_cb_vect != nullptr){
		((void(*)())__hw_serial_cb[0].user_cb_vect)();
	}
	else if(__hw_serial_cb[0].sys_cb_vect != nullptr) {
		SystemEventHandler::call_int_callback(__hw_serial_cb[0].sys_cb_vect);
	}
}

ISR(USART1_RX_vect){
	char temp = UDR1;
	//__hw_serial[0]->insertData(temp);
	if(__hw_serial[1]->echoIsEnabled()){
		UDR1 = temp;
	}
	if(__hw_serial_cb[0].user_cb_vect != nullptr){
		((void(*)())__hw_serial_cb[0].user_cb_vect)();
	}

	else if(__hw_serial_cb[0].sys_cb_vect != nullptr) {
		SystemEventHandler::call_int_callback(__hw_serial_cb[0].sys_cb_vect);

	}
}



#if defined(__AVR_ATmega328P__)
ISR(USART_RX_vect){
	char temp = UDR0;
	__hw_serial[0]->insertData(temp);
	if(__hw_serial[0]->echoIsEnabled()){
		UDR0 = temp;
	}
	//if(__hw_serial_cb[0] != nullptr){
	//	__hw_serial_cb[0]();
	//}

	if(__hw_serial_cb[0].user_cb_vect != nullptr){
		((void(*)())__hw_serial_cb[0].user_cb_vect)();
	}
	else if(__hw_serial_cb[0].sys_cb_vect != nullptr) {
		SystemEventHandler::call_int_callback(__hw_serial_cb[0].sys_cb_vect);
	}
}
#endif
/*
#elif defined(__AVR_ATmega640__) || defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)


//ISR(USART0_RX_vect){
//				//Serial *serial0 = SerialManager::getInstance(SERIAL0);
//				Serial *serial = __hw_serial[0];
//				char temp = UDR0;
//				serial->printf("Dentro isr %p %p\r\n", __hw_serial[0], &serial);
//				//serial0.insertData(temp);
//				//if(serial0->echoIsEnabled()){
//				//				UDR0 = temp;
//				//}
//				//serial0->rxCallBack();
//}
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
				uint8_t temp = UDR3;
				serial3->insertData(temp);
				if(serial3->echoIsEnabled()){
								UDR3 = temp;
				}
				serial3->rxCallBack();
}
#endif
*/

