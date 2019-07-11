#ifndef FIFO_H
#define FIFO_H
#include <macros.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <vector.h>
class Fifo
{
public:
	virtual u8t read() = 0;

protected:
	Fifo();
	~Fifo();

	u8t _read;
	u8t _write;
};



class Fifo256: public Fifo
{
public:
	Fifo256(): Fifo() {
		_read = 0;
		_write = 0;
	}
	u8t read();
private:
	u8t buff[256];

};
#endif // FIFO_H
