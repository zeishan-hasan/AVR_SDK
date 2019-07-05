	.file	"main.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Interrupt dal pin %u\r\n"
	.text
.global	_Z4funch
	.type	_Z4funch, @function
_Z4funch:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
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
	push __zero_reg__
	push r28
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	push r25
	push r24
	lds r24,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	push r24
	lds r24,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	push r24
	call _ZN6Serial6printfEPKcz
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
/* epilogue start */
	pop r28
	ret
	.size	_Z4funch, .-_Z4funch
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,43
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 43 */
/* stack size = 45 */
.L__stack_usage = 45
	lds r24,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	lds r25,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	or r24,r25
	brne .L5
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
.L5:
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
	ldi r20,lo8(1)
	ldi r22,lo8(13)
	movw r24,r28
	adiw r24,26
	call _ZN3PinC1Eh4DDRx
	ldi r18,lo8(50)
	ldi r20,lo8(-24)
	ldi r21,lo8(3)
	ldi r22,0
	ldi r23,0
	movw r24,r28
	adiw r24,26
	call _ZN3Pin6setPWMEmh
	ldi r24,lo8(-96)
	std Y+38,r24
	ldi r24,lo8(-79)
	std Y+39,r24
	ldi r24,lo8(-62)
	std Y+40,r24
	ldi r24,lo8(-45)
	std Y+41,r24
	ldi r24,lo8(-28)
	std Y+42,r24
	ldi r24,lo8(-11)
	std Y+43,r24
	movw r22,r28
	subi r22,-38
	sbci r23,-1
	movw r24,r28
	adiw r24,1
	call _ZN8Enc28j60C1ER9macaddr_t
.L6:
	ldi r18,lo8(1599999)
	ldi r24,hi8(1599999)
	ldi r25,hlo8(1599999)
1:	subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
	rjmp .L6
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
	.size	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, 2
_ZZN13SerialManager11getInstanceE10SerialPortE8instance:
	.zero	2
	.ident	"GCC: (GNU) 5.4.0"
.global __do_copy_data
.global __do_clear_bss
