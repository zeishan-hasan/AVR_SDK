#include "portmanager.h"


Pin::Pin(uint8_t portNo, DDRx direction)
{
    if(portNo > ELEMENT_IN_ARRAY(_flashMappedPort)){
                return;
    }
    uint16_t timers[] = {0x24,0x80,0xB0,0x90,0xA0,0x120};

    uint16_t _ADC_CHANNELS[16] = {
        /*CHANNEL_00*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (0<<MUX1) | (0<<MUX0),
        /*CHANNEL_01*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (0<<MUX1) | (1<<MUX0),
        /*CHANNEL_02*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (1<<MUX1) | (0<<MUX0),
        /*CHANNEL_03*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (1<<MUX1) | (1<<MUX0),
        /*CHANNEL_04*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (0<<MUX1) | (0<<MUX0),
        /*CHANNEL_05*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (0<<MUX1) | (1<<MUX0),
        /*CHANNEL_06*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (1<<MUX1) | (0<<MUX0),
        /*CHANNEL_07*/	 (0<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (1<<MUX1) | (1<<MUX0),
        /*CHANNEL_08*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (0<<MUX1) | (0<<MUX0),
        /*CHANNEL_09*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (0<<MUX1) | (1<<MUX0),
        /*CHANNEL_10*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (1<<MUX1) | (0<<MUX0),
        /*CHANNEL_11*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (0<<MUX2) | (1<<MUX1) | (1<<MUX0),
        /*CHANNEL_12*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (0<<MUX1) | (0<<MUX0),
        /*CHANNEL_13*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (0<<MUX1) | (1<<MUX0),
        /*CHANNEL_14*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (1<<MUX1) | (0<<MUX0),
        /*CHANNEL_15*/	 (1<<11) | (0<<MUX4) | (0<<MUX3) | (1<<MUX2) | (1<<MUX1) | (1<<MUX0),
    };

				_pinx	       = (volatile uint8_t*)pgm_read_word(&_flashMappedPort[portNo].pinx);
				_ddrx	       = (volatile uint8_t*)( _pinx + 1);
    _portx       = (volatile uint8_t*)( _pinx + 2);
    _registerBit = pgm_read_byte( &_flashMappedPort[portNo].registerBit );
    _controlBits = pgm_read_word( &_flashMappedPort[portNo].controlBits );
    _pinNumber	 = portNo;
    if(pgm_read_word(&_flashMappedPort[portNo].controlBits) & (1<<isPWM)){
        uint16_t temp = (pgm_read_word(&_flashMappedPort[portNo].controlBits) & (0x7<<OUT_CMP_SEL)) >> OUT_CMP_SEL;

        //WARNING  Timer 2 will be used into scheduler
        //if(temp == 2){
        //	_local_ctrl_bits = _PWM_8BIT;
        //	_pwm_8BIT.TCCRxA = (volatile uint8_t*)*(timers+temp);
        //	_pwm_8BIT.TCCRxB = (volatile uint8_t*)_pwm_8BIT.TCCRxA + 1;
								//	_pwm_8BIT.TCNTx	 = (volatile uint8_t*)_pwm_8BIT.TCCRxB + 1;
        //}

        //else{
        if( temp != 0 || temp != 2 ){

            _local_ctrl_bits  = _PWM_16BIT;
            _pwm_16BIT.TCCRxA = (volatile uint8_t*)*(timers+temp);
            _pwm_16BIT.TCCRxB = (volatile uint8_t*)_pwm_16BIT.TCCRxA + 1;
            _pwm_16BIT.TCCRxC = (volatile uint8_t*)_pwm_16BIT.TCCRxB + 1;
            _pwm_16BIT.TCNTx  = (volatile uint8_t*)_pwm_16BIT.TCCRxC + 2;
            _pwm_16BIT.ICRx   = (volatile uint8_t*)_pwm_16BIT.TCNTx  + 2;

        }
        //}
    }
    else if(pgm_read_byte(&_flashMappedPort[portNo].controlBits)&(1<<isADC)){
        _local_ctrl_bits = _ADC; //setting ADC flag
        channel = _ADC_CHANNELS[ (pgm_read_word(&_flashMappedPort[portNo].controlBits) &(0xF<<ADC_SEL)) >> ADC_SEL ];
    }

    setDirection(direction);
}

Pin::~Pin()
{

}

void Pin::on()
{
    *_portx |= (1 << _registerBit);
}

void Pin::setState(bool stat)
{
    if(stat == HIGH){
        *_portx |= (1 << _registerBit);
        return;
    }
    *_portx &= ~(1 << _registerBit);

}

void Pin::off()
{
    *_portx &= ~(1 << _registerBit);
}

void Pin::toggle()
{
    *_portx ^= (1 << _registerBit);
}

void Pin::setDirection(DDRx direction)
{

    if(direction == OUTPUT){
        *_ddrx |= (1 << _registerBit);
        return;
    }
    *_ddrx &= ~(1 <<_registerBit);
    if(direction == INPUT_PULLUP){
        on();
    }


}

bool Pin::setPWM(uint32_t freq, uint8_t duty)
{
    /*switch (_local_ctrl_bits) {

    case _PWM_16BIT:
        _freq_pwm = calculateTicks(freq);
        _duty_pwm = _freq_pwm-(_freq_pwm*((float)duty/100));
        *((volatile uint16_t*)_pwm_16BIT.ICRx) = _freq_pwm;
        switch( (_controlBits & (0x3<<LETTER_SEL) )>>LETTER_SEL){
        case 0:
            _pwm_16BIT.OCRx = (volatile uint8_t*)_pwm_16BIT.ICRx + 2;
            *_pwm_16BIT.TCCRxA |= (1<<7) | (1<<6) ;
            break;
        case 1:
            _pwm_16BIT.OCRx = (volatile uint8_t*)_pwm_16BIT.ICRx + 4;
            *_pwm_16BIT.TCCRxA |= (1<<5) | (1<<4) ;
            break;
        case 2:
            _pwm_16BIT.OCRx = (volatile uint8_t*)_pwm_16BIT.ICRx + 6;
            *_pwm_16BIT.TCCRxA |= (1<<3) | (1<<2) ;
            break;
        };
        *((volatile uint16_t*)_pwm_16BIT.OCRx) = _duty_pwm;

        *_pwm_16BIT.TCCRxA  |= (1 << WGM11) | (0 << WGM10);// Setting PWM, Phase Correct
        *_pwm_16BIT.TCCRxB  |= (1 << WGM13) | (1 << WGM12);// TOP = OCRnA TOVx Flag = BOTTOM
        *_pwm_16BIT.TCCRxB  |= (0<< CS12) | (0 << CS11) | (1 << CS10); //Setting prescaler to 1, so F_CPU
        break;
    default:
        return false;
    }*/

    if(_local_ctrl_bits == _PWM_16BIT){
        _freq_pwm = calculateTicks(freq);
        _duty_pwm = _freq_pwm-(_freq_pwm*((float)duty/100));
        *((volatile uint16_t*)_pwm_16BIT.ICRx) = _freq_pwm;
        switch((_controlBits & (0x3 << LETTER_SEL)) >> LETTER_SEL){
        case 0:
            _pwm_16BIT.OCRx = (volatile uint8_t*)_pwm_16BIT.ICRx + 2;
            *_pwm_16BIT.TCCRxA |= (1<<7) | (1<<6) ;
            break;
        case 1:
            _pwm_16BIT.OCRx = (volatile uint8_t*)_pwm_16BIT.ICRx + 4;
            *_pwm_16BIT.TCCRxA |= (1<<5) | (1<<4) ;
            break;
        case 2:
            _pwm_16BIT.OCRx = (volatile uint8_t*)_pwm_16BIT.ICRx + 6;
            *_pwm_16BIT.TCCRxA |= (1<<3) | (1<<2) ;
            break;
        };
        *((volatile uint16_t*)_pwm_16BIT.OCRx) = _duty_pwm;

        *_pwm_16BIT.TCCRxA  |= (1 << WGM11) | (0 << WGM10);// Setting PWM, Phase Correct
        *_pwm_16BIT.TCCRxB  |= (1 << WGM13) | (1 << WGM12);// TOP = OCRnA TOVx Flag = BOTTOM
        *_pwm_16BIT.TCCRxB  |= (0<< CS12) | (0 << CS11) | (1 << CS10); //Setting prescaler to 1, so F_CPU
        return true;
    }

    return false;
}

bool Pin::setDuty(uint8_t duty)
{
    //FIXME  REMOVE 8_BIT TIMER
    /* switch (_local_ctrl_bits) {
    case _PWM_8BIT:
        _duty_pwm=(-2.55*duty)+255;
        *((volatile uint8_t*)_pwm_8BIT.OCRx)=_duty_pwm;
        break;
    case _PWM_16BIT:
        _duty_pwm=_freq_pwm-(_freq_pwm*((float)duty/100));
        *((volatile uint16_t*)_pwm_16BIT.OCRx)=_duty_pwm;
        break;
    default:
        return false;
    }*/

    if(_local_ctrl_bits == _PWM_16BIT){
        _duty_pwm=_freq_pwm-(_freq_pwm*((float)duty/100));
        *((volatile uint16_t*)_pwm_16BIT.OCRx)=_duty_pwm;
        return true;
    }

    return false;
}

bool Pin::setFreq(uint16_t freq)
{
    /*//FIXME  REMOVE 8_BIT TIMER
    float ratio =_freq_pwm/_duty_pwm;
    _freq_pwm = calculateTicks(freq);
    _duty_pwm = (float)_freq_pwm/(float)ratio;
    switch (_local_ctrl_bits) {
    case _PWM_8BIT:
        return false; //Can't change frequency
    case _PWM_16BIT:
        *((volatile uint16_t*)_pwm_16BIT.ICRx)=_freq_pwm;
        *((volatile uint16_t*)_pwm_16BIT.OCRx)=_duty_pwm;
        break;
    default:
        return false;
    }*/

    if(_local_ctrl_bits == _PWM_16BIT){
        float ratio =_freq_pwm/_duty_pwm;
        _freq_pwm = calculateTicks(freq);
        _duty_pwm = (float)_freq_pwm/(float)ratio;
        *((volatile uint16_t*)_pwm_16BIT.ICRx)=_freq_pwm;
        *((volatile uint16_t*)_pwm_16BIT.OCRx)=_duty_pwm;
        return true;
    }

    return false;
}

bool Pin::digitalRead()
{
    if(*_pinx & (1<<_registerBit)){
        return true;
    }
    return false;
}


uint16_t Pin::analogRead(_ADMUX vRef, _ADCSRA_PRESCALER prescaler, _ADCSRB_AUTOTRIGGER autoTrigger)
{
    if(_local_ctrl_bits == 0){
        return 65535;
    }
    if(channel == 65535){
        return 65535;
    }

    /*
    ╔════════╦═══════╦═══════╦═══════╦══════╦══════╦═══════╦═══════╦═══════╗
    ║        ║   7   ║   6   ║   5   ║   4  ║   3  ║   2   ║   1   ║   0   ║
    ╠════════╬═══════╬═══════╬═══════╬══════╬══════╬═══════╬═══════╬═══════╣
    ║ ADCSRB ║   -   ║  ACME ║   -   ║   -  ║ MUX5 ║ ADTS2 ║ ADTS1 ║ ADTS0 ║
    ╠════════╬═══════╬═══════╬═══════╬══════╬══════╬═══════╬═══════╬═══════╣
    ║  ADMUX ║ REFS1 ║ REFS0 ║ ADLAR ║ MUX4 ║ MUX3 ║  MUX2 ║  MUX1 ║  MUX0 ║
    ╚════════╩═══════╩═══════╩═══════╩══════╩══════╩═══════╩═══════╩═══════╝
    */

    uint16_t _adcsrb_adxmux_reg = (autoTrigger<<8) | vRef | channel;

    if(ADCSRA == 0){

        ADCSRA |= (1<<ADEN) | (0<<ADIE) | prescaler;//FIXME if set ADIE will not work and crash(it's necessary?)

    }

    while(ADCSRA & (1<<ADIF) == 0);

    ADCSRB = (_adcsrb_adxmux_reg >> 8);

    ADMUX = (_adcsrb_adxmux_reg & 0xFF);

    ADCSRA |= (1<<ADSC);

    while(ADCSRA & (1<<ADSC));

    return ADC;//*0.004882813;
}


uint8_t Pin::getPinNumber()
{
    return _pinNumber;
}

uint8_t Pin::getPWM()
{
    return (uint8_t)((((float)_freq_pwm - (float)_duty_pwm) * (float)100) / (float)_freq_pwm) & 0xFF;
}

uint8_t Pin::getRegisterBit()
{
    return _registerBit;
}

volatile uint8_t* Pin::getPINxAddr()
{
    return _pinx;
}

uint16_t Pin::calculateTicks(uint32_t freq)
{
    return (1.0/freq)/(1.0/F_CPU);
}

