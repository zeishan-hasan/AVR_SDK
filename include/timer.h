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

typedef void func(void);
class Scheduler
{
public:

	static void init();
	static void addTask(func *task);
	static void removeTask();
	static func *getTask(size_t index);
private:
	static yanujz::vector<func*> scheduler;
};





struct Time{
	Time(uint64_t us){
	 microSeconds = 0;
	 //milliSeconds = 0;
	 //seconds			= 0;
	 //minutes			= 0;
	 //hours				= 0;
	 //days					= 0;
	}
	uint64_t microSeconds = 0;
	//Atm not used

	//uint16_t milliSeconds = 0;
	//uint16_t seconds			= 0;
	//uint16_t minutes			= 0;
	//uint16_t hours				= 0;
	//uint16_t days					= 0;
};
class Timer{
public:
	static void init();
	static void start();
	static void stop();
	static double now();
	static Time _time;

private:
	static uint8_t _isInit;
};


#endif // TIMER_H
