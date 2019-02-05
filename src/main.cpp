#ifndef F_CPU
#define F_CPU 16000000UL
#endif
#include <avr/io.h>
#include <util/delay.h>
#include <stdlib.h>
#include "stdio.h"
#include <portmanager.h>
#include <pwmmanager.h>
#include <serial.h>
#include "vector.h"
#include <time.h>
#include <stdlib.h>
#include <timer.h>
#include <command.h>

/*
struct Time{
	uint32_t us;
	int ms;
};
Time tmp;
void timerSetup(){

	TCCR0A = 0;// set entire TCCR2A register to 0
	TCCR0B = 0;// same for TCCR2B
	TCNT0 = 0;//initialize counter value to 0

	TCCR0B |= (0 << CS02) |(0 << CS01) | (0 << CS00);
	TIMSK0 |=  (1 << TOIE0);
}
void timerStart(){
	TCCR0B |= (0 << CS02) |(0 << CS01) | (1 << CS00);
	tmp.us = 0;
	TCNT0 = 0;
}
uint8_t timerStop(){
	//TCNT0 = 0;
	TCCR0B &= ~((1<<CS02) | (1<<CS01) | (1<<CS00));
	return  TCNT0;
}



ISR(TIMER0_OVF_vect){
	++tmp.us;
	//if(tmp.us == 63){
	//	++tmp.ms;
	//	tmp.us = 0;
	//}
}*/
//double asdTime = 0;




//ISR (PCINT1_vect) {
//	if (PINB & (1<<PB1)) { // detect rising edge
//		timer.start();
//	} else { // detect falling edge
//		us0  = (double)timer._time.microSeconds*0.000016 + (timer.stop()*(1/F_CPU));
//	}
//}



volatile uint8_t port_b_history = 0xFF; // start whith pulled-up pins ;
volatile bool isBusy = true;
ISR (PCINT0_vect) {
	uint8_t	changed_bits = PINB ^ port_b_history;
	port_b_history = PINB;

	//if(changed_bits & (1<<PB0)){
		if (PINB & (1<<PB0)) { // detect rising edge
			Timer::start();
		}
		else { // detect falling edge
			Timer::stop();
			//us1  = (timer._time.microSeconds);//(double)timer._time.microSeconds*0.000016 + (timer.stop()*(1/F_CPU));

		}
	//}
	//if(changed_bits & (1<<PB2)){
	//	if (PINB & (1<<PB2)) { // detect rising edge
	//		timer.start();
	//	} else { // detect falling edge
	//		us0  = (double)timer._time.microSeconds*0.000016 + (timer.stop()*(1/F_CPU));
	//
	//	}
	//}

}




//---------------hardware imnterwergthdfsa--------/////////wadsfrgthyjuilòpà§/
ISR(INT4_vect){
	cli();
	if (EICRB & 0x3 == 3){
		//serial0->printf("Rising Int\r\n");
		EICRB	&=  ~(1<<ISC40);
		Timer::start();
	}
	else {
		//serial0->printf("Falling Int\r\n");
		EICRB	|= (1<<ISC41) | (1<<ISC40);
		Timer::stop();
		//us0 = Timer::_time.seconds;//(double)timer._time.microSeconds*0.000016 + (timer.stop())*(1/F_CPU);
	}
	sei();

}/*
ISR(INT5_vect){
	cli();
	if ((EICRB & (0x3<<2)) >>2 == 3){
		EICRB	&=  ~(1<<ISC50);
		timer.start();
	}
	else {
		EICRB	|= (1<<ISC51) | (1<<ISC50);
		us1  = (double)timer._time.microSeconds*0.000016 + (timer.stop()*(1/F_CPU));

	}
	sei();
}
*/
int main(void)
{


	cli();

	//PCICR	 |=	 (1 << PCIE0);
	////PCIFR	 |=  (1 << PCIF0);
	//PCMSK0 |=  (1 << PCINT2)| (1 << PCINT1)| (1 << PCINT0);





	//EICRB	|= (1<<ISC51) | (1<<ISC50) |(1<<ISC41) | (1<<ISC40);
	//EIMSK |= (1<<INT4) | (1<<INT5);
	sei();	//PCICR |= (1<<PCIE0);

	serial0->init(UART::BAUD_9600);

	//serial0->setISRCallBack(HIGH);


	//Pin US0_PIN_TRIGGER(13,OUTPUT);
	//Pin US0_PIN_ECHO(51,INPUT);
	//
	//Pin US1_PIN_TRIGGER(12,OUTPUT);
	//Pin US1_PIN_ECHO(53,INPUT);


	//Command command(&command);
	//command.handleCommands();
	//pin.setPWM(2500,50);
	//timtimerSetup();
	//Scheduler scheduler(&scheduler);
	//scheduler.addTask((func*)sfdgrhnjmj);

	//Pin pin(13,OUTPUT);
	DDRB|=(1<<PB7);


	//Timer::start();
	Timer::init();

	while (1) {

		//_delay_ms(500);
		//US0_PIN_TRIGGER.on();
		//_delay_us(10);
		//US0_PIN_TRIGGER.off();
		//_delay_ms(20);
		//
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



		//serial0->printf("Listening\r\n");
		//	asd.stop();
			Timer::start();
			_delay_us(10);
			//asm volatile("nop");
			//asm volatile("nop");
			Timer::stop();
			//serial0->printf("%lf\r\n",(0.0000000625*(float)TCNT0)*1e6-0.812500);
			serial0->printf("%lf\r\n",(0.0625*(double)TCNT0)+(Timer::_time.microSeconds*5)-0.812500);
			_delay_ms(500);
	}
}
