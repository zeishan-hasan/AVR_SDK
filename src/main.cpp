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


struct Sensors sensors;
Pin US0_PIN_TRIGGER(9,OUTPUT);
Pin US0_PIN_ECHO(A15,INPUT);

Pin US1_PIN_TRIGGER(8,OUTPUT);
Pin US1_PIN_ECHO(A14,INPUT);

Pin US2_PIN_TRIGGER(7,OUTPUT);
Pin US2_PIN_ECHO(A13,INPUT);

Pin US3_PIN_TRIGGER(6,OUTPUT);
Pin US3_PIN_ECHO(A12,INPUT);

Pin adc0(A0,INPUT);
Pin adc1(A1,INPUT);
Pin adc2(A2,INPUT);
Pin adc3(A3,INPUT);

Pin vccMotor(28,OUTPUT);

void readMOTOR(){
	ATOMIC_BLOCK(ATOMIC_FORCEON){
		sensors.VCC_MOTOR=vccMotor.digitalRead();
	}
}

void readADC()
{
	ATOMIC_BLOCK(ATOMIC_FORCEON)
	{
		sensors.adc.ADC00=adc0.analogRead();
	}
	ATOMIC_BLOCK(ATOMIC_FORCEON)
	{
		sensors.adc.ADC01=adc1.analogRead();
	}
	ATOMIC_BLOCK(ATOMIC_FORCEON)
	{
		sensors.adc.ADC02=adc2.analogRead();
	}
	ATOMIC_BLOCK(ATOMIC_FORCEON)
	{
		sensors.adc.ADC03=adc3.analogRead();
	}

}
void ultraSonicRoutine(uint8_t pin){
	US0_PIN_TRIGGER.on();
	_delay_us(10);
	US0_PIN_TRIGGER.off();
	US1_PIN_TRIGGER.on();
	_delay_us(10);
	US1_PIN_TRIGGER.off();

	US2_PIN_TRIGGER.on();
	_delay_us(10);
	US2_PIN_TRIGGER.off();
	US3_PIN_TRIGGER.on();
	_delay_us(10);
	US3_PIN_TRIGGER.off();
}
void ultraSonicISR(uint8_t pin) {
	if(pin == US0_PIN_ECHO.getPinNumber()){
		static double previous;
		if (US0_PIN_ECHO.digitalRead()){
			previous = Timer::now();
		}
		else {
			ATOMIC_BLOCK(ATOMIC_FORCEON){
				//Serial2::printf("Shedfasd\r\n");
				sensors.us.US0 = (Timer::now() - previous) /58;
			}
		}
	}
	else if(pin == US1_PIN_ECHO.getPinNumber()){
		static double previous;
		if (US1_PIN_ECHO.digitalRead()){
			previous = Timer::now();
		}
		else {
			ATOMIC_BLOCK(ATOMIC_FORCEON){
				sensors.us.US1 = (Timer::now() - previous) /58;
			}
		}
	}
	else if(pin == US2_PIN_ECHO.getPinNumber()){
		static double previous;
		if (US2_PIN_ECHO.digitalRead()){
			previous = Timer::now();
		}
		else {
			ATOMIC_BLOCK(ATOMIC_FORCEON){
				sensors.us.US2 = (Timer::now() - previous) /58;
			}
		}
	}
	else if(pin == US3_PIN_ECHO.getPinNumber()){
		static double previous;
		if (US3_PIN_ECHO.digitalRead()){
			previous = Timer::now();
		}
		else {
			ATOMIC_BLOCK(ATOMIC_FORCEON){
				sensors.us.US3 = (Timer::now() - previous) /58;
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
			// Serial0::printf("Parsing %c\r\n",temp);
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
			if(temp== 0){continue;}
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
void pippo(){
	uint8_t s;
	asm volatile (
				"pop %0"    "\n\t"
				//"incr r16"    "\n\t"
				//"mov %0,r16" "\n\t"
				: "=r" (s)
				:
				// :"r16"
				);
	Serial0::printf("Dato %d\r\n",s);
	return;
}
int main(void)
{


	Timer::start();
	Serial0::init(BAUD_1000000,_LOW_PRIORITY);
	Serial2::init(BAUD_1000000,_LOW_PRIORITY);
	Serial0::setEchoServer(false);
	Serial0::setRxISRCallBack(true);
	Serial0::enableShell(false);
	vccMotor.on();
	//Serial3::init(BAUD_9600,_LOW_PRIORITY);
	//Serial3::setEchoServer(false);
	//Serial3::setRxISRCallBack(true);
	//Serial3::enableShell(false);

	//Serial0::printf("init :%d\r\n",Serial3::bufferIsReadable());

	//Serial3::init(BAUD_9600,_LOW_PRIORITY);
	Interrupt::attachInterrupt(US0_PIN_ECHO.getPinNumber(),POSITIVE_EDGE,ultraSonicISR);
	Interrupt::attachInterrupt(US1_PIN_ECHO.getPinNumber(),POSITIVE_EDGE,ultraSonicISR);
	Interrupt::attachInterrupt(US2_PIN_ECHO.getPinNumber(),POSITIVE_EDGE,ultraSonicISR);
	Interrupt::attachInterrupt(US3_PIN_ECHO.getPinNumber(),POSITIVE_EDGE,ultraSonicISR);
	//Scheduler::addTask((func*)ultraSonicRoutine);
	////Scheduler::addTask((func*)func1);
	//Command::serialOutput = (uint8_t*)&UDR0;
	Scheduler::addTask((func*)ultraSonicRoutine);
	Scheduler::addTask((func*)readMOTOR);
	Scheduler::addTask(readADC);
	Scheduler::addTask(Command::handleCommands);
	Scheduler::init();
	//uint16_t a;
	Serial0::flush();
	//DDRB=0x80;
	//Serial2::printf("Pin number %d\r\n",adc0.getPinNumber());
	//adc0.getPinData();
	//uint16_t b=adc0.analogRead();
	while (1) {
		//Serial0::printf("%u\r\n",sensors.VCC_MOTOR);
		//Serial2::printf("%d\r\n",USART0_BUFF);
		//Serial0::printf("Timer : %lf\r\n",Timer::now()/1e6);
		//a =adc0.analogRead();
		//UDR0 = a >> 8;
		//UDR0 = a & 0xFF;
		//Serial0::printf("%c",adc0.analogRead());

		//Serial0::printf("%u\r\n",sensors.adc.ADC00);
		//_delay_ms(1);
	}
}

