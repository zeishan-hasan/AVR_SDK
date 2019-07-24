#ifndef SERIAL_H
#define SERIAL_H
#include <macros.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/setbaud.h>
#include <stdio.h>
#include <systemevent.h>
#include <printf.h>
#if defined(__AVR_ATmega640__) || defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)
#include <atmega2560.h>
#elif defined(__AVR_ATmega48p__) ||  defined(__AVR_ATmega88P__) || defined(__AVR_ATmega328P__)
#include <atmega328p.h>
#else
#include <gpiodef.h>
#endif



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







class Serial
{
public:
	//-----------------METHODS-----------------//
	/**
					* @brief Initialize serial
					* @param[in] baud Check UART enum
					* @param[in] priority Check SerialPriority enum
					*/
	void init(HW_UART baud);

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
					* @brief registerCallback
					* @param[in] cb
					*/
	virtual void registerCallback(ser_cb_t *cb = nullptr)  = 0;
	virtual void registerCallback(SystemEventHandler *cb = nullptr)  = 0;

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
					* @brief clear
					*/
	void clear();
	//-----------------VARIABLES---------------//

	/**
					* @brief A FIFO Rotating buffer
					*/
protected:
	//-----------------METHODS-----------------//
	Serial(volatile u8t* UCSRxA, HW_UART baud);

	//-----------------VARIABLES---------------//
	bool _echoServer;
	bool _bufferReadable;
	u8t *_read;
	u8t *_write;
	u8t USART_BUFF[MAX_SERIAL_BUFFER];

	volatile u8t* UCSRxA;
};



static Serial* __hw_serial[4] = {nullptr, nullptr, nullptr, nullptr};
static __HW_INT_ISR __hw_serial_cb[4] = {nullptr, nullptr, nullptr, nullptr};



class Serial0 : public Serial {
	friend class SerialManager;
private:
	Serial0(HW_UART baud, bool setRxIrq = false, bool setEcho = false) : Serial((volatile u8t*)&UCSR0A, baud) {
		UCSRxA = (volatile u8t*)&UCSR0A;

		setRxISRCallBack(setRxIrq);
		setEchoServer(setEcho);

		__hw_serial_cb[0].user_cb_vect = nullptr;
		__hw_serial_cb[0].sys_cb_vect = nullptr;
	}

	virtual void registerCallback(ser_cb_t* cb = nullptr) override {
		__hw_serial_cb[0].user_cb_vect = cb;
	}
	virtual void registerCallback(SystemEventHandler* cb = nullptr) override {
		__hw_serial_cb[0].sys_cb_vect = cb;
	}
};

class Serial1 : public Serial {
	friend class SerialManager;
private:
	Serial1(HW_UART baud, bool setRxIrq = false, bool setEcho = false) : Serial((volatile u8t*)&UCSR1A, baud) {
		UCSRxA = (volatile u8t*)&UCSR1A;

	_echoServer = true;
		setRxISRCallBack(setRxIrq);
		setEchoServer(setEcho);

		__hw_serial_cb[1].user_cb_vect = nullptr;
		__hw_serial_cb[1].sys_cb_vect = nullptr;
	}

	virtual void registerCallback(ser_cb_t* cb = nullptr) override {
		__hw_serial_cb[1].user_cb_vect = cb;
	}

	virtual void registerCallback(SystemEventHandler* cb = nullptr) override {
		__hw_serial_cb[1].sys_cb_vect = cb;
	}
};






/*


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
*/


class SerialManager
{
public:
	static Serial* getInstance(u8t port,HW_UART baud, bool setRxIrq = false, bool setEcho = false);
private:
	static Serial* _getPtr(u8t port){
		return __hw_serial[port];
	}

};




#endif // SERIAL_H
