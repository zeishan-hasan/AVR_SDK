	.file	"main.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.section	.text._ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_,"axG",@progbits,_ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_,comdat
	.weak	_ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_
	.type	_ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_, @function
_ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_:
	push r7
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 13 */
.L__stack_usage = 13
	movw r28,r24
	movw r12,r18
	movw r14,r20
.L14:
	cp r14,r12
	cpc r15,r13
	brne .+2
	rjmp .L1
	movw r30,r14
	ld r7,Z+
	movw r14,r30
	ld r10,Y
	ldd r11,Y+1
	movw r16,r22
	sub r16,r10
	sbc r17,r11
	ldd r24,Y+4
	ldd r25,Y+5
	movw r8,r24
	ldi r31,-1
	sub r8,r31
	sbc r9,r31
	cp r24,r8
	cpc r25,r9
	brsh .L3
	ldd r18,Y+2
	ldd r19,Y+3
	cp r18,r8
	cpc r19,r9
	brsh .L4
	adiw r24,9
	cp r18,r24
	cpc r19,r25
	brsh .L4
	std Y+3,r25
	std Y+2,r24
	call _Znwj
	std Y+1,r25
	st Y,r24
	movw r26,r10
.L7:
	movw r24,r26
	sub r24,r10
	sbc r25,r11
	ldd r18,Y+4
	ldd r19,Y+5
	cp r24,r18
	cpc r25,r19
	brsh .L5
	ld r30,Y
	ldd r31,Y+1
	add r30,r24
	adc r31,r25
	sbiw r30,0
	breq .L6
	ld r24,X
	st Z,r24
.L6:
	adiw r26,1
	rjmp .L7
.L5:
	movw r24,r10
	call _ZdlPv
.L4:
	ldd r24,Y+4
	ldd r25,Y+5
.L10:
	cp r24,r8
	cpc r25,r9
	brsh .L21
	ld r30,Y
	ldd r31,Y+1
	add r30,r24
	adc r31,r25
	sbiw r30,0
	breq .L9
	st Z,r7
.L9:
	adiw r24,1
	rjmp .L10
.L3:
	cp r8,r24
	cpc r9,r25
	brsh .L11
.L21:
	std Y+5,r9
	std Y+4,r8
.L11:
	ldd r18,Y+4
	ldd r19,Y+5
	subi r18,1
	sbc r19,__zero_reg__
.L13:
	ld r24,Y
	ldd r25,Y+1
	movw r30,r24
	cp r16,r18
	cpc r17,r19
	brsh .L12
	add r30,r18
	adc r31,r19
	subi r18,1
	sbc r19,__zero_reg__
	movw r26,r24
	add r26,r18
	adc r27,r19
	ld r24,X
	st Z,r24
	rjmp .L13
.L12:
	add r30,r16
	adc r31,r17
	st Z,r7
	subi r16,-1
	sbci r17,-1
	ld r22,Y
	ldd r23,Y+1
	add r22,r16
	adc r23,r17
	rjmp .L14
.L1:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop r7
	ret
	.size	_ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_, .-_ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,56
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 56 */
/* stack size = 58 */
.L__stack_usage = 58
	lds r24,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	lds r25,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	or r24,r25
	brne .L24
	ldi r24,lo8(22)
	ldi r25,lo8(1)
	call _Znwj
	movw r30,r24
	subi r30,-7
	sbci r31,-2
	ldi r18,lo8(-64)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-63)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-62)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-59)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-60)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-58)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	sts _ZZN13SerialManager11getInstanceE10SerialPortE8instance+1,r25
	sts _ZZN13SerialManager11getInstanceE10SerialPortE8instance,r24
.L24:
	lds r16,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	lds r17,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	ldi r18,0
	ldi r20,lo8(64)
	ldi r21,lo8(66)
	ldi r22,lo8(15)
	ldi r23,0
	movw r24,r16
	call _ZN6Serial4initE4UART14SerialPriority
	ldi r22,0
	movw r24,r16
	call _ZN6Serial16setRxISRCallBackEb
	ldi r22,0
	movw r24,r16
	call _ZN6Serial13setEchoServerEb
	movw r24,r16
	call _ZN6Serial5clearEv
	movw r24,r28
	adiw r24,29
	call _ZN8Enc28j60C1Ev
	ldi r16,lo8(53)
	ldi r18,lo8(52)
	ldi r20,lo8(51)
	ldi r22,lo8(50)
	movw r24,r28
	adiw r24,29
	call _ZN8Enc28j606setSPIEhhhh
	ldi r24,lo8(1)
	ldi r25,0
	std Y+2,r25
	std Y+1,r24
	ldi r18,0
	ldi r19,lo8(8)
	std Y+4,r19
	std Y+3,r18
	ldi r18,lo8(6)
	std Y+5,r18
	ldi r18,lo8(4)
	std Y+6,r18
	std Y+8,r25
	std Y+7,r24
	ldi r24,lo8(-11)
	std Y+9,r24
	ldi r24,lo8(-28)
	std Y+10,r24
	ldi r24,lo8(-45)
	std Y+11,r24
	ldi r24,lo8(-62)
	std Y+12,r24
	ldi r24,lo8(-79)
	std Y+13,r24
	ldi r24,lo8(-96)
	std Y+14,r24
	ldi r24,lo8(-56)
	ldi r25,lo8(1)
	ldi r26,lo8(-88)
	ldi r27,lo8(-64)
	std Y+15,r24
	std Y+16,r25
	std Y+17,r26
	std Y+18,r27
	std Y+19,__zero_reg__
	std Y+20,__zero_reg__
	std Y+21,__zero_reg__
	std Y+22,__zero_reg__
	std Y+23,__zero_reg__
	std Y+24,__zero_reg__
	ldi r24,lo8(-59)
	ldi r25,lo8(1)
	ldi r26,lo8(-88)
	ldi r27,lo8(-64)
	std Y+25,r24
	std Y+26,r25
	std Y+27,r26
	std Y+28,r27
	std Y+51,__zero_reg__
	std Y+50,__zero_reg__
	ldi r24,lo8(8)
	ldi r25,0
	std Y+53,r25
	std Y+52,r24
	std Y+55,__zero_reg__
	std Y+54,__zero_reg__
	call _Znwj
	std Y+51,r25
	std Y+50,r24
	movw r18,r28
	subi r18,-29
	sbci r19,-1
	movw r20,r28
	subi r20,-1
	sbci r21,-1
	movw r22,r24
	movw r24,r28
	adiw r24,50
	call _ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_
.L25:
	ldi r18,lo8(1599999)
	ldi r24,hi8(1599999)
	ldi r25,hlo8(1599999)
1:	subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
	rjmp .L25
	.size	main, .-main
.global	debug
	.section .bss
	.type	debug, @object
	.size	debug, 1
debug:
	.zero	1
	.weak	_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	.section	.bss._ZZN13SerialManager11getInstanceE10SerialPortE8instance,"awG",@nobits,_ZZN13SerialManager11getInstanceE10SerialPortE8instance,comdat
	.type	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, @object
	.size	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, 8
_ZZN13SerialManager11getInstanceE10SerialPortE8instance:
	.zero	8
	.ident	"GCC: (GNU) 5.4.0"
.global __do_clear_bss
