#include "command.h"

yanujz::vector<uint8_t> Command::fetchCommandQueue;

void Command::handleCommands()
{
	if(Serial0::bufferIsReadable()){
		Command::addCommand(Serial0::_readData());
	}
}

void Command::addCommand(uint8_t cmd)
{
	Command::fetchCommandQueue.pushRight(cmd);
	Command::fetchCommandQueue.popLeft(decodeCommand());

}
uint8_t Command::decodeCommand()
{
	if(Command::fetchCommandQueue[0]  == 0xFF){return 1;}

	uint8_t *structPtr = (uint8_t*)&sensors;
	uint8_t isWrite = 0;
	uint8_t sensorSelect =  Command::fetchCommandQueue[0] & 0xF;

	if((Command::fetchCommandQueue[0] & _WRITE_CMD_MSK) >> _WRITE_CMD){
		isWrite = true;
	}
	switch ((Command::fetchCommandQueue[0] & _CMD_SEL_MSK) >> _CMD_SEL) {

	case CMD_GROUP_ADC:
		ATOMIC_BLOCK(ATOMIC_FORCEON){
			readADC(sensorSelect);
		}
		break;
	case CMD_GROUP_US:

		ATOMIC_BLOCK(ATOMIC_FORCEON){
			readUS(sensorSelect);
		}
		break;
	case CMD_GROUP_PIR:
		ATOMIC_BLOCK(ATOMIC_FORCEON){
			readPir(sensorSelect);
		}
		break;
	case CMD_GROUP_LED:
		if(isWrite){
			ATOMIC_BLOCK(ATOMIC_FORCEON){
				writeLed(sensorSelect,Command::fetchCommandQueue[1]);
				//Serial0::incReadData();
				Serial0::_readData(); // NEEDED FOR +1 POINTER ROTARY ARRAY
			}
		}
		else{
			ATOMIC_BLOCK(ATOMIC_FORCEON){
				readLed(sensorSelect);
			}
		}
		break;
	case CMD_GROUP_VCC_MOTOR:
		if(isWrite){
			ATOMIC_BLOCK(ATOMIC_FORCEON){
				writeMotor(sensorSelect,Command::fetchCommandQueue[1]);
				Serial0::_readData();
			}
		}
		else {
			ATOMIC_BLOCK(ATOMIC_FORCEON){
				readMotor(sensorSelect);
			}
		}

		break;
	case CMD_GROUP_RELAY:

		if(isWrite){
			ATOMIC_BLOCK(ATOMIC_FORCEON){
				writeRelay(sensorSelect,Command::fetchCommandQueue[1]);
				Serial0::_readData();
			}
		}
		else{
			ATOMIC_BLOCK(ATOMIC_FORCEON){
				readRelay(sensorSelect);
			}
		}
		break;
	case CMD_GROUP_EXTENDED:
		if(isWrite){
			//TODO Need to write value
		}
		//TODO
		break;

	}

	if(isWrite){
		return 2;
	}

	return 1;
}
uint8_t Command::getQueueSize()
{
	return Command::fetchCommandQueue.size();
}
//--------COMMANDS ROUTINE--------/
uint8_t *Command::serialOutput = (uint8_t*)&UDR0;
void readPir(uint8_t sensorSelect)
{
	switch (sensorSelect) {
	case _PIR0:
		*Command::serialOutput = sensors.pir.PIR0;
		break;
	case _PIR1:
		*Command::serialOutput = sensors.pir.PIR1;
		break;
	case _PIR2:
		*Command::serialOutput = sensors.pir.PIR2;
		break;
	case _PIR3:
		*Command::serialOutput = sensors.pir.PIR3;
		break;
	}
}
void readRelay(uint8_t sensorSelect)
{
	switch (sensorSelect) {
	case _VCC_RELAY:
		*Command::serialOutput = sensors.relay.VCC_RELAY;
		break;
	case _RELAY0:
		*Command::serialOutput = sensors.relay.RELAY0;
		break;
	case _RELAY1:
		*Command::serialOutput = sensors.relay.RELAY1;
		break;
	case _RELAY2:
		*Command::serialOutput = sensors.relay.RELAY2;
		break;
	case _RELAY3:
		*Command::serialOutput = sensors.relay.RELAY3;
		break;
	}
}
void writeRelay(uint8_t sensorSelect, uint8_t value)
{
	switch (sensorSelect) {
	case _VCC_RELAY:
		sensors.relay.VCC_RELAY = value;
		break;
	case _RELAY0:
		sensors.relay.RELAY0 = value;
		break;
	case _RELAY1:
		sensors.relay.RELAY1 = value;
		break;
	case _RELAY2:
		sensors.relay.RELAY2 = value;
		break;
	case _RELAY3:
		sensors.relay.RELAY3 = value;
		break;
	}
}
void readMotor(uint8_t sensorSelect)
{
	*Command::serialOutput = sensors.VCC_MOTOR;
}
void writeMotor(uint8_t sensorSelect, uint8_t value)
{
	if(value>1){
		return;
	}
	switch (sensorSelect) {
	case 0:
		sensors.VCC_MOTOR = value;
		break;
	}
}
void readLed(uint8_t  sensorSelect){
	switch (sensorSelect) {
	case _LED0:
		*Command::serialOutput = sensors.led.LED0;
		break;
	case _LED1:
		*Command::serialOutput = sensors.led.LED1;
		break;
	case _LED2:
		*Command::serialOutput = sensors.led.LED2;
		break;
	case _LED3:
		*Command::serialOutput = sensors.led.LED3;
		break;
	}
}
void writeLed(uint8_t  sensorSelect ,uint8_t value){
	switch (sensorSelect) {
	case _LED0:
		sensors.led.LED0 = value;
		break;
	case _LED1:
		sensors.led.LED1 = value;
		break;
	case _LED2:
		sensors.led.LED2 = value;
		break;
	case _LED3:
		sensors.led.LED3 = value;
		break;
	}
}
void readUS(uint8_t sensorSelect)
{
	while ( !( UCSR0A & (1<<UDRE0)) );
	switch (sensorSelect) {
	case _US0:
		//Serial2::printf("Data : %d\r\n",sensors.us.US0);
		*Command::serialOutput = sensors.us.US0;
		break;
	case _US1:
		*Command::serialOutput = sensors.us.US1;
		break;
	case _US2:
		*Command::serialOutput = sensors.us.US2;
		break;
	case _US3:
		*Command::serialOutput = sensors.us.US3;
		break;
	}
}
void readADC(uint8_t sensorSelect)
{
	while ( !( UCSR0A & (1<<UDRE0)) );
	switch (sensorSelect) {

	case _ADC00:
		ATOMIC_BLOCK(ATOMIC_FORCEON){
			*Command::serialOutput = sensors.adc.ADC00>>8;
			//while ( !( UCSR0A & (1<<UDRE0)) );
			*Command::serialOutput = sensors.adc.ADC00&0xFF;
		}
		break;
	case _ADC01:
		*Command::serialOutput = sensors.adc.ADC01>>8;
		*Command::serialOutput = sensors.adc.ADC01&0xFF;
		break;
	case _ADC02:
		*Command::serialOutput = sensors.adc.ADC02>>8;
		*Command::serialOutput = sensors.adc.ADC02&0xFF;
		break;
	case _ADC03:
		*Command::serialOutput = sensors.adc.ADC03>>8;
		*Command::serialOutput = sensors.adc.ADC03&0xFF;
		break;
	case _ADC04:
		*Command::serialOutput = sensors.adc.ADC04>>8;
		*Command::serialOutput = sensors.adc.ADC00&0xFF;
		break;
	case _ADC05:
		*Command::serialOutput = sensors.adc.ADC05;
		*Command::serialOutput = sensors.adc.ADC05&0xFF;
		break;
	case _ADC06:
		*Command::serialOutput = sensors.adc.ADC06>>8;
		*Command::serialOutput = sensors.adc.ADC06&0xFF;
		break;
	case _ADC07:
		*Command::serialOutput = sensors.adc.ADC07>>8;
		*Command::serialOutput = sensors.adc.ADC07&0xFF;
		break;
	case _ADC08:
		*Command::serialOutput = sensors.adc.ADC08>>8;
		*Command::serialOutput = sensors.adc.ADC08&0xFF;
		break;
	case _ADC09:
		*Command::serialOutput = sensors.adc.ADC09>>8;
		*Command::serialOutput = sensors.adc.ADC09&0xFF;
		break;
	case _ADC10:
		*Command::serialOutput = sensors.adc.ADC10>>8;
		*Command::serialOutput = sensors.adc.ADC10&0xFF;
		break;
	case _ADC11:
		*Command::serialOutput = sensors.adc.ADC11>>8;
		*Command::serialOutput = sensors.adc.ADC11&0xFF;
		break;
	case _ADC12:
		*Command::serialOutput = sensors.adc.ADC12>>8;
		*Command::serialOutput = sensors.adc.ADC12&0xFF;
		break;
	case _ADC13:
		*Command::serialOutput = sensors.adc.ADC13>>8;
		*Command::serialOutput = sensors.adc.ADC13&0xFF;
		break;
	case _ADC14:
		*Command::serialOutput = sensors.adc.ADC14>>8;
		*Command::serialOutput = sensors.adc.ADC14&0xFF;
		break;
	case _ADC15:
		*Command::serialOutput = sensors.adc.ADC15>>8;
		*Command::serialOutput = sensors.adc.ADC15&0xFF;
		break;
	}
}


