#ifndef SERIAL_H
#define SERIAL_H
#ifndef F_CPU
#define F_CPU 16000000UL
#endif
#define BAUD 9600
#define MYUBRR(x) (F_CPU/16/x-1)
#define MAX_SERIAL_BUFFER 256
#define ABS(N) ((N<0)?(-N):(N))
#include <cppfix.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/setbaud.h>
#include <avr/iom2560.h>
#include <stdio.h>
#include "vector.h"
typedef void ser_cb_t();
#define _atmega2560 1
//#define _atmega328p 1

#ifdef _atmega2560
enum UART{
    BAUD_2400    =    2400,
    BAUD_4800    =    4800,
    BAUD_9600    =    9600,
    BAUD_14400   =   14400,
    BAUD_19200   =   19200,
    BAUD_28800   =   28800,
    BAUD_38400   =   38400,
    BAUD_57600   =   57600,
    BAUD_76800   =   76800,
    BAUD_115200  =  115200,
    BAUD_250000  =  250000,
    BAUD_500000  =  500000,
    BAUD_1000000 = 1000000,
    //BAUD_2000000 = 20000000
};
enum SerialPort: uint8_t{
    SERIAL0 = 0,
    SERIAL1 = 1,
    SERIAL2 = 2,
    SERIAL3 = 3,
    MAX_SERIAL
};

enum SerialPriority: uint8_t{
    _LOW_PRIORITY,
    _MEDIUM_PRIORITY,
    _HIGH_PRIORITY
};




struct serial_t
{
    volatile uint8_t *UCSRxA;
    volatile uint8_t *UCSRxB;
    volatile uint8_t *UCSRxC;
    volatile uint8_t *UBRRxH;
    volatile uint8_t *UBRRxL;
    volatile uint8_t *UDRx;
};


class Serial
{

public:
    //-----------------METHODS-----------------//
    void	init(UART baud, SerialPriority priority = _LOW_PRIORITY);
    void	printf(const char *fmt,...);
    void	readUntil(char *buffer, char chr);
    void	flush();
    void	setRxISRCallBack (bool state);
    void	setEchoServer(bool state = false);
    void	insertData(uint8_t data);
    void	incReadData(uint8_t value = 1);
    void	enableShell(bool value = false);
    void	registerCallback(ser_cb_t *cb = nullptr);
    void	rxCallBack();
    bool	shellIsEnabled();
    bool	bufferIsReadable();
    bool	isAvailable();
    bool	echoIsEnabled();
    uint8_t	receive();
    uint8_t	readData();
    SerialPriority getPriority();
    void clear();
    //-----------------VARIABLES---------------//
    uint8_t USART_BUFF[MAX_SERIAL_BUFFER];
protected:
    Serial(void) {}
    //-----------------METHODS-----------------//
    void print(const char *str);
    //-----------------VARIABLES---------------//
    bool	echoServer;
    bool	shellEnabled;
    bool	bufferReadable;
    uint8_t	*_read;
    uint8_t	*_write;
    serial_t self;
    SerialPriority priority;
    ser_cb_t *callback;
};





class Serial0 : public Serial {
    friend class SerialManager;
private:
    Serial0(): Serial() {
        self.UCSRxA = (volatile uint8_t*)&UCSR0A;
        self.UCSRxB = (volatile uint8_t*)&UCSR0B;
        self.UCSRxC = (volatile uint8_t*)&UCSR0C;
        self.UBRRxH = (volatile uint8_t*)&UBRR0H;
        self.UBRRxL = (volatile uint8_t*)&UBRR0L;
        self.UDRx   = (volatile uint8_t*)&UDR0;
    }

};

class Serial1 : public Serial {
    friend class SerialManager;
private:
    Serial1(): Serial() {
        self.UCSRxA = (volatile uint8_t*)&UCSR1A;
        self.UCSRxB = (volatile uint8_t*)&UCSR1B;
        self.UCSRxC	= (volatile uint8_t*)&UCSR1C;
        self.UBRRxH = (volatile uint8_t*)&UBRR1H;
        self.UBRRxL = (volatile uint8_t*)&UBRR1L;
        self.UDRx		= (volatile uint8_t*)&UDR1;
    }

};


class Serial2 : public Serial {
    friend class SerialManager;
private:
    Serial2(): Serial() {
        self.UCSRxA = (volatile uint8_t*)&UCSR2A;
        self.UCSRxB = (volatile uint8_t*)&UCSR2B;
        self.UCSRxC	= (volatile uint8_t*)&UCSR2C;
        self.UBRRxH = (volatile uint8_t*)&UBRR2H;
        self.UBRRxL = (volatile uint8_t*)&UBRR2L;
        self.UDRx		= (volatile uint8_t*)&UDR2;
    }

};

class Serial3 : public Serial {
    friend class SerialManager;
private:
    Serial3(): Serial() {
        self.UCSRxA = (volatile uint8_t*)&UCSR3A;
        self.UCSRxB = (volatile uint8_t*)&UCSR3B;
        self.UCSRxC	= (volatile uint8_t*)&UCSR3C;
        self.UBRRxH = (volatile uint8_t*)&UBRR3H;
        self.UBRRxL = (volatile uint8_t*)&UBRR3L;
        self.UDRx		= (volatile uint8_t*)&UDR3;
    }


};

class SerialManager
{
public:
    static Serial* getInstance(SerialPort port){
        static Serial* instance[MAX_SERIAL];
        if (instance[port] == 0)
        {
            switch (port) {
            case SERIAL0:
                instance[port] = new Serial0;
                break;
            case SERIAL1:
                instance[port] = new Serial1;
                break;
            case SERIAL2:
                instance[port] = new Serial2;
                break;
            case SERIAL3:
                instance[port] = new Serial3;
                break;
            }

        }
        return instance[port];
    }
private:


};


#endif



#ifdef _atmega328p
enum SerialPort{SERIAL0=0};
#endif



#endif // SERIAL_H
