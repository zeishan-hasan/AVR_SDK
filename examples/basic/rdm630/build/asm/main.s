	.file	"main.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Buzzer ok!\r\n"
.LC1:
	.string	"Attach ok\r\n"
.LC2:
	.string	"New Card found!\r\n"
.LC3:
	.string	"ID: "
.LC4:
	.string	"%c"
.LC5:
	.string	"\r\n"
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,18
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 18 */
/* stack size = 20 */
.L__stack_usage = 20
	lds r24,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	lds r25,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	or r24,r25
	brne .L2
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
.L2:
	lds r15,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	lds r14,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	ldi r18,0
	ldi r20,lo8(64)
	ldi r21,lo8(66)
	ldi r22,lo8(15)
	ldi r23,0
	mov r24,r15
	mov r25,r14
	call _ZN6Serial4initE4UART14SerialPriority
	ldi r22,0
	mov r24,r15
	mov r25,r14
	call _ZN6Serial16setRxISRCallBackEb
	ldi r22,0
	mov r24,r15
	mov r25,r14
	call _ZN6Serial13setEchoServerEb
	mov r24,r15
	mov r25,r14
	call _ZN6Serial5clearEv
	movw r24,r28
	adiw r24,1
	call _ZN7Rdm6300C1Ev
	ldi r22,lo8(13)
	movw r24,r28
	adiw r24,1
	call _ZN7Rdm630012setBuzzerPinEh
	tst r24
	breq .L3
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	push r25
	push r24
	push r14
	push r15
	call _ZN6Serial6printfEPKcz
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
.L3:
	ldi r18,lo8(-128)
	ldi r19,lo8(37)
	ldi r20,0
	ldi r21,0
	ldi r22,lo8(3)
	movw r24,r28
	adiw r24,1
	call _ZN7Rdm63008attachToE10SerialPort4UART
	tst r24
	breq .L4
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	push r25
	push r24
	push r14
	push r15
	call _ZN6Serial6printfEPKcz
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
.L4:
	ldi r24,lo8(8)
	ldi r25,0
	call _Znwj
	movw r12,r24
	ldi r16,0
	ldi r17,0
	ldi r24,lo8(8)
	mov r8,r24
	mov r9,__zero_reg__
	ldi r25,lo8(.LC4)
	mov r2,r25
	ldi r25,hi8(.LC4)
	mov r3,r25
	ldi r18,lo8(.LC5)
	mov r4,r18
	ldi r18,hi8(.LC5)
	mov r5,r18
.L19:
	movw r24,r28
	adiw r24,1
	call _ZN7Rdm63009isNewCardEv
	tst r24
	brne .+2
	rjmp .L5
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	push r25
	push r24
	push r14
	push r15
	call _ZN6Serial6printfEPKcz
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	movw r24,r28
	adiw r24,12
	call _ZN7Rdm63007getDataEv
	ldd r10,Y+16
	ldd r11,Y+17
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	cp r8,r10
	cpc r9,r11
	brsh .L6
	movw r24,r10
	call _Znwj
	movw r6,r24
	movw r30,r24
	movw r26,r12
	add r24,r16
	adc r25,r17
.L9:
	cp r30,r24
	cpc r31,r25
	breq .L7
	sbiw r30,0
	breq .L8
	ld r18,X
	st Z,r18
.L8:
	adiw r30,1
	adiw r26,1
	rjmp .L9
.L7:
	movw r24,r12
	call _ZdlPv
	movw r8,r10
	movw r12,r6
.L6:
	ldd r24,Y+16
	ldd r25,Y+17
	ldd r18,Y+12
	ldd r19,Y+13
	movw r30,r18
	movw r26,r12
	movw r20,r24
	cp r16,r24
	cpc r17,r25
	brsh .L10
	movw r20,r16
.L10:
	add r20,r18
	adc r21,r19
.L12:
	cp r30,r20
	cpc r31,r21
	breq .L11
	ld r22,Z+
	st X+,r22
	rjmp .L12
.L11:
	cp r16,r24
	cpc r17,r25
	brsh .L13
	movw r30,r12
	add r30,r16
	adc r31,r17
	movw r26,r18
	add r26,r16
	adc r27,r17
	movw r18,r12
	add r18,r24
	adc r19,r25
.L15:
	sbiw r30,0
	breq .L14
	ld r20,X
	st Z,r20
.L14:
	adiw r30,1
	adiw r26,1
	cp r18,r30
	cpc r19,r31
	brne .L15
	movw r16,r24
.L13:
	cp r24,r16
	cpc r25,r17
	brsh .L16
	movw r16,r24
.L16:
	ldd r24,Y+12
	ldd r25,Y+13
	call _ZdlPv
	ldi r24,lo8(.LC3)
	ldi r25,hi8(.LC3)
	push r25
	push r24
	push r14
	push r15
	call _ZN6Serial6printfEPKcz
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	mov r11,__zero_reg__
.L18:
	mov r24,r11
	ldi r25,0
	cp r24,r16
	cpc r25,r17
	brsh .L17
	movw r30,r12
	add r30,r24
	adc r31,r25
	ld r24,Z
	push __zero_reg__
	push r24
	push __zero_reg__
	push r24
	push r3
	push r2
	push r14
	push r15
	call _ZN6Serial6printfEPKcz
	inc r11
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	rjmp .L18
.L17:
	push r5
	push r4
	push r14
	push r15
	call _ZN6Serial6printfEPKcz
	ldi r25,lo8(3199999)
	ldi r18,hi8(3199999)
	ldi r24,hlo8(3199999)
1:	subi r25,1
	sbci r18,0
	sbci r24,0
	brne 1b
	rjmp .
	nop
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
.L5:
	ldi r24,lo8(-25537)
	ldi r25,hi8(-25537)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
	rjmp .L19
	.size	main, .-main
.global	debug
	.data
	.type	debug, @object
	.size	debug, 1
debug:
	.byte	1
	.weak	_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	.section	.bss._ZZN13SerialManager11getInstanceE10SerialPortE8instance,"awG",@nobits,_ZZN13SerialManager11getInstanceE10SerialPortE8instance,comdat
	.type	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, @object
	.size	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, 8
_ZZN13SerialManager11getInstanceE10SerialPortE8instance:
	.zero	8
	.ident	"GCC: (GNU) 5.4.0"
.global __do_copy_data
.global __do_clear_bss
