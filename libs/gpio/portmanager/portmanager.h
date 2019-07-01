#ifndef PORTMANAGER_H
#define PORTMANAGER_H

///@file
#include <avr/io.h>
#include <stdlib.h>
#include <math.h>
#include <util/delay.h>
#include <stdio.h>
#include "macros.h"

#if defined(__AVR_ATmega640__) || defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)
#include <atmega2560.h>
#elif defined (__AVR_ATmega328P__)
#include <atmega328p.h>
#endif


/**
        * @brief The DDRx enum
        */
enum DDRx:uint8_t{
    INPUT,
    OUTPUT,
    INPUT_PULLUP
};

/**
        * @brief The LogicStates enum
        */
enum LogicStates:uint8_t{
    LOW, HIGH
};




/**
        * @brief The _ADMUX enum
        */
enum _ADMUX: u8t {
    INTERNAL_VREF   = (0<<REFS1) | (0<<REFS0), // AREF,Internal VREF turned OFF
    AVCC            = (0<<REFS1) | (1<<REFS0), // AVCC at AREF Pin with external capacitor
    INTERNAL_1_1V   = (1<<REFS1) | (0<<REFS0), // Internal 1.1Voltage reference with external capacitor at AREF pin
    INTERNAL_2_56V  = (1<<REFS1) | (1<<REFS0), // Internal 2.56Voltage reference with external capacitor at AREF pin
};

/**
        * @brief The _ADCSRA_PRESCALER enum
        */
enum _ADCSRA_PRESCALER: u8t {
    F_CPU_BY_2	  = (0<<ADPS2)|(0<<ADPS1)|(1<<ADPS0),
    F_CPU_BY_4	  = (0<<ADPS2)|(1<<ADPS1)|(0<<ADPS0),
    F_CPU_BY_8	  = (0<<ADPS2)|(1<<ADPS1)|(1<<ADPS0),
    F_CPU_BY_16	 = (1<<ADPS2)|(0<<ADPS1)|(0<<ADPS0),
    F_CPU_BY_32	 = (1<<ADPS2)|(0<<ADPS1)|(1<<ADPS0),
    F_CPU_BY_64	 = (1<<ADPS2)|(1<<ADPS1)|(0<<ADPS0),
    F_CPU_BY_128 = (1<<ADPS2)|(1<<ADPS1)|(1<<ADPS0),
};


/**
        * @brief The _ADCSRB_AUTOTRIGGER enum
        */
enum _ADCSRB_AUTOTRIGGER: u8t{
    FREE_RUNNING_MODE         = (0<<ADTS2) | (0<<ADTS1) |(0<<ADTS0),
    ANALOG_COMPARATOR         = (0<<ADTS2) | (0<<ADTS1) |(1<<ADTS0),
    EXTERNAL_INTERRUPT_REQ_0  = (0<<ADTS2) | (1<<ADTS1) |(0<<ADTS0),
    TNCT0_COMP_A              = (0<<ADTS2) | (1<<ADTS1) |(1<<ADTS0),
    TNCT0_OVERFLOW												= (1<<ADTS2) | (0<<ADTS1) |(0<<ADTS0),
    TNCT1_COMP_B														= (1<<ADTS2) | (0<<ADTS1) |(1<<ADTS0),
    TNCT1_OVERFLOW												= (1<<ADTS2) | (1<<ADTS1) |(0<<ADTS0),
    TNCT1_CAPTURE_EVENT	      = (1<<ADTS2) | (1<<ADTS1) |(1<<ADTS0),
};

/**
        * @brief The PWM_8BIT struct
        */
struct PWM_8BIT {
    volatile uint8_t *TCCRxA = nullptr;
    volatile uint8_t *TCCRxB = nullptr;
    volatile uint8_t *TCNTx  = nullptr;
    volatile uint8_t *OCRx   = nullptr;
};

/**
        * @brief The PWM_16BIT struct
        */
struct PWM_16BIT : PWM_8BIT {
    volatile uint8_t *TCCRxC = nullptr;
    volatile uint8_t *ICRx   = nullptr;
};

/**
        * @brief The _LOCAL_CTRL_BITS enum
        */
/*
enum _LOCAL_CTRL_BITS:uint8_t{
        _PWM_8BIT = 0x2, _PWM_16BIT = 0x3, _ADC = 0x4
};*/


enum _PWM_BITS : u8t {
    _PWM_8BIT, _PWM_16BIT
};



/**
        * @brief The Pin class
        */
class Pin{
public:

    Pin(){}

    /**
                                        * @brief Pin Constructor
                                        * @param[in] portNo Is the physical pin of the board
                                        * @param[in] direction Check DDRx enum
                                        */
    Pin(uint8_t portNo, DDRx direction);

    ~Pin();

    /**
                                        * @brief Sets state on of a pin
                                        */
    void on();

    /**
                                        * @brief Set state of a pin
                                        * @param[in] stat  True = on, False = off
                                        */
    void setState(bool stat = true);

    /**
                                        * @brief Sets state off of a pin
                                        */
    void off();

    /**
                                        * @brief Toggle a pin state
                                        */
    void toggle();

    /**
                                        * @brief setDirection
                                        * @param[in] direction
                                        */
    void setDirection(DDRx direction);

    /**
                                        * @brief Set hardware PWM
                                        * @param[in] freq In hertz
                                        * @param[in] duty In range 0 - 100
                                        * @return True if pin has hardware PWM, else  false
                                        */
    bool setPWM(uint32_t freq, uint8_t duty = 50);

    /**
                                        * @brief Set duty of hardware PWM
                                        * @param[in] duty Range 0 - 100
                                        * @return True if pin has hardware PWM, else  false
                                        */
    bool setDuty(uint8_t duty);

    /**
                                        * @brief Set Frequency of hardware PWM
                                        * @param[in] freq In hertz
                                        * @return True if pin has hardware PWM, else  false
                                        */
    bool setFreq(uint16_t freq);

    /**
                                        * @brief Stop PWM
                                        * @return True if pin has hardware PWM, else  false
                                        */
    bool stopPWM();

    /**
                                        * @brief digitalRead
                                        * @return True if pin TTL high, else False
                                        */
    bool digitalRead();

    /**
                                        * @brief analogRead
                                        * @param[in] vRef Check _ADMUX enum
                                        * @param[in] prescaler Check _ADCSRA_PRESCALER enum
                                        * @param[in] autoTrigger Check _ADCSRB_AUTOTRIGGER enum
                                        * @return
                                        */
    uint16_t analogRead(_ADMUX vRef = AVCC, _ADCSRA_PRESCALER prescaler = F_CPU_BY_128, _ADCSRB_AUTOTRIGGER autoTrigger = FREE_RUNNING_MODE);

    /**
                                        * @brief getPinNumber
                                        * @return Number of mapped pin into the board
                                        */
    uint8_t getPinNumber();

    /**
                                        * @brief Get PWM Duty Cycle
                                        * @return Percentage of duty cycle. Range : 0% - 100%
                                        */
    uint8_t getPWM();

    /**
                                        * @brief Get register bit
                                        * @return Bits into own register
                                        */
    uint8_t getRegisterBit();

    /**
                                        * @brief getPINxAddr
                                        * @return Mapped address of PINx
                                        */
    volatile uint8_t *getPINxAddr();

private:
    //---- Methods ----//
    uint16_t calculateTicks(uint32_t freq);

    //---- Variables ----//
    volatile uint8_t *_ddrx;
    volatile uint8_t *_portx;
    volatile uint8_t *_pinx;
    uint16_t channel = 65535;
    uint8_t _registerBit;
    //uint8_t _local_ctrl_bits;

    PWM_16BIT _pwm_16BIT;
    PWM_8BIT _pwm_8BIT;

    uint16_t _freq_pwm;
    uint16_t _duty_pwm;
    uint16_t _controlBits;

    uint8_t _pinNumber;
};


#endif // PORTMANAGER_H
