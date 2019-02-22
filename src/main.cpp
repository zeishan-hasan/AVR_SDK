#ifndef F_CPU
#define F_CPU 16000000UL
#endif
#include <avr/io.h>
#include <util/delay.h>
#include <stdlib.h>
#include "stdio.h"
#include <portmanager.h>
#include <serial.h>
#include "vector.h"
#include <time.h>
#include <stdlib.h>
#include <timer.h>
#include <command.h>
#include <interrupt.h>
#include <sensors.h>
#include <util/atomic.h>
#include <avr/wdt.h>

struct Sensors sensors;
Pin US0_PIN_TRIGGER(8,OUTPUT);
Pin US0_PIN_ECHO(53,INPUT);
void ultraSonicRoutine(){
    US0_PIN_TRIGGER.on();
    _delay_us(10);
    US0_PIN_TRIGGER.off();

};



void ultraSonicISR(uint8_t pin) {
    if(pin == US0_PIN_ECHO.getPinNumber()){
        static double previous;
        if (US0_PIN_ECHO.digitalRead()){
            previous = Timer::now();
        }
        else {
            ATOMIC_BLOCK(ATOMIC_FORCEON){
                sensors.us.US0 = (Timer::now() - previous) /58;
            }
        }
    }

}
void func1(){
    // serial0->printf("Altra\r\n");
};
/*
char TEMP_USART0_BUFF[MAX_SERIAL_BUFFER];
char USART0_BUFF[MAX_SERIAL_BUFFER];
char *temp[10];
uint8_t index= 0;
ISR(USART3_RX_vect){
    if(index == MAX_SERIAL_BUFFER){
        index = 0;
    }
    USART0_BUFF[index]= UDR3;
    //UDR0 = USART0_BUFF[index];
    if(USART0_BUFF[index] == '\n'){
        if (strncmp(USART0_BUFF,"$GPRMC",strlen("$GPRMC"))==0){ //$GPRMC,100339.00,A,3808.24584,N,01304.18234,E,0.028,,250518,,,A*7F
            USART0_BUFF[++index]= '\0';
            ATOMIC_BLOCK(ATOMIC_FORCEON){
                strcpy(_USART0_BUFF,USART0_BUFF);
            }
            //serial0->printf("%s",_USART0_BUFF);
            uint8_t i = 0;
            char *vect;
            vect = strtok (_USART0_BUFF,",");
            temp[i]=vect;
            ++i;

            while (vect != NULL)
            {
                vect = strtok (NULL, ",");
                temp[i]=vect;
                ++i;
            }
            index = 0;
            return;
        }
        else {
            index = 0;
            return;
        }
    }
    ++index;

}

void getGPS(){

    if(temp[0]==nullptr){
        return;
    };
    ATOMIC_BLOCK(ATOMIC_FORCEON){
        if(*(temp[1] +  0 )  >= '0' && *(temp[1] +  0 ) <= '9' ){
            sensors.gps.datetime.hours   =  ( *(temp[1] +  0 ) & 0xF) * 10 + (* (temp[1] + 1) & 0xF);
            sensors.gps.datetime.minutes =  ( *(temp[1] +  2 ) & 0xF) * 10 + (* (temp[1] + 3) & 0xF);
            sensors.gps.datetime.seconds =  ( *(temp[1] +  4 ) & 0xF) * 10 + (* (temp[1] + 5) & 0xF);
        }
        if(*(temp[2] +  0 )  == 'A' || *(temp[2] +  0 )  == 'V'){
            sensors.gps.status =  ( *(temp[2] +  0 ) == 'A') ? 1 : 0 ;
        }
        if(*(temp[3] +  0 )  >= '0' && *(temp[3] +  0 ) <= '9' ){
            sensors.gps.latitude.degrees        = ( *(temp[3] +  0 ) & 0xF) * 10 + (* (temp[3] + 1) & 0xF);
            sensors.gps.latitude.minutesInteger = ( *(temp[3] +  2 ) & 0xF) * 10 + (* (temp[3] + 3) & 0xF);
            sensors.gps.latitude.minutesDecimal = atoi((temp[3] +  5));
            sensors.gps.latitude.dir            = ( *(temp[4] +  0 ) == 'N') ? 0 : 1 ;
        }

        if(*(temp[5] +  0 )  >= '0' && *(temp[5] +  0 ) <= '9' ){
            sensors.gps.longitude.degrees        = ( *(temp[5] +  0 ) & 0xF) * 100 + ( *(temp[5] + 1) & 0xF) *10 + ( *(temp[5]+ 2) & 0xF);
            sensors.gps.longitude.minutesInteger = ( *(temp[5] +  3 ) & 0xF) * 10 + (* (temp[5] + 4) & 0xF);
            sensors.gps.longitude.minutesDecimal = atoi((temp[5] +  6));
            sensors.gps.longitude.dir            = ( *(temp[6] +  0 ) == 'W') ? 0 : 1 ;
        }
        if(*(temp[7] +  0 )  >= '0' && *(temp[7] +  0 ) <= '9' ){
            float speed =  atof((const char*)temp[7])*0.514444;
            sensors.gps.speed.integer = speed;
            sensors.gps.speed.decimal = (uint8_t)(speed*100)%100;
        }

        if(*(temp[8] +  0 )  >= '0' && *(temp[8] +  0 ) <= '9' ){
            sensors.gps.datetime.day    =  ( *(temp[8] +  0 ) & 0xF) * 10 + (* (temp[8] + 1) & 0xF);
            sensors.gps.datetime.month  =  ( *(temp[8] +  2 ) & 0xF) * 10 + (* (temp[8] + 3) & 0xF);
            sensors.gps.datetime.year   =  ( *(temp[8] +  4 ) & 0xF) * 10 + (* (temp[8] + 5) & 0xF);
        }
    }
}*/
void readLine(){
    TCCR2B &= ~(1 << CS22) |(1 << CS21) | (1 << CS20);
    char temp = 0,buff[256];
    uint8_t i = 0;
    Serial0::printf("Shell\r\n");
    while (1) {
        while (Serial0::bufferIsReadable()) {
            temp = Serial0::_readData();
            if(temp== 0){continue;}
            //Serial0::printf("Parsing %c\r\n",temp);
            buff[i++] = temp;
            if(temp == '\b'){
                if(--i<0){i = 0;}
            }
            if(temp == 13){
                buff[i++] = '\n';
                buff[i] = '\0';
                i = 0;
                temp = 0;

                Serial0::printf("You wrote: %s",buff);

                break;
            }
            //_delay_ms(500);
        }
        //_delay_ms(500);
    }

}
void readLineGPS(){
    TCCR2B &= ~(1 << CS22) |(1 << CS21) | (1 << CS20);
    char temp = 0,buff[256];
    uint8_t i = 0;
    Serial0::printf("GPS\r\n");
    while (1) {
        while (Serial3::bufferIsReadable()) {
            temp = Serial3::_readData();
            if(temp == 0){continue;}
            buff[i++] = temp;
            if(temp == '\b'){
                if(--i<0){i = 0;}
            }
            if(temp == '\n'){
                buff[i++] = '\r';
                buff[i] = '\0';
                i = 0;
                temp = 0;
                if (strncmp(buff,"$GPRMC",strlen("$GPRMC"))==0){
                    Serial0::printf("%s",buff);
                }
                break;
            }
            //_delay_ms(500);
        }
        //_delay_ms(500);
    }

}
void pippo[[noreturn]](){
    uint8_t s = 0;
    //WDTCSR = (1<<WDIF) | (1<<WDIE) | (1<<WDP3) | (0<<WDP2) | (0<<WDP1) | (0<<WDP0);
    //Serial0::printf("Address of  s : %p\r\n",&s);
    uint16_t _sp  = SP;
    Serial0::printf("Base pointer %p\r\n",*(uint8_t*)_sp+3);
    while (1) {
        Serial0::printf("Value of pippo : %d\r\n",s++);
        _delay_ms(500);
    }

}

void pippo1[[noreturn]](){
    uint8_t s = 0;
    //WDTCSR = (1<<WDIF) | (1<<WDIE) | (1<<WDP3) | (0<<WDP2) | (0<<WDP1) | (0<<WDP0);
    uint16_t _sp  = SP;
    Serial0::printf("Base pointer %p\r\n",*(uint8_t*)_sp+3);
    func *f = *(func*)(_sp+3);
    f();
    while (1) {
        Serial0::printf("Value of pippo1 : %d\r\n",s++);
        _delay_ms(1000);

    }

}
void setupWDT(){
    // Disable all interrupts
    cli();

    /* Clear MCU Status Register. Not really needed here as we don't need to know why the MCU got reset. page 44 of datasheet */
    MCUSR = 0;

    /* Disable and clear all Watchdog settings. Nice to get a clean slate when dealing with interrupts */

    //WDTCSR = 0;
    WDTCSR = (1<<WDCE)|(1<<WDE);

    // Setup Watchdog for interrupt and not reset, and a approximately 500ms timeout P.45
    WDTCSR =  (0<<WDP3) | (0<<WDP2) | (0<<WDP1) | (0<<WDP0);

    // Enable all interrupts.
    sei();
}

int main(void)
{


    Timer::start();
    Serial0::init(BAUD_1000000,_LOW_PRIORITY);
    Serial0::setEchoServer(false);
    Serial0::setRxISRCallBack(false);
    Serial0::enableShell(false);

    //Serial3::init(BAUD_9600,_LOW_PRIORITY);
    //Serial3::setEchoServer(false);
    //Serial3::setRxISRCallBack(false);
    //Serial3::enableShell(false);

    //Serial0::printf("init :%d\r\n",Serial3::bufferIsReadable());

    //Serial3::init(BAUD_9600,_LOW_PRIORITY);
    //Interrupt::attachInterrupt(53,POSITIVE_EDGE,ultraSonicISR);
    //Scheduler::addTask((func*)ultraSonicRoutine);
    ////Scheduler::addTask((func*)func1);
    //Command::serialOutput = (uint8_t*)&UDR0;
    //Scheduler::addTask(readLineGPS);
    //Scheduler::addTask(readLine);
    Scheduler::addTask(pippo);
    Scheduler::addTask(pippo1);

    //Scheduler::init();
    //_delay_ms(1000);
    // wdt_disable();

    //setupWDT();
    //wdt_enable(WDTO_1S);

    //pippo();
    //uint8_t s;
    //    asm volatile (
    //                "ldi r16,50" "\n\t"
    //                "push r16"    "\n\t"
    //                //"mov %0,r16" "\n\t"
    //                :
    //                :
    //                :"r16"
    //                );
    //pippo();
    //Serial0::printf("Dato %d\r\n",s);
    //readLineGPS();
    // uint8_t var = 0;
    // asm volatile(
    //             "RJMP PIPPO"    "\n"
    //             "SOMMA:"               "\n\t"
    //             "IN r28,0x3d   ""\n\t"  //get stack pointer
    //             "IN r29,0x3e   ""\n\t"
    //             "ADIW R29:R28,4 ""\n\t"
    //             "LD r16,Y+    ""\n\t"
    //             "LD r17,Y     ""\n\t"
    //             "ADD r16,r17  ""\n\t"
    //             "RET         ""\n"
    //             "PIPPO:"                            "\n\t"
    //             "LDI R16,low(0x21FF)      ""\n\t"
    //             "OUT SPL,R16              ""\n\t"
    //             "LDI R16,high(0x21FF)     ""\n\t"
    //             "OUT SPH,R16              ""\n\t"
    //             "LDI R18,0x1              ""\n\t"
    //             "PUSH R18                 ""\n\t"
    //             "LDI R18,0x2              ""\n\t"
    //             "PUSH %R18                 ""\n\t"
    //             "CALL SOMMA               ""\n\t"
    //             "MOV %0,%R16               ""\n\t"
    //             :"=r"(var)
    //             :
    //             :"%r24");
    //DDRB |= (1<<7);
    //uint8_t value;
    //__asm__ __volatile__(
    //            "LDI ZL,0xFF\n\t"
    //            "LDI ZH,0x21\n\t"
    //            "LDI R16,0X22\n\t"
    //            "ST    Z,R16\n\t"
    //            "LDI R16,0X11\n\t"
    //            "ST    -Z,R16\n\t"
    //            //"LDI R16,0X88\n\t"
    //            "ADIW Z,2\n\t"
    //            //"ST    Z,R16\n\t"
    //            //"LDS %0,$2200\n\t"
    //            :"=r"(value)
    //            );
    //uint8_t* ptr = (uint8_t*)0x2200;
    //*ptr = 0x55;
    //Serial0::printf("Valoree 0x%x\r\n",*ptr);
    //Serial0::printf("Valore val 0x%x\r\n",value);
    //Serial0::printf("Valoree 0x%x\r\n",*(uint8_t*)0x21FE);
    //pippo();
    //asm volatile ("STS $21FF,r16");
    Pin adc0(A0,INPUT);
    while (1) {
        Serial0::printf("Data : %lf\r\n");
        _delay_ms(10);
        //serial0->printf("Data : %lf\r\n",*a+5);
        //Interrupt::deatchInterrupt(13);
        //US0_PIN_TRIGGER.on();
        //_delay_us(10);
        //US0_PIN_TRIGGER.off();

        ////_delay_ms(20);
        ////
        //US1_PIN_TRIGGER.on();
        //_delay_us(10);
        //US1_PIN_TRIGGER.off();
        //serial0->printf("Queue size : %d\r\n",command.getQueueSize());
        ///serial0->printf("US0 %lf cm\r\",us0*1e6/58);
        //serial0->printf("US1 %lf cm\r\n",us1*1e6/58);
        //serial0->printf("%02d:%02d:%02d:%03d\r\n",timer._time.hours,timer._time.minutes,timer._time.seconds,timer._time.milliSeconds);
        //Timer::start();
        // asm volatile("nop");
        //Timer::stop();
        //if(Timer::_time.microSeconds){

        //int a= Timer::_time.microSeconds*5+(0.0000000625*(double)TCNT0);
        //serial0->printf("%d\r\n",Timer::_time.microSeconds*5);
        //while (1) {}
        //serial0->printf("%d\r\n",Timer::_time.microSeconds);


        //PORTB ^= (1<<7);
        //serial0->printf("Listening\r\n");
        //	asd.stop();
        //Timer::start();
        //_delay_ms(100);
        //asm volatile("nop");
        //asm volatile("nop");
        //Timer::stop();
        //serial0->printf("%lf\r\n", (0.0000000625*(float)TCNT0)*1e6 -0.812500);
        //serial0->printf("Tempo %.lf\r\n",Timer::now());
        //serial0->printf("us0: %.lf\n\r",us0/58);
        //serial0->printf("\r\n");
        //if(serial2->available()){
        //serial0->readUntil(buff,'\r');
        //if(serialBuffer[i] == '\r'){
        //	serial0->printf("You wrote : %s\r\n",*serialBuffer);
        //serial0->printf("0x%x\r\n",serial2->receive());
        //}
        //serial0->printf("%c",CMD_LED3_W);
        //serial0->printf("%c",65);
        //_delay_ms(500);
        //serial0->printf("%c",CMD_LED3_R);
        //_delay_ms(500);
        //ATOMIC_BLOCK(ATOMIC_FORCEON){

        //serial0->printf("Speed : %d.%d\r\n",sensors.gps.speed.integer,sensors.gps.speed.decimal);
        //serial0->printf("Data : %d/%d/%d\r\n",sensors.gps.datetime.day,sensors.gps.datetime.month,sensors.gps.datetime.year);
        //serial0->printf("%d:%d:%d\r\n",sensors.gps.datetime.hours,sensors.gps.datetime.minutes,sensors.gps.datetime.seconds);
        //serial0->printf("Lat : %d %d.%u\r\n",sensors.gps.latitude.degrees ,sensors.gps.latitude.minutesInteger,sensors.gps.latitude.minutesDecimal);
        //serial0->printf("Long : %d %d.%u\r\n",sensors.gps.longitude.degrees ,sensors.gps.longitude.minutesInteger,sensors.gps.longitude.minutesDecimal);
        //if(serial3->available()){
        //    serial3->readUntil(buff,'\r');
        //    serial0->printf("%s",buff);
        //}

        //serial2->printf("Long : \r\n%d deg\r\n%d min\r\n%u sec\r\nDir: %d\r\n", sensors.gps.longitude.degrees, sensors.gps.longitude.minutes,
        //                sensors.gps.longitude.seconds,sensors.gps.longitude.dir);
        //Serial0::printf("Data %c\r\n",Serial0::_readData());
        //Serial0::printf("%c",Serial0::_readData());

        //_delay_ms(100);

    }
}
ISR(WDT_vect){
    //func *f = Scheduler::getTask(0);
    //if(f != nullptr){
    //    f();
    //}
    //Scheduler::removeTask();
    //Scheduler::addTask(f);
    PORTB ^= (1<<7);
    Serial0::printf("WDT\r\n");
    //WDTCSR |= (1<<WDIE);
}
