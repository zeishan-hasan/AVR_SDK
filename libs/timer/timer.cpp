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

    TCCR0A  = 0;    // Setting 0 means that the timer will reach the overflow
    TCCR0B  = 0;
    TCNT0   = 255;		// Set counter to 0
    OCR0A   = 255;
    TIMSK0  = (1<<TOIE0);	// Set the ISR OVF vect


    sei();
    _isInit = true;

}

void Timer::start()
{
    if(_isInit == false){
        init();
    }
    _time.microSeconds	= 0;
    TCCR0B |= (0 << CS02) |(0 << CS01) | (1 << CS00);
    //TCNT0   = 255;

}

void Timer::stop()
{
    TCCR0B &= ~((1<<CS02) | (1<<CS01) | (1<<CS00));

}

uint32_t Timer::now()
{
    //return ((_time.microSeconds)+((1.0/F_CPU*1e6)*TCNT0));
    //_time.uSecComma = (0.0625*(float)TCNT0);
    return (_time.microSeconds);
}

ISR(TIMER0_OVF_vect){
    asm volatile("LDS r17,0x22\n\t"
                 "EOR r17,r19\n\t"
                 "STS 0x22,r17\n\t"
                 );
    //PORTA ^= 0x1;
    Timer::_time.microSeconds++;
    asm volatile ("LDI r16,255\n\t"
                  "STS 0x46,R16 \n\t"
                  );
}
//---------End Timer Class---------//
