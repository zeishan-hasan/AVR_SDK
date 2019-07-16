	.file	"rdm630.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	_ZN7Rdm6300C2Ev
	.type	_ZN7Rdm6300C2Ev, @function
_ZN7Rdm6300C2Ev:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	std Y+1,__zero_reg__
	st Y,__zero_reg__
	ldi r24,lo8(8)
	ldi r25,0
	std Y+3,r25
	std Y+2,r24
	std Y+5,__zero_reg__
	std Y+4,__zero_reg__
	call _Znwj
	std Y+1,r25
	st Y,r24
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZN7Rdm6300C2Ev, .-_ZN7Rdm6300C2Ev
.global	_ZN7Rdm6300C1Ev
	.set	_ZN7Rdm6300C1Ev,_ZN7Rdm6300C2Ev
.global	_ZN7Rdm6300D2Ev
	.type	_ZN7Rdm6300D2Ev, @function
_ZN7Rdm6300D2Ev:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ld r24,Z
	ldd r25,Z+1
	jmp _ZdlPv
	.size	_ZN7Rdm6300D2Ev, .-_ZN7Rdm6300D2Ev
.global	_ZN7Rdm6300D1Ev
	.set	_ZN7Rdm6300D1Ev,_ZN7Rdm6300D2Ev
.global	_ZN7Rdm63008attachToE10SerialPort4UART
	.type	_ZN7Rdm63008attachToE10SerialPort4UART, @function
_ZN7Rdm63008attachToE10SerialPort4UART:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_ZN7Rdm63008attachToE10SerialPort4UART, .-_ZN7Rdm63008attachToE10SerialPort4UART
.global	_ZN7Rdm630012setBuzzerPinEh
	.type	_ZN7Rdm630012setBuzzerPinEh, @function
_ZN7Rdm630012setBuzzerPinEh:
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 5 */
.L__stack_usage = 5
	movw r16,r24
	mov r15,r22
	ldi r24,lo8(14)
	ldi r25,0
	call _Znwj
	movw r28,r24
	ldi r20,lo8(1)
	ldi r21,0
	mov r22,r15
	call _ZN3PinC1Eh4DDRx
	movw r30,r16
	std Z+8,r29
	std Z+7,r28
	ldi r18,0
	ldi r20,lo8(-24)
	ldi r21,lo8(3)
	ldi r22,0
	ldi r23,0
	movw r24,r28
	call _ZN3Pin6setPWMEmh
	cpse r24,__zero_reg__
	rjmp .L5
	movw r30,r16
	std Z+8,__zero_reg__
	std Z+7,__zero_reg__
.L5:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	ret
	.size	_ZN7Rdm630012setBuzzerPinEh, .-_ZN7Rdm630012setBuzzerPinEh
.global	_ZN7Rdm63007calcCrcERSt6vectorIhSaIhEE
	.type	_ZN7Rdm63007calcCrcERSt6vectorIhSaIhEE, @function
_ZN7Rdm63007calcCrcERSt6vectorIhSaIhEE:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r22
	ld r26,Z
	ldd r27,Z+1
	movw r30,r26
	movw r20,r26
	subi r20,-10
	sbci r21,-1
	ldi r24,0
.L8:
	ldd r18,Z+1
	ldi r25,lo8(16)
	mul r18,r25
	movw r18,r0
	clr __zero_reg__
	ldd r25,Z+2
	andi r25,lo8(15)
	or r18,r25
	eor r24,r18
	adiw r30,2
	cp r20,r30
	cpc r21,r31
	brne .L8
	adiw r26,11
	ld r18,X
	sbiw r26,11
	ldi r30,lo8(16)
	mul r18,r30
	movw r18,r0
	clr __zero_reg__
	clr r19
	ldi r25,0
	ldi r20,lo8(1)
	ldi r21,0
	cp r18,r24
	cpc r19,r25
	breq .L9
	ldi r20,0
	ldi r21,0
.L9:
	adiw r26,12
	ld r24,X
	andi r24,lo8(15)
	or r20,r24
	ldi r24,lo8(1)
	or r20,r21
	brne .L10
	ldi r24,0
.L10:
	ret
	.size	_ZN7Rdm63007calcCrcERSt6vectorIhSaIhEE, .-_ZN7Rdm63007calcCrcERSt6vectorIhSaIhEE
.global	_ZN7Rdm630013isValidPacketERSt6vectorIhSaIhEE
	.type	_ZN7Rdm630013isValidPacketERSt6vectorIhSaIhEE, @function
_ZN7Rdm630013isValidPacketERSt6vectorIhSaIhEE:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r26,r22
	ld r30,X+
	ld r31,X
	sbiw r26,1
	ld r18,Z
	cpi r18,lo8(2)
	brne .L17
	adiw r26,4
	ld r18,X+
	ld r19,X
	sbiw r26,4+1
	add r30,r18
	adc r31,r19
	sbiw r30,1
	ld r20,Z
	cpi r20,lo8(3)
	brne .L17
	cpi r18,14
	cpc r19,__zero_reg__
	brne .L17
	jmp _ZN7Rdm63007calcCrcERSt6vectorIhSaIhEE
.L17:
	ldi r24,0
	ret
	.size	_ZN7Rdm630013isValidPacketERSt6vectorIhSaIhEE, .-_ZN7Rdm630013isValidPacketERSt6vectorIhSaIhEE
.global	_ZN7Rdm630014buzzerIncomingEv
	.type	_ZN7Rdm630014buzzerIncomingEv, @function
_ZN7Rdm630014buzzerIncomingEv:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	ldd r24,Y+7
	ldd r25,Y+8
	sbiw r24,0
	breq .L18
	ldi r18,lo8(70)
	ldi r20,lo8(-24)
	ldi r21,lo8(3)
	ldi r22,0
	ldi r23,0
	call _ZN3Pin6setPWMEmh
	ldi r18,lo8(799999)
	ldi r24,hi8(799999)
	ldi r25,hlo8(799999)
1:	subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
	ldi r18,lo8(70)
	ldi r20,lo8(-72)
	ldi r21,lo8(11)
	ldi r22,0
	ldi r23,0
	ldd r24,Y+7
	ldd r25,Y+8
	call _ZN3Pin6setPWMEmh
	ldi r18,lo8(799999)
	ldi r24,hi8(799999)
	ldi r25,hlo8(799999)
1:	subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
	ldi r22,0
	ldd r24,Y+7
	ldd r25,Y+8
/* epilogue start */
	pop r29
	pop r28
	jmp _ZN3Pin7setDutyEh
.L18:
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZN7Rdm630014buzzerIncomingEv, .-_ZN7Rdm630014buzzerIncomingEv
.global	_ZN7Rdm630015buzzerOutcomingEv
	.type	_ZN7Rdm630015buzzerOutcomingEv, @function
_ZN7Rdm630015buzzerOutcomingEv:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	ldd r24,Y+7
	ldd r25,Y+8
	sbiw r24,0
	breq .L20
	ldi r18,lo8(70)
	ldi r20,lo8(-72)
	ldi r21,lo8(11)
	ldi r22,0
	ldi r23,0
	call _ZN3Pin6setPWMEmh
	ldi r18,lo8(799999)
	ldi r24,hi8(799999)
	ldi r25,hlo8(799999)
1:	subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
	ldi r18,lo8(70)
	ldi r20,lo8(-24)
	ldi r21,lo8(3)
	ldi r22,0
	ldi r23,0
	ldd r24,Y+7
	ldd r25,Y+8
	call _ZN3Pin6setPWMEmh
	ldi r18,lo8(799999)
	ldi r24,hi8(799999)
	ldi r25,hlo8(799999)
1:	subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
	ldi r22,0
	ldd r24,Y+7
	ldd r25,Y+8
/* epilogue start */
	pop r29
	pop r28
	jmp _ZN3Pin7setDutyEh
.L20:
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZN7Rdm630015buzzerOutcomingEv, .-_ZN7Rdm630015buzzerOutcomingEv
.global	_ZN7Rdm630012buzzerDeniedEv
	.type	_ZN7Rdm630012buzzerDeniedEv, @function
_ZN7Rdm630012buzzerDeniedEv:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r30,r24
	ldd r24,Z+7
	ldd r25,Z+8
	sbiw r24,0
	breq .L22
	movw r28,r30
	ldi r18,lo8(70)
	ldi r20,lo8(-72)
	ldi r21,lo8(11)
	ldi r22,0
	ldi r23,0
	call _ZN3Pin6setPWMEmh
	ldi r18,lo8(1599999)
	ldi r24,hi8(1599999)
	ldi r25,hlo8(1599999)
1:	subi r18,1
	sbci r24,0
	sbci r25,0
	brne 1b
	rjmp .
	nop
	ldi r22,0
	ldd r24,Y+7
	ldd r25,Y+8
/* epilogue start */
	pop r29
	pop r28
	jmp _ZN3Pin7setDutyEh
.L22:
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZN7Rdm630012buzzerDeniedEv, .-_ZN7Rdm630012buzzerDeniedEv
.global	_ZN7Rdm63009isNewCardEv
	.type	_ZN7Rdm63009isNewCardEv, @function
_ZN7Rdm63009isNewCardEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_ZN7Rdm63009isNewCardEv, .-_ZN7Rdm63009isNewCardEv
	.section	.text._ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_,"axG",@progbits,_ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_,comdat
	.weak	_ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_
	.type	_ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_, @function
_ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_:
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
/* stack size = 13 */
.L__stack_usage = 13
	movw r28,r24
	movw r12,r18
	movw r14,r20
.L38:
	cp r14,r12
	cpc r15,r13
	brne .+2
	rjmp .L25
	movw r30,r14
	ld r7,Z+
	movw r14,r30
	ld r10,Y
	ldd r11,Y+1
	movw r16,r22
	sub r16,r10
	sbc r17,r11
	ldd r24,Y+4
	ldd r25,Y+5
	movw r8,r24
	ldi r31,-1
	sub r8,r31
	sbc r9,r31
	cp r24,r8
	cpc r25,r9
	brsh .L27
	ldd r18,Y+2
	ldd r19,Y+3
	cp r18,r8
	cpc r19,r9
	brsh .L28
	adiw r24,9
	cp r18,r24
	cpc r19,r25
	brsh .L28
	std Y+3,r25
	std Y+2,r24
	call _Znwj
	std Y+1,r25
	st Y,r24
	movw r26,r10
.L31:
	movw r24,r26
	sub r24,r10
	sbc r25,r11
	ldd r18,Y+4
	ldd r19,Y+5
	cp r24,r18
	cpc r25,r19
	brsh .L29
	ld r30,Y
	ldd r31,Y+1
	add r30,r24
	adc r31,r25
	sbiw r30,0
	breq .L30
	ld r24,X
	st Z,r24
.L30:
	adiw r26,1
	rjmp .L31
.L29:
	movw r24,r10
	call _ZdlPv
.L28:
	ldd r24,Y+4
	ldd r25,Y+5
.L34:
	cp r24,r8
	cpc r25,r9
	brsh .L45
	ld r30,Y
	ldd r31,Y+1
	add r30,r24
	adc r31,r25
	sbiw r30,0
	breq .L33
	st Z,r7
.L33:
	adiw r24,1
	rjmp .L34
.L27:
	cp r8,r24
	cpc r9,r25
	brsh .L35
.L45:
	std Y+5,r9
	std Y+4,r8
.L35:
	ldd r18,Y+4
	ldd r19,Y+5
	subi r18,1
	sbc r19,__zero_reg__
.L37:
	ld r24,Y
	ldd r25,Y+1
	movw r30,r24
	cp r16,r18
	cpc r17,r19
	brsh .L36
	add r30,r18
	adc r31,r19
	subi r18,1
	sbc r19,__zero_reg__
	movw r26,r24
	add r26,r18
	adc r27,r19
	ld r24,X
	st Z,r24
	rjmp .L37
.L36:
	add r30,r16
	adc r31,r17
	st Z,r7
	subi r16,-1
	sbci r17,-1
	ld r22,Y
	ldd r23,Y+1
	add r22,r16
	adc r23,r17
	rjmp .L38
.L25:
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
	ret
	.size	_ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_, .-_ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_
	.text
.global	_ZN7Rdm63007getDataEv
	.type	_ZN7Rdm63007getDataEv, @function
_ZN7Rdm63007getDataEv:
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
	std Y+1,__zero_reg__
	st Y,__zero_reg__
	ldi r24,lo8(8)
	ldi r25,0
	std Y+3,r25
	std Y+2,r24
	std Y+5,__zero_reg__
	std Y+4,__zero_reg__
	call _Znwj
	std Y+1,r25
	st Y,r24
	movw r30,r16
	ld r20,Z
	ldd r21,Z+1
	ldd r18,Z+4
	ldd r19,Z+5
	subi r18,1
	sbc r19,__zero_reg__
	add r18,r20
	adc r19,r21
	subi r20,-1
	sbci r21,-1
	movw r22,r24
	movw r24,r28
	call _ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_ZN7Rdm63007getDataEv, .-_ZN7Rdm63007getDataEv
	.ident	"GCC: (GNU) 5.4.0"
