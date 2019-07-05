	.file	"spimaster.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
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
	ldi r24,lo8(12)
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
	ldi r24,lo8(12)
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
	adiw r28,12
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
	std Z+43,r22
	in r24,0x2c
	andi r24,lo8(-4)
	out 0x2c,r24
	in r24,0x2d
	andi r24,lo8(-2)
	out 0x2d,r24
	in r24,0x2d
	ldd r18,Z+43
	bst r18,2
	clr r25
	bld r25,0
	or r25,r24
	out 0x2d,r25
	in r25,0x2c
	ldd r24,Z+43
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
	movw r30,r24
	ldd r24,Z+43
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
	std Z+44,r22
	in r25,0x2c
	andi r25,lo8(-33)
	out 0x2c,r25
	in r18,0x2c
	ldd r25,Z+44
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
	movw r30,r24
	ldd r24,Z+44
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
	std Z+45,r22
	in r25,0x2c
	andi r25,lo8(-9)
	out 0x2c,r25
	in r18,0x2c
	ldd r25,Z+45
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
	movw r30,r24
	ldd r24,Z+45
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
	std Z+46,r22
	in r25,0x2c
	andi r25,lo8(-5)
	out 0x2c,r25
	in r18,0x2c
	ldd r25,Z+46
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
	movw r30,r24
	ldd r24,Z+46
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
	ldd r20,Z+40
	ldd r21,Z+41
	cp r20,r18
	cpc r21,r19
	brlo .L21
	ldd r24,Z+36
	ldd r25,Z+37
	ldi r31,lo8(12)
	mul r22,r31
	add r24,r0
	adc r25,r1
	clr __zero_reg__
	jmp _ZN3Pin3offEv
.L21:
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
	ldd r20,Z+40
	ldd r21,Z+41
	cp r20,r18
	cpc r21,r19
	brlo .L24
	ldd r24,Z+36
	ldd r25,Z+37
	ldi r31,lo8(12)
	mul r22,r31
	add r24,r0
	adc r25,r1
	clr __zero_reg__
	jmp _ZN3Pin2onEv
.L24:
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
.L26:
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L26
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
.L30:
	mov r24,r28
	ldi r25,0
	cp r24,r12
	cpc r25,r13
	brsh .L28
	movw r30,r14
	add r30,r24
	adc r31,r25
	ld r22,Z
	movw r24,r16
	call _ZN9MasterSPI4sendEh
	subi r28,lo8(-(1))
	rjmp .L30
.L28:
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
.L32:
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L32
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
.L36:
	mov r24,r9
	ldi r25,0
	cp r24,r12
	cpc r25,r13
	brsh .L34
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
	rjmp .L36
.L34:
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
.L40:
	mov r24,r17
	ldi r25,0
	cp r24,r10
	cpc r25,r11
	brsh .L38
	movw r28,r12
	add r28,r24
	adc r29,r25
	movw r24,r14
	call _ZN9MasterSPI7receiveEv
	st Y,r24
	subi r17,lo8(-(1))
	rjmp .L40
.L38:
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
	ldi r18,lo8(1)
	movw r30,r24
	ldd r24,Z+40
	ldd r25,Z+41
	cp r24,r22
	cpc r25,r23
	brsh .L43
	ldi r18,0
.L43:
	mov r24,r18
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
	movw r30,r24
	ldd r24,Z+36
	ldd r25,Z+37
	ldi r31,lo8(12)
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
	brsh .L46
	movw r12,r22
	movw r28,r24
	ldi r24,lo8(12)
	mul r24,r22
	movw r10,r0
	mul r24,r23
	add r11,r0
	clr __zero_reg__
	movw r14,r22
	ldi r16,0
	ldi r17,0
.L49:
	ldd r24,Y+4
	ldd r25,Y+5
	cp r14,r24
	cpc r15,r25
	brsh .L48
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
	subi r16,-12
	sbci r17,-1
	rjmp .L49
.L48:
	std Y+5,r13
	std Y+4,r12
.L46:
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
	sbiw r28,12
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 12 */
/* stack size = 22 */
.L__stack_usage = 22
	movw r14,r24
	mov r10,r22
	mov r11,r20
	mov r17,r18
	movw r12,r24
	ldi r24,36
	add r12,r24
	adc r13,__zero_reg__
	movw r30,r14
	std Z+37,__zero_reg__
	std Z+36,__zero_reg__
	ldi r24,lo8(8)
	ldi r25,0
	std Z+39,r25
	std Z+38,r24
	std Z+41,__zero_reg__
	std Z+40,__zero_reg__
	ldi r24,lo8(96)
	ldi r25,0
	call _Znwj
	movw r30,r14
	std Z+37,r25
	std Z+36,r24
	ldi r24,lo8(3)
	std Z+43,r24
	std Z+44,__zero_reg__
	std Z+45,__zero_reg__
	std Z+46,__zero_reg__
	ldi r20,0
	mov r22,r10
	movw r24,r28
	adiw r24,1
	call _ZN3PinC1Eh4DDRx
	ldi r24,lo8(12)
	movw r30,r28
	adiw r30,1
	movw r26,r14
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	movw r24,r28
	adiw r24,1
	call _ZN3PinD1Ev
	ldi r20,lo8(1)
	mov r22,r11
	movw r24,r28
	adiw r24,1
	call _ZN3PinC1Eh4DDRx
	ldi r24,lo8(12)
	movw r30,r28
	adiw r30,1
	movw r26,r14
	adiw r26,12
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
	ldi r24,lo8(12)
	movw r30,r28
	adiw r30,1
	movw r26,r14
	adiw r26,24
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
	movw r30,r14
	ldd r22,Z+40
	ldd r23,Z+41
	movw r16,r22
	subi r16,-1
	sbci r17,-1
	cp r22,r16
	cpc r23,r17
	brsh .L51
	ldd r24,Z+38
	ldd r25,Z+39
	cp r24,r16
	cpc r25,r17
	brsh .L52
	subi r22,-9
	sbci r23,-1
	cp r24,r22
	cpc r25,r23
	brsh .L52
	movw r24,r12
	call _ZNSt6vectorI3PinSaIS0_EE7reserveEj.part.7
.L52:
	movw r30,r14
	ldd r18,Z+40
	ldd r19,Z+41
	ldi r24,lo8(12)
	mul r24,r18
	movw r22,r0
	mul r24,r19
	add r23,r0
	clr __zero_reg__
	ldi r20,0
	ldi r21,0
.L55:
	movw r30,r14
	cp r18,r16
	cpc r19,r17
	brsh .L53
	ldd r26,Z+36
	ldd r27,Z+37
	movw r24,r20
	add r24,r22
	adc r25,r23
	add r26,r24
	adc r27,r25
	sbiw r26,0
	breq .L54
	ldi r24,lo8(12)
	movw r30,r28
	adiw r30,1
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
.L54:
	subi r18,-1
	sbci r19,-1
	subi r20,-12
	sbci r21,-1
	rjmp .L55
.L53:
	std Z+41,r17
	std Z+40,r16
	rjmp .L56
.L51:
	movw r22,r16
	movw r24,r12
	call _ZNSt6vectorI3PinSaIS0_EE8downsizeEj
.L56:
	movw r24,r28
	adiw r24,1
	call _ZN3PinD1Ev
	movw r30,r14
	ldd r18,Z+40
	ldd r19,Z+41
	ldi r20,lo8(12)
	mul r20,r18
	movw r24,r0
	mul r20,r19
	add r25,r0
	clr __zero_reg__
	ldd r18,Z+36
	ldd r19,Z+37
	add r24,r18
	adc r25,r19
	call _ZN3Pin2onEv
/* epilogue start */
	adiw r28,12
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
	sbiw r28,47
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 47 */
/* stack size = 56 */
.L__stack_usage = 56
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
	ldi r24,lo8(12)
	movw r30,r28
	adiw r30,1
	movw r26,r14
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	ldi r24,lo8(12)
	movw r30,r28
	adiw r30,13
	movw r26,r14
	adiw r26,12
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	ldi r24,lo8(12)
	movw r30,r28
	adiw r30,25
	movw r26,r14
	adiw r26,24
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	movw r16,r14
	subi r16,-36
	sbci r17,-1
	ldd r22,Y+41
	ldd r23,Y+42
	movw r26,r14
	adiw r26,38
	ld r24,X+
	ld r25,X
	sbiw r26,38+1
	cp r24,r22
	cpc r25,r23
	brsh .L62
	movw r24,r16
	call _ZNSt6vectorI3PinSaIS0_EE7reserveEj.part.7
.L62:
	ldd r24,Y+41
	ldd r25,Y+42
	movw r30,r14
	ldd r20,Z+40
	ldd r21,Z+41
	cp r24,r20
	cpc r25,r21
	brsh .L63
	movw r20,r24
.L63:
	ldi r24,0
	ldi r25,0
	ldi r18,0
	ldi r19,0
.L65:
	cp r18,r20
	cpc r19,r21
	breq .L64
	movw r30,r14
	ldd r26,Z+36
	ldd r27,Z+37
	add r26,r24
	adc r27,r25
	ldd r30,Y+37
	ldd r31,Y+38
	add r30,r24
	adc r31,r25
	ldi r22,lo8(12)
	0:
	ld r0,Z+
	st X+,r0
	dec r22
	brne 0b
	subi r18,-1
	sbci r19,-1
	adiw r24,12
	rjmp .L65
.L64:
	movw r26,r14
	adiw r26,40
	ld r18,X+
	ld r19,X
	sbiw r26,40+1
	ldd r24,Y+41
	ldd r25,Y+42
	cp r18,r24
	cpc r19,r25
	brsh .L66
	ldi r24,lo8(12)
	mul r24,r18
	movw r22,r0
	mul r24,r19
	add r23,r0
	clr __zero_reg__
	ldi r20,0
	ldi r21,0
.L68:
	ldd r24,Y+41
	ldd r25,Y+42
	cp r18,r24
	cpc r19,r25
	brsh .L66
	ldd r30,Y+37
	ldd r31,Y+38
	movw r24,r22
	add r24,r20
	adc r25,r21
	add r30,r24
	adc r31,r25
	movw r26,r14
	adiw r26,36
	ld r12,X+
	ld r13,X
	sbiw r26,36+1
	movw r26,r12
	add r26,r24
	adc r27,r25
	sbiw r26,0
	breq .L67
	ldi r24,lo8(12)
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
.L67:
	movw r30,r14
	ldd r24,Z+40
	ldd r25,Z+41
	adiw r24,1
	std Z+41,r25
	std Z+40,r24
	subi r18,-1
	sbci r19,-1
	subi r20,-12
	sbci r21,-1
	rjmp .L68
.L66:
	ldd r22,Y+41
	ldd r23,Y+42
	movw r26,r14
	adiw r26,40
	ld r24,X+
	ld r25,X
	sbiw r26,40+1
	cp r22,r24
	cpc r23,r25
	brsh .L69
	movw r24,r16
	call _ZNSt6vectorI3PinSaIS0_EE8downsizeEj
.L69:
	ldd r24,Y+44
	ldd r25,Y+45
	ldd r26,Y+46
	ldd r27,Y+47
	movw r30,r14
	std Z+43,r24
	std Z+44,r25
	std Z+45,r26
	std Z+46,r27
	ldi r16,0
	ldi r17,0
	mov r12,__zero_reg__
	mov r13,__zero_reg__
.L71:
	ldd r18,Y+41
	ldd r19,Y+42
	ldd r24,Y+37
	ldd r25,Y+38
	cp r12,r18
	cpc r13,r19
	brsh .L70
	add r24,r16
	adc r25,r17
	call _ZN3PinD1Ev
	ldi r31,-1
	sub r12,r31
	sbc r13,r31
	subi r16,-12
	sbci r17,-1
	rjmp .L71
.L70:
	call _ZdlPv
	movw r24,r28
	adiw r24,25
	call _ZN3PinD1Ev
	movw r24,r28
	adiw r24,13
	call _ZN3PinD1Ev
	movw r24,r28
	adiw r24,1
	call _ZN3PinD1Ev
	movw r26,r14
	adiw r26,46
	ld r22,X
	movw r24,r14
	call _ZN9MasterSPI13setClockPhaseE8SPI_CPHA
	movw r30,r14
	ldd r22,Z+45
	movw r24,r14
	call _ZN9MasterSPI16setClockPolarityE8SPI_CPOL
	movw r26,r14
	adiw r26,43
	ld r22,X
	movw r24,r14
	call _ZN9MasterSPI8setClockE10SPI_CLKSEL
	movw r30,r14
	ldd r22,Z+44
	movw r24,r14
	call _ZN9MasterSPI12setDataOrderE8SPI_DORD
	in r24,0x2c
	ori r24,lo8(16)
	out 0x2c,r24
	movw r24,r14
	call _ZN9MasterSPI6enableEv
/* epilogue start */
	adiw r28,47
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
	ret
	.size	_ZN9MasterSPIC2Ehhhh, .-_ZN9MasterSPIC2Ehhhh
.global	_ZN9MasterSPIC1Ehhhh
	.set	_ZN9MasterSPIC1Ehhhh,_ZN9MasterSPIC2Ehhhh
	.ident	"GCC: (GNU) 5.4.0"
