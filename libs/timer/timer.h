#ifndef TIMER_H
#define TIMER_H

#ifndef F_CPU
#define F_CPU 16000000
#endif

#include <avr/io.h>
#include <vector.h>
#include <avr/iom2560.h>
#include <avr/interrupt.h>
#include <serial.h>
/*
typedef void func(void);
class Scheduler
{
public:

    static void init();
    static void addTask(func *task);
    static void removeTask();
    static void stop();
    static void start();
    static func *getTask(size_t index);
private:
    static yanujz::vector<func*> scheduler;
};


*/


struct Time{
    Time(){
        microSeconds    = 8;
        milliSeconds    = 0;
        seconds         = 0;
        minutes         = 0;
        hours           = 0;
        days            = 0;
    }
    //Atm not used

    uint64_t microSeconds;
    uint16_t milliSeconds;
    uint16_t seconds     ;
    uint16_t minutes     ;
    uint16_t hours       ;
    uint16_t days        ;
};
class Timer{
public:
    //static Timer* getInstance();
    static void init();
    static void start();
    static void stop();
    static double now();
    static Time _time;

private:
    //Timer();
    static bool _isInit;
};


#endif // TIMER_H
