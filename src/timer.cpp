#include "timer.h"

Scheduler::Scheduler(Scheduler *ptr)
{

	//TODO Convert it with timer2

	TCCR2A = 0;// set entire TCCR2A register to 0
	TCCR2B = 0;// same for TCCR2B
	TCNT2 = 0;//initialize counter value to 0
	// set compare match register for 2khz increments
	OCR2A = 255;//244Hz
	OCR2B = 100;//488Hz

	TCCR2B |= (1 << CS22) |(0 << CS21) | (1 << CS20);


	TIMSK2 |=  (1 << TOIE2);

	pointerToTimer = ptr;
}

void Scheduler::addTask(func *task)
{
	scheduler.pushRight(task);
}
void Scheduler::removeTask(){
	scheduler.popLeft();
}
func *Scheduler::getTask(size_t index)
{
	return (func*)scheduler[index];
}
/*
ISR(TIMER0_COMPA_vect){

	//static int pre=0;
	//if(++pre != 123) return;
	//pre = 0;

	PORTB ^= (1<<7);
	serial0->printf("A OVF compare A %d\r\n",TCNT0);
	//pointerToTimer
	//TCCR0B &= ~((1<<CS02) | (1<<CS01) | (1<<CS00));
	//func *f = (func*)pointerToTimer->getTask(0);
	//pointerToTimer->removeTask();
	//pointerToTimer->addTask(f);
	//f();
	//TCCR0B |= (1<<CS02) | (0<<CS01) | (1<<CS00);
}
ISR(TIMER0_COMPB_vect){

	//static int pre=0;
	//if(++pre != 123) return;
	//pre = 0;

	PORTB ^= (1<<7);
	serial0->printf("B OVF compare B %d\r\n",TCNT0);
	//pointerToTimer
	//TCCR0B &= ~((1<<CS02) | (1<<CS01) | (1<<CS00));
	//func *f = (func*)pointerToTimer->getTask(0);
	//pointerToTimer->removeTask();
	//pointerToTimer->addTask(f);
	//f();
	//TCCR0B |= (1<<CS02) | (0<<CS01) | (1<<CS00);
}
/*ISR(TIMER0_OVF_vect){

	static uint8_t pre=0;
	//static int sec=0;
	if(++pre != 61) return;
	pre = 0;
	//++sec;
	//PORTB ^= (1<<7);
	serial0->printf("Interrupt\r\n");
	//pointerToTimer
	//TCCR0B &= ~((1<<CS02) | (1<<CS01) | (1<<CS00));
	func *f = (func*)pointerToTimer->getTask(0);
	pointerToTimer->removeTask();
	pointerToTimer->addTask(f);
	f();
	//TCCR0B |= (1<<CS02) | (0<<CS01) | (1<<CS00);
}*/

//int a = 0;



Time Timer::_time = {0,0,0,0,0,0};
uint8_t Timer::_isInit = false;

void Timer::init()
{

	TCCR0A	= ( 1 << WGM01  ) | ( 0 << WGM00  );	// Set the timer mode to CTC
	OCR0A		= 80;								// Set the value that you want to count to (1/F_CPU)*OCR0A -> 0.000005 Seconds
	TIMSK0	= ( 1 << OCIE0A );	// Set the ISR COMPA vect
	TCCR0B	= ( 0 << WGM02 );
	TCNT0		= 0;								// Set counter to 0
	_isInit = true;

}

void Timer::start()
{
	if(_isInit == false){Timer::init();}
	_time.microSeconds	= 0;
	_time.milliSeconds	= 0;
	_time.seconds				= 0;
	_time.minutes				= 0;
	_time.hours					= 0;
	_time.days					= 0;
	TCCR0B |= (0 << CS02) |(0 << CS01) | (1 << CS00);
	TCNT0 = 0;

}

void Timer::stop()
{
	TCCR0B &= ~((1<<CS02) | (1<<CS01) | (1<<CS00));
			//return  TCNT0;
}

ISR(TIMER0_COMPA_vect){
	//++ptrToTimer->_time.microSeconds;
	//	if(++ptrToTimer->_time.microSeconds > 199){
	//		ptrToTimer->_time.microSeconds = 0;
	//		if(++ptrToTimer->_time.milliSeconds > 999){
	//			ptrToTimer->_time.milliSeconds = 0;
	//			if(++ptrToTimer->_time.seconds == 60){
	//				ptrToTimer->_time.seconds = 0;
	//				if(++ptrToTimer->_time.minutes == 60){
	//					ptrToTimer->_time.minutes = 0;
	//					if(++ptrToTimer->_time.hours == 24){
	//						ptrToTimer->_time.hours = 0;
	//						++ptrToTimer->_time.days;
	//					}
	//				}
	//			}
	//		}
	//	}

	//PORTB ^= (1<<7);
	++Timer::_time.microSeconds;
	//if((++Timer::_time.microSeconds) != 200){ return; }
	//Timer::_time.microSeconds = 0;
	//if((++Timer::_time.milliSeconds)!= 1000){ return; }
	//Timer::_time.milliSeconds = 0;
	//if((++Timer::_time.seconds)!= 60){ return; }

}


//ISR(TIMER0_OVF_vect){
//	//++ptrToTimer->_time.microSeconds;
//	//++_time.microSeconds;
//	//if(tmp.us == 63){
//	//	++tmp.ms;
//	//	tmp.us = 0;
//	//}
//}
//
