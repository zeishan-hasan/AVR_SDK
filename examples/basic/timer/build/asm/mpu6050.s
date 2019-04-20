	.file	"mpu6050.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	_ZN7Mpu6050C2E7slave_t
	.type	_ZN7Mpu6050C2E7slave_t, @function
_ZN7Mpu6050C2E7slave_t:
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
	call _ZN9I2CMasterC1Ev
	std Y+4,__zero_reg__
	std Y+3,__zero_reg__
	std Y+6,__zero_reg__
	std Y+5,__zero_reg__
	std Y+8,__zero_reg__
	std Y+7,__zero_reg__
	std Y+10,__zero_reg__
	std Y+9,__zero_reg__
	std Y+12,__zero_reg__
	std Y+11,__zero_reg__
	std Y+14,__zero_reg__
	std Y+13,__zero_reg__
	std Y+16,__zero_reg__
	std Y+15,__zero_reg__
	std Y+17,__zero_reg__
	std Y+18,__zero_reg__
	std Y+2,r17
	std Y+1,r16
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_ZN7Mpu6050C2E7slave_t, .-_ZN7Mpu6050C2E7slave_t
.global	_ZN7Mpu6050C1E7slave_t
	.set	_ZN7Mpu6050C1E7slave_t,_ZN7Mpu6050C2E7slave_t
.global	_ZN7Mpu6050C2Ehh
	.type	_ZN7Mpu6050C2Ehh, @function
_ZN7Mpu6050C2Ehh:
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
	std Y+4,__zero_reg__
	std Y+3,__zero_reg__
	std Y+6,__zero_reg__
	std Y+5,__zero_reg__
	std Y+8,__zero_reg__
	std Y+7,__zero_reg__
	std Y+10,__zero_reg__
	std Y+9,__zero_reg__
	std Y+12,__zero_reg__
	std Y+11,__zero_reg__
	std Y+14,__zero_reg__
	std Y+13,__zero_reg__
	std Y+16,__zero_reg__
	std Y+15,__zero_reg__
	std Y+17,__zero_reg__
	std Y+18,__zero_reg__
	std Y+1,r16
	std Y+2,r17
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_ZN7Mpu6050C2Ehh, .-_ZN7Mpu6050C2Ehh
.global	_ZN7Mpu6050C1Ehh
	.set	_ZN7Mpu6050C1Ehh,_ZN7Mpu6050C2Ehh
.global	_ZN7Mpu60506wakeUpEv
	.type	_ZN7Mpu60506wakeUpEv, @function
_ZN7Mpu60506wakeUpEv:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	ldd r22,Y+1
	call _ZN9I2CMaster5startEh
	ldi r22,lo8(107)
	movw r24,r28
	call _ZN9I2CMaster4sendEh
	ldi r22,0
	movw r24,r28
	call _ZN9I2CMaster4sendEh
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	jmp _ZN9I2CMaster4stopEv
	.size	_ZN7Mpu60506wakeUpEv, .-_ZN7Mpu60506wakeUpEv
.global	_ZN7Mpu60505sleepEv
	.type	_ZN7Mpu60505sleepEv, @function
_ZN7Mpu60505sleepEv:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	ldd r22,Y+1
	call _ZN9I2CMaster5startEh
	ldi r22,lo8(107)
	movw r24,r28
	call _ZN9I2CMaster4sendEh
	ldd r22,Y+2
	movw r24,r28
	call _ZN9I2CMaster7receiveEh
	mov r22,r24
	ori r22,lo8(64)
	movw r24,r28
	call _ZN9I2CMaster4sendEh
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	jmp _ZN9I2CMaster4stopEv
	.size	_ZN7Mpu60505sleepEv, .-_ZN7Mpu60505sleepEv
.global	_ZN7Mpu605010getRawDataEv
	.type	_ZN7Mpu605010getRawDataEv, @function
_ZN7Mpu605010getRawDataEv:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r16,r24
	movw r28,r22
	ldd r22,Y+1
	movw r24,r28
	call _ZN9I2CMaster5startEh
	ldi r22,lo8(59)
	movw r24,r28
	call _ZN9I2CMaster4sendEh
	ldd r22,Y+2
	movw r24,r28
	call _ZN9I2CMaster5startEh
	movw r24,r28
	call _ZN9I2CMaster12read_sendAckEv
	std Y+4,r24
	movw r24,r28
	call _ZN9I2CMaster12read_sendAckEv
	std Y+3,r24
	movw r24,r28
	call _ZN9I2CMaster12read_sendAckEv
	std Y+6,r24
	movw r24,r28
	call _ZN9I2CMaster12read_sendAckEv
	std Y+5,r24
	movw r24,r28
	call _ZN9I2CMaster12read_sendAckEv
	std Y+8,r24
	movw r24,r28
	call _ZN9I2CMaster12read_sendAckEv
	std Y+7,r24
	movw r24,r28
	call _ZN9I2CMaster12read_sendAckEv
	std Y+10,r24
	movw r24,r28
	call _ZN9I2CMaster12read_sendAckEv
	std Y+9,r24
	movw r24,r28
	call _ZN9I2CMaster12read_sendAckEv
	std Y+12,r24
	movw r24,r28
	call _ZN9I2CMaster12read_sendAckEv
	std Y+11,r24
	movw r24,r28
	call _ZN9I2CMaster12read_sendAckEv
	std Y+14,r24
	movw r24,r28
	call _ZN9I2CMaster12read_sendAckEv
	std Y+13,r24
	movw r24,r28
	call _ZN9I2CMaster12read_sendAckEv
	std Y+16,r24
	movw r24,r28
	call _ZN9I2CMaster13read_sendNackEv
	std Y+15,r24
	ldi r24,lo8(14)
	movw r30,r28
	adiw r30,3
	movw r26,r16
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	movw r24,r16
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_ZN7Mpu605010getRawDataEv, .-_ZN7Mpu605010getRawDataEv
.global	__floatsisf
.global	__mulsf3
.global	__divsf3
.global	__addsf3
.global	_ZN7Mpu605012getDataFixedE10TEMP_UNITS
	.type	_ZN7Mpu605012getDataFixedE10TEMP_UNITS, @function
_ZN7Mpu605012getDataFixedE10TEMP_UNITS:
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,14
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 14 */
/* stack size = 21 */
.L__stack_usage = 21
	movw r16,r24
	movw r14,r22
	mov r13,r20
	movw r24,r28
	adiw r24,1
	call _ZN7Mpu605010getRawDataEv
	movw r30,r14
	ldd r22,Z+3
	ldd r23,Z+4
	mov __tmp_reg__,r23
	lsl r0
	sbc r24,r24
	sbc r25,r25
	call __floatsisf
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(-128)
	ldi r21,lo8(56)
	call __mulsf3
	movw r30,r16
	st Z,r22
	std Z+1,r23
	std Z+2,r24
	std Z+3,r25
	movw r30,r14
	ldd r22,Z+5
	ldd r23,Z+6
	mov __tmp_reg__,r23
	lsl r0
	sbc r24,r24
	sbc r25,r25
	call __floatsisf
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(-128)
	ldi r21,lo8(56)
	call __mulsf3
	movw r30,r16
	std Z+4,r22
	std Z+5,r23
	std Z+6,r24
	std Z+7,r25
	movw r30,r14
	ldd r22,Z+7
	ldd r23,Z+8
	mov __tmp_reg__,r23
	lsl r0
	sbc r24,r24
	sbc r25,r25
	call __floatsisf
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(-128)
	ldi r21,lo8(56)
	call __mulsf3
	movw r30,r16
	std Z+8,r22
	std Z+9,r23
	std Z+10,r24
	std Z+11,r25
	movw r30,r14
	ldd r22,Z+11
	ldd r23,Z+12
	mov __tmp_reg__,r23
	lsl r0
	sbc r24,r24
	sbc r25,r25
	call __floatsisf
	ldi r18,lo8(-51)
	ldi r19,lo8(-52)
	ldi r20,lo8(28)
	ldi r21,lo8(66)
	call __mulsf3
	ldi r18,0
	ldi r19,lo8(-1)
	ldi r20,lo8(127)
	ldi r21,lo8(71)
	call __divsf3
	movw r30,r16
	std Z+16,r22
	std Z+17,r23
	std Z+18,r24
	std Z+19,r25
	movw r30,r14
	ldd r22,Z+13
	ldd r23,Z+14
	mov __tmp_reg__,r23
	lsl r0
	sbc r24,r24
	sbc r25,r25
	call __floatsisf
	ldi r18,lo8(-51)
	ldi r19,lo8(-52)
	ldi r20,lo8(28)
	ldi r21,lo8(66)
	call __mulsf3
	ldi r18,0
	ldi r19,lo8(-1)
	ldi r20,lo8(127)
	ldi r21,lo8(71)
	call __divsf3
	movw r30,r16
	std Z+20,r22
	std Z+21,r23
	std Z+22,r24
	std Z+23,r25
	movw r30,r14
	ldd r22,Z+15
	ldd r23,Z+16
	mov __tmp_reg__,r23
	lsl r0
	sbc r24,r24
	sbc r25,r25
	call __floatsisf
	ldi r18,lo8(-51)
	ldi r19,lo8(-52)
	ldi r20,lo8(28)
	ldi r21,lo8(66)
	call __mulsf3
	ldi r18,0
	ldi r19,lo8(-1)
	ldi r20,lo8(127)
	ldi r21,lo8(71)
	call __divsf3
	movw r30,r16
	std Z+24,r22
	std Z+25,r23
	std Z+26,r24
	std Z+27,r25
	movw r30,r14
	ldd r22,Z+9
	ldd r23,Z+10
	mov __tmp_reg__,r23
	lsl r0
	sbc r24,r24
	sbc r25,r25
	call __floatsisf
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(-86)
	ldi r21,lo8(67)
	call __divsf3
	ldi r18,lo8(-72)
	ldi r19,lo8(30)
	ldi r20,lo8(18)
	ldi r21,lo8(66)
	call __addsf3
	ldi r31,lo8(1)
	cp r13,r31
	breq .L7
	tst r13
	breq .L11
	ldi r18,lo8(2)
	cp r13,r18
	breq .L9
.L6:
	movw r24,r16
/* epilogue start */
	adiw r28,14
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
	pop r13
	ret
.L7:
	ldi r18,lo8(102)
	ldi r19,lo8(102)
	ldi r20,lo8(-26)
	ldi r21,lo8(63)
	call __mulsf3
	ldi r18,0
	ldi r19,0
	ldi r20,0
	ldi r21,lo8(66)
.L12:
	call __addsf3
.L11:
	movw r30,r16
	std Z+12,r22
	std Z+13,r23
	std Z+14,r24
	std Z+15,r25
	rjmp .L6
.L9:
	ldi r18,lo8(51)
	ldi r19,lo8(-109)
	ldi r20,lo8(-120)
	ldi r21,lo8(67)
	rjmp .L12
	.size	_ZN7Mpu605012getDataFixedE10TEMP_UNITS, .-_ZN7Mpu605012getDataFixedE10TEMP_UNITS
.global	_ZN7Mpu605013setAccelRangeE11ACCEL_RANGE
	.type	_ZN7Mpu605013setAccelRangeE11ACCEL_RANGE, @function
_ZN7Mpu605013setAccelRangeE11ACCEL_RANGE:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	lsl r22
	lsl r22
	lsl r22
	std Y+17,r22
	ldd r22,Y+1
	call _ZN9I2CMaster5startEh
	ldi r22,lo8(28)
	movw r24,r28
	call _ZN9I2CMaster4sendEh
	ldd r22,Y+17
	movw r24,r28
	call _ZN9I2CMaster4sendEh
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	jmp _ZN9I2CMaster4stopEv
	.size	_ZN7Mpu605013setAccelRangeE11ACCEL_RANGE, .-_ZN7Mpu605013setAccelRangeE11ACCEL_RANGE
.global	_ZN7Mpu605013getAccelRangeEv
	.type	_ZN7Mpu605013getAccelRangeEv, @function
_ZN7Mpu605013getAccelRangeEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldd r24,Z+17
/* epilogue start */
	ret
	.size	_ZN7Mpu605013getAccelRangeEv, .-_ZN7Mpu605013getAccelRangeEv
.global	_ZN7Mpu605012setGyroRangeE10GYRO_RANGE
	.type	_ZN7Mpu605012setGyroRangeE10GYRO_RANGE, @function
_ZN7Mpu605012setGyroRangeE10GYRO_RANGE:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	lsl r22
	lsl r22
	lsl r22
	std Y+18,r22
	ldd r22,Y+1
	call _ZN9I2CMaster5startEh
	ldi r22,lo8(27)
	movw r24,r28
	call _ZN9I2CMaster4sendEh
	ldd r22,Y+18
	movw r24,r28
	call _ZN9I2CMaster4sendEh
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	jmp _ZN9I2CMaster4stopEv
	.size	_ZN7Mpu605012setGyroRangeE10GYRO_RANGE, .-_ZN7Mpu605012setGyroRangeE10GYRO_RANGE
.global	_ZN7Mpu605012getGyroRangeEv
	.type	_ZN7Mpu605012getGyroRangeEv, @function
_ZN7Mpu605012getGyroRangeEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldd r24,Z+18
/* epilogue start */
	ret
	.size	_ZN7Mpu605012getGyroRangeEv, .-_ZN7Mpu605012getGyroRangeEv
	.ident	"GCC: (GNU) 8.2.0"
