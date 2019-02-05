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
//#include <portmanager.h>
//#include <stdarg.h>

#define _atmega2560 1
//#define _atmega328p 1

enum UART{
			BAUD_110 = 110,BAUD_300=330,BAUD_600=600,BAUD_1200=1200,
			BAUD_2400 = 2400,BAUD_4800=4800,BAUD_9600=9600,BAUD_14400=14400,
			BAUD_19200 = 19200,BAUD_38400=38400,BAUD_57600=57600,BAUD_115200=115200,
			BAUD_128000 = 128000,BAUD_256000=256000};
#ifdef _atmega2560
enum SerialPort{SERIAL0=0,SERIAL1=1,SERIAL2=2,SERIAL3=3};

class Serial
{

public:

	Serial(){}
	virtual ~Serial(){}
	virtual void init(UART){}
	virtual void printf(const char *fmt, ...){}
	virtual char receive(){}
	virtual void readUntil(char *buffer,char _char){}
	virtual uint8_t available(){}
	virtual void setISRCallBack(bool state){}
private:
	virtual void print(const char *str);
protected:
};
class Serial0 : public Serial {
public:
	virtual ~Serial0() override{}
	using Serial::Serial;
	void init(UART baud) override;
	char receive() override;
	void readUntil(char *buffer, char _char) override;
	void printf(const char *fmt,...) override;
	uint8_t available() override;
	void setISRCallBack(bool state) override;
private:
	void print(const char *str) override;
};
class Serial1 : public Serial {
public:
	virtual ~Serial1() override{}
	using Serial::Serial;
	void init(UART baud) override;
	char receive() override;
	void printf(const char *fmt,...) override;
private:
	void print(const char *str) override;
	uint8_t echoServer;
};
class Serial2 : public Serial {
public:
	virtual ~Serial2() override{}
	using Serial::Serial;
	void init(UART baud) override;
	char receive() override;
	void printf(const char *fmt,...) override;
private:
	void print(const char *str) override;
};

class Serial3 : public Serial {
public:
	virtual ~Serial3() override{}
	using Serial::Serial;
	void init(UART baud) override;
	char receive() override;
	void printf(const char *fmt,...) override;
private:
	void print(const char *str) override;
};


class SerialManager{
public:
	static Serial *getSerial(SerialPort uartNumber){
		switch (uartNumber) {
		case SerialPort::SERIAL0:
			return new Serial0();
		case SerialPort::SERIAL1:
			return new Serial1();
		case SerialPort::SERIAL2:
			return new Serial2();
		case SerialPort::SERIAL3:
			return new Serial3();
		default:
			return nullptr;

		}
	}


};

#endif



#ifdef _atmega328p
enum SerialPort{SERIAL0=0};
#endif

static Serial *serial0 = SerialManager::getSerial(SerialPort::SERIAL0);






#endif // SERIAL_H
