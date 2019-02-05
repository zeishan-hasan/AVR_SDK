#include "pwmmanager.h"


void setPWM(uint8_t pin, uint8_t freq, uint8_t duty)
{

}

void setDuty(uint8_t pin, uint8_t duty)
{

}

void setFreq(uint8_t pin, uint8_t freq)
{

}

void printFloat(float val, char *buff) {
   char smallBuff[16];
   int val1 = (int) val;
   unsigned int val2;
   if (val < 0) {
	  val2 = (int) (-100.0 * val) % 100;
   } else {
	  val2 = (int) (100.0 * val) % 100;
   }
   if (val2 < 10) {
	  sprintf(smallBuff, "%d.0%u", val1, val2);
   } else {
	  sprintf(smallBuff, "%d.%u", val1, val2);
   }

   strcat(buff, smallBuff);
}


int calculateTicks(int freq)
{
	/*
	 * Calculating 1000Hz frequency
	 * 16000000/1024 = 15625Hz
	 * 1/15625 = 0.000064s
	 * 1/1000 = 0.001s
	 * 0.001 / 0.000064 = 15.625
	 *
	 *
	 * 16000000/256 = 62500Hz
	 * 1/62500 = 0.000016s
	 * 1/1000 = 0.001s
	 * 0.001 / 0.000016 = 62.5
	 *
	 * 16000000 / 64 = 250000Hz
	 * 1/250000 = 0.000004s
	 * 1/1000 = 0.001s
	 * 0.001 / 0.000004 = 250
	 *
	 * 16000000 / 8 = 2000000Hz
	 * 1/2000000 = 0.0000005s
	 * 1/1000 = 0.001s
	 * 0.001 / 0.0000005 = 2000
	 *
	 * 16000000 /1 = 16000000Hz
	 * 1/16000000 = 0.000000063s
	 * 1/1000 = 0.001s
	 * 0.001/ 0.000000063 = 15873
	*/
	char buff[256];
	float a=(1/freq);//0.001/0.000000063 ;
	printFloat(a,buff);
	//serial0->print(buff);
	//serial0->print("\r\n");
	return 0;//( (1/freq)/(1/F_CPU))*1000;
}


