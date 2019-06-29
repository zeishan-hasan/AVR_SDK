	.file	"spimaster.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.type	_ZNSt6vectorI3PinSaIS0_EE7reserveEj.part.7, @function
_ZNSt6vectorI3PinSaIS0_EE7reserveEj.part.7:
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
	movw r16,r24
	movw r30,r24
	ld r14,Z
	ldd r15,Z+1
	std Z+3,r23
	std Z+2,r22
	ldi r24,lo8(37)
	mov r31,r24
	mul r31,r22
	movw r24,r0
	mul r31,r23
	add r25,r0
	clr __zero_reg__
	call _Znwj
	movw r30,r16
	std Z+1,r25
	st Z,r24
	movw r28,r14
	mov r12,__zero_reg__
	mov r13,__zero_reg__
.L4:
	movw r30,r16
	ldd r24,Z+4
	ldd r25,Z+5
	cp r12,r24
	cpc r13,r25
	brsh .L2
	ld r26,Z
	ldd r27,Z+1
	movw r24,r28
	sub r24,r14
	sbc r25,r15
	add r26,r24
	adc r27,r25
	sbiw r26,0
	breq .L3
	ldi r24,lo8(37)
	movw r30,r28
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
.L3:
	movw r24,r28
	call _ZN3PinD1Ev
	ldi r31,-1
	sub r12,r31
	sbc r13,r31
	adiw r28,37
	rjmp .L4
.L2:
	movw r24,r14
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	jmp _ZdlPv
	.size	_ZNSt6vectorI3PinSaIS0_EE7reserveEj.part.7, .-_ZNSt6vectorI3PinSaIS0_EE7reserveEj.part.7
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
	ret
	.size	_ZN3PinC2Ev, .-_ZN3PinC2Ev
	.weak	_ZN3PinC1Ev
	.set	_ZN3PinC1Ev,_ZN3PinC2Ev
	.text
.global	_ZN9MasterSPI6enableEv
	.type	_ZN9MasterSPI6enableEv, @function
_ZN9MasterSPI6enableEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	in r24,0x2c
	ori r24,lo8(64)
	out 0x2c,r24
	ret
	.size	_ZN9MasterSPI6enableEv, .-_ZN9MasterSPI6enableEv
.global	_ZN9MasterSPI7disableEv
	.type	_ZN9MasterSPI7disableEv, @function
_ZN9MasterSPI7disableEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	in r24,0x2c
	andi r24,lo8(-65)
	out 0x2c,r24
	ret
	.size	_ZN9MasterSPI7disableEv, .-_ZN9MasterSPI7disableEv
.global	_ZN9MasterSPI8setClockE10SPI_CLKSEL
	.type	_ZN9MasterSPI8setClockE10SPI_CLKSEL, @function
_ZN9MasterSPI8setClockE10SPI_CLKSEL:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	subi r30,-118
	sbci r31,-1
	st Z,r22
	in r24,0x2c
	andi r24,lo8(-4)
	out 0x2c,r24
	in r24,0x2d
	andi r24,lo8(-2)
	out 0x2d,r24
	in r24,0x2d
	ld r18,Z
	bst r18,2
	clr r25
	bld r25,0
	or r25,r24
	out 0x2d,r25
	in r25,0x2c
	ld r24,Z
	andi r24,lo8(3)
	or r24,r25
	out 0x2c,r24
	ret
	.size	_ZN9MasterSPI8setClockE10SPI_CLKSEL, .-_ZN9MasterSPI8setClockE10SPI_CLKSEL
.global	_ZN9MasterSPI8getClockEv
	.type	_ZN9MasterSPI8getClockEv, @function
_ZN9MasterSPI8getClockEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	subi r24,-118
	sbci r25,-1
	movw r30,r24
	ld r24,Z
	ret
	.size	_ZN9MasterSPI8getClockEv, .-_ZN9MasterSPI8getClockEv
.global	_ZN9MasterSPI12setDataOrderE8SPI_DORD
	.type	_ZN9MasterSPI12setDataOrderE8SPI_DORD, @function
_ZN9MasterSPI12setDataOrderE8SPI_DORD:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	subi r30,-119
	sbci r31,-1
	st Z,r22
	in r25,0x2c
	andi r25,lo8(-33)
	out 0x2c,r25
	in r18,0x2c
	ld r25,Z
	ldi r19,lo8(32)
	mul r25,r19
	movw r24,r0
	clr __zero_reg__
	or r24,r18
	out 0x2c,r24
	ret
	.size	_ZN9MasterSPI12setDataOrderE8SPI_DORD, .-_ZN9MasterSPI12setDataOrderE8SPI_DORD
.global	_ZN9MasterSPI12getDataOrderEv
	.type	_ZN9MasterSPI12getDataOrderEv, @function
_ZN9MasterSPI12getDataOrderEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	subi r24,-119
	sbci r25,-1
	movw r30,r24
	ld r24,Z
	ret
	.size	_ZN9MasterSPI12getDataOrderEv, .-_ZN9MasterSPI12getDataOrderEv
.global	_ZN9MasterSPI16setClockPolarityE8SPI_CPOL
	.type	_ZN9MasterSPI16setClockPolarityE8SPI_CPOL, @function
_ZN9MasterSPI16setClockPolarityE8SPI_CPOL:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	subi r30,-120
	sbci r31,-1
	st Z,r22
	in r25,0x2c
	andi r25,lo8(-9)
	out 0x2c,r25
	in r18,0x2c
	ld r25,Z
	ldi r19,lo8(8)
	mul r25,r19
	movw r24,r0
	clr __zero_reg__
	or r24,r18
	out 0x2c,r24
	ret
	.size	_ZN9MasterSPI16setClockPolarityE8SPI_CPOL, .-_ZN9MasterSPI16setClockPolarityE8SPI_CPOL
.global	_ZN9MasterSPI16getClockPolarityEv
	.type	_ZN9MasterSPI16getClockPolarityEv, @function
_ZN9MasterSPI16getClockPolarityEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	subi r24,-120
	sbci r25,-1
	movw r30,r24
	ld r24,Z
	ret
	.size	_ZN9MasterSPI16getClockPolarityEv, .-_ZN9MasterSPI16getClockPolarityEv
.global	_ZN9MasterSPI13setClockPhaseE8SPI_CPHA
	.type	_ZN9MasterSPI13setClockPhaseE8SPI_CPHA, @function
_ZN9MasterSPI13setClockPhaseE8SPI_CPHA:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	subi r30,-121
	sbci r31,-1
	st Z,r22
	in r25,0x2c
	andi r25,lo8(-5)
	out 0x2c,r25
	in r18,0x2c
	ld r25,Z
	ldi r19,lo8(4)
	mul r25,r19
	movw r24,r0
	clr __zero_reg__
	or r24,r18
	out 0x2c,r24
	ret
	.size	_ZN9MasterSPI13setClockPhaseE8SPI_CPHA, .-_ZN9MasterSPI13setClockPhaseE8SPI_CPHA
.global	_ZN9MasterSPI13getClockPhaseEv
	.type	_ZN9MasterSPI13getClockPhaseEv, @function
_ZN9MasterSPI13getClockPhaseEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	subi r24,-121
	sbci r25,-1
	movw r30,r24
	ld r24,Z
	ret
	.size	_ZN9MasterSPI13getClockPhaseEv, .-_ZN9MasterSPI13getClockPhaseEv
.global	_ZN9MasterSPI11enableSlaveEh
	.type	_ZN9MasterSPI11enableSlaveEh, @function
_ZN9MasterSPI11enableSlaveEh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	mov r18,r22
	ldi r19,0
	subi r18,-1
	sbci r19,-1
	movw r30,r24
	subi r30,-115
	sbci r31,-1
	ld r20,Z
	ldd r21,Z+1
	cp r20,r18
	cpc r21,r19
	brlo .L22
	sbiw r30,4
	ld r24,Z
	ldd r25,Z+1
	ldi r18,lo8(37)
	mul r22,r18
	add r24,r0
	adc r25,r1
	clr __zero_reg__
	jmp _ZN3Pin3offEv
.L22:
	ret
	.size	_ZN9MasterSPI11enableSlaveEh, .-_ZN9MasterSPI11enableSlaveEh
.global	_ZN9MasterSPI12disableSlaveEh
	.type	_ZN9MasterSPI12disableSlaveEh, @function
_ZN9MasterSPI12disableSlaveEh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	mov r18,r22
	ldi r19,0
	subi r18,-1
	sbci r19,-1
	movw r30,r24
	subi r30,-115
	sbci r31,-1
	ld r20,Z
	ldd r21,Z+1
	cp r20,r18
	cpc r21,r19
	brlo .L25
	sbiw r30,4
	ld r24,Z
	ldd r25,Z+1
	ldi r18,lo8(37)
	mul r22,r18
	add r24,r0
	adc r25,r1
	clr __zero_reg__
	jmp _ZN3Pin2onEv
.L25:
	ret
	.size	_ZN9MasterSPI12disableSlaveEh, .-_ZN9MasterSPI12disableSlaveEh
.global	_ZN9MasterSPI4sendEh
	.type	_ZN9MasterSPI4sendEh, @function
_ZN9MasterSPI4sendEh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	out 0x2e,r22
.L27:
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L27
/* epilogue start */
	ret
	.size	_ZN9MasterSPI4sendEh, .-_ZN9MasterSPI4sendEh
.global	_ZN9MasterSPI4sendEPhj
	.type	_ZN9MasterSPI4sendEPhj, @function
_ZN9MasterSPI4sendEPhj:
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 7 */
.L__stack_usage = 7
	movw r16,r24
	movw r14,r22
	movw r12,r20
	ldi r28,0
.L31:
	mov r24,r28
	ldi r25,0
	cp r24,r12
	cpc r25,r13
	brsh .L29
	movw r30,r14
	add r30,r24
	adc r31,r25
	ld r22,Z
	movw r24,r16
	call _ZN9MasterSPI4sendEh
	subi r28,lo8(-(1))
	rjmp .L31
.L29:
/* epilogue start */
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	ret
	.size	_ZN9MasterSPI4sendEPhj, .-_ZN9MasterSPI4sendEPhj
.global	_ZN9MasterSPI8transferEh
	.type	_ZN9MasterSPI8transferEh, @function
_ZN9MasterSPI8transferEh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	out 0x2e,r22
.L33:
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L33
	in r24,0x2e
	ret
	.size	_ZN9MasterSPI8transferEh, .-_ZN9MasterSPI8transferEh
.global	_ZN9MasterSPI11sendReceiveEPhS0_j
	.type	_ZN9MasterSPI11sendReceiveEPhS0_j, @function
_ZN9MasterSPI11sendReceiveEPhS0_j:
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
/* prologue: function */
/* frame size = 0 */
/* stack size = 11 */
.L__stack_usage = 11
	movw r16,r24
	movw r10,r22
	movw r14,r20
	movw r12,r18
	mov r9,__zero_reg__
.L37:
	mov r24,r9
	ldi r25,0
	cp r24,r12
	cpc r25,r13
	brsh .L35
	movw r28,r10
	add r28,r24
	adc r29,r25
	movw r30,r14
	add r30,r24
	adc r31,r25
	ld r22,Z
	movw r24,r16
	call _ZN9MasterSPI8transferEh
	st Y,r24
	inc r9
	rjmp .L37
.L35:
/* epilogue start */
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
	ret
	.size	_ZN9MasterSPI11sendReceiveEPhS0_j, .-_ZN9MasterSPI11sendReceiveEPhS0_j
.global	_ZN9MasterSPI7receiveEv
	.type	_ZN9MasterSPI7receiveEv, @function
_ZN9MasterSPI7receiveEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r22,0
	jmp _ZN9MasterSPI8transferEh
	.size	_ZN9MasterSPI7receiveEv, .-_ZN9MasterSPI7receiveEv
.global	_ZN9MasterSPI7receiveEPhj
	.type	_ZN9MasterSPI7receiveEPhj, @function
_ZN9MasterSPI7receiveEPhj:
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 9 */
.L__stack_usage = 9
	movw r14,r24
	movw r12,r22
	movw r10,r20
	ldi r17,0
.L41:
	mov r24,r17
	ldi r25,0
	cp r24,r10
	cpc r25,r11
	brsh .L39
	movw r28,r12
	add r28,r24
	adc r29,r25
	movw r24,r14
	call _ZN9MasterSPI7receiveEv
	st Y,r24
	subi r17,lo8(-(1))
	rjmp .L41
.L39:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	ret
	.size	_ZN9MasterSPI7receiveEPhj, .-_ZN9MasterSPI7receiveEPhj
.global	_ZN9MasterSPI11sendReceiveEh
	.type	_ZN9MasterSPI11sendReceiveEh, @function
_ZN9MasterSPI11sendReceiveEh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp _ZN9MasterSPI8transferEh
	.size	_ZN9MasterSPI11sendReceiveEh, .-_ZN9MasterSPI11sendReceiveEh
.global	_ZN9MasterSPI12slaveIsValidEh
	.type	_ZN9MasterSPI12slaveIsValidEh, @function
_ZN9MasterSPI12slaveIsValidEh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r23,0
	subi r22,-1
	sbci r23,-1
	movw r30,r24
	subi r30,-115
	sbci r31,-1
	ldi r24,lo8(1)
	ld r18,Z
	ldd r19,Z+1
	cp r18,r22
	cpc r19,r23
	brsh .L44
	ldi r24,0
.L44:
	ret
	.size	_ZN9MasterSPI12slaveIsValidEh, .-_ZN9MasterSPI12slaveIsValidEh
.global	_ZN9MasterSPI15isInitilizedSPIEv
	.type	_ZN9MasterSPI15isInitilizedSPIEv, @function
_ZN9MasterSPI15isInitilizedSPIEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	in r24,0x2c
	bst r24,6
	clr r24
	bld r24,0
	ret
	.size	_ZN9MasterSPI15isInitilizedSPIEv, .-_ZN9MasterSPI15isInitilizedSPIEv
.global	_ZN9MasterSPI11getSlavePinEh
	.type	_ZN9MasterSPI11getSlavePinEh, @function
_ZN9MasterSPI11getSlavePinEh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	subi r24,-111
	sbci r25,-1
	movw r30,r24
	ld r24,Z
	ldd r25,Z+1
	ldi r31,lo8(37)
	mul r22,r31
	add r24,r0
	adc r25,r1
	clr __zero_reg__
	jmp _ZN3Pin12getPinNumberEv
	.size	_ZN9MasterSPI11getSlavePinEh, .-_ZN9MasterSPI11getSlavePinEh
	.section	.text._ZNSt6vectorI3PinSaIS0_EE8downsizeEj,"axG",@progbits,_ZNSt6vectorI3PinSaIS0_EE8downsizeEj,comdat
	.weak	_ZNSt6vectorI3PinSaIS0_EE8downsizeEj
	.type	_ZNSt6vectorI3PinSaIS0_EE8downsizeEj, @function
_ZNSt6vectorI3PinSaIS0_EE8downsizeEj:
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
/* prologue: function */
/* frame size = 0 */
/* stack size = 10 */
.L__stack_usage = 10
	movw r30,r24
	ldd r18,Z+4
	ldd r19,Z+5
	cp r22,r18
	cpc r23,r19
	brsh .L47
	movw r12,r22
	movw r28,r24
	ldi r24,lo8(37)
	mul r24,r22
	movw r10,r0
	mul r24,r23
	add r11,r0
	clr __zero_reg__
	movw r14,r22
	ldi r16,0
	ldi r17,0
.L50:
	ldd r24,Y+4
	ldd r25,Y+5
	cp r14,r24
	cpc r15,r25
	brsh .L49
	movw r24,r16
	add r24,r10
	adc r25,r11
	ld r18,Y
	ldd r19,Y+1
	add r24,r18
	adc r25,r19
	call _ZN3PinD1Ev
	ldi r31,-1
	sub r14,r31
	sbc r15,r31
	subi r16,-37
	sbci r17,-1
	rjmp .L50
.L49:
	std Y+5,r13
	std Y+4,r12
.L47:
/* epilogue start */
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
	ret
	.size	_ZNSt6vectorI3PinSaIS0_EE8downsizeEj, .-_ZNSt6vectorI3PinSaIS0_EE8downsizeEj
	.section	.text._ZN9MasterSPI12_masterSPI_tC2Ehhhh,"axG",@progbits,_ZN9MasterSPI12_masterSPI_tC5Ehhhh,comdat
	.weak	_ZN9MasterSPI12_masterSPI_tC2Ehhhh
	.type	_ZN9MasterSPI12_masterSPI_tC2Ehhhh, @function
_ZN9MasterSPI12_masterSPI_tC2Ehhhh:
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
/* stack size = 51 */
.L__stack_usage = 51
	movw r12,r24
	mov r6,r22
	mov r7,r20
	mov r17,r18
	call _ZN3PinC1Ev
	movw r8,r12
	ldi r24,37
	add r8,r24
	adc r9,__zero_reg__
	movw r24,r8
	call _ZN3PinC1Ev
	movw r10,r12
	ldi r30,74
	add r10,r30
	adc r11,__zero_reg__
	movw r24,r10
	call _ZN3PinC1Ev
	movw r14,r12
	ldi r31,111
	add r14,r31
	adc r15,__zero_reg__
	movw r30,r14
	std Z+1,__zero_reg__
	st Z,__zero_reg__
	ldi r24,lo8(8)
	ldi r25,0
	std Z+3,r25
	std Z+2,r24
	std Z+5,__zero_reg__
	std Z+4,__zero_reg__
	ldi r24,lo8(40)
	ldi r25,lo8(1)
	call _Znwj
	movw r30,r14
	std Z+1,r25
	st Z,r24
	adiw r30,7
	ldi r24,lo8(3)
	st Z,r24
	std Z+1,__zero_reg__
	std Z+2,__zero_reg__
	std Z+3,__zero_reg__
	ldi r20,0
	mov r22,r6
	movw r24,r28
	adiw r24,1
	call _ZN3PinC1Eh4DDRx
	ldi r24,lo8(37)
	movw r30,r28
	adiw r30,1
	movw r26,r12
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	movw r24,r28
	adiw r24,1
	call _ZN3PinD1Ev
	ldi r20,lo8(1)
	mov r22,r7
	movw r24,r28
	adiw r24,1
	call _ZN3PinC1Eh4DDRx
	ldi r24,lo8(37)
	movw r30,r28
	adiw r30,1
	movw r26,r8
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	movw r24,r28
	adiw r24,1
	call _ZN3PinD1Ev
	ldi r20,lo8(1)
	mov r22,r17
	movw r24,r28
	adiw r24,1
	call _ZN3PinC1Eh4DDRx
	ldi r24,lo8(37)
	movw r30,r28
	adiw r30,1
	movw r26,r10
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	movw r24,r28
	adiw r24,1
	call _ZN3PinD1Ev
	ldi r20,lo8(1)
	mov r22,r16
	movw r24,r28
	adiw r24,1
	call _ZN3PinC1Eh4DDRx
	movw r30,r12
	subi r30,-115
	sbci r31,-1
	ld r22,Z
	ldd r23,Z+1
	movw r12,r22
	ldi r31,-1
	sub r12,r31
	sbc r13,r31
	cp r22,r12
	cpc r23,r13
	brsh .L52
	movw r30,r14
	ldd r24,Z+2
	ldd r25,Z+3
	cp r24,r12
	cpc r25,r13
	brsh .L53
	subi r22,-9
	sbci r23,-1
	cp r24,r22
	cpc r25,r23
	brsh .L53
	movw r24,r14
	call _ZNSt6vectorI3PinSaIS0_EE7reserveEj.part.7
.L53:
	movw r30,r14
	ldd r18,Z+4
	ldd r19,Z+5
	ldi r24,lo8(37)
	mul r24,r18
	movw r22,r0
	mul r24,r19
	add r23,r0
	clr __zero_reg__
	ldi r20,0
	ldi r21,0
.L56:
	movw r30,r14
	cp r18,r12
	cpc r19,r13
	brsh .L54
	ld r26,Z
	ldd r27,Z+1
	movw r24,r20
	add r24,r22
	adc r25,r23
	add r26,r24
	adc r27,r25
	sbiw r26,0
	breq .L55
	ldi r24,lo8(37)
	movw r30,r28
	adiw r30,1
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
.L55:
	subi r18,-1
	sbci r19,-1
	subi r20,-37
	sbci r21,-1
	rjmp .L56
.L54:
	std Z+5,r13
	std Z+4,r12
	rjmp .L57
.L52:
	movw r22,r12
	movw r24,r14
	call _ZNSt6vectorI3PinSaIS0_EE8downsizeEj
.L57:
	movw r24,r28
	adiw r24,1
	call _ZN3PinD1Ev
	movw r30,r14
	ldd r18,Z+4
	ldd r19,Z+5
	ldi r20,lo8(37)
	mul r20,r18
	movw r24,r0
	mul r20,r19
	add r25,r0
	clr __zero_reg__
	ld r18,Z
	ldd r19,Z+1
	add r24,r18
	adc r25,r19
	call _ZN3Pin2onEv
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
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop r7
	pop r6
	ret
	.size	_ZN9MasterSPI12_masterSPI_tC2Ehhhh, .-_ZN9MasterSPI12_masterSPI_tC2Ehhhh
	.weak	_ZN9MasterSPI12_masterSPI_tC1Ehhhh
	.set	_ZN9MasterSPI12_masterSPI_tC1Ehhhh,_ZN9MasterSPI12_masterSPI_tC2Ehhhh
	.text
.global	_ZN9MasterSPIC2Ev
	.type	_ZN9MasterSPIC2Ev, @function
_ZN9MasterSPIC2Ev:
	push r16
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	ldi r16,lo8(-1)
	ldi r18,lo8(-1)
	ldi r20,lo8(-1)
	ldi r22,lo8(-1)
	call _ZN9MasterSPI12_masterSPI_tC1Ehhhh
/* epilogue start */
	pop r16
	ret
	.size	_ZN9MasterSPIC2Ev, .-_ZN9MasterSPIC2Ev
.global	_ZN9MasterSPIC1Ev
	.set	_ZN9MasterSPIC1Ev,_ZN9MasterSPIC2Ev
.global	_ZN9MasterSPIC2Ehhhh
	.type	_ZN9MasterSPIC2Ehhhh, @function
_ZN9MasterSPIC2Ehhhh:
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
	in r28,__SP_L__
	in r29,__SP_H__
	subi r28,122
	sbc r29,__zero_reg__
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 122 */
/* stack size = 132 */
.L__stack_usage = 132
	movw r14,r24
	mov r17,r22
	mov r13,r20
	mov r12,r18
	mov r11,r16
	ldi r16,lo8(-1)
	ldi r18,lo8(-1)
	ldi r20,lo8(-1)
	ldi r22,lo8(-1)
	call _ZN9MasterSPI12_masterSPI_tC1Ehhhh
	mov r16,r11
	mov r18,r12
	mov r20,r13
	mov r22,r17
	movw r24,r28
	adiw r24,1
	call _ZN9MasterSPI12_masterSPI_tC1Ehhhh
	ldi r24,lo8(37)
	movw r30,r28
	adiw r30,1
	movw r26,r14
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	ldi r24,lo8(37)
	movw r30,r28
	adiw r30,38
	movw r26,r14
	adiw r26,37
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	movw r26,r14
	subi r26,-74
	sbci r27,-1
	ldi r24,lo8(37)
	movw r30,r28
	subi r30,-75
	sbci r31,-1
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	movw r16,r14
	subi r16,-111
	sbci r17,-1
	adiw r28,116-62
	ldd r22,Y+62
	ldd r23,Y+63
	sbiw r28,116-62
	movw r26,r16
	adiw r26,2
	ld r24,X+
	ld r25,X
	sbiw r26,2+1
	cp r24,r22
	cpc r25,r23
	brsh .L63
	movw r24,r16
	call _ZNSt6vectorI3PinSaIS0_EE7reserveEj.part.7
.L63:
	adiw r28,116-62
	ldd r24,Y+62
	ldd r25,Y+63
	sbiw r28,116-62
	movw r30,r16
	ldd r20,Z+4
	ldd r21,Z+5
	cp r24,r20
	cpc r25,r21
	brsh .L64
	movw r20,r24
.L64:
	ldi r24,0
	ldi r25,0
	ldi r18,0
	ldi r19,0
.L66:
	cp r18,r20
	cpc r19,r21
	breq .L65
	movw r30,r16
	ld r26,Z
	ldd r27,Z+1
	add r26,r24
	adc r27,r25
	adiw r28,112-62
	ldd r30,Y+62
	ldd r31,Y+63
	sbiw r28,112-62
	add r30,r24
	adc r31,r25
	ldi r22,lo8(37)
	0:
	ld r0,Z+
	st X+,r0
	dec r22
	brne 0b
	subi r18,-1
	sbci r19,-1
	adiw r24,37
	rjmp .L66
.L65:
	movw r26,r16
	adiw r26,4
	ld r18,X+
	ld r19,X
	sbiw r26,4+1
	adiw r28,116-62
	ldd r24,Y+62
	ldd r25,Y+63
	sbiw r28,116-62
	cp r18,r24
	cpc r19,r25
	brsh .L67
	ldi r24,lo8(37)
	mul r24,r18
	movw r22,r0
	mul r24,r19
	add r23,r0
	clr __zero_reg__
	ldi r20,0
	ldi r21,0
.L69:
	adiw r28,116-62
	ldd r24,Y+62
	ldd r25,Y+63
	sbiw r28,116-62
	cp r18,r24
	cpc r19,r25
	brsh .L67
	adiw r28,112-62
	ldd r30,Y+62
	ldd r31,Y+63
	sbiw r28,112-62
	movw r24,r22
	add r24,r20
	adc r25,r21
	add r30,r24
	adc r31,r25
	movw r26,r16
	ld r12,X+
	ld r13,X
	movw r26,r12
	add r26,r24
	adc r27,r25
	sbiw r26,0
	breq .L68
	ldi r24,lo8(37)
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
.L68:
	movw r30,r16
	ldd r24,Z+4
	ldd r25,Z+5
	adiw r24,1
	std Z+5,r25
	std Z+4,r24
	subi r18,-1
	sbci r19,-1
	subi r20,-37
	sbci r21,-1
	rjmp .L69
.L67:
	adiw r28,116-62
	ldd r22,Y+62
	ldd r23,Y+63
	sbiw r28,116-62
	movw r26,r16
	adiw r26,4
	ld r24,X+
	ld r25,X
	sbiw r26,4+1
	cp r22,r24
	cpc r23,r25
	brsh .L70
	movw r24,r16
	call _ZNSt6vectorI3PinSaIS0_EE8downsizeEj
.L70:
	movw r10,r14
	ldi r27,118
	add r10,r27
	adc r11,__zero_reg__
	adiw r28,119-60
	ldd r24,Y+60
	ldd r25,Y+61
	ldd r26,Y+62
	ldd r27,Y+63
	sbiw r28,119-60
	movw r30,r10
	st Z,r24
	std Z+1,r25
	std Z+2,r26
	std Z+3,r27
	ldi r16,0
	ldi r17,0
	mov r12,__zero_reg__
	mov r13,__zero_reg__
.L72:
	adiw r28,116-62
	ldd r24,Y+62
	ldd r25,Y+63
	sbiw r28,116-62
	cp r12,r24
	cpc r13,r25
	brsh .L71
	adiw r28,112-62
	ldd r24,Y+62
	ldd r25,Y+63
	sbiw r28,112-62
	add r24,r16
	adc r25,r17
	call _ZN3PinD1Ev
	ldi r31,-1
	sub r12,r31
	sbc r13,r31
	subi r16,-37
	sbci r17,-1
	rjmp .L72
.L71:
	adiw r28,112-62
	ldd r24,Y+62
	ldd r25,Y+63
	sbiw r28,112-62
	call _ZdlPv
	movw r24,r28
	subi r24,-75
	sbci r25,-1
	call _ZN3PinD1Ev
	movw r24,r28
	adiw r24,38
	call _ZN3PinD1Ev
	movw r24,r28
	adiw r24,1
	call _ZN3PinD1Ev
	movw r30,r14
	subi r30,-121
	sbci r31,-1
	ld r22,Z
	movw r24,r14
	call _ZN9MasterSPI13setClockPhaseE8SPI_CPHA
	movw r30,r14
	subi r30,-120
	sbci r31,-1
	ld r22,Z
	movw r24,r14
	call _ZN9MasterSPI16setClockPolarityE8SPI_CPOL
	movw r26,r10
	ld r22,X
	movw r24,r14
	call _ZN9MasterSPI8setClockE10SPI_CLKSEL
	movw r30,r14
	subi r30,-119
	sbci r31,-1
	ld r22,Z
	movw r24,r14
	call _ZN9MasterSPI12setDataOrderE8SPI_DORD
	in r24,0x2c
	ori r24,lo8(16)
	out 0x2c,r24
	movw r24,r14
	call _ZN9MasterSPI6enableEv
/* epilogue start */
	subi r28,-122
	sbci r29,-1
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
	ret
	.size	_ZN9MasterSPIC2Ehhhh, .-_ZN9MasterSPIC2Ehhhh
.global	_ZN9MasterSPIC1Ehhhh
	.set	_ZN9MasterSPIC1Ehhhh,_ZN9MasterSPIC2Ehhhh
	.ident	"GCC: (GNU) 5.4.0"
