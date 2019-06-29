	.file	"spimaster.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
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
	std Z+51,r22
	in r24,0x2c
	andi r24,lo8(-4)
	out 0x2c,r24
	in r24,0x2d
	andi r24,lo8(-2)
	out 0x2d,r24
	in r24,0x2d
	ldd r18,Z+51
	bst r18,2
	clr r25
	bld r25,0
	or r25,r24
	out 0x2d,r25
	in r25,0x2c
	ldd r24,Z+51
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
	ldd r24,Z+51
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
	std Z+52,r22
	in r25,0x2c
	andi r25,lo8(-33)
	out 0x2c,r25
	in r18,0x2c
	ldd r25,Z+52
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
	ldd r24,Z+52
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
	std Z+53,r22
	in r25,0x2c
	andi r25,lo8(-9)
	out 0x2c,r25
	in r18,0x2c
	ldd r25,Z+53
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
	ldd r24,Z+53
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
	std Z+54,r22
	in r25,0x2c
	andi r25,lo8(-5)
	out 0x2c,r25
	in r18,0x2c
	ldd r25,Z+54
	ldi r19,lo8(4)
	mul r25,r19
	movw r24,r0
	clr __zero_reg__
	or r24,r18
	out 0x2c,r24
	ret
	.size	_ZN9MasterSPI13setClockPhaseE8SPI_CPHA, .-_ZN9MasterSPI13setClockPhaseE8SPI_CPHA
.global	_ZN9MasterSPIC2E11masterSPI_t13mSPIsetting_t
	.type	_ZN9MasterSPIC2E11masterSPI_t13mSPIsetting_t, @function
_ZN9MasterSPIC2E11masterSPI_t13mSPIsetting_t:
	push r10
	push r11
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 9 */
.L__stack_usage = 9
	movw r28,r24
	movw r10,r22
	mov r15,r18
	mov r16,r19
	mov r14,r20
	mov r13,r21
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
	std Y+17,r25
	std Y+16,r24
	ldi r24,lo8(-1)
	ldi r25,0
	std Y+21,r25
	std Y+20,r24
	std Y+23,r25
	std Y+22,r24
	std Y+25,r25
	std Y+24,r24
	std Y+27,r25
	std Y+26,r24
	std Y+29,r25
	std Y+28,r24
	std Y+31,r25
	std Y+30,r24
	std Y+33,r25
	std Y+32,r24
	std Y+35,r25
	std Y+34,r24
	std Y+37,r25
	std Y+36,r24
	std Y+39,r25
	std Y+38,r24
	std Y+50,__zero_reg__
	std Y+49,__zero_reg__
	ldi r24,0
	ldi r25,0
	call malloc
	std Y+48,r25
	std Y+47,r24
	std Y+51,__zero_reg__
	std Y+52,__zero_reg__
	std Y+53,__zero_reg__
	std Y+54,__zero_reg__
	ldi r24,lo8(-1)
	std Y+6,r24
	std Y+7,r24
	std Y+8,r24
	std Y+9,r24
	ldi r24,lo8(37)
	ldi r30,0
	ldi r31,0
	movw r26,r28
	adiw r26,10
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	ldi r24,lo8(55)
	movw r30,r10
	movw r26,r28
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	out 0x2c,__zero_reg__
	ldd r30,Y+2
	ldd r31,Y+3
	ld r18,Z
	ldi r24,lo8(1)
	ldi r25,0
	movw r20,r24
	ldd r0,Y+7
	rjmp 2f
	1:
	lsl r20
	rol r21
	2:
	dec r0
	brpl 1b
	ldd r0,Y+8
	rjmp 2f
	1:
	lsl r24
	rol r25
	2:
	dec r0
	brpl 1b
	or r24,r20
	or r24,r18
	st Z,r24
	movw r10,r28
	ldi r24,10
	add r10,r24
	adc r11,__zero_reg__
	ldi r22,lo8(1)
	movw r24,r10
	call _ZN3Pin12setDirectionE4DDRx
	movw r24,r10
	call _ZN3Pin2onEv
	ldi r17,0
.L12:
	mov r24,r17
	ldi r25,0
	ldd r18,Y+49
	ldd r19,Y+50
	cp r24,r18
	cpc r25,r19
	brsh .L11
	ldi r24,lo8(37)
	mul r17,r24
	movw r10,r0
	clr __zero_reg__
	ldd r24,Y+47
	ldd r25,Y+48
	ldi r22,lo8(1)
	add r24,r10
	adc r25,r11
	call _ZN3Pin12setDirectionE4DDRx
	ldd r24,Y+47
	ldd r25,Y+48
	add r24,r10
	adc r25,r11
	call _ZN3Pin2onEv
	subi r17,lo8(-(1))
	rjmp .L12
.L11:
	mov r22,r13
	movw r24,r28
	call _ZN9MasterSPI13setClockPhaseE8SPI_CPHA
	mov r22,r14
	movw r24,r28
	call _ZN9MasterSPI16setClockPolarityE8SPI_CPOL
	mov r22,r15
	movw r24,r28
	call _ZN9MasterSPI8setClockE10SPI_CLKSEL
	mov r22,r16
	movw r24,r28
	call _ZN9MasterSPI12setDataOrderE8SPI_DORD
	in r24,0x2c
	ori r24,lo8(16)
	out 0x2c,r24
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r11
	pop r10
	jmp _ZN9MasterSPI6enableEv
	.size	_ZN9MasterSPIC2E11masterSPI_t13mSPIsetting_t, .-_ZN9MasterSPIC2E11masterSPI_t13mSPIsetting_t
.global	_ZN9MasterSPIC1E11masterSPI_t13mSPIsetting_t
	.set	_ZN9MasterSPIC1E11masterSPI_t13mSPIsetting_t,_ZN9MasterSPIC2E11masterSPI_t13mSPIsetting_t
.global	_ZN9MasterSPI13getClockPhaseEv
	.type	_ZN9MasterSPI13getClockPhaseEv, @function
_ZN9MasterSPI13getClockPhaseEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldd r24,Z+54
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
	ldd r20,Z+49
	ldd r21,Z+50
	cp r20,r18
	cpc r21,r19
	brlo .L17
	ldd r24,Z+47
	ldd r25,Z+48
	ldi r31,lo8(37)
	mul r22,r31
	add r24,r0
	adc r25,r1
	clr __zero_reg__
	jmp _ZN3Pin3offEv
.L17:
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
	ldd r20,Z+49
	ldd r21,Z+50
	cp r20,r18
	cpc r21,r19
	brlo .L20
	ldd r24,Z+47
	ldd r25,Z+48
	ldi r31,lo8(37)
	mul r22,r31
	add r24,r0
	adc r25,r1
	clr __zero_reg__
	jmp _ZN3Pin2onEv
.L20:
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
.L22:
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L22
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
.L26:
	mov r24,r28
	ldi r25,0
	cp r24,r12
	cpc r25,r13
	brsh .L24
	movw r30,r14
	add r30,r24
	adc r31,r25
	ld r22,Z
	movw r24,r16
	call _ZN9MasterSPI4sendEh
	subi r28,lo8(-(1))
	rjmp .L26
.L24:
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
.global	_ZN9MasterSPI7receiveEv
	.type	_ZN9MasterSPI7receiveEv, @function
_ZN9MasterSPI7receiveEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.L28:
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L28
	in r24,0x2e
	ret
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
.L32:
	mov r24,r17
	ldi r25,0
	cp r24,r10
	cpc r25,r11
	brsh .L30
	movw r28,r12
	add r28,r24
	adc r29,r25
	movw r24,r14
	call _ZN9MasterSPI7receiveEv
	st Y,r24
	subi r17,lo8(-(1))
	rjmp .L32
.L30:
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
	out 0x2e,r22
.L34:
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L34
	in r24,0x2e
	ret
	.size	_ZN9MasterSPI11sendReceiveEh, .-_ZN9MasterSPI11sendReceiveEh
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
.L38:
	mov r24,r9
	ldi r25,0
	cp r24,r12
	cpc r25,r13
	brsh .L36
	movw r28,r10
	add r28,r24
	adc r29,r25
	movw r30,r14
	add r30,r24
	adc r31,r25
	ld r22,Z
	movw r24,r16
	call _ZN9MasterSPI11sendReceiveEh
	st Y,r24
	inc r9
	rjmp .L38
.L36:
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
	ldd r24,Z+49
	ldd r25,Z+50
	cp r24,r22
	cpc r25,r23
	brsh .L40
	ldi r18,0
.L40:
	mov r24,r18
	ret
	.size	_ZN9MasterSPI12slaveIsValidEh, .-_ZN9MasterSPI12slaveIsValidEh
	.ident	"GCC: (GNU) 5.4.0"
