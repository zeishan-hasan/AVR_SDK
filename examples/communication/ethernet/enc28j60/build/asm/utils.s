	.file	"utils.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	_Z11__swapBytesRSt6vectorIhSaIhEEjj
	.type	_Z11__swapBytesRSt6vectorIhSaIhEEjj, @function
_Z11__swapBytesRSt6vectorIhSaIhEEjj:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ld r18,Z
	ldd r19,Z+1
	movw r30,r18
	add r30,r22
	adc r31,r23
	ld r22,Z
	movw r26,r18
	add r26,r20
	adc r27,r21
	ld r18,X
	st Z,r18
	movw r30,r24
	ld r24,Z
	ldd r25,Z+1
	movw r30,r24
	add r30,r20
	adc r31,r21
	st Z,r22
	ret
	.size	_Z11__swapBytesRSt6vectorIhSaIhEEjj, .-_Z11__swapBytesRSt6vectorIhSaIhEEjj
.global	_Z12__swapEndianRSt6vectorIhSaIhEEj
	.type	_Z12__swapEndianRSt6vectorIhSaIhEEj, @function
_Z12__swapEndianRSt6vectorIhSaIhEEj:
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
/* prologue: function */
/* frame size = 0 */
/* stack size = 16 */
.L__stack_usage = 16
	movw r8,r24
	movw r14,r22
	movw r4,r22
	lsr r5
	ror r4
	mov r6,__zero_reg__
	mov r7,__zero_reg__
	ldi r16,0
	ldi r17,0
.L6:
	movw r30,r8
	ldd r24,Z+4
	ldd r25,Z+5
	movw r22,r14
	call __udivmodhi4
	cp r16,r22
	cpc r17,r23
	brsh .L2
	movw r10,r14
	add r10,r6
	adc r11,r7
	movw r12,r10
	ldi r28,0
	ldi r29,0
.L5:
	ldi r31,1
	sub r12,r31
	sbc r13,__zero_reg__
	cp r28,r4
	cpc r29,r5
	breq .L4
	movw r22,r28
	add r22,r6
	adc r23,r7
	movw r20,r12
	movw r24,r8
	call _Z11__swapBytesRSt6vectorIhSaIhEEjj
	adiw r28,1
	rjmp .L5
.L4:
	subi r16,-1
	sbci r17,-1
	movw r6,r10
	rjmp .L6
.L2:
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
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	ret
	.size	_Z12__swapEndianRSt6vectorIhSaIhEEj, .-_Z12__swapEndianRSt6vectorIhSaIhEEj
.global	_Z11__swapBytesPhjj
	.type	_Z11__swapBytesPhjj, @function
_Z11__swapBytesPhjj:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r26,r24
	add r26,r22
	adc r27,r23
	ld r18,X
	movw r30,r24
	add r30,r20
	adc r31,r21
	ld r24,Z
	st X,r24
	st Z,r18
	ret
	.size	_Z11__swapBytesPhjj, .-_Z11__swapBytesPhjj
.global	_Z12__swapEndianPhjj
	.type	_Z12__swapEndianPhjj, @function
_Z12__swapEndianPhjj:
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
/* prologue: function */
/* frame size = 0 */
/* stack size = 18 */
.L__stack_usage = 18
	movw r2,r24
	movw r24,r22
	movw r4,r20
	movw r22,r20
	call __udivmodhi4
	movw r10,r22
	movw r6,r4
	lsr r7
	ror r6
	ldi r16,0
	ldi r17,0
	mov r14,__zero_reg__
	mov r15,__zero_reg__
.L13:
	cp r14,r10
	cpc r15,r11
	breq .L9
	movw r8,r4
	add r8,r16
	adc r9,r17
	movw r12,r8
	ldi r28,0
	ldi r29,0
.L12:
	ldi r24,1
	sub r12,r24
	sbc r13,__zero_reg__
	cp r28,r6
	cpc r29,r7
	breq .L11
	movw r22,r28
	add r22,r16
	adc r23,r17
	movw r20,r12
	movw r24,r2
	call _Z11__swapBytesPhjj
	adiw r28,1
	rjmp .L12
.L11:
	ldi r24,-1
	sub r14,r24
	sbc r15,r24
	movw r16,r8
	rjmp .L13
.L9:
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
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	ret
	.size	_Z12__swapEndianPhjj, .-_Z12__swapEndianPhjj
.global	_Z13__swapNibblesRSt6vectorIhSaIhEE
	.type	_Z13__swapNibblesRSt6vectorIhSaIhEE, @function
_Z13__swapNibblesRSt6vectorIhSaIhEE:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r26,r24
	ldi r18,0
	ldi r19,0
.L16:
	adiw r26,4
	ld r24,X+
	ld r25,X
	sbiw r26,4+1
	cp r18,r24
	cpc r19,r25
	brsh .L14
	ld r30,X+
	ld r31,X
	sbiw r26,1
	add r30,r18
	adc r31,r19
	ld r25,Z
	swap r25
	st Z,r25
	subi r18,-1
	sbci r19,-1
	rjmp .L16
.L14:
	ret
	.size	_Z13__swapNibblesRSt6vectorIhSaIhEE, .-_Z13__swapNibblesRSt6vectorIhSaIhEE
.global	_Z6__fillRSt6vectorIhSaIhEEhj
	.type	_Z6__fillRSt6vectorIhSaIhEEhj, @function
_Z6__fillRSt6vectorIhSaIhEEhj:
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
	movw r28,r24
	mov r9,r22
	movw r14,r20
	ldi r16,0
	ldi r17,0
.L28:
	cp r16,r14
	cpc r17,r15
	brne .+2
	rjmp .L17
	ldd r24,Y+4
	ldd r25,Y+5
	movw r12,r24
	ldi r18,-1
	sub r12,r18
	sbc r13,r18
	cp r24,r12
	cpc r25,r13
	brsh .L19
	ldd r18,Y+2
	ldd r19,Y+3
	cp r18,r12
	cpc r19,r13
	brsh .L20
	adiw r24,9
	cp r18,r24
	cpc r19,r25
	brsh .L20
	ld r10,Y
	ldd r11,Y+1
	std Y+3,r25
	std Y+2,r24
	call _Znwj
	std Y+1,r25
	st Y,r24
	movw r26,r10
.L23:
	movw r24,r26
	sub r24,r10
	sbc r25,r11
	ldd r18,Y+4
	ldd r19,Y+5
	cp r24,r18
	cpc r25,r19
	brsh .L21
	ld r30,Y
	ldd r31,Y+1
	add r30,r24
	adc r31,r25
	sbiw r30,0
	breq .L22
	ld r24,X
	st Z,r24
.L22:
	adiw r26,1
	rjmp .L23
.L21:
	movw r24,r10
	call _ZdlPv
.L20:
	ldd r24,Y+4
	ldd r25,Y+5
.L26:
	cp r24,r12
	cpc r25,r13
	brsh .L35
	ld r30,Y
	ldd r31,Y+1
	add r30,r24
	adc r31,r25
	sbiw r30,0
	breq .L25
	st Z,r9
.L25:
	adiw r24,1
	rjmp .L26
.L19:
	cp r12,r24
	cpc r13,r25
	brsh .L27
.L35:
	std Y+5,r13
	std Y+4,r12
.L27:
	subi r16,-1
	sbci r17,-1
	rjmp .L28
.L17:
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
	.size	_Z6__fillRSt6vectorIhSaIhEEhj, .-_Z6__fillRSt6vectorIhSaIhEEhj
.global	_Z6__fillRhhjj
	.type	_Z6__fillRhhjj, @function
_Z6__fillRhhjj:
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 7 */
.L__stack_usage = 7
	movw r14,r24
	mov r13,r22
	movw r28,r20
	movw r16,r18
	movw r22,r18
	call realloc
	movw r30,r24
	ld r24,Z
	movw r30,r14
	st Z,r24
	add r16,r28
	adc r17,r29
	add r30,r28
	adc r31,r29
.L38:
	movw r24,r30
	sub r24,r14
	sbc r25,r15
	cp r24,r16
	cpc r25,r17
	brsh .L36
	st Z+,r13
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
	ret
	.size	_Z6__fillRhhjj, .-_Z6__fillRhhjj
.global	_Z13__swapNibblesPhj
	.type	_Z13__swapNibblesPhj, @function
_Z13__swapNibblesPhj:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_Z13__swapNibblesPhj, .-_Z13__swapNibblesPhj
.global	_Z9isInRangejjj
	.type	_Z9isInRangejjj, @function
_Z9isInRangejjj:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r18,r24
	ldi r24,lo8(1)
	cp r18,r22
	cpc r19,r23
	brsh .L41
	cp r20,r18
	cpc r21,r19
	brsh .L41
	ldi r24,0
	ret
.L41:
	ret
	.size	_Z9isInRangejjj, .-_Z9isInRangejjj
	.ident	"GCC: (GNU) 5.4.0"
