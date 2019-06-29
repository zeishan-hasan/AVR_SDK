	.file	"tcp.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.type	_ZNSt6vectorIhSaIhEE7reserveEj.part.6, @function
_ZNSt6vectorIhSaIhEE7reserveEj.part.6:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r24
	movw r24,r22
	ld r16,Y
	ldd r17,Y+1
	std Y+3,r23
	std Y+2,r22
	call _Znwj
	std Y+1,r25
	st Y,r24
	movw r26,r16
.L4:
	movw r24,r26
	sub r24,r16
	sbc r25,r17
	ldd r18,Y+4
	ldd r19,Y+5
	cp r24,r18
	cpc r25,r19
	brsh .L2
	ld r30,Y
	ldd r31,Y+1
	add r30,r24
	adc r31,r25
	sbiw r30,0
	breq .L3
	ld r24,X
	st Z,r24
.L3:
	adiw r26,1
	rjmp .L4
.L2:
	movw r24,r16
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	jmp _ZdlPv
	.size	_ZNSt6vectorIhSaIhEE7reserveEj.part.6, .-_ZNSt6vectorIhSaIhEE7reserveEj.part.6
.global	_ZN3TcpC2Ev
	.type	_ZN3TcpC2Ev, @function
_ZN3TcpC2Ev:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	std Y+25,__zero_reg__
	std Y+24,__zero_reg__
	ldi r24,lo8(8)
	ldi r25,0
	std Y+27,r25
	std Y+26,r24
	std Y+29,__zero_reg__
	std Y+28,__zero_reg__
	call _Znwj
	std Y+25,r25
	std Y+24,r24
	std Y+1,__zero_reg__
	st Y,__zero_reg__
	std Y+3,__zero_reg__
	std Y+2,__zero_reg__
	std Y+4,__zero_reg__
	std Y+5,__zero_reg__
	std Y+6,__zero_reg__
	std Y+7,__zero_reg__
	std Y+8,__zero_reg__
	std Y+9,__zero_reg__
	std Y+10,__zero_reg__
	std Y+11,__zero_reg__
	std Y+13,__zero_reg__
	std Y+15,__zero_reg__
	std Y+14,__zero_reg__
	std Y+17,__zero_reg__
	std Y+16,__zero_reg__
	std Y+19,__zero_reg__
	std Y+18,__zero_reg__
	std Y+20,__zero_reg__
	std Y+21,__zero_reg__
	std Y+22,__zero_reg__
	std Y+23,__zero_reg__
	std Y+12,__zero_reg__
	movw r24,r28
	adiw r24,31
	call _ZN4IPv4C1Ev
	movw r24,r28
	subi r24,121
	sbci r25,-1
/* epilogue start */
	pop r29
	pop r28
	jmp _ZN6SocketC1Ev
	.size	_ZN3TcpC2Ev, .-_ZN3TcpC2Ev
.global	_ZN3TcpC1Ev
	.set	_ZN3TcpC1Ev,_ZN3TcpC2Ev
.global	_ZN3TcpD2Ev
	.type	_ZN3TcpD2Ev, @function
_ZN3TcpD2Ev:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	adiw r24,31
	call _ZN4IPv4D1Ev
	ldd r24,Y+24
	ldd r25,Y+25
/* epilogue start */
	pop r29
	pop r28
	jmp _ZdlPv
	.size	_ZN3TcpD2Ev, .-_ZN3TcpD2Ev
.global	_ZN3TcpD1Ev
	.set	_ZN3TcpD1Ev,_ZN3TcpD2Ev
.global	_ZN3Tcp11decapsulateERSt6vectorIhSaIhEE
	.type	_ZN3Tcp11decapsulateERSt6vectorIhSaIhEE, @function
_ZN3Tcp11decapsulateERSt6vectorIhSaIhEE:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_ZN3Tcp11decapsulateERSt6vectorIhSaIhEE, .-_ZN3Tcp11decapsulateERSt6vectorIhSaIhEE
	.section	.text._ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_,"axG",@progbits,_ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_,comdat
	.weak	_ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_
	.type	_ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_, @function
_ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_:
	push r8
	push r9
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
	movw r14,r18
	movw r12,r20
.L22:
	cp r14,r12
	cpc r15,r13
	brne .+2
	rjmp .L12
	movw r30,r12
	ld r11,Z+
	movw r12,r30
	ld r24,Y
	ldd r25,Y+1
	movw r16,r22
	sub r16,r24
	sbc r17,r25
	ldd r22,Y+4
	ldd r23,Y+5
	movw r8,r22
	ldi r31,-1
	sub r8,r31
	sbc r9,r31
	cp r22,r8
	cpc r23,r9
	brsh .L14
	ldd r24,Y+2
	ldd r25,Y+3
	cp r24,r8
	cpc r25,r9
	brsh .L15
	subi r22,-9
	sbci r23,-1
	cp r24,r22
	cpc r25,r23
	brsh .L15
	movw r24,r28
	call _ZNSt6vectorIhSaIhEE7reserveEj.part.6
.L15:
	ldd r24,Y+4
	ldd r25,Y+5
.L18:
	cp r24,r8
	cpc r25,r9
	brsh .L26
	ld r30,Y
	ldd r31,Y+1
	add r30,r24
	adc r31,r25
	sbiw r30,0
	breq .L17
	st Z,r11
.L17:
	adiw r24,1
	rjmp .L18
.L14:
	cp r8,r22
	cpc r9,r23
	brsh .L19
.L26:
	std Y+5,r9
	std Y+4,r8
.L19:
	ldd r18,Y+4
	ldd r19,Y+5
	subi r18,1
	sbc r19,__zero_reg__
.L21:
	ld r24,Y
	ldd r25,Y+1
	movw r30,r24
	cp r16,r18
	cpc r17,r19
	brsh .L20
	add r30,r18
	adc r31,r19
	subi r18,1
	sbc r19,__zero_reg__
	movw r26,r24
	add r26,r18
	adc r27,r19
	ld r24,X
	st Z,r24
	rjmp .L21
.L20:
	add r30,r16
	adc r31,r17
	st Z,r11
	subi r16,-1
	sbci r17,-1
	ld r22,Y
	ldd r23,Y+1
	add r22,r16
	adc r23,r17
	rjmp .L22
.L12:
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
	pop r9
	pop r8
	ret
	.size	_ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_, .-_ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_
	.text
.global	_ZN3Tcp11encapsulateERSt6vectorIhSaIhEE
	.type	_ZN3Tcp11encapsulateERSt6vectorIhSaIhEE, @function
_ZN3Tcp11encapsulateERSt6vectorIhSaIhEE:
	push r16
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,7
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 7 */
/* stack size = 11 */
.L__stack_usage = 11
	movw r16,r24
	movw r30,r22
	ld r20,Z
	ldd r21,Z+1
	ldd r18,Z+4
	ldd r19,Z+5
	add r18,r20
	adc r19,r21
	movw r30,r24
	ldd r22,Z+24
	ldd r23,Z+25
	adiw r24,24
	call _ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_
	std Y+2,__zero_reg__
	std Y+1,__zero_reg__
	ldi r24,lo8(8)
	ldi r25,0
	std Y+4,r25
	std Y+3,r24
	std Y+6,__zero_reg__
	std Y+5,__zero_reg__
	call _Znwj
	std Y+2,r25
	std Y+1,r24
	ldd r24,Y+3
	ldd r25,Y+4
	sbiw r24,31
	brsh .L28
	ldi r22,lo8(31)
	ldi r23,0
	movw r24,r28
	adiw r24,1
	call _ZNSt6vectorIhSaIhEE7reserveEj.part.6
.L28:
	ldd r26,Y+1
	ldd r27,Y+2
	ldi r24,lo8(31)
	movw r30,r16
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	movw r24,r16
	adiw r24,31
	call _ZN4IPv411encapsulateERSt6vectorIhSaIhEE
	ldd r24,Y+1
	ldd r25,Y+2
	call _ZdlPv
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
	ret
	.size	_ZN3Tcp11encapsulateERSt6vectorIhSaIhEE, .-_ZN3Tcp11encapsulateERSt6vectorIhSaIhEE
	.ident	"GCC: (GNU) 5.4.0"
