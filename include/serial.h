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
	//BAUD_2000000 =
};
enum SerialPort{
    SERIAL0 = 0,
    SERIAL1 = 1,
    SERIAL2 = 2,
    SERIAL3 = 3
};
enum SerialPriority{
    _LOW_PRIORITY,_MEDIUM_PRIORITY,_HIGH_PRIORITY
};

class Serial0 {
public:
    //-----------------METHODS-----------------//
    static void           init             (UART baud, SerialPriority priority = _LOW_PRIORITY);
    static void           printf           (const char *fmt,...);
    static uint8_t        available        ();
    static void           readUntil        (char *buffer, char _char);
    static uint8_t        receive          ();
	static void			  flush		       ();
    static void           setRxISRCallBack (bool state);
    static uint8_t        getEchoServer    ();
    static void           setEchoServer    (bool state = false);
    static void           _insertData      (uint8_t data);
    static uint8_t        _readData        ();
    static void           enableShell      (bool value = false);
    static bool           shellIsEnabled   ();
    static SerialPriority getPriority      ();
    static bool           bufferIsReadable ();
    //-----------------VARIABLES---------------//
    static uint8_t USART0_BUFF[MAX_SERIAL_BUFFER];
private:
    //-----------------METHODS-----------------//
    static void print(const char *str);
    //-----------------VARIABLES---------------//
    static uint8_t        echoServer;
    static uint8_t        shellEnabled;
    static uint8_t        *_read;
    static uint8_t        *_write;
    static SerialPriority priority;
    static bool           bufferReadable;
};
class Serial1 {
public:
    //-----------------METHODS-----------------//
    static void           init             (UART baud, SerialPriority priority = _LOW_PRIORITY);
    static void           printf           (const char *fmt,...);
    static uint8_t        available        ();
    static void           readUntil        (char *buffer, char _char);
    static uint8_t        receive          ();
	static void			  flush		       ();
    static void           setRxISRCallBack (bool state);
    static uint8_t        getEchoServer    ();
    static void           setEchoServer    (bool state);
    static void           _insertData      (uint8_t data);
    static uint8_t        _readData        ();
    static void           enableShell      (bool value = false);
    static bool           shellIsEnabled   ();
    static SerialPriority getPriority      ();
    //-----------------VARIABLES---------------//
    static uint8_t USART1_BUFF[MAX_SERIAL_BUFFER];
private:
    //-----------------METHODS-----------------//
    static void print(const char *str);
    //-----------------VARIABLES---------------//
    static uint8_t        echoServer;
    static uint8_t        shellEnabled;
    static uint8_t        *_read;
    static uint8_t        *_write;
    static SerialPriority priority;
};
class Serial2 {
public:
    //-----------------METHODS-----------------//
    static void           init             (UART baud, SerialPriority priority = _LOW_PRIORITY);
    static void           printf           (const char *fmt,...);
    static uint8_t        available        ();
    static void           readUntil        (char *buffer, char _char);
    static uint8_t        receive          ();
	static void			  flush		       ();
    static void           setRxISRCallBack (bool state);
    static uint8_t        getEchoServer    ();
    static void           setEchoServer    (bool state);
    static void           _insertData      (uint8_t data);
    static uint8_t        _readData        ();
    static void           enableShell      (bool value = false);
    static bool           shellIsEnabled   ();
    static SerialPriority getPriority      ();
    //-----------------VARIABLES---------------//
    static uint8_t USART2_BUFF[MAX_SERIAL_BUFFER];
private:
    //-----------------METHODS-----------------//
    static void print(const char *str);
    //-----------------VARIABLES---------------//
    static uint8_t        echoServer;
    static uint8_t        shellEnabled;
    static uint8_t        *_read;
    static uint8_t        *_write;
    static SerialPriority priority;
};

class Serial3{
public:
    //-----------------METHODS-----------------//
    static void           init             (UART baud, SerialPriority priority = _LOW_PRIORITY);
    static void           printf           (const char *fmt,...);
    static uint8_t        available        ();
    static void           readUntil        (char *buffer, char _char);
    static uint8_t        receive          ();
	static void			  flush		       ();
    static void           setRxISRCallBack (bool state);
    static uint8_t        getEchoServer    ();
    static void           setEchoServer    (bool state);
    static void           _insertData      (uint8_t data);
    static uint8_t        _readData        ();
    static void           enableShell      (bool value = false);
    static bool           shellIsEnabled   ();
    static SerialPriority getPriority      ();
    static bool           bufferIsReadable  ();
    //-----------------VARIABLES---------------//
    static uint8_t USART3_BUFF[MAX_SERIAL_BUFFER];
private:
    //-----------------METHODS-----------------//
    static void print(const char *str);
    //-----------------VARIABLES---------------//
    static uint8_t        echoServer;
    static uint8_t        shellEnabled;
    static uint8_t        *_read;
    static uint8_t        *_write;
    static SerialPriority priority;
    static bool           bufferReadable;
};

#endif



#ifdef _atmega328p
enum SerialPort{SERIAL0=0};
#endif



#endif // SERIAL_H
