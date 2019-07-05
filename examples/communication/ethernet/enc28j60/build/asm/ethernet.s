	.file	"ethernet.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.section	.rodata
.LC0:
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.text
.global	_ZN8EthernetC2Ev
	.type	_ZN8EthernetC2Ev, @function
_ZN8EthernetC2Ev:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	st Y,__zero_reg__
	std Y+1,__zero_reg__
	std Y+2,__zero_reg__
	std Y+3,__zero_reg__
	std Y+4,__zero_reg__
	std Y+5,__zero_reg__
	std Y+6,__zero_reg__
	std Y+7,__zero_reg__
	std Y+8,__zero_reg__
	std Y+9,__zero_reg__
	std Y+10,__zero_reg__
	std Y+11,__zero_reg__
	std Y+13,__zero_reg__
	std Y+12,__zero_reg__
	ldi r24,lo8(7)
	ldi r30,lo8(.LC0)
	ldi r31,hi8(.LC0)
	movw r26,r28
	adiw r26,14
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	ldi r24,lo8(-43)
	std Y+21,r24
	std Y+22,__zero_reg__
	std Y+23,__zero_reg__
	std Y+24,__zero_reg__
	std Y+25,__zero_reg__
	std Y+26,__zero_reg__
	std Y+27,__zero_reg__
	std Y+28,__zero_reg__
	std Y+29,__zero_reg__
	std Y+30,__zero_reg__
	std Y+31,__zero_reg__
	std Y+32,__zero_reg__
	std Y+33,__zero_reg__
	std Y+41,__zero_reg__
	std Y+40,__zero_reg__
	ldi r24,lo8(8)
	ldi r25,0
	std Y+43,r25
	std Y+42,r24
	std Y+45,__zero_reg__
	std Y+44,__zero_reg__
	call _Znwj
	std Y+41,r25
	std Y+40,r24
	std Y+22,__zero_reg__
	std Y+23,__zero_reg__
	std Y+24,__zero_reg__
	std Y+25,__zero_reg__
	std Y+26,__zero_reg__
	std Y+27,__zero_reg__
	std Y+28,__zero_reg__
	std Y+29,__zero_reg__
	std Y+30,__zero_reg__
	std Y+31,__zero_reg__
	std Y+32,__zero_reg__
	std Y+33,__zero_reg__
	std Y+34,__zero_reg__
	std Y+35,__zero_reg__
	std Y+36,__zero_reg__
	std Y+37,__zero_reg__
	std Y+39,__zero_reg__
	std Y+38,__zero_reg__
	std Y+47,__zero_reg__
	std Y+48,__zero_reg__
	std Y+49,__zero_reg__
	std Y+50,__zero_reg__
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZN8EthernetC2Ev, .-_ZN8EthernetC2Ev
.global	_ZN8EthernetC1Ev
	.set	_ZN8EthernetC1Ev,_ZN8EthernetC2Ev
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Size : %u\r\n"
	.text
.global	_ZN8Ethernet11encapsulateERSt6vectorIhSaIhEE
	.type	_ZN8Ethernet11encapsulateERSt6vectorIhSaIhEE, @function
_ZN8Ethernet11encapsulateERSt6vectorIhSaIhEE:
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
/* stack size = 8 */
.L__stack_usage = 8
	movw r30,r22
	ldd r18,Z+4
	ldd r19,Z+5
	subi r18,46
	sbc r19,__zero_reg__
	cpi r18,-81
	sbci r19,5
	brlo .L15
	ldi r24,0
	rjmp .L13
.L15:
	movw r28,r24
	lds r24,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	lds r25,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	or r24,r25
	brne .L7
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
.L7:
	lds r15,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	lds r14,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	ldi r24,lo8(8)
	ldi r25,0
	call _Znwj
	movw r12,r24
	ldi r24,lo8(14)
	ldi r25,0
	call _Znwj
	movw r16,r24
	movw r24,r12
	call _ZdlPv
	ldi r24,lo8(14)
	movw r30,r28
	movw r26,r16
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	lds r24,debug
	tst r24
	breq .L5
	push __zero_reg__
	push __zero_reg__
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
	pop __tmp_reg__
	pop __tmp_reg__
.L5:
	movw r24,r16
	call _ZdlPv
	ldi r24,lo8(1)
.L13:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	ret
	.size	_ZN8Ethernet11encapsulateERSt6vectorIhSaIhEE, .-_ZN8Ethernet11encapsulateERSt6vectorIhSaIhEE
.global	_ZN8Ethernet11decapsulateERSt6vectorIhSaIhEE
	.type	_ZN8Ethernet11decapsulateERSt6vectorIhSaIhEE, @function
_ZN8Ethernet11decapsulateERSt6vectorIhSaIhEE:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_ZN8Ethernet11decapsulateERSt6vectorIhSaIhEE, .-_ZN8Ethernet11decapsulateERSt6vectorIhSaIhEE
	.weak	_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	.section	.bss._ZZN13SerialManager11getInstanceE10SerialPortE8instance,"awG",@nobits,_ZZN13SerialManager11getInstanceE10SerialPortE8instance,comdat
	.type	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, @object
	.size	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, 2
_ZZN13SerialManager11getInstanceE10SerialPortE8instance:
	.zero	2
	.ident	"GCC: (GNU) 5.4.0"
.global __do_copy_data
.global __do_clear_bss
