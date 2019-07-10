	.file	"main.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	_Z4funch
	.type	_Z4funch, @function
_Z4funch:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
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
	sbiw r28,31
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 31 */
/* stack size = 33 */
.L__stack_usage = 33
	ldi r24,lo8(-96)
	std Y+26,r24
	ldi r24,lo8(-79)
	std Y+27,r24
	ldi r24,lo8(-62)
	std Y+28,r24
	ldi r24,lo8(-45)
	std Y+29,r24
	ldi r24,lo8(-28)
	std Y+30,r24
	ldi r24,lo8(-11)
	std Y+31,r24
	movw r22,r28
	subi r22,-26
	sbci r23,-1
	movw r24,r28
	adiw r24,1
	call _ZN8Enc28j60C1ER9macaddr_t
	sbi 0x4,7
.L3:
	in r24,0x5
	subi r24,lo8(-(-128))
	out 0x5,r24
	rjmp .L3
	.size	main, .-main
.global	debug
	.data
	.type	debug, @object
	.size	debug, 1
debug:
	.byte	1
	.ident	"GCC: (GNU) 5.4.0"
.global __do_copy_data
