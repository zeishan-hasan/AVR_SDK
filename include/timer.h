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

typedef size_t func(void);
class Scheduler
{
public:
	Scheduler(Scheduler *ptr);
	void addTask(func *task);
	void removeTask();
	func *getTask(size_t index);
private:
	yanujz::vector<func*> scheduler;
};
static Scheduler *pointerToTimer;





struct Time{
	Time(uint32_t us,uint16_t ms,uint16_t s,uint16_t m,uint16_t h,uint16_t d){
	 microSeconds = 0;
	 milliSeconds = 0;
	 seconds			= 0;
	 minutes			= 0;
	 hours				= 0;
	 days					= 0;
	}
	uint32_t microSeconds = 0;
	uint16_t milliSeconds = 0;
	uint16_t seconds			= 0;
	uint16_t minutes			= 0;
	uint16_t hours				= 0;
	uint16_t days					= 0;
};
class Timer{
public:
	static void init();
	static void start();
	static void stop();

	static Time _time;

private:
	static uint8_t _isInit;
};


#endif // TIMER_H
