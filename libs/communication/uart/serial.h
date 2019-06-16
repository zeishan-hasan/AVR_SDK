#ifndef SERIAL_H
#define SERIAL_H
#include <macros.h>
//#include "cppfix.h"
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/setbaud.h>
//#include <avr/iom2560.h>
#include <stdio.h>
///@file
//#include "vector.h"

/**
 * @brief Used to handle interrupts
 */
typedef void ser_cb_t();

#define _atmega2560 1
//#define _atmega328p 1

#ifdef _atmega2560
/**
 * @brief The UART enum
 */
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
    /**
     * @brief Initialize serial
     * @param[in] baud Check UART enum
     * @param[in] priority Check SerialPriority enum
     */
    void init(UART baud, SerialPriority _priority = _LOW_PRIORITY);

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
    void incReadData(uint8_t value = 1);

    /**
     * @brief enableShell
     * @param[in] value
     */
    void enableShell(bool value = false);

    /**
     * @brief registerCallback
     * @param[in] cb
     */
    void registerCallback(ser_cb_t *cb = nullptr);

    /**
     * @brief Used to call registered callback function
     */
    void rxCallBack();

    /**
     * @brief
     * @return
     */
    bool shellIsEnabled();

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
    SerialPriority getPriority();

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
    Serial(void) {}
    void _print(const char *str);

    //-----------------VARIABLES---------------//
    bool _echoServer;
    bool _shellEnabled;
    bool _bufferReadable;
    uint8_t *_read;
    uint8_t *_write;
    serial_t _self;
    SerialPriority _priority;
    ser_cb_t *_callback;
};





class Serial0 : public Serial {
    friend class SerialManager;
private:
    Serial0(): Serial() {
        _self.UCSRxA = (volatile uint8_t*)&UCSR0A;
        _self.UCSRxB = (volatile uint8_t*)&UCSR0B;
        _self.UCSRxC = (volatile uint8_t*)&UCSR0C;
        _self.UBRRxH = (volatile uint8_t*)&UBRR0H;
        _self.UBRRxL = (volatile uint8_t*)&UBRR0L;
        _self.UDRx   = (volatile uint8_t*)&UDR0;
    }

};

class Serial1 : public Serial {
    friend class SerialManager;
private:
    Serial1(): Serial() {
        _self.UCSRxA = (volatile uint8_t*)&UCSR1A;
        _self.UCSRxB = (volatile uint8_t*)&UCSR1B;
        _self.UCSRxC = (volatile uint8_t*)&UCSR1C;
        _self.UBRRxH = (volatile uint8_t*)&UBRR1H;
        _self.UBRRxL = (volatile uint8_t*)&UBRR1L;
        _self.UDRx   = (volatile uint8_t*)&UDR1;
    }

};


class Serial2 : public Serial {
    friend class SerialManager;
private:
    Serial2(): Serial() {
        _self.UCSRxA = (volatile uint8_t*)&UCSR2A;
        _self.UCSRxB = (volatile uint8_t*)&UCSR2B;
        _self.UCSRxC = (volatile uint8_t*)&UCSR2C;
        _self.UBRRxH = (volatile uint8_t*)&UBRR2H;
        _self.UBRRxL = (volatile uint8_t*)&UBRR2L;
        _self.UDRx   = (volatile uint8_t*)&UDR2;
    }

};

class Serial3 : public Serial {
    friend class SerialManager;
private:
    Serial3(): Serial() {
        _self.UCSRxA = (volatile uint8_t*)&UCSR3A;
        _self.UCSRxB = (volatile uint8_t*)&UCSR3B;
        _self.UCSRxC = (volatile uint8_t*)&UCSR3C;
        _self.UBRRxH = (volatile uint8_t*)&UBRR3H;
        _self.UBRRxL = (volatile uint8_t*)&UBRR3L;
        _self.UDRx   = (volatile uint8_t*)&UDR3;
    }


};

class SerialManager
{
public:
    static Serial* getInstance(SerialPort port){
        static Serial* instance[4] = {nullptr};
        if (instance[port] == nullptr)
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
