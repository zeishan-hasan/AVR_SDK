	.file	"spislave.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	_ZN8SlaveSPIC2Ev
	.type	_ZN8SlaveSPIC2Ev, @function
_ZN8SlaveSPIC2Ev:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	inc r31
	ldi r24,lo8(-1)
	std Z+6,r24
	std Z+7,r24
	std Z+8,r24
	std Z+9,r24
	ret
	.size	_ZN8SlaveSPIC2Ev, .-_ZN8SlaveSPIC2Ev
.global	_ZN8SlaveSPIC1Ev
	.set	_ZN8SlaveSPIC1Ev,_ZN8SlaveSPIC2Ev
.global	_ZN8SlaveSPIC2E10slaveSPI_t8SPI_DORD10SPI_CLKSEL8SPI_CPOL8SPI_CPHA
	.type	_ZN8SlaveSPIC2E10slaveSPI_t8SPI_DORD10SPI_CLKSEL8SPI_CPOL8SPI_CPHA, @function
_ZN8SlaveSPIC2E10slaveSPI_t8SPI_DORD10SPI_CLKSEL8SPI_CPOL8SPI_CPHA:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,10
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 10 */
/* stack size = 16 */
.L__stack_usage = 16
	std Y+1,r14
	std Y+2,r15
	std Y+3,r16
	std Y+4,r17
	std Y+5,r18
	std Y+6,r19
	std Y+7,r20
	std Y+8,r21
	std Y+9,r22
	std Y+10,r23
	movw r26,r24
	inc r27
	ldi r18,lo8(10)
	movw r30,r28
	adiw r30,1
	0:
	ld r0,Z+
	st X+,r0
	dec r18
	brne 0b
	out 0x2c,__zero_reg__
	out 0x4,__zero_reg__
	out 0x2d,__zero_reg__
	movw r30,r24
	subi r30,-2
	sbci r31,-2
	ld r14,Z
	ldd r15,Z+1
	movw r20,r24
	subi r20,-7
	sbci r21,-2
	ldi r18,lo8(1)
	ldi r19,0
	movw r22,r18
	movw r26,r20
	ld r0,X
	rjmp 2f
	1:
	lsl r22
	rol r23
	2:
	dec r0
	brpl 1b
	subi r20,-1
	sbci r21,-1
	movw r16,r18
	movw r26,r20
	ld r0,X
	rjmp 2f
	1:
	lsl r16
	rol r17
	2:
	dec r0
	brpl 1b
	or r22,r16
	movw r20,r24
	subi r20,-9
	sbci r21,-2
	movw r16,r18
	movw r26,r20
	ld r0,X
	rjmp 2f
	1:
	lsl r16
	rol r17
	2:
	dec r0
	brpl 1b
	movw r20,r16
	or r20,r22
	com r20
	movw r26,r14
	st X,r20
	ld __tmp_reg__,Z+
	ld r31,Z
	mov r30,__tmp_reg__
	ld r20,Z
	movw r26,r24
	subi r26,-6
	sbci r27,-2
	ld r0,X
	rjmp 2f
	1:
	lsl r18
	rol r19
	2:
	dec r0
	brpl 1b
	or r18,r20
	st Z,r18
	in r18,0x2c
	andi r18,lo8(-17)
	out 0x2c,r18
	in r18,0x2c
	ori r18,lo8(64)
	out 0x2c,r18
	movw r30,r24
	subi r30,-10
	sbci r31,-2
	std Z+1,__zero_reg__
	st Z,__zero_reg__
/* epilogue start */
	adiw r28,10
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
	ret
	.size	_ZN8SlaveSPIC2E10slaveSPI_t8SPI_DORD10SPI_CLKSEL8SPI_CPOL8SPI_CPHA, .-_ZN8SlaveSPIC2E10slaveSPI_t8SPI_DORD10SPI_CLKSEL8SPI_CPOL8SPI_CPHA
.global	_ZN8SlaveSPIC1E10slaveSPI_t8SPI_DORD10SPI_CLKSEL8SPI_CPOL8SPI_CPHA
	.set	_ZN8SlaveSPIC1E10slaveSPI_t8SPI_DORD10SPI_CLKSEL8SPI_CPOL8SPI_CPHA,_ZN8SlaveSPIC2E10slaveSPI_t8SPI_DORD10SPI_CLKSEL8SPI_CPOL8SPI_CPHA
.global	_ZN8SlaveSPI11getInstanceE10slaveSPI_t
	.type	_ZN8SlaveSPI11getInstanceE10slaveSPI_t, @function
_ZN8SlaveSPI11getInstanceE10slaveSPI_t:
	push r6
	push r7
	push r8
	push r10
	push r12
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,20
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 20 */
/* stack size = 31 */
.L__stack_usage = 31
	std Y+11,r16
	std Y+12,r17
	std Y+13,r18
	std Y+14,r19
	std Y+15,r20
	std Y+16,r21
	std Y+17,r22
	std Y+18,r23
	std Y+19,r24
	std Y+20,r25
	lds r24,_ZZN8SlaveSPI11getInstanceE10slaveSPI_tE8instance
	lds r25,_ZZN8SlaveSPI11getInstanceE10slaveSPI_tE8instance+1
	or r24,r25
	brne .L4
	ldi r24,lo8(10)
	movw r30,r28
	adiw r30,11
	movw r26,r28
	adiw r26,1
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	ldi r24,lo8(17)
	ldi r25,lo8(1)
	call _Znwj
	movw r6,r24
	push __zero_reg__
	mov r8,__zero_reg__
	ldi r24,lo8(4)
	mov r10,r24
	mov r12,__zero_reg__
	ldd r14,Y+1
	ldd r15,Y+2
	ldd r16,Y+3
	ldd r17,Y+4
	ldd r18,Y+5
	ldd r19,Y+6
	ldd r20,Y+7
	ldd r21,Y+8
	ldd r22,Y+9
	ldd r23,Y+10
	movw r24,r6
	call _ZN8SlaveSPIC1E10slaveSPI_t8SPI_DORD10SPI_CLKSEL8SPI_CPOL8SPI_CPHA
	sts _ZZN8SlaveSPI11getInstanceE10slaveSPI_tE8instance+1,r7
	sts _ZZN8SlaveSPI11getInstanceE10slaveSPI_tE8instance,r6
	pop __tmp_reg__
.L4:
	lds r24,_ZZN8SlaveSPI11getInstanceE10slaveSPI_tE8instance
	lds r25,_ZZN8SlaveSPI11getInstanceE10slaveSPI_tE8instance+1
/* epilogue start */
	adiw r28,20
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
	pop r12
	pop r10
	pop r8
	pop r7
	pop r6
	ret
	.size	_ZN8SlaveSPI11getInstanceE10slaveSPI_t, .-_ZN8SlaveSPI11getInstanceE10slaveSPI_t
.global	_ZN8SlaveSPI6setISREb
	.type	_ZN8SlaveSPI6setISREb, @function
_ZN8SlaveSPI6setISREb:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	in r24,0x2c
	tst r22
	breq .L7
	ori r24,lo8(-128)
	out 0x2c,r24
/* #APP */
 ;  56 "libs/communication/spi/slave/spislave.cpp" 1
	sei
 ;  0 "" 2
/* #NOAPP */
	ret
.L7:
	andi r24,lo8(127)
	out 0x2c,r24
	ret
	.size	_ZN8SlaveSPI6setISREb, .-_ZN8SlaveSPI6setISREb
.global	_ZN8SlaveSPI4sendEh
	.type	_ZN8SlaveSPI4sendEh, @function
_ZN8SlaveSPI4sendEh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	out 0x2e,r22
.L10:
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L10
/* epilogue start */
	ret
	.size	_ZN8SlaveSPI4sendEh, .-_ZN8SlaveSPI4sendEh
.global	_ZN8SlaveSPI4sendEPhj
	.type	_ZN8SlaveSPI4sendEPhj, @function
_ZN8SlaveSPI4sendEPhj:
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
.L14:
	mov r24,r28
	ldi r25,0
	cp r24,r12
	cpc r25,r13
	brsh .L12
	movw r30,r14
	add r30,r24
	adc r31,r25
	ld r22,Z
	movw r24,r16
	call _ZN8SlaveSPI4sendEh
	subi r28,lo8(-(1))
	rjmp .L14
.L12:
/* epilogue start */
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	ret
	.size	_ZN8SlaveSPI4sendEPhj, .-_ZN8SlaveSPI4sendEPhj
.global	_ZN8SlaveSPI7receiveEv
	.type	_ZN8SlaveSPI7receiveEv, @function
_ZN8SlaveSPI7receiveEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.L16:
	in __tmp_reg__,0x2d
	sbrs __tmp_reg__,7
	rjmp .L16
	in r24,0x2e
	ret
	.size	_ZN8SlaveSPI7receiveEv, .-_ZN8SlaveSPI7receiveEv
.global	_ZN8SlaveSPI7receiveEPhj
	.type	_ZN8SlaveSPI7receiveEPhj, @function
_ZN8SlaveSPI7receiveEPhj:
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
.L20:
	mov r24,r17
	ldi r25,0
	cp r24,r10
	cpc r25,r11
	brsh .L18
	movw r28,r12
	add r28,r24
	adc r29,r25
	movw r24,r14
	call _ZN8SlaveSPI7receiveEv
	st Y,r24
	subi r17,lo8(-(1))
	rjmp .L20
.L18:
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
	.size	_ZN8SlaveSPI7receiveEPhj, .-_ZN8SlaveSPI7receiveEPhj
.global	_ZN8SlaveSPI13busIsWritableEv
	.type	_ZN8SlaveSPI13busIsWritableEv, @function
_ZN8SlaveSPI13busIsWritableEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	inc r31
	ld __tmp_reg__,Z+
	ld r31,Z
	mov r30,__tmp_reg__
	ld r18,Z
	movw r30,r24
	subi r30,-9
	sbci r31,-2
	ld r24,Z
	ldi r19,0
	mov r0,r24
	rjmp 2f
	1:
	asr r19
	ror r18
	2:
	dec r0
	brpl 1b
	andi r18,1
	clr r19
	ldi r25,1
	eor r18,r25
	rjmp 2f
	1:
	asr r19
	ror r18
	2:
	dec r24
	brpl 1b
	ldi r24,lo8(1)
	or r18,r19
	brne .L22
	ldi r24,0
.L22:
	ret
	.size	_ZN8SlaveSPI13busIsWritableEv, .-_ZN8SlaveSPI13busIsWritableEv
.global	_ZN8SlaveSPI16registerCallbackEPFvhE
	.type	_ZN8SlaveSPI16registerCallbackEPFvhE, @function
_ZN8SlaveSPI16registerCallbackEPFvhE:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	in r18,0x2c
	ori r18,lo8(-128)
	out 0x2c,r18
/* #APP */
 ;  56 "libs/communication/spi/slave/spislave.cpp" 1
	sei
 ;  0 "" 2
/* #NOAPP */
	movw r30,r24
	subi r30,-10
	sbci r31,-2
	std Z+1,r23
	st Z,r22
	ret
	.size	_ZN8SlaveSPI16registerCallbackEPFvhE, .-_ZN8SlaveSPI16registerCallbackEPFvhE
.global	_ZN8SlaveSPI8callbackEh
	.type	_ZN8SlaveSPI8callbackEh, @function
_ZN8SlaveSPI8callbackEh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	subi r24,-10
	sbci r25,-2
	movw r26,r24
	ld r30,X+
	ld r31,X
	sbiw r30,0
	breq .L24
	mov r24,r22
	ijmp
.L24:
	ret
	.size	_ZN8SlaveSPI8callbackEh, .-_ZN8SlaveSPI8callbackEh
.global	_ZN8SlaveSPI10insertDataEh
	.type	_ZN8SlaveSPI10insertDataEh, @function
_ZN8SlaveSPI10insertDataEh:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r30,r24
	subi r30,-14
	sbci r31,-2
	ld r18,Z
	ldd r19,Z+1
	subi r18,-1
	sbci r19,-1
	movw r20,r24
	subi r20,1
	sbci r21,-1
	cp r20,r18
	cpc r21,r19
	brlo .L27
	std Z+1,r19
	st Z,r18
	rjmp .L28
.L27:
	std Z+1,r25
	st Z,r24
.L28:
	ld r26,Z
	ldd r27,Z+1
	movw r28,r24
	subi r28,-12
	sbci r29,-2
	ld r18,Y
	ldd r19,Y+1
	cp r26,r18
	cpc r27,r19
	brne .L29
	sbiw r26,1
	cp r26,r24
	cpc r27,r25
	brsh .L30
	std Z+1,r21
	st Z,r20
	rjmp .L26
.L29:
	st X,r22
	rjmp .L26
.L30:
	std Z+1,r27
	st Z,r26
.L26:
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZN8SlaveSPI10insertDataEh, .-_ZN8SlaveSPI10insertDataEh
.global	_ZN8SlaveSPI8readDataEv
	.type	_ZN8SlaveSPI8readDataEv, @function
_ZN8SlaveSPI8readDataEv:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r26,r24
	subi r26,-16
	sbci r27,-2
	st X,__zero_reg__
	movw r30,r24
	subi r30,-12
	sbci r31,-2
	ld r18,Z
	ldd r19,Z+1
	subi r18,-1
	sbci r19,-1
	movw r20,r24
	subi r20,1
	sbci r21,-1
	cp r20,r18
	cpc r21,r19
	brlo .L34
	std Z+1,r19
	st Z,r18
	rjmp .L35
.L34:
	std Z+1,r25
	st Z,r24
.L35:
	ld __tmp_reg__,Z+
	ld r31,Z
	mov r30,__tmp_reg__
	movw r28,r24
	subi r28,-14
	sbci r29,-2
	ld r24,Y
	ldd r25,Y+1
	cp r30,r24
	cpc r31,r25
	breq .L36
	ldi r24,lo8(1)
	st X,r24
.L36:
	ld r24,Z
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZN8SlaveSPI8readDataEv, .-_ZN8SlaveSPI8readDataEv
.global	_ZN8SlaveSPI16bufferIsReadableEv
	.type	_ZN8SlaveSPI16bufferIsReadableEv, @function
_ZN8SlaveSPI16bufferIsReadableEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r26,r24
	subi r26,-12
	sbci r27,-2
	movw r30,r24
	subi r30,-14
	sbci r31,-2
	ldi r24,lo8(1)
	ld r20,X+
	ld r21,X
	ld r18,Z
	ldd r19,Z+1
	cp r20,r18
	cpc r21,r19
	brne .L38
	ldi r24,0
.L38:
	ret
	.size	_ZN8SlaveSPI16bufferIsReadableEv, .-_ZN8SlaveSPI16bufferIsReadableEv
.global	__vector_17
	.type	__vector_17, @function
__vector_17:
	push r1
	push r0
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r16
	push r17
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
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,10
	out __SP_H__,r29
	out __SP_L__,r28
/* prologue: Signal */
/* frame size = 10 */
/* stack size = 29 */
.L__stack_usage = 29
	ldi r24,lo8(-1)
	std Y+7,r24
	std Y+8,r24
	std Y+9,r24
	std Y+10,r24
	ldd r16,Y+1
	ldd r17,Y+2
	ldd r18,Y+3
	ldd r19,Y+4
	ldd r20,Y+5
	ldd r21,Y+6
	ldi r22,lo8(-1)
	ldi r23,lo8(-1)
	ldi r25,lo8(-1)
	call _ZN8SlaveSPI11getInstanceE10slaveSPI_t
	movw r16,r24
	in r24,0x2e
	std Y+1,r24
	ldd r22,Y+1
	movw r24,r16
	call _ZN8SlaveSPI10insertDataEh
	ldd r22,Y+1
	movw r24,r16
	call _ZN8SlaveSPI8callbackEh
/* epilogue start */
	adiw r28,10
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
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
	pop r17
	pop r16
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
	.size	__vector_17, .-__vector_17
	.local	_ZZN8SlaveSPI11getInstanceE10slaveSPI_tE8instance
	.comm	_ZZN8SlaveSPI11getInstanceE10slaveSPI_tE8instance,2,1
	.ident	"GCC: (GNU) 5.4.0"
.global __do_clear_bss
