#ifndef PWMMANAGER_H
#define PWMMANAGER_H
#define F_CPU 16000000UL
#include <avr/io.h>
#include <portmanager.h>
#include <string.h>

void setPWM(uint8_t pin,uint8_t freq,uint8_t duty);
void setDuty(uint8_t pin,uint8_t duty);
void setFreq(uint8_t pin,uint8_t freq);

int calculateTicks(int freq);
#endif // PWMMANAGER_H
