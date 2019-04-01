#include "timer.h"



//---------Scheduler Class---------//
/*
yanujz::vector<func*> Scheduler::scheduler;
void Scheduler::init()
{
    //WARNING Untested code

    TCCR2A = 0;// set entire TCCR2A register to 0
    TCCR2B = 0;// same for TCCR2B
    TCNT2 = 0;//initialize counter value to 0
    // set compare match register for 2khz increments
    OCR2A = 255;//244Hz
    OCR2B = 100;//488Hz

    TCCR2B |= (1 << CS22) |(1 << CS21) | (1 << CS20);

    sei();
    TIMSK2 |=  (1 << TOIE2);

}

void Scheduler::addTask(func *task)
{
    Scheduler::scheduler.pushRight(task);
}
void Scheduler::removeTask(){
    Scheduler::scheduler.popLeft();
}

void Scheduler::stop()
{
    TCCR2B &= ~((1<<CS02) | (1<<CS01) | (1<<CS00));

}

void Scheduler::start()
{
    TCCR2B |= (1 << CS22) |(1 << CS21) | (1 << CS20);
}
func *Scheduler::getTask(size_t index)
{
    return (func*)Scheduler::scheduler[index];
}

ISR(TIMER2_OVF_vect){
    //static uint16_t p = 0;
    //if(++p != 63){return;}
    //p = 0;
    Scheduler::stop();
    func *f = Scheduler::getTask(0);
    //Serial0::printf("Task to do : %p\r\n",f);
    Scheduler::removeTask();
    Scheduler::addTask(f);
    if(f != nullptr){
        f();
    }
    Scheduler::start();
};*/
//---------End Scheduler Class---------//


//---------Timer Class---------//

Time Timer::_time;
bool Timer::_isInit = false;

//Timer *Timer::getInstance()
//{
//    static Timer *timer = nullptr;
//    if(timer == nullptr){
//        timer = new Timer();
//    }
//    return timer;
//}

void Timer::init()
{

    TCCR0A  = 0;                // Setting 0 means that the timer will reach the overflow
    TCCR0B  = 0;
    TCNT0   = 0;		// Set counter to 0
    TIMSK0  = (1<<TOIE0);	// Set the ISR OVF vect
    sei();
    _isInit = true;

}

void Timer::start()
{
    if(_isInit == false){
        init();
    }
    _time.microSeconds	= 8;
    TCCR0B |= (0 << CS02) |(0 << CS01) | (1 << CS00);
    TCNT0 = 0;

}

void Timer::stop()
{
    TCCR0B &= ~((1<<CS02) | (1<<CS01) | (1<<CS00));

}

double Timer::now()
{
    return ((_time.microSeconds)+(0.0625*TCNT0));
}



uint8_t cnt;

ISR(TIMER0_OVF_vect){
    //Serial *serial1 = SerialManager::getInstance(SERIAL1);
    Timer::_time.microSeconds += 16;
    //if(timer->_time.microSeconds >= 1008){
    //    return;
    //}
    //serial1->printf("Now : %u\r\n",timer->_time.microSeconds);

    //    if(++cnt != 63){
    //        return;
    //    }
    //PORTB ^= 0X80;
    //cnt = 0;
    //timer->_time.microSeconds = 8;
    //timer->_time.milliSeconds++;
    //
    //if(timer->_time.milliSeconds == 1000){
    //    timer->_time.milliSeconds = 0;
    //    timer->_time.seconds++;
    //}
    //if(timer->_time.seconds == 60){
    //    timer->_time.seconds = 0;
    //    timer->_time.minutes++;
    //}
}
//---------End Timer Class---------//
