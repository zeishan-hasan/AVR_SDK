#include "pins.h"
/*
void set_pwm(u8t pin, DUTY duty)
{

}


void set_pwm_freq_duty(u8t pin, size_t freq, u8t duty)
{
	u16t var =	pgm_read_word(&__flashMappedPort[pin]);
	u8t timer = varToTimer(var);

	freq =  F_CPU/freq;
	duty = freq -((freq*duty)/100);

	if(timer == NO_TIMER || timer == TIMER_0){
		return;
	}

	u8t pwmGroup = varToPWMGroup(var);
	u8t letter = varToLetter(var);

	u16t TCCRxA = __hw_timer_addr[timer];
	u16t ICRx;
	u16t OCRx;
	u8t temp;
	//(*((volatile u8t*)ICRx)) =	CALCULATE_PWM_TICKS(freq);
	switch (pwmGroup) {
	case PWM8BIT:
		switch (letter) {
		case LETTER_A:
			temp	|= bitValue(7) | bitValue(6);
			OCRx = TCCRxA + 3;
			break;
		case LETTER_B:
			temp		|= bitValue(5) | bitValue(4);
			OCRx = TCCRxA + 4;
			break;
		}
		(*((volatile u8t*)OCRx)) = __hw_timer_addr[1];
		(*((volatile u8t*)TCCRxA))  |=  temp | (0 << WGM11) | (1 << WGM10);
		(*((volatile u8t*)TCCRxA + 1)) |= (0 << CS12) | (1 << CS11) | (0 << CS10);
		break;
	case PWM16BIT:
		//ICRx_16BIT(TCCRxA) = CALCULATE_PWM_TICKS(freq);
		switch (letter) {
		case LETTER_A:
			(*((volatile u8t*)TCCRxA)) |= bitValue(7) | bitValue(6);
			//OCRxA_16BIT(TCCRxA) = CALCULATE_DUTY_16BIT(freq, duty);
			break;
		case LETTER_B:
			(*((volatile u8t*)TCCRxA))	|= bitValue(5) | bitValue(4);

			break;
#if defined(LETTER_C)
		case LETTER_C:
			(*((volatile u8t*)TCCRxA))	|= bitValue(3) | bitValue(2);
			OCRxC_16BIT(TCCRxA) = freq;
			break;
#endif
		}
		//OCRxB_16BIT(TCCRxA) = CALCULATE_DUTY_16BIT(freq, duty);
		(*((volatile u8t*)TCCRxA))   |= (1 << WGM11) | (0 << WGM10);// Setting PWM, Phase Correct
		//TCCRxB_16BIT(TCCRxA)  |= (1 << WGM13) | (1 << WGM12);// TOP = OCRnA TOVx Flag = BOTTOM
		//TCCRxB_16BIT(TCCRxA)  |= (0 << CS12) | (0 << CS11) | (1 << CS10); //Setting prescaler to 1, so F_CPU
		break;
	default:
		break;
	}
*/
	//
	//volatile u8t* TCCRxA = &_SFR_MEM8(__hw_timer_addr[timer]);




	//	switch (pinToPWMGroup(__var)) {
	//	case PWM8BIT:
	//		switch (pinToLetter(__var)) {
	//		case LETTER_A:
	//			*TCCRxA	|= bitValue(7) | bitValue(6);
	//			//OCRxA_8BIT(TCCRxA) = CALCULATE_DUTY_8BIT(duty);
	//			break;
	//		case LETTER_B:
	//			*TCCRxA	|= bitValue(5) | bitValue(4);
	//			//OCRxB_8BIT(TCCRxA) = CALCULATE_DUTY_8BIT(duty);
	//			break;
	//		default:
	//			break;
	//		}
	//		*TCCRxA |= (0 << WGM11) | (1 << WGM10);
	//		TCCRxB_8BIT(TCCRxA) |= (0 << WGM22);
	//		TCCRxB_8BIT(TCCRxA) |= (0 << CS12) | (1 << CS11) | (0 << CS10);
	//		break;
	//	case PWM16BIT:
	//		//ICRx_16BIT(TCCRxA) = CALCULATE_PWM_TICKS(freq);
	//		switch (pinToLetter(__var)) {
	//		case LETTER_A:
	//			*TCCRxA |= bitValue(7) | bitValue(6);
	//			//OCRxA_16BIT(TCCRxA) = CALCULATE_DUTY_16BIT(freq, duty);
	//			break;
	//		case LETTER_B:
	//			*TCCRxA	|= bitValue(5) | bitValue(4);
	//			//OCRxB_16BIT(TCCRxA) = CALCULATE_DUTY_16BIT(freq, duty);
	//			break;
	//#if defined(LETTER_C)
	//		case LETTER_C:
	//			*TCCRxA	|= bitValue(3) | bitValue(2);
	//			OCRxC_16BIT(TCCRxA) = CALCULATE_DUTY_16BIT(freq, duty);
	//			break;
	//#endif
	//		default:
	//			break;
	//		}
	//		*TCCRxA  |= (1 << WGM11) | (0 << WGM10);// Setting PWM, Phase Correct
	//		TCCRxB_16BIT(TCCRxA)  |= (1 << WGM13) | (1 << WGM12);// TOP = OCRnA TOVx Flag = BOTTOM
	//		TCCRxB_16BIT(TCCRxA)  |= (0 << CS12) | (0 << CS11) | (1 << CS10); //Setting prescaler to 1, so F_CPU
	//		break;
	//	default:
	//		break;
	//	}
//}





/*
		if(pinToTimer(pin) == NO_TIMER || pinToTimer(pin) == TIMER_0){
			return;
		}
		switch (pinToPWMGroup(pin)) {
		case PWM8BIT:
			switch (pinToLetter(pin)) {
			case LETTER_A:
				TCCRxA(pinToTimer(pin))	|= bitValue(7) | bitValue(6);
				OCRxA_8BIT(pinToTimer(pin)) = CALCULATE_DUTY_8BIT(duty);
				break;
			case LETTER_B:
				TCCRxA(pinToTimer(pin))	|= bitValue(5) | bitValue(4);
				OCRxB_8BIT(pinToTimer(pin)) = CALCULATE_DUTY_8BIT(duty);
				break;
			default:
				break;
			}
			TCCRxA(pinToTimer(pin)) |= (0 << WGM11) | (1 << WGM10);
			TCCRxB_8BIT(pinToTimer(pin)) |= (0 << WGM22);
			TCCRxB_8BIT(pinToTimer(pin)) |= (0 << CS12) | (1 << CS11) | (0 << CS10);
			break;
		case PWM16BIT:
			ICRx_16BIT(pinToTimer(pin)) = CALCULATE_PWM_TICKS(freq);
			switch (pinToLetter(pin)) {
			case LETTER_A:
				TCCRxA(pinToTimer(pin))	|= bitValue(7) | bitValue(6);
				OCRxA_16BIT(pinToTimer(pin)) = CALCULATE_DUTY_16BIT(freq, duty);
				break;
			case LETTER_B:
				TCCRxA(pinToTimer(pin))	|= bitValue(5) | bitValue(4);
				OCRxB_16BIT(pinToTimer(pin)) = CALCULATE_DUTY_16BIT(freq, duty);
				break;
	#if defined(LETTER_C)
			case LETTER_C:
				TCCRxA(pinToTimer(pin))	|= bitValue(3) | bitValue(2);
				OCRxC_16BIT(pinToTimer(pin)) = CALCULATE_DUTY_16BIT(freq, duty);
				break;
	#endif
			default:
				break;
			}
			TCCRxA(pinToTimer(pin))  |= (1 << WGM11) | (0 << WGM10);// Setting PWM, Phase Correct
			TCCRxB_16BIT(pinToTimer(pin))  |= (1 << WGM13) | (1 << WGM12);// TOP = OCRnA TOVx Flag = BOTTOM
			TCCRxB_16BIT(pinToTimer(pin))  |= (0 << CS12) | (0 << CS11) | (1 << CS10); //Setting prescaler to 1, so F_CPU
			break;
		default:
			break;
		}*/
/*
//---- ATMEGA2560 ----//

void pinMode(u8t pin, DDRx direction)
{
	u16t var =	pgm_read_word(&__flashMappedPort[pin]);
	//u16t var = getVar(pin);

	u8t regbit  = (var >> 8) & 0x07;

	u16t ddrx = ((var & 0x1f) + 1);
	if(bitRead(var, 5)){
		ddrx |= 0x100;
	}
	else {
		ddrx += 0x20;
	}
	if(direction == OUTPUT){
		(*((volatile u8t*)ddrx)) |= __bitToValue[regbit];
		return;
	}

	(*((volatile u8t*)ddrx)) &= __bitToValue_compl[regbit];

	if(direction == INPUT_PULLUP){
		(*((volatile u8t*)ddrx))	|= __bitToValue[regbit];
	}
}


void toggle(u8t pin)
{
	u16t var =	pgm_read_word(&__flashMappedPort[pin]);
	u8t regbit  = (var >> 8) & 0x07;

	u16t pinx =((var & 0x1f));
	if(bitRead(var, 5)){
		pinx |= 0x100;
	}
	else {
		pinx += 0x20;
	}
	(*((volatile u8t*)pinx)) =  __bitToValue[regbit];
}








//---- ATMEGA328P ----//

//void toggle(u8t pin)
//{
//	u16t var =	pgm_read_word(&__flashMappedPort[pin]);
//	u8t regbit  = ( var >> 8) & 0x07;
//
//	u16t pinx =((var & 0x1f) + 2);
//	if( var & (1 << 5)){
//		pinx |= 0x100;
//		(*((volatile u8t*)pinx)) ^=  __bitToValue[regbit];
//	}
//	else {
//		pinx += 0x20;
//		(*((volatile u8t*)pinx)) ^=  __bitToValue[regbit];
//	}
//}

*/






