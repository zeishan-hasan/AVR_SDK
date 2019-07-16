	.file	"adccomparator.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
.global	__floatsisf
.global	__mulsf3
.global	__divsf3
.global	__fixsfsi
	.text
.global	_Z11adc_compare11ADC_COMPARE6_ADMUX17_ADCSRA_PRESCALER19_ADCSRB_AUTOTRIGGER
	.type	_Z11adc_compare11ADC_COMPARE6_ADMUX17_ADCSRA_PRESCALER19_ADCSRB_AUTOTRIGGER, @function
_Z11adc_compare11ADC_COMPARE6_ADMUX17_ADCSRA_PRESCALER19_ADCSRB_AUTOTRIGGER:
	push r12
	push r13
	push r14
	push r15
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 5 */
.L__stack_usage = 5
	or r22,r24
	ldi r30,0
	ldi r31,0
	mov r31,r18
	or r30,r22
	or r31,r23
	lds r18,122
	cpse r18,__zero_reg__
	rjmp .L2
	lds r18,122
	ori r18,lo8(-128)
	or r20,r18
	sts 122,r20
.L2:
	lds r18,122
	sts 123,r31
	sts 124,r30
	lds r18,122
	ori r18,lo8(64)
	sts 122,r18
.L3:
	lds r18,122
	sbrc r18,6
	rjmp .L3
	lds r22,120
	lds r23,120+1
	sbrc r23,1
	ori r23,252
.L4:
	cpi r24,30
	cpc r25,__zero_reg__
	brge .L5
	subi r24,lo8(-(-8))
	rjmp .L6
.L5:
	subi r24,lo8(-(-18))
.L6:
	mov r30,r24
	ldi r31,0
	subi r30,lo8(-(_ZL13adc_gain_vect))
	sbci r31,hi8(-(_ZL13adc_gain_vect))
/* #APP */
 ;  32 "libs/gpio/adc_comparator/adccomparator.cpp" 1
	lpm r28, Z
	
 ;  0 "" 2
/* #NOAPP */
	mov __tmp_reg__,r23
	lsl r0
	sbc r24,r24
	sbc r25,r25
	call __floatsisf
	ldi r18,0
	ldi r19,lo8(64)
	ldi r20,lo8(-100)
	ldi r21,lo8(69)
	call __mulsf3
	movw r12,r22
	movw r14,r24
	mov r22,r28
	ldi r23,0
	ldi r24,0
	ldi r25,0
	call __floatsisf
	ldi r18,0
	ldi r19,0
	ldi r20,0
	ldi r21,lo8(68)
	call __mulsf3
	movw r18,r22
	movw r20,r24
	movw r24,r14
	movw r22,r12
	call __divsf3
	call round
	call __fixsfsi
	mov __tmp_reg__,r23
	lsl r0
	sbc r24,r24
	sbc r25,r25
/* epilogue start */
	pop r28
	pop r15
	pop r14
	pop r13
	pop r12
	ret
	.size	_Z11adc_compare11ADC_COMPARE6_ADMUX17_ADCSRA_PRESCALER19_ADCSRB_AUTOTRIGGER, .-_Z11adc_compare11ADC_COMPARE6_ADMUX17_ADCSRA_PRESCALER19_ADCSRB_AUTOTRIGGER
	.section	.progmem.data,"a",@progbits
	.type	_ZL13adc_gain_vect, @object
	.size	_ZL13adc_gain_vect, 44
_ZL13adc_gain_vect:
	.byte	10
	.byte	10
	.byte	-56
	.byte	-56
	.byte	10
	.byte	10
	.byte	-56
	.byte	-56
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	10
	.byte	10
	.byte	-56
	.byte	-56
	.byte	10
	.byte	10
	.byte	-56
	.byte	-56
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.ident	"GCC: (GNU) 5.4.0"
