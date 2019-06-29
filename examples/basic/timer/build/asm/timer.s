	.file	"timer.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	_ZN5Timer4initEv
	.type	_ZN5Timer4initEv, @function
_ZN5Timer4initEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	out 0x24,__zero_reg__
	out 0x25,__zero_reg__
	out 0x26,__zero_reg__
	ldi r24,lo8(-1)
	out 0x27,r24
	in r24,0x24
	ori r24,lo8(2)
	out 0x24,r24
	in r24,0x25
	out 0x25,r24
	ldi r24,lo8(2)
	sts 110,r24
/* #APP */
 ;  91 "libs//timer/timer.cpp" 1
	sei
 ;  0 "" 2
/* #NOAPP */
	ldi r24,lo8(1)
	sts _ZN5Timer7_isInitE,r24
/* epilogue start */
	ret
	.size	_ZN5Timer4initEv, .-_ZN5Timer4initEv
.global	_ZN5Timer5startEv
	.type	_ZN5Timer5startEv, @function
_ZN5Timer5startEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,_ZN5Timer7_isInitE
	cpse r24,__zero_reg__
	rjmp .L3
	call _ZN5Timer4initEv
.L3:
	sts _ZN5Timer5_timeE,__zero_reg__
	sts _ZN5Timer5_timeE+1,__zero_reg__
	sts _ZN5Timer5_timeE+2,__zero_reg__
	sts _ZN5Timer5_timeE+3,__zero_reg__
	in r24,0x25
	ori r24,lo8(1)
	out 0x25,r24
/* epilogue start */
	ret
	.size	_ZN5Timer5startEv, .-_ZN5Timer5startEv
.global	_ZN5Timer4stopEv
	.type	_ZN5Timer4stopEv, @function
_ZN5Timer4stopEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	in r24,0x25
	andi r24,lo8(-8)
	out 0x25,r24
/* epilogue start */
	ret
	.size	_ZN5Timer4stopEv, .-_ZN5Timer4stopEv
.global	_ZN5Timer3nowEv
	.type	_ZN5Timer3nowEv, @function
_ZN5Timer3nowEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r22,__microSecond
	ldi r23,0
	ldi r25,0
	ldi r24,0
/* epilogue start */
	ret
	.size	_ZN5Timer3nowEv, .-_ZN5Timer3nowEv
	.section	.text.startup,"ax",@progbits
	.type	_GLOBAL__sub_I__ZN5Timer5_timeE, @function
_GLOBAL__sub_I__ZN5Timer5_timeE:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sts _ZN5Timer5_timeE,__zero_reg__
	sts _ZN5Timer5_timeE+1,__zero_reg__
	sts _ZN5Timer5_timeE+2,__zero_reg__
	sts _ZN5Timer5_timeE+3,__zero_reg__
/* epilogue start */
	ret
	.size	_GLOBAL__sub_I__ZN5Timer5_timeE, .-_GLOBAL__sub_I__ZN5Timer5_timeE
	.global __do_global_ctors
	.section .ctors,"a",@progbits
	.p2align	1
	.word	gs(_GLOBAL__sub_I__ZN5Timer5_timeE)
.global	__system_time
	.section .bss
	.type	__system_time, @object
	.size	__system_time, 4
__system_time:
	.zero	4
.global	ovfl_count
	.type	ovfl_count, @object
	.size	ovfl_count, 1
ovfl_count:
	.zero	1
.global	__microSecond
	.type	__microSecond, @object
	.size	__microSecond, 1
__microSecond:
	.zero	1
.global	_ZN5Timer7_isInitE
	.type	_ZN5Timer7_isInitE, @object
	.size	_ZN5Timer7_isInitE, 1
_ZN5Timer7_isInitE:
	.zero	1
.global	_ZN5Timer5_timeE
	.type	_ZN5Timer5_timeE, @object
	.size	_ZN5Timer5_timeE, 4
_ZN5Timer5_timeE:
	.zero	4
	.ident	"GCC: (GNU) 8.2.0"
.global __do_clear_bss
