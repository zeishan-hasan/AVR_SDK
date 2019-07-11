#ifndef SERIAL_H
#define SERIAL_H
#include <macros.h>
//#include "cppfix.h"
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/setbaud.h>
#include <stdio.h>
#include <systemevent.h>


///@file

/**
	* @brief Used to handle interrupts
	*/
typedef void ser_cb_t();

struct __HW_INT_ISR
{
	ser_cb_t* user_cb_vect;
	SystemEventHandler* sys_cb_vect;
};




#define _UCSRxB(x) (*(x  + 1))
#define _UCSRxC(x) (*(x  + 2))
#define _UBRRxL(x)  (*(x  + 4))
#define _UBRRxH(x)  (*(x  + 5))
#define _UDRx(x)   (*(x  + 6))

/**
	* @brief The UART enum
	*/
enum UART{
	BAUD_2400    = 416,
	BAUD_4800    = 207,
	BAUD_9600    = 103,
	BAUD_14400   =	 68,
	BAUD_19200   =		51,
	BAUD_28800   =  34,
	BAUD_38400   =  25,
	BAUD_57600   =  16,
	BAUD_76800   =  12,
	BAUD_115200  =   8,
	BAUD_250000  =   3,
	BAUD_500000  =   1,
	BAUD_1000000 =   0
};

/**
	* @brief The SerialPort enum
	*/
enum SerialPort: uint8_t{
	SERIAL0 = 0,
	SERIAL1 = 1,
	SERIAL2 = 2,
	SERIAL3 = 3,
	MAX_SERIAL
};

/**
	* @brief The SerialPriority enum
	*/
enum SerialPriority: uint8_t{
	_LOW_PRIORITY,
	_MEDIUM_PRIORITY,
	_HIGH_PRIORITY
};


/**
	* @brief The serial_t struct
	*/
/*
struct serial_t
{
	volatile uint8_t *UCSRxA;
	volatile uint8_t *UCSRxB;
	volatile uint8_t *UCSRxC;
	volatile uint8_t *UBRRxH;
	volatile uint8_t *UBRRxL;
	volatile uint8_t *UDRx;
};
*/


class Serial
{


public:
	//-----------------METHODS-----------------//
	/**
					* @brief Initialize serial
					* @param[in] baud Check UART enum
					* @param[in] priority Check SerialPriority enum
					*/
	void init(UART baud);

	/**
					* @brief printf
					* @param fmt
					*/
	void printf(const char *fmt,...);

	/**
					* @brief Reads from UDRx
					* @param[out] buffer
					* @param[in] chr
					* @attention NOT TESTED WELL
					*/
	void readUntil(char *buffer, char chr);

	/**
					* @brief Empties UDRx buffer
					*/
	void flush();

	/**
					* @brief Enables interrupt on receive
					* @param[in] state
					*/
	void setRxISRCallBack (bool state);

	/**
					* @brief Enables echo server
					* @param[i] state
					*/
	void setEchoServer(bool state = false);

	/**
					* @brief Pushes data into \ref USART_BUFF[MAX_SERIAL_BUFFER]
					* @param[in] data
					*/
	void insertData(uint8_t data);

	/**
					* @brief Moves \ref *_read pointer forward
					* @param[in] value Number of steps
					* @bug NOT WORKING ATM
					*/
	//void incReadData(uint8_t value = 1);

	/**
					* @brief enableShell
					* @param[in] value
					*/
	//void enableShell(bool value = false);

	/**
					* @brief registerCallback
					* @param[in] cb
					*/
	virtual void registerCallback(ser_cb_t *cb = nullptr)  = 0;
	virtual void registerCallback(SystemEventHandler *cb = nullptr)  = 0;

	/**
					* @brief Used to call registered callback function
					*/
	//	inline void rxCallBack();

	/**
					* @brief
					* @return
					*/
	//	bool shellIsEnabled();

	/**
					* @brief bufferIsReadable
					* @return
					*/
	bool bufferIsReadable();

	/**
					* @brief isAvailable
					* @return
					*/
	bool isAvailable();

	/**
					* @brief echoIsEnabled
					* @return
					*/
	bool echoIsEnabled();

	/**
					* @brief receive
					* @return
					*/
	uint8_t receive();

	/**
					* @brief readData
					* @return
					*/
	uint8_t readData();

	/**
					* @brief getPriority
					* @return
					*/
	//SerialPriority getPriority();

	/**
					* @brief clear
					*/
	void clear();
	//-----------------VARIABLES---------------//

	/**
					* @brief A FIFO Rotating buffer
					*/
	uint8_t USART_BUFF[MAX_SERIAL_BUFFER];
protected:
	//-----------------METHODS-----------------//
	Serial() {}
	void _print(const char *str);

	//-----------------VARIABLES---------------//
	bool _echoServer;
	//bool _shellEnabled;
	bool _bufferReadable;
	uint8_t *_read;
	uint8_t *_write;
	//serial_t _self;
	volatile u8t* UCSRxA;
	//SerialPriority _priority;
	//ser_cb_t *_callback;
};

extern Serial* __hw_serial[4];
extern __HW_INT_ISR __hw_serial_cb[4];

class Serial0 : public Serial {
	friend class SerialManager;
public:
	Serial0(UART baud): Serial() {
		UCSRxA = (volatile uint8_t*)&UCSR0A;

		init(baud);
		__hw_serial[0] = this;
	}
	void registerCallback(ser_cb_t* cb = nullptr){
		__hw_serial_cb[0].user_cb_vect = cb;
	}
	void registerCallback(SystemEventHandler* cb = nullptr){
		__hw_serial_cb[0].sys_cb_vect = cb;
	}
};
#if defined(__AVR_ATmega328P__) || defined(__AVR_ATmega640__) || defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)
#endif
#if defined(__AVR_ATmega640__) || defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)
//class Serial1 : public Serial {
//	friend class SerialManager;
//private:
//	Serial1(): Serial() {
//		_self.UCSRxA = (volatile uint8_t*)&UCSR1A;
//		_self.UCSRxB = (volatile uint8_t*)&UCSR1B;
//		_self.UCSRxC = (volatile uint8_t*)&UCSR1C;
//		_self.UBRRxH = (volatile uint8_t*)&UBRR1H;
//		_self.UBRRxL = (volatile uint8_t*)&UBRR1L;
//		_self.UDRx   = (volatile uint8_t*)&UDR1;
//	}
//
//};


//class Serial2 : public Serial {
//	friend class SerialManager;
//private:
//	Serial2(): Serial() {
//		_self.UCSRxA = (volatile uint8_t*)&UCSR2A;
//		_self.UCSRxB = (volatile uint8_t*)&UCSR2B;
//		_self.UCSRxC = (volatile uint8_t*)&UCSR2C;
//		_self.UBRRxH = (volatile uint8_t*)&UBRR2H;
//		_self.UBRRxL = (volatile uint8_t*)&UBRR2L;
//		_self.UDRx   = (volatile uint8_t*)&UDR2;
//	}
//
//};

//class Serial3 : public Serial {
//	friend class SerialManager;
//private:
//	Serial3(): Serial() {
//		_self.UCSRxA = (volatile uint8_t*)&UCSR3A;
//		_self.UCSRxB = (volatile uint8_t*)&UCSR3B;
//		_self.UCSRxC = (volatile uint8_t*)&UCSR3C;
//		_self.UBRRxH = (volatile uint8_t*)&UBRR3H;
//		_self.UBRRxL = (volatile uint8_t*)&UBRR3L;
//		_self.UDRx   = (volatile uint8_t*)&UDR3;
//	}
//
//
//};
#endif
/*
class SerialManager
{
public:
	static Serial* getInstance(SerialPort port){

#if defined(__AVR_ATmega640__) || defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)
		static Serial* instance[1] = {nullptr};
#elif defined (__AVR_ATmega328P__)
		static Serial* instance[1] = {nullptr};
#endif
		if (instance[port] == nullptr)
		{
			switch (port) {
#if defined (__AVR_ATmega328P__) || defined(__AVR_ATmega640__) || defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)

			case SERIAL0:
				instance[port] = new Serial0;
				break;
			#endif
#if defined(__AVR_ATmega640__) || defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)
			case SERIAL1:
				instance[port] = new Serial1;
				break;
			case SERIAL2:
				instance[port] = new Serial2;
				break;
			case SERIAL3:
				instance[port] = new Serial3;
				break;
#endif
			}
		}
		return instance[port];
	}
private:


};

*/



#endif // SERIAL_H
