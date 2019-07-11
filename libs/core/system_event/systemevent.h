#pragma once
#include <macros.h>

class SystemEventHandler
{
public:
	SystemEventHandler();
	static void call_int_callback(SystemEventHandler *context, u8t pin = 0);
	virtual void callback(u8t pin) = 0;
	//virtual void callback() = 0;
protected:
};


//class NetworkEvent : public SystemEventHandler
//{
//public:
//	//NetworkEvent : public SystemEvent() {}
//};
