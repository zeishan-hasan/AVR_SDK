	.file	"main.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"_Now :%u\r\n"
.LC1:
	.string	"_Prev :%u\r\n"
.LC2:
	.string	"_Delta T :%u\r\n\r\n"
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
	push r28
	push r29
	rcall .
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 4 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r24,r28
	adiw r24,1
	call time
	movw r24,r22
	call srand
	ldi r24,lo8(-128)
	out 0x4,r24
	out 0x24,__zero_reg__
	out 0x25,__zero_reg__
	out 0x26,__zero_reg__
	ldi r24,lo8(-1)
	out 0x27,r24
	in r24,0x24
	ori r24,lo8(2)
	out 0x24,r24
	ldi r24,lo8(2)
	sts 110,r24
	lds r24,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+2
	lds r25,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+2+1
	or r24,r25
	brne .L2
	ldi r24,lo8(22)
	ldi r25,lo8(1)
	call _Znwj
	movw r30,r24
	subi r30,-7
	sbci r31,-2
	ldi r18,lo8(-56)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-55)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-54)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-51)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-52)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-50)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	sts _ZZN13SerialManager11getInstanceE10SerialPortE8instance+2+1,r25
	sts _ZZN13SerialManager11getInstanceE10SerialPortE8instance+2,r24
.L2:
	lds r17,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+2
	lds r16,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+3
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
/* #APP */
 ;  32 "src/main.cpp" 1
	sei
 ;  0 "" 2
/* #NOAPP */
	ldi r18,lo8(1599999)
	ldi r19,hi8(1599999)
	ldi r20,hlo8(1599999)
1:	subi r18,1
	sbci r19,0
	sbci r20,0
	brne 1b
	rjmp .
	nop
	in r24,0x25
	ori r24,lo8(1)
	out 0x25,r24
	call _Z6microsv
	movw r14,r24
/* #APP */
 ;  40 "src/main.cpp" 1
	nop
 ;  0 "" 2
 ;  41 "src/main.cpp" 1
	nop
 ;  0 "" 2
 ;  42 "src/main.cpp" 1
	nop
 ;  0 "" 2
 ;  43 "src/main.cpp" 1
	nop
 ;  0 "" 2
/* #NOAPP */
	call _Z6microsv
	movw r12,r24
	sub r12,r14
	sbc r13,r15
	ldi r18,lo8(799999)
	ldi r19,hi8(799999)
	ldi r20,hlo8(799999)
1:	subi r18,1
	sbci r19,0
	sbci r20,0
	brne 1b
	rjmp .
	nop
	push r25
	push r24
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	push r25
	push r24
	push r16
	push r17
	call _ZN6Serial6printfEPKcz
	push r15
	push r14
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	push r25
	push r24
	push r16
	push r17
	call _ZN6Serial6printfEPKcz
	push r13
	push r12
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	push r25
	push r24
	push r16
	push r17
	call _ZN6Serial6printfEPKcz
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
.L3:
	ldi r25,lo8(1599999)
	ldi r18,hi8(1599999)
	ldi r19,hlo8(1599999)
1:	subi r25,1
	sbci r18,0
	sbci r19,0
	brne 1b
	rjmp .
	nop
	rjmp .L3
	.size	main, .-main
	.weak	_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	.section	.bss._ZZN13SerialManager11getInstanceE10SerialPortE8instance,"awG",@nobits,_ZZN13SerialManager11getInstanceE10SerialPortE8instance,comdat
	.type	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, @object
	.size	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, 8
_ZZN13SerialManager11getInstanceE10SerialPortE8instance:
	.zero	8
	.ident	"GCC: (GNU) 5.4.0"
.global __do_copy_data
.global __do_clear_bss
