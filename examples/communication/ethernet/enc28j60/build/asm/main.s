	.file	"main.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
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
	.section	.rodata.str1.1
.LC3:
	.string	"link is up\r\n"
.LC4:
	.string	"unread packet %u\r\n"
.LC5:
	.string	"Receiving data\r\n"
	.section	.rodata
.LC0:
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-96
	.byte	-79
	.byte	-62
	.byte	-45
	.byte	-28
	.byte	-11
	.byte	8
	.byte	6
	.byte	0
	.byte	1
	.byte	8
	.byte	0
	.byte	6
	.byte	4
	.byte	0
	.byte	1
	.byte	-96
	.byte	-79
	.byte	-62
	.byte	-45
	.byte	-28
	.byte	-11
	.byte	-64
	.byte	-88
	.byte	2
	.byte	-56
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-64
	.byte	-88
	.byte	2
	.byte	1
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	subi r28,71
	sbc r29,__zero_reg__
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 71 */
/* stack size = 73 */
.L__stack_usage = 73
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
	lds r17,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	lds r16,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	ldi r18,0
	ldi r20,lo8(64)
	ldi r21,lo8(66)
	ldi r22,lo8(15)
	ldi r23,0
	mov r24,r17
	mov r25,r16
	call _ZN6Serial4initE4UART14SerialPriority
	ldi r22,0
	mov r24,r17
	mov r25,r16
	call _ZN6Serial16setRxISRCallBackEb
	ldi r22,0
	mov r24,r17
	mov r25,r16
	call _ZN6Serial13setEchoServerEb
	mov r24,r17
	mov r25,r16
	call _ZN6Serial5clearEv
	ldi r24,lo8(-96)
	adiw r28,66-63
	std Y+63,r24
	sbiw r28,66-63
	ldi r24,lo8(-79)
	adiw r28,67-63
	std Y+63,r24
	sbiw r28,67-63
	ldi r24,lo8(-62)
	adiw r28,68-63
	std Y+63,r24
	sbiw r28,68-63
	ldi r24,lo8(-45)
	adiw r28,69-63
	std Y+63,r24
	sbiw r28,69-63
	ldi r24,lo8(-28)
	adiw r28,70-63
	std Y+63,r24
	sbiw r28,70-63
	ldi r24,lo8(-11)
	adiw r28,71-63
	std Y+63,r24
	sbiw r28,71-63
	movw r22,r28
	subi r22,-66
	sbci r23,-1
	movw r24,r28
	adiw r24,43
	call _ZN8Enc28j60C1ER9macaddr_t
	ldi r24,lo8(42)
	ldi r30,lo8(.LC0)
	ldi r31,hi8(.LC0)
	movw r26,r28
	adiw r26,1
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	ldi r24,lo8(.LC3)
	mov r14,r24
	ldi r24,hi8(.LC3)
	mov r15,r24
	ldi r25,lo8(.LC4)
	mov r12,r25
	ldi r25,hi8(.LC4)
	mov r13,r25
	ldi r18,lo8(.LC5)
	mov r10,r18
	ldi r18,hi8(.LC5)
	mov r11,r18
.L9:
	movw r24,r28
	adiw r24,43
	call _ZN8Enc28j608isLinkUpEv
	tst r24
	breq .L7
	push r15
	push r14
	push r16
	push r17
	call _ZN6Serial6printfEPKcz
	movw r24,r28
	adiw r24,43
	call _ZN8Enc28j6015getUnreadPacketEv
	push __zero_reg__
	push r24
	push r13
	push r12
	push r16
	push r17
	call _ZN6Serial6printfEPKcz
	movw r24,r28
	adiw r24,43
	call _ZN8Enc28j6015isReceivingDataEv
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	tst r24
	breq .L7
	push r11
	push r10
	push r16
	push r17
	call _ZN6Serial6printfEPKcz
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
.L7:
	ldi r20,lo8(42)
	ldi r21,0
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	movw r24,r28
	adiw r24,43
	call _ZN8Enc28j6010sendPacketEPhj
	ldi r19,lo8(1599999)
	ldi r24,hi8(1599999)
	ldi r25,hlo8(1599999)
1:	subi r19,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
	rjmp .L9
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
