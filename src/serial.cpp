#include "serial.h"
#include <string.h>

//--------------------------------------------------SERIAL 0--------------------------------------------------//
//--------------------------------------------------Public methods--------------------------------------------//
uint8_t Serial0::USART0_BUFF[MAX_SERIAL_BUFFER];
uint8_t *Serial0::_read;
uint8_t *Serial0::_write;
SerialPriority Serial0::priority;
uint8_t Serial0::echoServer;
bool Serial0::bufferReadable;

void Serial0::init(UART baud, SerialPriority priority){
    UBRR0H = MYUBRR(baud)>>8;
	UBRR0L = (uint8_t)(MYUBRR(baud));
    /* Enable receiver and transmitter */
    UCSR0B = (1<<RXEN0)|(1<<TXEN0);
    /* Set frame format: 8data, 1stop bit */
    UCSR0C = (1<<UCSZ01)|(1<<UCSZ00);
	//UCSR0A = (1<<U2X0);						/// moltiplicatore
    Serial0::priority =  priority;
	memset(Serial0::USART0_BUFF,0xFF,MAX_SERIAL_BUFFER);
    Serial0::_read  = Serial0::USART0_BUFF;
    Serial0::_write = Serial0::USART0_BUFF+1;
    Serial0::bufferReadable = true;
}

void Serial0::printf(const char *fmt,...)
{
    va_list arg;
    char buff[MAX_SERIAL_BUFFER];
    va_start(arg,fmt);
    vsprintf(buff,fmt,arg);
    va_end(arg);
    Serial0::print(buff);
}


uint8_t Serial0::available()
{
    return (UCSR0A & (1<<RXC0))>>RXC0; // Return 1 means is available
}

void Serial0::readUntil(char *buffer,char _char)
{

    register uint8_t i = 0;

    while (1) {
        char temp = receive();
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

}

uint8_t Serial0::receive()
{
    while (!(UCSR0A & (1<<RXC0)));
	return UDR0;
}


void Serial0::flush()
{
	uint8_t dummy;
	while(UCSR0A & (1<<RXC0)) dummy=UDR0;
}
//---------- FIX ME ----------//
void Serial0::setRxISRCallBack(bool state)
{
    if(state == 1){
        UCSR0B |= (state << RXCIE0);
        return;
    }
    UCSR0B &= ~(1 << RXCIE0);

}
//---------- END FIX ME ----------//
uint8_t Serial0::getEchoServer()
{
    return Serial0::echoServer;
}
void Serial0::setEchoServer(bool state)
{
    Serial0::echoServer = state;
}

void Serial0::_insertData(uint8_t data)
{

    if( ++Serial0::_write > (uint8_t*)(&Serial0::USART0_BUFF+1)-1){
        Serial0::_write = Serial0::USART0_BUFF;
    }
    if(Serial0::_write == Serial0::_read){
        --Serial0::_write;
        if(Serial0::_write < Serial0::USART0_BUFF){
            Serial0::_write = (uint8_t*)(&Serial0::USART0_BUFF+1)-1;
        }
    }
    *Serial0::_write = data;
    //Serial0::bufferReadable = true;
}
uint8_t Serial0::_readData()
{

	Serial0::bufferReadable = true;
    if( ++Serial0::_read > (uint8_t*)(&Serial0::USART0_BUFF+1)-1){

        Serial0::_read = Serial0::USART0_BUFF;
    }
	if(Serial0::_read > Serial0::_write){
		Serial0::bufferReadable = false;
		Serial0::_read = Serial0::_write;
		return  0xFF;
        //if(Serial0::_read<Serial0::USART0_BUFF){
        //    Serial0::_read = (uint8_t*)(&Serial0::USART0_BUFF+1)-1;
        //}
        //return  *Serial0::_read;
    }
    uint8_t temp = *Serial0::_read;
	*Serial0::_read = 0xFF;
    return temp;
}



uint8_t Serial0::shellEnabled = false;



//---------- UNTESTED CODE ----------//
void Serial0::enableShell(bool value)
{
	Serial0::shellEnabled = value;
	if(value){
	Serial0::setRxISRCallBack(true);
	}
}
//---------- END UNTESTED CODE ----------//


bool Serial0::shellIsEnabled(){
    return Serial0::shellEnabled;
}

SerialPriority Serial0::getPriority()
{
    return Serial0::priority;
}

bool Serial0::bufferIsReadable()
{
    if(Serial0::_read == Serial0::_write){return false;}
    return true;
    ///return Serial0::bufferReadable;
}

//--------------------------------------------------End Public methods------------------------------------------//
//---------------Private methods----------//
void Serial0::print(const char *str){
    register uint8_t i=0;
    while (str[i]!=0) {
        // Wait for empty transmit buffer
        while ( !( UCSR0A & (1<<UDRE0)) );
        UDR0=str[i];
        ++i;
    }

}


//----------End private methods----------//
//------------------------------------------------END SERIAL 0--------------------------------------------------//

//--------------------------------------------------SERIAL 1--------------------------------------------------//
//--------------------------------------------------Public methods--------------------------------------------//
uint8_t Serial1::USART1_BUFF[MAX_SERIAL_BUFFER];
uint8_t *Serial1::_read;
uint8_t *Serial1::_write;
SerialPriority Serial1::priority;
uint8_t Serial1::echoServer;

void Serial1::init(UART baud, SerialPriority priority){
    UBRR1H = MYUBRR(baud)>>8;
    UBRR1L = (uint8_t)(MYUBRR(baud));
    /* Enable receiver and transmitter */
    UCSR1B = (1<<RXEN1)|(1<<TXEN1);
    /* Set frame format: 8data, 1stop bit */
    UCSR1C = (1<<UCSZ11)|(1<<UCSZ10);
    Serial1::priority =  priority;
    Serial1::_read  = Serial1::USART1_BUFF;
    Serial1::_write = Serial1::USART1_BUFF+1;
}

void Serial1::printf(const char *fmt,...)
{
    va_list arg;
    char buff[MAX_SERIAL_BUFFER];
    va_start(arg,fmt);
    vsprintf(buff,fmt,arg);
    va_end(arg);
    Serial1::print(buff);
}

uint8_t Serial1::available()
{
    return (UCSR1A & (1<<RXC1))>>RXC1; // Return 1 means is available
}

void Serial1::readUntil(char *buffer,char _char)
{

    register uint8_t i = 0;

    while (1) {
        char temp = Serial1::receive();
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

}

uint8_t Serial1::receive()
{
    while (!(UCSR1A & (1<<RXC1)));
    return UDR1;
}

void Serial1::flush()
{
	uint8_t dummy;
	while(UCSR1A & (1<<RXC1)) dummy=UDR1;
}


void Serial1::setRxISRCallBack(bool state)
{
    if(state == 1){
        UCSR1B |= (state << RXCIE1);
        return;
    }
    UCSR1B &= ~(1 << RXCIE1);

}

uint8_t Serial1::getEchoServer()
{
    return Serial1::echoServer;
}
void Serial1::setEchoServer(bool state)
{
    Serial1::echoServer = state;
}

void Serial1::_insertData(uint8_t data)
{
    *Serial1::_write = data;
    if( ++Serial1::_write > (uint8_t*)(&Serial1::USART1_BUFF+1)-1){
        Serial1::_write = Serial1::USART1_BUFF;
    }
    if(Serial1::_write == Serial1::_read){
        --Serial1::_write;
        if(Serial1::_write<Serial1::USART1_BUFF){
            Serial1::_write = (uint8_t*)(&Serial1::USART1_BUFF+1)-1;
        }
    }
}
uint8_t Serial1::_readData()
{
    uint8_t temp = *Serial1::_read;
    if( ++Serial1::_read > (uint8_t*)(&Serial1::USART1_BUFF+1)-1){
        Serial1::_read = Serial1::USART1_BUFF;
    }
    if(Serial1::_read ==Serial1::_write){
        Serial1::_read = Serial1::_write-1;
        if(Serial1::_read<Serial1::USART1_BUFF){
            Serial1::_read = (uint8_t*)(&Serial1::USART1_BUFF+1)-1;
        }
        temp = *Serial1::_read;
    }
    return temp;
}



uint8_t Serial1::shellEnabled = false;
void Serial1::enableShell(bool value)
{
    Serial1::shellEnabled = value;
	//Serial1::setRxISRCallBack(true);
}
bool Serial1::shellIsEnabled(){
    return Serial1::shellEnabled;
}

SerialPriority Serial1::getPriority()
{
    return Serial1::priority;
}
//--------------------------------------------------End Public methods------------------------------------------//
//----------------------------------------------------Private methods-------------------------------------------//
void Serial1::print(const char *str){
    register uint8_t i=0;
    while (str[i]!=0) {
        // Wait for empty transmit buffer
        while ( !( UCSR1A & (1<<UDRE1)) );
        UDR1=str[i];
        ++i;
    }

}
//-------------------------------------End private methods------------------------------------------------------//
//------------------------------------------------------------------END SERIAL 1----------------------------------------------------------------------//




//--------------------------------------------------------------------SERIAL 2------------------------------------------------------------------------//
//--------------------------------------------------Public methods--------------------------------------------//
uint8_t Serial2::USART2_BUFF[MAX_SERIAL_BUFFER];
uint8_t *Serial2::_read;
uint8_t *Serial2::_write;
SerialPriority Serial2::priority;
uint8_t Serial2::echoServer;

void Serial2::init(UART baud, SerialPriority priority)
{
    UBRR2H= MYUBRR(baud)>>8;

    UBRR2L = (uint8_t)(MYUBRR(baud));
    // Enable receiver and transmitter
    UCSR2B = (1<<RXEN2)|(1<<TXEN2);
    // Set frame format: 8data, 1stop bit
    UCSR2C = (1<<UCSZ21)|(1<<UCSZ20);
     Serial2::priority =  priority;
     Serial2::_read  = Serial2::USART2_BUFF;
     Serial2::_write = Serial2::USART2_BUFF+1;
}
void Serial2::printf(const char *fmt,...)
{
    va_list arg;
    char buff[MAX_SERIAL_BUFFER];
    va_start(arg,fmt);
    vsprintf(buff,fmt,arg);
    va_end(arg);
    Serial2::print(buff);
}
uint8_t Serial2::available()
{
    return (UCSR2A & (1<<RXC2))>>RXC2; // 01011101 RCXC0 1
}
void Serial2::readUntil(char *buffer, char _char)
{

    register uint8_t i = 0;

    while (1) {
        char temp = Serial2::receive();
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
}
uint8_t Serial2::receive()
{
    while (!(UCSR2A & (1<<RXC2)));
    return UDR2;
}

void Serial2::flush()
{
	uint8_t dummy;
	while(UCSR2A & (1<<RXC2)) dummy=UDR2;
}

void Serial2::setRxISRCallBack(bool state)
{
    if(state == 1){
        UCSR2B |= (state << RXCIE0);
        return;
    }
    UCSR2B &= ~(1 << RXCIE0);
}
uint8_t Serial2::getEchoServer()
{
    return Serial2::echoServer;
}
void Serial2::setEchoServer(bool state)
{
    Serial2::echoServer = state;
}

void Serial2::_insertData(uint8_t data)
{
    *Serial2::_write = data;
    if( ++_write > (uint8_t*)(&Serial2::USART2_BUFF+1)-1){
        Serial2::_write = Serial2::USART2_BUFF;
    }
    if(Serial2::_write == Serial2::_read){
        --Serial2::_write;
        if(Serial2::_write < Serial2::USART2_BUFF){
            Serial2::_write = (uint8_t*)(&Serial2::USART2_BUFF+1)-1;
        }
    }
}
uint8_t Serial2::_readData()
{
    uint8_t temp = *Serial2::_read;
    if( ++Serial2::_read > (uint8_t*)(&Serial2::USART2_BUFF+1)-1){
        Serial2::_read = Serial2::USART2_BUFF;
    }
    if(Serial2::_read == Serial2::_write){
        Serial2::_read = Serial2::_write-1;
        if(Serial2::_read < Serial2::USART2_BUFF){
            Serial2::_read = (uint8_t*)(&Serial2::USART2_BUFF+1)-1;
        }
        temp = *Serial2::_read;
    }
    return temp;
}

uint8_t Serial2::shellEnabled = false;
void Serial2::enableShell(bool value)
{
    Serial2::shellEnabled = value;
    Serial2::setRxISRCallBack(true);
}
bool Serial2::shellIsEnabled(){
    return Serial2::shellEnabled;
}

SerialPriority Serial2::getPriority()
{
    return Serial2::priority;
}


//----------End Public methods----------//
//----------Private methods----------//
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
//----------End Private methods----------//
//------------------------------------------------------------------END SERIAL 2----------------------------------------------------------------------//
//----------------------------------------------------------------------SERIAL 3----------------------------------------------------------------------//
//----------Public methods----------//
uint8_t  Serial3::USART3_BUFF[MAX_SERIAL_BUFFER];
uint8_t *Serial3::_read;
uint8_t *Serial3::_write;
SerialPriority Serial3::priority;
uint8_t Serial3::echoServer;
bool Serial3::bufferReadable;

void Serial3::init(UART baud, SerialPriority priority)
{
    UBRR3H=MYUBRR(baud)>>8;

    UBRR3L = (uint8_t)(MYUBRR(baud));
    // Enable receiver and transmitter
    UCSR3B = (1<<RXEN3)|(1<<TXEN3);
    // Set frame format: 8data, 1stop bit
    UCSR3C = (1<<UCSZ31)|(1<<UCSZ30);
    Serial3::priority =  priority;
    Serial3::_read  = Serial3::USART3_BUFF;
    Serial3::_write = Serial3::USART3_BUFF+1;
    Serial3::bufferReadable = false;
}
void Serial3::printf(const char *fmt,...)
{
    va_list arg;
    char buff[MAX_SERIAL_BUFFER];
    va_start(arg,fmt);
    vsprintf(buff,fmt,arg);
    va_end(arg);
    Serial3::print(buff);
}
uint8_t Serial3::available()
{
    return (UCSR3A & (1<<RXC3))>>RXC3; // 01011101 RCXC0 1
}
void Serial3::readUntil(char *buffer, char _char)
{
    register uint8_t i = 0;

    while (1) {
        char temp = Serial3::receive();
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
}
uint8_t Serial3::receive()
{
    while (!(UCSR3A & (1<<RXC3)));
    return UDR3;
}

void Serial3::flush()
{
	uint8_t dummy;
	while(UCSR3A & (1<<RXC3)) dummy=UDR3;
}

void Serial3::setRxISRCallBack(bool state)
{
    if(state == 1){
        UCSR3B |= (state << RXCIE3);
        return;
    }
    UCSR3B &= ~(1 << RXCIE3);
}
uint8_t Serial3::getEchoServer()
{
    return Serial3::echoServer;
}
void Serial3::setEchoServer(bool state)
{
    Serial3::echoServer = state;
}

void Serial3::_insertData(uint8_t data)
{
    if( ++Serial3::_write > (uint8_t*)(&Serial3::USART3_BUFF+1)-1){
        Serial3::_write = Serial3::USART3_BUFF;
    }
    if(Serial3::_write == Serial3::_read){
        --Serial3::_write;
        if(Serial3::_write < Serial3::USART3_BUFF){
            Serial3::_write = (uint8_t*)(&Serial3::USART3_BUFF+1)-1;
        }
    }
    *Serial3::_write = data;
}
uint8_t Serial3::_readData()
{

    //Serial0::bufferReadable = true;
    if( ++Serial3::_read > (uint8_t*)(&Serial3::USART3_BUFF+1)-1){
        Serial3::_read = Serial3::USART3_BUFF;
    }
    if(Serial3::_read > Serial3::_write){
        //Serial0::bufferReadable = false;
        Serial3::_read = Serial3::_write;
        return  0;
        //if(Serial0::_read<Serial0::USART0_BUFF){
        //    Serial0::_read = (uint8_t*)(&Serial0::USART0_BUFF+1)-1;
        //}
        //return  *Serial0::_read;
    }
    uint8_t temp = *Serial3::_read;
    *Serial3::_read = 0;
    return temp;
}


uint8_t Serial3::shellEnabled = false;
void Serial3::enableShell(bool value)
{
    Serial3::shellEnabled = value;
    Serial3::setRxISRCallBack(true);
}
bool Serial3::shellIsEnabled(){
    return Serial3::shellEnabled;
}

SerialPriority Serial3::getPriority()
{
    return Serial3::priority;
}

bool Serial3::bufferIsReadable()
{
   if(Serial3::_read == Serial3::_write) return false;
   return true;
    //return Serial3::bufferReadable;
}



//----------End Public methods----------//
//----------Private Methods----------//
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
//----------End Private Methods----------//
//------------------------------------------------------END SERIAL 3------------------------------------------------------//
//-----------------------------------------------------Interrupt Service Routine------------------------------------------//

//uint8_t TEMP_USART0_BUFF[MAX_SERIAL_BUFFER];
//uint8_t Serial0::USART0_BUFF[MAX_SERIAL_BUFFER];
//uint8_t Serial0::echoServer;
/*void readLine(){
    char temp;
    Serial0::printf("\n");
    while (1) {
        temp = Serial0::_readData();
        Serial0::printf("%c",temp);
        //_delay_ms(10);
        if(temp == '\r'){
            Serial0::printf("\n");
            break;
        }
    }
}*/
ISR(USART0_RX_vect){
    char temp = UDR0;
    Serial0::_insertData(temp);
    if(Serial0::getEchoServer()){
		UDR0 = temp;
    }

}
ISR(USART1_RX_vect){
    char temp = UDR1;
    Serial1::_insertData(temp);
    if(Serial1::getEchoServer()){
        UDR1 = temp;
    }
}
ISR(USART2_RX_vect){
    char temp = UDR2;
    Serial2::_insertData(temp);
    if(Serial2::getEchoServer()){
        UDR2 = temp;
    }
}
ISR(USART3_RX_vect){
    char temp = UDR3;
    Serial3::_insertData(temp);
    if(Serial3::getEchoServer()){
        UDR3 = temp;
    }
}
