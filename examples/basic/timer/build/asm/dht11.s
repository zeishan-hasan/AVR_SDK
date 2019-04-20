	.file	"dht11.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.section	.text._ZN3PinC2Ev,"axG",@progbits,_ZN3PinC5Ev,comdat
	.weak	_ZN3PinC2Ev
	.type	_ZN3PinC2Ev, @function
_ZN3PinC2Ev:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
	std Z+7,r25
	std Z+6,r24
	ldi r24,lo8(-1)
	ldi r25,0
	std Z+11,r25
	std Z+10,r24
	std Z+13,r25
	std Z+12,r24
	std Z+15,r25
	std Z+14,r24
	std Z+17,r25
	std Z+16,r24
	std Z+19,r25
	std Z+18,r24
	std Z+21,r25
	std Z+20,r24
	std Z+23,r25
	std Z+22,r24
	std Z+25,r25
	std Z+24,r24
	std Z+27,r25
	std Z+26,r24
	std Z+29,r25
	std Z+28,r24
/* epilogue start */
	ret
	.size	_ZN3PinC2Ev, .-_ZN3PinC2Ev
	.weak	_ZN3PinC1Ev
	.set	_ZN3PinC1Ev,_ZN3PinC2Ev
	.text
.global	_ZN5Dht11C2E3Pin
	.type	_ZN5Dht11C2E3Pin, @function
_ZN5Dht11C2E3Pin:
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
	call _ZN3PinC1Ev
	ldi r24,lo8(37)
	movw r30,r16
	movw r26,r28
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_ZN5Dht11C2E3Pin, .-_ZN5Dht11C2E3Pin
.global	_ZN5Dht11C1E3Pin
	.set	_ZN5Dht11C1E3Pin,_ZN5Dht11C2E3Pin
.global	_ZN5Dht11C2Eh
	.type	_ZN5Dht11C2Eh, @function
_ZN5Dht11C2Eh:
	push r15
	push r16
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,37
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 37 */
/* stack size = 42 */
.L__stack_usage = 42
	movw r16,r24
	mov r15,r22
	call _ZN3PinC1Ev
	ldi r20,lo8(2)
	mov r22,r15
	movw r24,r28
	adiw r24,1
	call _ZN3PinC1Eh4DDRx
	ldi r24,lo8(37)
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
	adiw r28,37
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
	ret
	.size	_ZN5Dht11C2Eh, .-_ZN5Dht11C2Eh
.global	_ZN5Dht11C1Eh
	.set	_ZN5Dht11C1Eh,_ZN5Dht11C2Eh
.global	_ZN5Dht11C2E7dht11_t
	.type	_ZN5Dht11C2E7dht11_t, @function
_ZN5Dht11C2E7dht11_t:
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
	call _ZN3PinC1Ev
	ldi r24,lo8(42)
	movw r30,r16
	movw r26,r28
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
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
	ldd r24,Z+39
/* epilogue start */
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
	ldd r24,Z+37
/* epilogue start */
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
.L10:
	movw r24,r28
	call _ZN3Pin11digitalReadEv
	tst r24
	breq .L13
	ldi r18,lo8(10)
1:	dec r18
	brne 1b
	rjmp .
	subi r17,lo8(-(-1))
	brne .L10
.L9:
	ldi r17,0
.L7:
	mov r24,r17
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
.L13:
	ldi r16,lo8(46)
.L8:
	movw r24,r28
	call _ZN3Pin11digitalReadEv
	mov r17,r24
	cpse r24,__zero_reg__
	rjmp .L14
	ldi r24,lo8(10)
1:	dec r24
	brne 1b
	rjmp .
	subi r16,lo8(-(-1))
	brne .L8
	rjmp .L9
.L14:
	ldi r16,lo8(46)
.L11:
	movw r24,r28
	call _ZN3Pin11digitalReadEv
	tst r24
	breq .L7
	ldi r25,lo8(10)
1:	dec r25
	brne 1b
	rjmp .
	subi r16,lo8(-(-1))
	brne .L11
	rjmp .L9
	.size	_ZN5Dht1114startContitionEv, .-_ZN5Dht1114startContitionEv
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Alluppatoo LOW\r\n"
.LC1:
	.string	"Alluppatoo\r\n"
.LC2:
	.string	"T high %d\r\n"
.LC3:
	.string	"%d\r\n"
	.text
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
	rcall .
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 7 */
/* stack size = 25 */
.L__stack_usage = 25
	movw r16,r24
	lds r24,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+2
	lds r25,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+2+1
	or r24,r25
	brne .L26
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
.L26:
	lds r2,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+2
	lds r3,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+3
	movw r24,r28
	adiw r24,1
	movw r8,r24
	ldi r24,lo8(5)
	movw r30,r8
	0:
	st Z+,__zero_reg__
	dec r24
	brne 0b
	movw r24,r16
	call _ZN5Dht1114startContitionEv
	cpse r24,__zero_reg__
	rjmp .L27
	ldi r31,lo8(6399999)
	ldi r18,hi8(6399999)
	ldi r24,hlo8(6399999)
1:	subi r31,1
	sbci r18,0
	sbci r24,0
	brne 1b
	rjmp .
	nop
.L25:
/* epilogue start */
	adiw r28,7
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
.L27:
	ldi r22,lo8(2)
	movw r24,r16
	call _ZN3Pin12setDirectionE4DDRx
	movw r30,r28
	adiw r30,6
	std Y+7,r31
	std Y+6,r30
.L35:
	ldi r24,lo8(7)
	mov r10,r24
	mov r11,__zero_reg__
.L34:
	call _ZN5Timer3nowEv
	movw r4,r22
	movw r6,r24
.L30:
	movw r24,r16
	call _ZN3Pin11digitalReadEv
	cpse r24,__zero_reg__
	rjmp .L29
	call _ZN5Timer3nowEv
	movw r12,r22
	movw r14,r24
	sub r12,r4
	sbc r13,r5
	sbc r14,r6
	sbc r15,r7
	movw r26,r14
	movw r24,r12
	sub r24,r4
	sbc r25,r5
	sbc r26,r6
	sbc r27,r7
	cpi r24,90
	cpc r25,__zero_reg__
	cpc r26,__zero_reg__
	cpc r27,__zero_reg__
	brlo .L30
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
.L41:
	push r25
	push r24
	push r3
	push r2
	call _ZN6Serial6printfEPKcz
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	rjmp .L25
.L29:
	call _ZN5Timer3nowEv
	movw r4,r22
	movw r6,r24
.L32:
	movw r24,r16
	call _ZN3Pin11digitalReadEv
	tst r24
	breq .L31
	call _ZN5Timer3nowEv
	movw r12,r22
	movw r14,r24
	sub r12,r4
	sbc r13,r5
	sbc r14,r6
	sbc r15,r7
	ldi r31,90
	cp r12,r31
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brlo .L32
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	rjmp .L41
.L31:
	push r15
	push r14
	push r13
	push r12
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	push r25
	push r24
	push r3
	push r2
	call _ZN6Serial6printfEPKcz
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	ldi r25,20
	cp r12,r25
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brlo .L33
	ldi r24,lo8(1)
	ldi r25,0
	mov r0,r10
	rjmp 2f
	1:
	lsl r24
	2:
	dec r0
	brpl 1b
	mov r25,r24
	com r25
	movw r30,r8
	ld r24,Z
	and r24,r25
	st Z,r24
.L33:
	ldi r31,1
	sub r10,r31
	sbc r11,__zero_reg__
	brcs .+2
	rjmp .L34
	movw r30,r8
	ld r24,Z+
	movw r8,r30
	push __zero_reg__
	push r24
	ldi r24,lo8(.LC3)
	ldi r25,hi8(.LC3)
	push r25
	push r24
	push r3
	push r2
	call _ZN6Serial6printfEPKcz
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	ldd r24,Y+6
	ldd r25,Y+7
	cp r24,r8
	cpc r25,r9
	breq .+2
	rjmp .L35
	ldd r24,Y+1
	movw r30,r16
	std Z+37,r24
	ldd r24,Y+2
	std Z+38,r24
	ldd r24,Y+3
	std Z+39,r24
	ldd r24,Y+4
	std Z+40,r24
	ldd r24,Y+5
	std Z+41,r24
	rjmp .L25
	.size	_ZN5Dht117getDataEv, .-_ZN5Dht117getDataEv
.global	_ZN5Dht118checkCrcEv
	.type	_ZN5Dht118checkCrcEv, @function
_ZN5Dht118checkCrcEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldd r25,Z+37
	ldd r24,Z+38
	add r25,r24
	ldd r24,Z+39
	add r25,r24
	ldd r24,Z+40
	add r25,r24
	ldi r24,lo8(1)
	ldd r18,Z+41
	cpse r25,r18
	ldi r24,0
.L43:
/* epilogue start */
	ret
	.size	_ZN5Dht118checkCrcEv, .-_ZN5Dht118checkCrcEv
	.weak	_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	.section	.bss._ZZN13SerialManager11getInstanceE10SerialPortE8instance,"awG",@nobits,_ZZN13SerialManager11getInstanceE10SerialPortE8instance,comdat
	.type	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, @object
	.size	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, 8
_ZZN13SerialManager11getInstanceE10SerialPortE8instance:
	.zero	8
	.ident	"GCC: (GNU) 8.2.0"
.global __do_copy_data
.global __do_clear_bss
