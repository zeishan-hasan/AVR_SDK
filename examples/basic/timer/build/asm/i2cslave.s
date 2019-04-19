	.file	"i2cslave.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	_Z16I2C_setCallbacksPFvhEPFvvE
	.type	_Z16I2C_setCallbacksPFvhEPFvvE, @function
_Z16I2C_setCallbacksPFvhEPFvvE:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sts _ZL8I2C_recv+1,r25
	sts _ZL8I2C_recv,r24
	sts _ZL7I2C_req+1,r23
	sts _ZL7I2C_req,r22
	ret
	.size	_Z16I2C_setCallbacksPFvhEPFvvE, .-_Z16I2C_setCallbacksPFvhEPFvvE
.global	_Z8I2C_inith
	.type	_Z8I2C_inith, @function
_Z8I2C_inith:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* #APP */
 ;  17 "libs/communication/i2c/slave/i2cslave.cpp" 1
	cli
 ;  0 "" 2
/* #NOAPP */
	lsl r24
	sts 186,r24
	ldi r24,lo8(-59)
	sts 188,r24
/* #APP */
 ;  22 "libs/communication/i2c/slave/i2cslave.cpp" 1
	sei
 ;  0 "" 2
/* #NOAPP */
	ret
	.size	_Z8I2C_inith, .-_Z8I2C_inith
.global	_Z8I2C_stopv
	.type	_Z8I2C_stopv, @function
_Z8I2C_stopv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* #APP */
 ;  28 "libs/communication/i2c/slave/i2cslave.cpp" 1
	cli
 ;  0 "" 2
/* #NOAPP */
	sts 188,__zero_reg__
	sts 186,__zero_reg__
/* #APP */
 ;  31 "libs/communication/i2c/slave/i2cslave.cpp" 1
	sei
 ;  0 "" 2
/* #NOAPP */
	ret
	.size	_Z8I2C_stopv, .-_Z8I2C_stopv
.global	__vector_39
	.type	__vector_39, @function
__vector_39:
	push r1
	push r0
	in r0,__SREG__
	push r0
	clr __zero_reg__
	in r0,__RAMPZ__
	push r0
	push r18
	push r19
	push r20
	push r21
	push r22
	push r23
	push r24
	push r25
	push r26
	push r27
	push r30
	push r31
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 16 */
.L__stack_usage = 16
	lds r24,185
	andi r24,lo8(-8)
	cpi r24,lo8(-128)
	breq .L6
	brsh .L7
	cpse r24,__zero_reg__
	rjmp .L5
	sts 188,__zero_reg__
	rjmp .L5
.L7:
	cpi r24,lo8(-88)
	breq .L10
	cpi r24,lo8(-72)
	breq .L10
	rjmp .L5
.L6:
	lds r24,187
	lds r30,_ZL8I2C_recv
	lds r31,_ZL8I2C_recv+1
	eicall
	rjmp .L5
.L10:
	lds r30,_ZL7I2C_req
	lds r31,_ZL7I2C_req+1
	eicall
.L5:
	ldi r24,lo8(-59)
	sts 188,r24
/* epilogue start */
	pop r31
	pop r30
	pop r27
	pop r26
	pop r25
	pop r24
	pop r23
	pop r22
	pop r21
	pop r20
	pop r19
	pop r18
	pop r0
	out __RAMPZ__,r0
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
	.size	__vector_39, .-__vector_39
	.local	_ZL7I2C_req
	.comm	_ZL7I2C_req,2,1
	.local	_ZL8I2C_recv
	.comm	_ZL8I2C_recv,2,1
	.ident	"GCC: (GNU) 5.4.0"
.global __do_clear_bss
