	.file	"hmc5883.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	_ZN7Hmc5883C2Ehh
	.type	_ZN7Hmc5883C2Ehh, @function
_ZN7Hmc5883C2Ehh:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r24
	mov r16,r22
	mov r17,r20
	call _ZN9I2CMasterC1Ev
	std Y+13,__zero_reg__
	ldi r24,lo8(4)
	std Y+14,r24
	ldi r24,lo8(1)
	std Y+15,r24
	std Y+17,__zero_reg__
	std Y+16,__zero_reg__
	std Y+18,__zero_reg__
	std Y+11,r16
	std Y+12,r17
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_ZN7Hmc5883C2Ehh, .-_ZN7Hmc5883C2Ehh
.global	_ZN7Hmc5883C1Ehh
	.set	_ZN7Hmc5883C1Ehh,_ZN7Hmc5883C2Ehh
.global	_ZN7Hmc58834initEv
	.type	_ZN7Hmc58834initEv, @function
_ZN7Hmc58834initEv:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	movw r28,r24
	ldd r24,Y+13
	ldi r20,lo8(32)
	mul r24,r20
	movw r18,r0
	clr __zero_reg__
	ldd r25,Y+14
	ldi r20,lo8(4)
	mul r25,r20
	movw r24,r0
	clr __zero_reg__
	or r24,r18
	ldd r17,Y+18
	or r17,r24
	ldd r22,Y+11
	movw r24,r28
	call _ZN9I2CMaster5startEh
	ldi r22,0
	movw r24,r28
	call _ZN9I2CMaster4sendEh
	mov r22,r17
	movw r24,r28
	call _ZN9I2CMaster4sendEh
	movw r24,r28
	call _ZN9I2CMaster4stopEv
	ldd r22,Y+11
	movw r24,r28
	call _ZN9I2CMaster5startEh
	ldi r22,lo8(1)
	movw r24,r28
	call _ZN9I2CMaster4sendEh
	ldd r22,Y+15
	swap r22
	lsl r22
	andi r22,lo8(-32)
	movw r24,r28
	call _ZN9I2CMaster4sendEh
	movw r24,r28
	call _ZN9I2CMaster4stopEv
	ldd r22,Y+11
	movw r24,r28
	call _ZN9I2CMaster5startEh
	ldi r22,lo8(2)
	movw r24,r28
	call _ZN9I2CMaster4sendEh
	ldd r22,Y+16
	movw r24,r28
	call _ZN9I2CMaster4sendEh
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r17
	jmp _ZN9I2CMaster4stopEv
	.size	_ZN7Hmc58834initEv, .-_ZN7Hmc58834initEv
.global	_ZN7Hmc58839setSampleE14SAMPLE_MEASURE
	.type	_ZN7Hmc58839setSampleE14SAMPLE_MEASURE, @function
_ZN7Hmc58839setSampleE14SAMPLE_MEASURE:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	mov r24,r22
	ldd r22,Y+13
	mov r25,r22
	andi r25,lo8(-97)
	ldi r18,lo8(32)
	mul r24,r18
	movw r22,r0
	clr __zero_reg__
	or r22,r25
	std Y+13,r22
	ldd r22,Y+11
	movw r24,r28
	call _ZN9I2CMaster5startEh
	ldi r22,0
	movw r24,r28
	call _ZN9I2CMaster4sendEh
	ldd r22,Y+13
	movw r24,r28
	call _ZN9I2CMaster4sendEh
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	jmp _ZN9I2CMaster4stopEv
	.size	_ZN7Hmc58839setSampleE14SAMPLE_MEASURE, .-_ZN7Hmc58839setSampleE14SAMPLE_MEASURE
.global	_ZN7Hmc58839getSampleEv
	.type	_ZN7Hmc58839getSampleEv, @function
_ZN7Hmc58839getSampleEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldd r24,Z+13
	ret
	.size	_ZN7Hmc58839getSampleEv, .-_ZN7Hmc58839getSampleEv
.global	_ZN7Hmc588310setOutRateEv
	.type	_ZN7Hmc588310setOutRateEv, @function
_ZN7Hmc588310setOutRateEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_ZN7Hmc588310setOutRateEv, .-_ZN7Hmc588310setOutRateEv
.global	_ZN7Hmc588310getOutRateEv
	.type	_ZN7Hmc588310getOutRateEv, @function
_ZN7Hmc588310getOutRateEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldd r24,Z+14
	ret
	.size	_ZN7Hmc588310getOutRateEv, .-_ZN7Hmc588310getOutRateEv
.global	_ZN7Hmc58837setGainEv
	.type	_ZN7Hmc58837setGainEv, @function
_ZN7Hmc58837setGainEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_ZN7Hmc58837setGainEv, .-_ZN7Hmc58837setGainEv
.global	_ZN7Hmc58837getGainEv
	.type	_ZN7Hmc58837getGainEv, @function
_ZN7Hmc58837getGainEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldd r24,Z+15
	ret
	.size	_ZN7Hmc58837getGainEv, .-_ZN7Hmc58837getGainEv
.global	_ZN7Hmc58839setOpModeEv
	.type	_ZN7Hmc58839setOpModeEv, @function
_ZN7Hmc58839setOpModeEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_ZN7Hmc58839setOpModeEv, .-_ZN7Hmc58839setOpModeEv
.global	_ZN7Hmc58839getOpModeEv
	.type	_ZN7Hmc58839getOpModeEv, @function
_ZN7Hmc58839getOpModeEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldd r24,Z+16
	ldd r25,Z+17
	ret
	.size	_ZN7Hmc58839getOpModeEv, .-_ZN7Hmc58839getOpModeEv
.global	_ZN7Hmc588314setMeasureModeEv
	.type	_ZN7Hmc588314setMeasureModeEv, @function
_ZN7Hmc588314setMeasureModeEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_ZN7Hmc588314setMeasureModeEv, .-_ZN7Hmc588314setMeasureModeEv
.global	_ZN7Hmc588314getMeasureModeEv
	.type	_ZN7Hmc588314getMeasureModeEv, @function
_ZN7Hmc588314getMeasureModeEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldd r24,Z+18
	ret
	.size	_ZN7Hmc588314getMeasureModeEv, .-_ZN7Hmc588314getMeasureModeEv
.global	__floatsisf
.global	__mulsf3
.global	__divsf3
.global	__addsf3
.global	_ZN7Hmc588310getHeadingEv
	.type	_ZN7Hmc588310getHeadingEv, @function
_ZN7Hmc588310getHeadingEv:
	push r8
	push r9
	push r10
	push r11
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	rcall .
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 16 */
.L__stack_usage = 16
	movw r14,r24
	ldi r16,lo8(6)
	ldi r17,0
	movw r18,r28
	subi r18,-1
	sbci r19,-1
	ldi r20,lo8(3)
	movw r30,r24
	ldd r22,Z+11
	call _ZN9I2CMaster7readRegEhhPhj
	ldd r22,Y+1
	ldd r23,Y+2
	eor r23,r22
	eor r22,r23
	eor r23,r22
	movw r30,r14
	std Z+2,r23
	std Z+1,r22
	ldd r24,Y+3
	ldd r25,Y+4
	eor r25,r24
	eor r24,r25
	eor r25,r24
	std Z+6,r25
	std Z+5,r24
	ldd r16,Y+5
	ldd r17,Y+6
	eor r17,r16
	eor r16,r17
	eor r17,r16
	std Z+4,r17
	std Z+3,r16
	mov __tmp_reg__,r23
	lsl r0
	sbc r24,r24
	sbc r25,r25
	call __floatsisf
	movw r8,r22
	movw r10,r24
	movw r22,r16
	lsl r17
	sbc r24,r24
	sbc r25,r25
	call __floatsisf
	movw r20,r10
	movw r18,r8
	call atan2
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(52)
	ldi r21,lo8(67)
	call __mulsf3
	ldi r18,lo8(-37)
	ldi r19,lo8(15)
	ldi r20,lo8(73)
	ldi r21,lo8(64)
	call __divsf3
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(52)
	ldi r21,lo8(67)
	call __addsf3
	movw r30,r14
	std Z+7,r22
	std Z+8,r23
	std Z+9,r24
	std Z+10,r25
/* epilogue start */
	adiw r28,6
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r11
	pop r10
	pop r9
	pop r8
	ret
	.size	_ZN7Hmc588310getHeadingEv, .-_ZN7Hmc588310getHeadingEv
.global	_ZN7Hmc58837getDataEv
	.type	_ZN7Hmc58837getDataEv, @function
_ZN7Hmc58837getDataEv:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r24
	movw r16,r22
	movw r24,r22
	call _ZN7Hmc588310getHeadingEv
	ldi r24,lo8(10)
	movw r30,r16
	adiw r30,1
	movw r26,r28
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_ZN7Hmc58837getDataEv, .-_ZN7Hmc58837getDataEv
	.ident	"GCC: (GNU) 5.4.0"
