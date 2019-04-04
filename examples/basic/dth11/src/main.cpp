#include "avr_sdk.h"
//static Pin pin(22,INPUT);

//const size_t size = 1024;
//static volatile uint8_t *state;
//static volatile uint32_t time[1024];

/*
void pulseIn(){
	uint32_t  previous;
	uint16_t i = 0;
	while (pin.digitalRead() == false);

	if(pin.digitalRead()){
		previous = Timer::now();
		while (pin.digitalRead()){
			var[i] = Timer::now() - previous;
			++i;
		};
	}

}


float getAVG(){
	uint32_t avg;
	for(size_t i = 0; i<SIZE_OF_ARRAY(var);++i){
		avg += var[i];
	}
	float asd = (float)avg/(float)SIZE_OF_ARRAY(var);
	asd += 0.0625*float(TCNT0);

	return asd;
}
*/
/*
uint8_t samples[8*1024];
int i; // n sample = 8kb * 8
int byte_i = i/8; // quale byte degli 8kb
int bit_i = i%8; // [ 0 - 7 ] quale bit, del byte byte_i-esimo

int byte_i = i>>3;
int bit_i  = i&7;

for(i=0; i<8*1024*8; i++)
{
	int byte_i = i>>3;
	int bit_i  = i&7;

	int v = digitalRead();
	samples[byte_i] |= (v<<bit_i);

int bit_i = i
void sample(){
	//Serial *serial1 = SerialManager::getInstance(SERIAL1);
	//serial1->printf("Sampling...\r\n");
	PORTB ^= 0X80;
	for(int i = 0; i < 4096; ++i){
		state[i] = pin.digitalRead();
		//time[i]		= Timer::now();
	}
	PORTB ^= 0X80;
	//serial1->printf("Done\r\n");
}

}*/
int main(){

	Timer::start();
	Serial *serial1 = SerialManager::getInstance(SERIAL1);
	serial1->init(BAUD_1000000);




	Dht11 dht11(22);
	DDRB = 0x80;
	//Pin pin(38,INPUT);
	serial1->clear();
	serial1->printf("Setup complete\r\n");

	uint16_t i = 0;
	//dht11.getTemperature();
	//sample();
	while (1) {
		dht11.startContition();
		_delay_ms(2000);
		//serial1->clear();

		//i = 0;
		//while (i != var) {
		//	avg += pulseIn();
		//
		//	++i;
		//}
		//deltaT_high = pulseIn();
//		state = new uint8_t[4096];
//		if(serial1->isAvailable()){
//			char temp = serial1->receive();
//			if(temp == 'n'){
//				serial1->printf("Time : %lu State : %u\r\n",state[i]);
//				++i;
//			}
//			if(temp == 's'){
//				sample();
//			}
//		}

		//avg = 0;

		//serial1->printf("%lu\r\n",Timer::_time.microSeconds );




		//previous = Timer::now();
		//while (pin.digitalRead()){
		//	//serial1->printf("high state\r\n");
		//}
		//
		//now = Timer::now() - previous;
		//serial1->printf("high state %lf\r\n",now);
		//	_delay_ms(100);

		//serial1->printf("%u\r\n",dht11.getHumidity());
	}

	return 0;
}
