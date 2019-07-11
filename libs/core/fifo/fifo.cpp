#include "fifo.h"


Fifo::Fifo()
{
	//buff = (u8t*)malloc(sizeof(u8t) * size);
}

Fifo::~Fifo()
{
	//free(buff);
}

u8t Fifo256::read()
{
	return buff[_read];
}
