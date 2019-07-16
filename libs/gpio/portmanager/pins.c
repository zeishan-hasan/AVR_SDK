#include "pins.h"



void setPWM(u8t pin, size_t freq, u8t duty)
{

	//u16t __var = pgm_read_word(&__flashMappedPort[5]);
	//u8t timer = pinToTimer(__var);
	//if(timer == NO_TIMER || timer == TIMER_0){
	//	return;
	//}
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
}





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




