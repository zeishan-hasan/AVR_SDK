	.file	"rdm630.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.type	_ZNSt6vectorIhSaIhEE7reserveEj.part.9, @function
_ZNSt6vectorIhSaIhEE7reserveEj.part.9:
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
	.size	_ZNSt6vectorIhSaIhEE7reserveEj.part.9, .-_ZNSt6vectorIhSaIhEE7reserveEj.part.9
	.type	_ZNSt6vectorIhSaIhEE6resizeEjRKh.part.11, @function
_ZNSt6vectorIhSaIhEE6resizeEjRKh.part.11:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r28,r24
	movw r16,r22
	movw r14,r20
	ldd r24,Y+2
	ldd r25,Y+3
	cp r24,r22
	cpc r25,r23
	brsh .L10
	subi r22,-8
	sbci r23,-1
	cp r24,r22
	cpc r25,r23
	brsh .L10
	movw r24,r28
	call _ZNSt6vectorIhSaIhEE7reserveEj.part.9
.L10:
	ldd r24,Y+4
	ldd r25,Y+5
.L13:
	cp r24,r16
	cpc r25,r17
	brsh .L11
	ld r30,Y
	ldd r31,Y+1
	add r30,r24
	adc r31,r25
	sbiw r30,0
	breq .L12
	movw r26,r14
	ld r18,X
	st Z,r18
.L12:
	adiw r24,1
	rjmp .L13
.L11:
	std Y+5,r17
	std Y+4,r16
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	ret
	.size	_ZNSt6vectorIhSaIhEE6resizeEjRKh.part.11, .-_ZNSt6vectorIhSaIhEE6resizeEjRKh.part.11
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
	std Y+3,__zero_reg__
	std Y+2,__zero_reg__
	ldi r24,lo8(8)
	ldi r25,0
	std Y+5,r25
	std Y+4,r24
	std Y+7,__zero_reg__
	std Y+6,__zero_reg__
	call _Znwj
	std Y+3,r25
	std Y+2,r24
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
	ldd r24,Z+2
	ldd r25,Z+3
	jmp _ZdlPv
	.size	_ZN7Rdm6300D2Ev, .-_ZN7Rdm6300D2Ev
.global	_ZN7Rdm6300D1Ev
	.set	_ZN7Rdm6300D1Ev,_ZN7Rdm6300D2Ev
.global	_ZN7Rdm63008attachToE10SerialPort4UART
	.type	_ZN7Rdm63008attachToE10SerialPort4UART, @function
_ZN7Rdm63008attachToE10SerialPort4UART:
	push r8
	push r9
	push r10
	push r11
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
	movw r16,r24
	movw r8,r18
	movw r10,r20
	mov r28,r22
	ldi r29,0
	lsl r28
	rol r29
	movw r24,r28
	subi r24,lo8(-(_ZZN13SerialManager11getInstanceE10SerialPortE8instance))
	sbci r25,hi8(-(_ZZN13SerialManager11getInstanceE10SerialPortE8instance))
	movw r14,r24
	movw r30,r24
	ld r24,Z
	ldd r25,Z+1
	or r24,r25
	brne .L20
	cpse r22,__zero_reg__
	rjmp .L20
	ldi r24,lo8(22)
	ldi r25,lo8(1)
	call _Znwj
	movw r30,r24
	subi r30,-7
	sbci r31,-2
	ldi r18,lo8(-64)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-63)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-62)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-59)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-60)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-58)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	movw r30,r14
	std Z+1,r25
	st Z,r24
.L20:
	subi r28,lo8(-(_ZZN13SerialManager11getInstanceE10SerialPortE8instance))
	sbci r29,hi8(-(_ZZN13SerialManager11getInstanceE10SerialPortE8instance))
	ld r24,Y
	ldd r25,Y+1
	movw r30,r16
	std Z+1,r25
	st Z,r24
	ldi r18,0
	movw r22,r10
	movw r20,r8
	call _ZN6Serial4initE4UART14SerialPriority
	ldi r22,0
	movw r30,r16
	ld r24,Z
	ldd r25,Z+1
	call _ZN6Serial16setRxISRCallBackEb
	ldi r22,0
	movw r30,r16
	ld r24,Z
	ldd r25,Z+1
	call _ZN6Serial13setEchoServerEb
	ldi r24,lo8(1)
	movw r30,r16
	ld r18,Z
	ldd r19,Z+1
	or r18,r19
	brne .L22
	ldi r24,0
.L22:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r11
	pop r10
	pop r9
	pop r8
	ret
	.size	_ZN7Rdm63008attachToE10SerialPort4UART, .-_ZN7Rdm63008attachToE10SerialPort4UART
.global	_ZN7Rdm63007getDataEv
	.type	_ZN7Rdm63007getDataEv, @function
_ZN7Rdm63007getDataEv:
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
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
/* stack size = 11 */
.L__stack_usage = 11
	movw r16,r24
	movw r14,r22
	movw r30,r24
	std Z+1,__zero_reg__
	st Z,__zero_reg__
	ldi r24,lo8(8)
	ldi r25,0
	std Z+3,r25
	std Z+2,r24
	std Z+5,__zero_reg__
	std Z+4,__zero_reg__
	call _Znwj
	movw r30,r16
	std Z+1,r25
	st Z,r24
	movw r30,r14
	ldd r18,Z+2
	ldd r19,Z+3
	movw r10,r18
	ldi r31,-1
	sub r10,r31
	sbc r11,r31
	movw r30,r14
	ldd r12,Z+6
	ldd r13,Z+7
	ldi r31,1
	sub r12,r31
	sbc r13,__zero_reg__
	add r12,r18
	adc r13,r19
.L29:
	cp r12,r10
	cpc r13,r11
	brne .+2
	rjmp .L23
	movw r30,r10
	ld r18,Z+
	movw r10,r30
	std Y+1,r18
	movw r30,r16
	ld r18,Z
	ldd r19,Z+1
	movw r14,r24
	sub r14,r18
	sbc r15,r19
	ldd r24,Z+4
	ldd r25,Z+5
	movw r22,r24
	subi r22,-1
	sbci r23,-1
	cp r24,r22
	cpc r25,r23
	brsh .L25
	movw r20,r28
	subi r20,-1
	sbci r21,-1
	movw r24,r16
	call _ZNSt6vectorIhSaIhEE6resizeEjRKh.part.11
	rjmp .L26
.L25:
	cp r22,r24
	cpc r23,r25
	brsh .L26
	movw r30,r16
	std Z+5,r23
	std Z+4,r22
.L26:
	movw r30,r16
	ldd r18,Z+4
	ldd r19,Z+5
	subi r18,1
	sbc r19,__zero_reg__
.L28:
	movw r30,r16
	ld r24,Z
	ldd r25,Z+1
	cp r14,r18
	cpc r15,r19
	brsh .L27
	movw r30,r24
	add r30,r18
	adc r31,r19
	subi r18,1
	sbc r19,__zero_reg__
	movw r26,r24
	add r26,r18
	adc r27,r19
	ld r24,X
	st Z,r24
	rjmp .L28
.L27:
	ldd r18,Y+1
	movw r30,r24
	add r30,r14
	adc r31,r15
	st Z,r18
	ldi r31,-1
	sub r14,r31
	sbc r15,r31
	movw r30,r16
	ld r24,Z
	ldd r25,Z+1
	add r24,r14
	adc r25,r15
	rjmp .L29
.L23:
	movw r24,r16
/* epilogue start */
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
	ret
	.size	_ZN7Rdm63007getDataEv, .-_ZN7Rdm63007getDataEv
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
	ldi r24,lo8(12)
	ldi r25,0
	call _Znwj
	movw r28,r24
	ldi r20,lo8(1)
	mov r22,r15
	call _ZN3PinC1Eh4DDRx
	movw r30,r16
	std Z+10,r29
	std Z+9,r28
	ldi r18,0
	ldi r20,lo8(-24)
	ldi r21,lo8(3)
	ldi r22,0
	ldi r23,0
	movw r24,r28
	call _ZN3Pin6setPWMEmh
	cpse r24,__zero_reg__
	rjmp .L31
	movw r30,r16
	std Z+10,__zero_reg__
	std Z+9,__zero_reg__
.L31:
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
.L33:
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
	brne .L33
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
	breq .L34
	ldi r20,0
	ldi r21,0
.L34:
	adiw r26,12
	ld r24,X
	andi r24,lo8(15)
	or r20,r24
	ldi r24,lo8(1)
	or r20,r21
	brne .L35
	ldi r24,0
.L35:
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
	brne .L42
	adiw r26,4
	ld r18,X+
	ld r19,X
	sbiw r26,4+1
	add r30,r18
	adc r31,r19
	sbiw r30,1
	ld r20,Z
	cpi r20,lo8(3)
	brne .L42
	cpi r18,14
	cpc r19,__zero_reg__
	brne .L42
	jmp _ZN7Rdm63007calcCrcERSt6vectorIhSaIhEE
.L42:
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
	ldd r24,Y+9
	ldd r25,Y+10
	sbiw r24,0
	breq .L43
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
	ldd r24,Y+9
	ldd r25,Y+10
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
	ldd r24,Y+9
	ldd r25,Y+10
/* epilogue start */
	pop r29
	pop r28
	jmp _ZN3Pin7setDutyEh
.L43:
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
	ldd r24,Y+9
	ldd r25,Y+10
	sbiw r24,0
	breq .L45
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
	ldd r24,Y+9
	ldd r25,Y+10
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
	ldd r24,Y+9
	ldd r25,Y+10
/* epilogue start */
	pop r29
	pop r28
	jmp _ZN3Pin7setDutyEh
.L45:
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
	ldd r24,Z+9
	ldd r25,Z+10
	sbiw r24,0
	breq .L47
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
	ldd r24,Y+9
	ldd r25,Y+10
/* epilogue start */
	pop r29
	pop r28
	jmp _ZN3Pin7setDutyEh
.L47:
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZN7Rdm630012buzzerDeniedEv, .-_ZN7Rdm630012buzzerDeniedEv
	.section	.text._ZNSt6vectorIhSaIhEEaSERKS1_,"axG",@progbits,_ZNSt6vectorIhSaIhEEaSERKS1_,comdat
	.weak	_ZNSt6vectorIhSaIhEEaSERKS1_
	.type	_ZNSt6vectorIhSaIhEEaSERKS1_, @function
_ZNSt6vectorIhSaIhEEaSERKS1_:
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
	cp r22,r24
	cpc r23,r25
	brne .+2
	rjmp .L51
	movw r26,r22
	adiw r26,4
	ld r22,X+
	ld r23,X
	sbiw r26,4+1
	ldd r24,Y+2
	ldd r25,Y+3
	cp r24,r22
	cpc r25,r23
	brsh .L52
	movw r24,r28
	call _ZNSt6vectorIhSaIhEE7reserveEj.part.9
.L52:
	movw r30,r16
	ldd r24,Z+4
	ldd r25,Z+5
	ldd r18,Y+4
	ldd r19,Y+5
	cp r24,r18
	cpc r25,r19
	brsh .L53
	movw r18,r24
.L53:
	ldi r24,0
	ldi r25,0
.L55:
	cp r24,r18
	cpc r25,r19
	breq .L54
	movw r26,r16
	ld r30,X+
	ld r31,X
	add r30,r24
	adc r31,r25
	ld r20,Z
	ld r30,Y
	ldd r31,Y+1
	add r30,r24
	adc r31,r25
	st Z,r20
	adiw r24,1
	rjmp .L55
.L54:
	ldd r24,Y+4
	ldd r25,Y+5
	movw r30,r16
	ldd r18,Z+4
	ldd r19,Z+5
	cp r24,r18
	cpc r25,r19
	brsh .L56
.L58:
	movw r26,r16
	adiw r26,4
	ld r18,X+
	ld r19,X
	sbiw r26,4+1
	cp r24,r18
	cpc r25,r19
	brsh .L56
	ld __tmp_reg__,X+
	ld r27,X
	mov r26,__tmp_reg__
	add r26,r24
	adc r27,r25
	ld r30,Y
	ldd r31,Y+1
	add r30,r24
	adc r31,r25
	sbiw r30,0
	breq .L57
	ld r18,X
	st Z,r18
.L57:
	ldd r18,Y+4
	ldd r19,Y+5
	subi r18,-1
	sbci r19,-1
	std Y+5,r19
	std Y+4,r18
	adiw r24,1
	rjmp .L58
.L56:
	movw r30,r16
	ldd r24,Z+4
	ldd r25,Z+5
	ldd r18,Y+4
	ldd r19,Y+5
	cp r24,r18
	cpc r25,r19
	brsh .L51
	std Y+5,r25
	std Y+4,r24
.L51:
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_ZNSt6vectorIhSaIhEEaSERKS1_, .-_ZNSt6vectorIhSaIhEEaSERKS1_
	.section	.text._ZNSt6vectorIhSaIhEE9push_backERKh,"axG",@progbits,_ZNSt6vectorIhSaIhEE9push_backERKh,comdat
	.weak	_ZNSt6vectorIhSaIhEE9push_backERKh
	.type	_ZNSt6vectorIhSaIhEE9push_backERKh, @function
_ZNSt6vectorIhSaIhEE9push_backERKh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r20,r22
	movw r26,r24
	adiw r26,4
	ld r30,X+
	ld r31,X
	sbiw r26,4+1
	movw r22,r30
	subi r22,-1
	sbci r23,-1
	cp r30,r22
	cpc r31,r23
	brsh .L64
	jmp _ZNSt6vectorIhSaIhEE6resizeEjRKh.part.11
.L64:
	cp r22,r30
	cpc r23,r31
	brsh .L63
	movw r30,r24
	std Z+5,r23
	std Z+4,r22
.L63:
	ret
	.size	_ZNSt6vectorIhSaIhEE9push_backERKh, .-_ZNSt6vectorIhSaIhEE9push_backERKh
	.text
.global	_ZN7Rdm63009isNewCardEv
	.type	_ZN7Rdm63009isNewCardEv, @function
_ZN7Rdm63009isNewCardEv:
	push r12
	push r13
	push r15
	push r16
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,9
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 9 */
/* stack size = 16 */
.L__stack_usage = 16
	movw r16,r24
	std Y+9,__zero_reg__
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
	lds r24,_ZZN7Rdm63009isNewCardEvE5count
	lds r25,_ZZN7Rdm63009isNewCardEvE5count+1
	adiw r24,1
	sts _ZZN7Rdm63009isNewCardEvE5count+1,r25
	sts _ZZN7Rdm63009isNewCardEvE5count,r24
	cpi r24,-72
	sbci r25,11
	brne .L67
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	movw r24,r16
	adiw r24,2
	call _ZNSt6vectorIhSaIhEEaSERKS1_
	ldi r24,lo8(3199999)
	ldi r25,hi8(3199999)
	ldi r30,hlo8(3199999)
1:	subi r24,1
	sbci r25,0
	sbci r30,0
	brne 1b
	rjmp .
	nop
	sts _ZZN7Rdm63009isNewCardEvE5count+1,__zero_reg__
	sts _ZZN7Rdm63009isNewCardEvE5count,__zero_reg__
.L67:
	movw r30,r16
	ld r24,Z
	ldd r25,Z+1
	call _ZN6Serial11isAvailableEv
	cpse r24,__zero_reg__
	rjmp .L68
.L71:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	movw r24,r16
	call _ZN7Rdm630013isValidPacketERSt6vectorIhSaIhEE
	mov r15,r24
	cpse r24,__zero_reg__
	rjmp .L69
	rjmp .L70
.L68:
	movw r30,r16
	ld r24,Z
	ldd r25,Z+1
	call _ZN6Serial7receiveEv
	std Y+9,r24
	cpi r24,lo8(2)
	brne .L71
	movw r22,r28
	subi r22,-9
	sbci r23,-1
	movw r24,r28
	adiw r24,1
	call _ZNSt6vectorIhSaIhEE9push_backERKh
.L73:
	movw r30,r16
	ld r24,Z
	ldd r25,Z+1
	call _ZN6Serial11isAvailableEv
	tst r24
	breq .L72
	movw r30,r16
	ld r24,Z
	ldd r25,Z+1
	call _ZN6Serial7receiveEv
	std Y+8,r24
	movw r22,r28
	subi r22,-8
	sbci r23,-1
	movw r24,r28
	adiw r24,1
	call _ZNSt6vectorIhSaIhEE9push_backERKh
.L72:
	ldd r24,Y+5
	ldd r25,Y+6
	sbiw r24,14
	brlo .L73
	rjmp .L71
.L69:
	movw r24,r16
	adiw r24,2
	ldd r20,Y+5
	ldd r21,Y+6
	movw r30,r16
	ldd r18,Z+6
	ldd r19,Z+7
	cp r20,r18
	cpc r21,r19
	brne .L74
	ldd r26,Y+1
	ldd r27,Y+2
	ldi r18,0
	ldi r19,0
.L76:
	cp r20,r18
	cpc r21,r19
	breq .L75
	ld r23,X+
	movw r30,r16
	ldd r12,Z+2
	ldd r13,Z+3
	movw r30,r12
	add r30,r18
	adc r31,r19
	ld r22,Z
	cpse r23,r22
	rjmp .L74
	subi r18,-1
	sbci r19,-1
	rjmp .L76
.L74:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	call _ZNSt6vectorIhSaIhEEaSERKS1_
	movw r24,r16
	call _ZN7Rdm630014buzzerIncomingEv
	rjmp .L70
.L75:
	movw r24,r16
	call _ZN7Rdm630012buzzerDeniedEv
	mov r15,__zero_reg__
.L70:
	ldd r24,Y+1
	ldd r25,Y+2
	call _ZdlPv
	mov r24,r15
/* epilogue start */
	adiw r28,9
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
	pop r13
	pop r12
	ret
	.size	_ZN7Rdm63009isNewCardEv, .-_ZN7Rdm63009isNewCardEv
	.local	_ZZN7Rdm63009isNewCardEvE5count
	.comm	_ZZN7Rdm63009isNewCardEvE5count,2,1
	.weak	_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	.section	.bss._ZZN13SerialManager11getInstanceE10SerialPortE8instance,"awG",@nobits,_ZZN13SerialManager11getInstanceE10SerialPortE8instance,comdat
	.type	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, @object
	.size	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, 2
_ZZN13SerialManager11getInstanceE10SerialPortE8instance:
	.zero	2
	.ident	"GCC: (GNU) 5.4.0"
.global __do_clear_bss
