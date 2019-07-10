	.file	"ethernet.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
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
.global	_ZN8Ethernet11encapsulateERSt6vectorIhSaIhEE
	.type	_ZN8Ethernet11encapsulateERSt6vectorIhSaIhEE, @function
_ZN8Ethernet11encapsulateERSt6vectorIhSaIhEE:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r30,r22
	ldd r18,Z+4
	ldd r19,Z+5
	subi r18,46
	sbc r19,__zero_reg__
	cpi r18,-81
	sbci r19,5
	brlo .L3
	ldi r24,0
	rjmp .L5
.L3:
	movw r28,r24
	ldi r24,lo8(8)
	ldi r25,0
	call _Znwj
	movw r14,r24
	ldi r24,lo8(14)
	ldi r25,0
	call _Znwj
	movw r16,r24
	movw r24,r14
	call _ZdlPv
	ldi r24,lo8(14)
	movw r30,r28
	movw r26,r16
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	movw r24,r16
	call _ZdlPv
	ldi r24,lo8(1)
.L5:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
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
	.ident	"GCC: (GNU) 5.4.0"
.global __do_copy_data
