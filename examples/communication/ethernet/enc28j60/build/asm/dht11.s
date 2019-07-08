	.file	"dht11.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	_ZN5Dht11C2E3Pin
	.type	_ZN5Dht11C2E3Pin, @function
_ZN5Dht11C2E3Pin:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r26,r24
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
	adiw r26,4+1
	st X,r25
	st -X,r24
	sbiw r26,4
	ldi r25,lo8(14)
	movw r30,r22
	0:
	ld r0,Z+
	st X+,r0
	dec r25
	brne 0b
	ret
	.size	_ZN5Dht11C2E3Pin, .-_ZN5Dht11C2E3Pin
.global	_ZN5Dht11C1E3Pin
	.set	_ZN5Dht11C1E3Pin,_ZN5Dht11C2E3Pin
.global	_ZN5Dht11C2Eh
	.type	_ZN5Dht11C2Eh, @function
_ZN5Dht11C2Eh:
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
/* stack size = 18 */
.L__stack_usage = 18
	movw r16,r24
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
	movw r30,r16
	std Z+5,r25
	std Z+4,r24
	ldi r20,lo8(2)
	movw r24,r28
	adiw r24,1
	call _ZN3PinC1Eh4DDRx
	ldi r24,lo8(14)
	movw r30,r28
	adiw r30,1
	movw r26,r16
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	movw r24,r28
	adiw r24,1
	call _ZN3PinD1Ev
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
	ret
	.size	_ZN5Dht11C2Eh, .-_ZN5Dht11C2Eh
.global	_ZN5Dht11C1Eh
	.set	_ZN5Dht11C1Eh,_ZN5Dht11C2Eh
.global	_ZN5Dht11C2E7dht11_t
	.type	_ZN5Dht11C2E7dht11_t, @function
_ZN5Dht11C2E7dht11_t:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r26,r24
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
	adiw r26,4+1
	st X,r25
	st -X,r24
	sbiw r26,4
	ldi r25,lo8(19)
	movw r30,r22
	0:
	ld r0,Z+
	st X+,r0
	dec r25
	brne 0b
	ret
	.size	_ZN5Dht11C2E7dht11_t, .-_ZN5Dht11C2E7dht11_t
.global	_ZN5Dht11C1E7dht11_t
	.set	_ZN5Dht11C1E7dht11_t,_ZN5Dht11C2E7dht11_t
.global	_ZN5Dht1114getTemperatureEv
	.type	_ZN5Dht1114getTemperatureEv, @function
_ZN5Dht1114getTemperatureEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldd r24,Z+16
	ret
	.size	_ZN5Dht1114getTemperatureEv, .-_ZN5Dht1114getTemperatureEv
.global	_ZN5Dht1111getHumidityEv
	.type	_ZN5Dht1111getHumidityEv, @function
_ZN5Dht1111getHumidityEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldd r24,Z+14
	ret
	.size	_ZN5Dht1111getHumidityEv, .-_ZN5Dht1111getHumidityEv
.global	_ZN5Dht1114startContitionEv
	.type	_ZN5Dht1114startContitionEv, @function
_ZN5Dht1114startContitionEv:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r24
	ldi r22,lo8(2)
	call _ZN3Pin12setDirectionE4DDRx
	movw r24,r28
	call _ZN3Pin3offEv
	ldi r22,lo8(1)
	movw r24,r28
	call _ZN3Pin12setDirectionE4DDRx
	ldi r18,lo8(63999)
	ldi r24,hi8(63999)
	ldi r25,hlo8(63999)
1:	subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
	ldi r22,lo8(2)
	movw r24,r28
	call _ZN3Pin12setDirectionE4DDRx
	ldi r17,lo8(21)
.L8:
	movw r24,r28
	call _ZN3Pin11digitalReadEv
	tst r24
	breq .L7
	ldi r18,lo8(10)
1:	dec r18
	brne 1b
	rjmp .
	subi r17,lo8(-(-1))
	brne .L8
.L11:
	ldi r17,0
	rjmp .L9
.L7:
	ldi r16,lo8(46)
.L12:
	movw r24,r28
	call _ZN3Pin11digitalReadEv
	mov r17,r24
	cpse r24,__zero_reg__
	rjmp .L10
	ldi r24,lo8(10)
1:	dec r24
	brne 1b
	rjmp .
	subi r16,lo8(-(-1))
	brne .L12
	rjmp .L11
.L10:
	ldi r16,lo8(46)
.L13:
	movw r24,r28
	call _ZN3Pin11digitalReadEv
	tst r24
	breq .L9
	ldi r25,lo8(10)
1:	dec r25
	brne 1b
	rjmp .
	subi r16,lo8(-(-1))
	brne .L13
	rjmp .L11
.L9:
	mov r24,r17
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_ZN5Dht1114startContitionEv, .-_ZN5Dht1114startContitionEv
.global	_ZN5Dht117getDataEv
	.type	_ZN5Dht117getDataEv, @function
_ZN5Dht117getDataEv:
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	rcall .
	push __zero_reg__
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 5 */
/* stack size = 23 */
.L__stack_usage = 23
	movw r16,r24
	movw r24,r28
	adiw r24,1
	movw r14,r24
	ldi r24,lo8(5)
	movw r30,r14
	0:
	st Z+,__zero_reg__
	dec r24
	brne 0b
	movw r24,r16
	call _ZN5Dht1114startContitionEv
	cpse r24,__zero_reg__
	rjmp .L26
	ldi r31,lo8(6399999)
	ldi r18,hi8(6399999)
	ldi r24,hlo8(6399999)
1:	subi r31,1
	sbci r18,0
	sbci r24,0
	brne 1b
	rjmp .
	nop
	rjmp .L25
.L26:
	ldi r22,lo8(2)
	movw r24,r16
	call _ZN3Pin12setDirectionE4DDRx
	movw r2,r28
	ldi r25,6
	add r2,r25
	adc r3,__zero_reg__
.L35:
	ldi r24,lo8(7)
	mov r12,r24
	mov r13,__zero_reg__
.L34:
	call _ZN5Timer3nowEv
	movw r4,r22
	movw r6,r24
.L30:
	movw r24,r16
	call _ZN3Pin11digitalReadEv
	cpse r24,__zero_reg__
	rjmp .L28
	call _ZN5Timer3nowEv
	movw r8,r22
	movw r10,r24
	sub r8,r4
	sbc r9,r5
	sbc r10,r6
	sbc r11,r7
	movw r26,r10
	movw r24,r8
	sub r24,r4
	sbc r25,r5
	sbc r26,r6
	sbc r27,r7
	cpi r24,90
	cpc r25,__zero_reg__
	cpc r26,__zero_reg__
	cpc r27,__zero_reg__
	brlo .L30
	rjmp .L25
.L28:
	call _ZN5Timer3nowEv
	movw r4,r22
	movw r6,r24
.L32:
	movw r24,r16
	call _ZN3Pin11digitalReadEv
	tst r24
	breq .L31
	call _ZN5Timer3nowEv
	movw r8,r22
	movw r10,r24
	sub r8,r4
	sbc r9,r5
	sbc r10,r6
	sbc r11,r7
	ldi r30,90
	cp r8,r30
	cpc r9,__zero_reg__
	cpc r10,__zero_reg__
	cpc r11,__zero_reg__
	brlo .L32
	rjmp .L25
.L31:
	ldi r31,20
	cp r8,r31
	cpc r9,__zero_reg__
	cpc r10,__zero_reg__
	cpc r11,__zero_reg__
	brlo .L33
	ldi r24,lo8(1)
	ldi r25,0
	mov r0,r12
	rjmp 2f
	1:
	lsl r24
	2:
	dec r0
	brpl 1b
	com r24
	movw r30,r14
	ld r25,Z
	and r24,r25
	st Z,r24
.L33:
	ldi r31,1
	sub r12,r31
	sbc r13,__zero_reg__
	brcs .+2
	rjmp .L34
	ldi r24,-1
	sub r14,r24
	sbc r15,r24
	cp r14,r2
	cpc r15,r3
	breq .+2
	rjmp .L35
	ldd r24,Y+1
	movw r30,r16
	std Z+14,r24
	ldd r24,Y+2
	std Z+15,r24
	ldd r24,Y+3
	std Z+16,r24
	ldd r24,Y+4
	std Z+17,r24
	ldd r24,Y+5
	std Z+18,r24
.L25:
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	ret
	.size	_ZN5Dht117getDataEv, .-_ZN5Dht117getDataEv
.global	_ZN5Dht118checkCrcEv
	.type	_ZN5Dht118checkCrcEv, @function
_ZN5Dht118checkCrcEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldd r25,Z+14
	ldd r24,Z+15
	add r25,r24
	ldd r24,Z+16
	add r25,r24
	ldd r24,Z+17
	add r25,r24
	ldi r24,lo8(1)
	ldd r18,Z+18
	cpse r25,r18
	ldi r24,0
.L40:
	ret
	.size	_ZN5Dht118checkCrcEv, .-_ZN5Dht118checkCrcEv
	.ident	"GCC: (GNU) 5.4.0"
