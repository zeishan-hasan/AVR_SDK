#include "command.h"

ISR(USART0_RX_vect){
	_commandQueuePTR->addCommand(UDR0);
}


Command::Command(Command *ptr)
{
	_commandQueuePTR = ptr;
}

void Command::handleCommands()
{
	serial0->setISRCallBack(1);
}

void Command::addCommand(uint8_t cmd)
{
	fetchCommandQueue.pushRight(cmd);
	fetchCommandQueue.popLeft(decodeCommand());

}

uint8_t Command::decodeCommand()
{
	if(fetchCommandQueue.first() & _WRITE_CMD){
		//TODO Decode Write Command and get next cell

		return 2;
	}
	return 1;
}

uint8_t Command::getQueueSize()
{
	return fetchCommandQueue.size();
}
