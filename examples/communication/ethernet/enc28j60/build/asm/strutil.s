	.file	"strutil.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	_Z8to_lowerPc
	.type	_Z8to_lowerPc, @function
_Z8to_lowerPc:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ld r18,Z
.L2:
	cpse r18,__zero_reg__
	rjmp .L2
/* epilogue start */
	ret
	.size	_Z8to_lowerPc, .-_Z8to_lowerPc
.global	_Z8to_upperPc
	.type	_Z8to_upperPc, @function
_Z8to_upperPc:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ld r18,Z
.L6:
	cpse r18,__zero_reg__
	rjmp .L6
/* epilogue start */
	ret
	.size	_Z8to_upperPc, .-_Z8to_upperPc
.global	_Z9isNumericRKSs
	.type	_Z9isNumericRKSs, @function
_Z9isNumericRKSs:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	ld r26,Y
	ldd r27,Y+1
	ld r18,X
	cpi r18,lo8(43)
	breq .L13
	ldi r25,lo8(1)
	ldi r24,0
	cpi r18,lo8(45)
	breq .L10
	ldi r25,0
.L10:
	mov r18,r25
	mov r19,r24
	rjmp .L9
.L13:
	ldi r18,lo8(1)
	ldi r19,0
.L9:
	movw r30,r26
	add r30,r18
	adc r31,r19
.L11:
	movw r18,r30
	sub r18,r26
	sbc r19,r27
	ld r25,Z+
	subi r25,lo8(-(-48))
	cpi r25,lo8(10)
	brlo .L11
	ldi r24,lo8(1)
	ldd r20,Y+4
	ldd r21,Y+5
	cp r20,r18
	cpc r21,r19
	breq .L12
	ldi r24,0
.L12:
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_Z9isNumericRKSs, .-_Z9isNumericRKSs
.global	_Z16countOccurrencesRKSsc
	.type	_Z16countOccurrencesRKSsc, @function
_Z16countOccurrencesRKSsc:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r26,r24
	ld r30,X+
	ld r31,X
	sbiw r26,1
	adiw r26,4
	ld r18,X+
	ld r19,X
	sbiw r26,4+1
	add r18,r30
	adc r19,r31
	ldi r24,0
	ldi r25,0
.L21:
	cp r30,r18
	cpc r31,r19
	breq .L19
	ld r20,Z+
	cpse r20,r22
	rjmp .L21
	adiw r24,1
	rjmp .L21
.L19:
	ret
	.size	_Z16countOccurrencesRKSsc, .-_Z16countOccurrencesRKSsc
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	" \t\r\n\013"
	.section	.text._Z11isBlankCharRc,"axG",@progbits,_Z11isBlankCharRc,comdat
	.weak	_Z11isBlankCharRc
	.type	_Z11isBlankCharRc, @function
_Z11isBlankCharRc:
	push r28
	push r29
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 8 */
.L__stack_usage = 8
	movw r18,r24
	ldi r25,lo8(6)
	ldi r30,lo8(.LC0)
	ldi r31,hi8(.LC0)
	movw r26,r28
	adiw r26,1
	0:
	ld r0,Z+
	st X+,r0
	dec r25
	brne 0b
	movw r30,r18
	ld r18,Z
	movw r30,r28
	adiw r30,1
	movw r24,r28
	adiw r24,7
.L24:
	ld r19,Z+
	cp r18,r19
	breq .L25
	cp r30,r24
	cpc r31,r25
	brne .L24
	ldi r24,0
	rjmp .L23
.L25:
	ldi r24,lo8(1)
.L23:
/* epilogue start */
	adiw r28,6
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	ret
	.size	_Z11isBlankCharRc, .-_Z11isBlankCharRc
	.text
.global	_Z10removeCharPcc
	.type	_Z10removeCharPcc, @function
_Z10removeCharPcc:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_Z10removeCharPcc, .-_Z10removeCharPcc
.global	_Z5splitPKcRPPcS0_
	.type	_Z5splitPKcRPPcS0_, @function
_Z5splitPKcRPPcS0_:
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
/* stack size = 15 */
.L__stack_usage = 15
	movw r28,r24
	movw r14,r22
	movw r6,r20
	movw r30,r24
	0:
	ld __tmp_reg__,Z+
	tst __tmp_reg__
	brne 0b
	movw r24,r30
	sub r24,r28
	sbc r25,r29
	call _Znaj
	movw r12,r24
	movw r22,r28
	call strcpy
	ldi r24,lo8(2)
	ldi r25,0
	call malloc
	movw r30,r14
	std Z+1,r25
	st Z,r24
	movw r22,r6
	movw r24,r12
	call strtok
	movw r16,r24
	mov r5,__zero_reg__
.L31:
	mov r28,r5
	ldi r29,0
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .L29
	movw r8,r28
	lsl r8
	rol r9
	movw r30,r14
	ld r10,Z
	ldd r11,Z+1
	add r10,r8
	adc r11,r9
	movw r30,r16
	0:
	ld __tmp_reg__,Z+
	tst __tmp_reg__
	brne 0b
	movw r24,r30
	sub r24,r16
	sbc r25,r17
	call malloc
	movw r30,r10
	std Z+1,r25
	st Z,r24
	movw r30,r14
	ld r24,Z
	ldd r25,Z+1
	movw r30,r24
	add r30,r8
	adc r31,r9
	movw r22,r16
	ld r24,Z
	ldd r25,Z+1
	call strcpy
	movw r22,r6
	ldi r24,0
	ldi r25,0
	call strtok
	movw r16,r24
	movw r22,r28
	subi r22,-2
	sbci r23,-1
	lsl r22
	rol r23
	movw r30,r14
	ld r24,Z
	ldd r25,Z+1
	call realloc
	movw r30,r14
	std Z+1,r25
	st Z,r24
	or r24,r25
	breq .L33
	inc r5
	rjmp .L31
.L29:
	cp r12,__zero_reg__
	cpc r13,__zero_reg__
	breq .L32
	movw r24,r12
	call _ZdaPv
.L32:
	movw r24,r28
	rjmp .L30
.L33:
	ldi r24,lo8(-83)
	ldi r25,lo8(-34)
.L30:
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
	ret
	.size	_Z5splitPKcRPPcS0_, .-_Z5splitPKcRPPcS0_
.global	_Z16hexByteStrToBytePKc
	.type	_Z16hexByteStrToBytePKc, @function
_Z16hexByteStrToBytePKc:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r30,r24
	0:
	ld __tmp_reg__,Z+
	tst __tmp_reg__
	brne 0b
	subi r30,lo8(-(-3))
	cpse r30,r24
	rjmp .L42
	movw r16,r24
	movw r30,r24
	ld r28,Z
	mov r24,r28
	mov __tmp_reg__,r28
	lsl r0
	sbc r25,r25
	call toupper
	cpi r24,65
	cpc r25,__zero_reg__
	brlt .L39
	subi r28,lo8(-(-55))
	swap r28
	andi r28,lo8(-16)
	rjmp .L40
.L39:
	andi r28,lo8(15)
.L40:
	movw r30,r16
	ldd r29,Z+1
	mov r24,r29
	mov __tmp_reg__,r29
	lsl r0
	sbc r25,r25
	call toupper
	cpi r24,65
	cpc r25,__zero_reg__
	brlt .L41
	ldi r24,lo8(-55)
	add r24,r29
	rjmp .L43
.L41:
	mov r24,r29
	andi r24,lo8(15)
.L43:
	or r24,r28
	rjmp .L38
.L42:
	ldi r24,0
.L38:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_Z16hexByteStrToBytePKc, .-_Z16hexByteStrToBytePKc
	.section	.text._ZNSt6vectorIcSaIcEED2Ev,"axG",@progbits,_ZNSt6vectorIcSaIcEED5Ev,comdat
	.weak	_ZNSt6vectorIcSaIcEED2Ev
	.type	_ZNSt6vectorIcSaIcEED2Ev, @function
_ZNSt6vectorIcSaIcEED2Ev:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ld r24,Z
	ldd r25,Z+1
	jmp _ZdlPv
	.size	_ZNSt6vectorIcSaIcEED2Ev, .-_ZNSt6vectorIcSaIcEED2Ev
	.weak	_ZNSt6vectorIcSaIcEED1Ev
	.set	_ZNSt6vectorIcSaIcEED1Ev,_ZNSt6vectorIcSaIcEED2Ev
	.section	.text._ZNSt6vectorIcSaIcEE6resizeEjRKc,"axG",@progbits,_ZNSt6vectorIcSaIcEE6resizeEjRKc,comdat
	.weak	_ZNSt6vectorIcSaIcEE6resizeEjRKc
	.type	_ZNSt6vectorIcSaIcEE6resizeEjRKc, @function
_ZNSt6vectorIcSaIcEE6resizeEjRKc:
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
	movw r28,r24
	ldd r24,Y+4
	ldd r25,Y+5
	cp r24,r22
	cpc r25,r23
	brsh .L46
	movw r14,r20
	movw r16,r22
	ldd r18,Y+2
	ldd r19,Y+3
	cp r18,r22
	cpc r19,r23
	brsh .L47
	movw r24,r22
	adiw r24,8
	cp r18,r24
	cpc r19,r25
	brsh .L47
	ld r12,Y
	ldd r13,Y+1
	std Y+3,r25
	std Y+2,r24
	call _Znwj
	std Y+1,r25
	st Y,r24
	movw r26,r12
.L50:
	movw r24,r26
	sub r24,r12
	sbc r25,r13
	ldd r18,Y+4
	ldd r19,Y+5
	cp r24,r18
	cpc r25,r19
	brsh .L48
	ld r30,Y
	ldd r31,Y+1
	add r30,r24
	adc r31,r25
	sbiw r30,0
	breq .L49
	ld r24,X
	st Z,r24
.L49:
	adiw r26,1
	rjmp .L50
.L48:
	movw r24,r12
	call _ZdlPv
.L47:
	ldd r24,Y+4
	ldd r25,Y+5
.L53:
	cp r24,r16
	cpc r25,r17
	brsh .L51
	ld r30,Y
	ldd r31,Y+1
	add r30,r24
	adc r31,r25
	sbiw r30,0
	breq .L52
	movw r26,r14
	ld r18,X
	st Z,r18
.L52:
	adiw r24,1
	rjmp .L53
.L51:
	std Y+5,r17
	std Y+4,r16
	rjmp .L45
.L46:
	cp r22,r24
	cpc r23,r25
	brsh .L45
	std Y+5,r23
	std Y+4,r22
.L45:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	ret
	.size	_ZNSt6vectorIcSaIcEE6resizeEjRKc, .-_ZNSt6vectorIcSaIcEE6resizeEjRKc
	.section	.text._ZNSsC2ERKSsjjRKSaIcE,"axG",@progbits,_ZNSsC5ERKSsjjRKSaIcE,comdat
	.weak	_ZNSsC2ERKSsjjRKSaIcE
	.type	_ZNSsC2ERKSsjjRKSaIcE, @function
_ZNSsC2ERKSsjjRKSaIcE:
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
	movw r12,r22
	movw r14,r20
	movw r10,r18
	movw r26,r24
	adiw r26,1
	st X,__zero_reg__
	st -X,__zero_reg__
	ldi r24,lo8(8)
	ldi r25,0
	adiw r26,2+1
	st X,r25
	st -X,r24
	sbiw r26,2
	adiw r26,4+1
	st X,__zero_reg__
	st -X,__zero_reg__
	sbiw r26,4
	call _Znwj
	movw r30,r16
	std Z+1,r25
	st Z,r24
	movw r26,r12
	adiw r26,4
	ld r24,X+
	ld r25,X
	sbiw r26,4+1
	cp r24,r14
	cpc r25,r15
	brsh .L62
	ldi r24,0
	ldi r25,0
	call _ZSt20__throw_out_of_rangePKc
.L62:
	movw r30,r12
	ldd r22,Z+4
	ldd r23,Z+5
	std Y+1,__zero_reg__
	sub r22,r14
	sbc r23,r15
	cp r10,r22
	cpc r11,r23
	brsh .L63
	movw r22,r10
.L63:
	movw r20,r28
	subi r20,-1
	sbci r21,-1
	movw r24,r16
	call _ZNSt6vectorIcSaIcEE6resizeEjRKc
	movw r26,r16
	adiw r26,4
	ld r20,X+
	ld r21,X
	sbiw r26,4+1
	movw r26,r12
	ld r30,X+
	ld r31,X
	add r14,r30
	adc r15,r31
	movw r30,r16
	ld r18,Z
	ldd r19,Z+1
	ldi r24,0
	ldi r25,0
	movw r26,r24
	ldi r22,0
	ldi r23,0
.L65:
	cp r24,r20
	cpc r25,r21
	cpc r26,r22
	cpc r27,r23
	brsh .L61
	movw r30,r14
	ld r17,Z+
	movw r14,r30
	movw r30,r18
	st Z+,r17
	movw r18,r30
	adiw r24,1
	adc r26,__zero_reg__
	adc r27,__zero_reg__
	rjmp .L65
.L61:
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
	.size	_ZNSsC2ERKSsjjRKSaIcE, .-_ZNSsC2ERKSsjjRKSaIcE
	.weak	_ZNSsC1ERKSsjjRKSaIcE
	.set	_ZNSsC1ERKSsjjRKSaIcE,_ZNSsC2ERKSsjjRKSaIcE
	.text
.global	_Z8to_lowerSs
	.type	_Z8to_lowerSs, @function
_Z8to_lowerSs:
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
	movw r10,r24
	movw r12,r22
	ldi r16,0
	ldi r17,0
.L68:
	movw r30,r12
	ldd r24,Z+4
	ldd r25,Z+5
	cp r16,r24
	cpc r17,r25
	brsh .L67
	ld r14,Z
	ldd r15,Z+1
	add r14,r16
	adc r15,r17
	movw r30,r14
	ld r24,Z
	mov __tmp_reg__,r24
	lsl r0
	sbc r25,r25
	call tolower
	movw r30,r14
	st Z,r24
	subi r16,-1
	sbci r17,-1
	rjmp .L68
.L67:
	movw r16,r28
	subi r16,-1
	sbci r17,-1
	ldi r18,lo8(-1)
	ldi r19,lo8(-1)
	ldi r20,0
	ldi r21,0
	movw r22,r12
	movw r24,r10
	call _ZNSsC1ERKSsjjRKSaIcE
	movw r24,r10
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
	.size	_Z8to_lowerSs, .-_Z8to_lowerSs
.global	_Z8to_upperSs
	.type	_Z8to_upperSs, @function
_Z8to_upperSs:
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
	movw r10,r24
	movw r12,r22
	ldi r16,0
	ldi r17,0
.L71:
	movw r30,r12
	ldd r24,Z+4
	ldd r25,Z+5
	cp r16,r24
	cpc r17,r25
	brsh .L70
	ld r14,Z
	ldd r15,Z+1
	add r14,r16
	adc r15,r17
	movw r30,r14
	ld r24,Z
	mov __tmp_reg__,r24
	lsl r0
	sbc r25,r25
	call toupper
	movw r30,r14
	st Z,r24
	subi r16,-1
	sbci r17,-1
	rjmp .L71
.L70:
	movw r16,r28
	subi r16,-1
	sbci r17,-1
	ldi r18,lo8(-1)
	ldi r19,lo8(-1)
	ldi r20,0
	ldi r21,0
	movw r22,r12
	movw r24,r10
	call _ZNSsC1ERKSsjjRKSaIcE
	movw r24,r10
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
	.size	_Z8to_upperSs, .-_Z8to_upperSs
	.section	.text._ZNSt6vectorISsSaISsEE6resizeEjRKSs,"axG",@progbits,_ZNSt6vectorISsSaISsEE6resizeEjRKSs,comdat
	.weak	_ZNSt6vectorISsSaISsEE6resizeEjRKSs
	.type	_ZNSt6vectorISsSaISsEE6resizeEjRKSs, @function
_ZNSt6vectorISsSaISsEE6resizeEjRKSs:
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
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
/* stack size = 17 */
.L__stack_usage = 17
	movw r14,r24
	movw r12,r22
	movw r4,r20
	movw r30,r24
	ldd r24,Z+4
	ldd r25,Z+5
	cp r24,r22
	cpc r25,r23
	brlo .+2
	rjmp .L73
	ldd r18,Z+2
	ldd r19,Z+3
	cp r18,r22
	cpc r19,r23
	brsh .L74
	movw r24,r22
	adiw r24,8
	cp r18,r24
	cpc r19,r25
	brsh .L74
	ld r8,Z
	ldd r9,Z+1
	std Z+3,r25
	std Z+2,r24
	ldi r18,lo8(7)
	movw r20,r24
	mul r18,r20
	movw r24,r0
	mul r18,r21
	add r25,r0
	clr __zero_reg__
	call _Znwj
	movw r30,r14
	std Z+1,r25
	st Z,r24
	movw r10,r8
	mov r6,__zero_reg__
	mov r7,__zero_reg__
.L77:
	movw r30,r14
	ldd r24,Z+4
	ldd r25,Z+5
	cp r6,r24
	cpc r7,r25
	brsh .L75
	ld r18,Z
	ldd r19,Z+1
	movw r24,r10
	sub r24,r8
	sbc r25,r9
	add r24,r18
	adc r25,r19
	sbiw r24,0
	breq .L76
	movw r16,r28
	subi r16,-1
	sbci r17,-1
	ldi r18,lo8(-1)
	ldi r19,lo8(-1)
	ldi r20,0
	ldi r21,0
	movw r22,r10
	call _ZNSsC1ERKSsjjRKSaIcE
.L76:
	movw r24,r10
	call _ZNSt6vectorIcSaIcEED2Ev
	ldi r31,-1
	sub r6,r31
	sbc r7,r31
	ldi r20,7
	add r10,r20
	adc r11,__zero_reg__
	rjmp .L77
.L75:
	movw r24,r8
	call _ZdlPv
.L74:
	movw r30,r14
	ldd r10,Z+4
	ldd r11,Z+5
	ldi r24,lo8(7)
	mul r24,r10
	movw r6,r0
	mul r24,r11
	add r7,r0
	clr __zero_reg__
	mov r8,__zero_reg__
	mov r9,__zero_reg__
.L80:
	cp r10,r12
	cpc r11,r13
	brsh .L78
	movw r30,r14
	ld r18,Z
	ldd r19,Z+1
	movw r24,r8
	add r24,r6
	adc r25,r7
	add r24,r18
	adc r25,r19
	sbiw r24,0
	breq .L79
	movw r16,r28
	subi r16,-1
	sbci r17,-1
	ldi r18,lo8(-1)
	ldi r19,lo8(-1)
	ldi r20,0
	ldi r21,0
	movw r22,r4
	call _ZNSsC1ERKSsjjRKSaIcE
.L79:
	ldi r31,-1
	sub r10,r31
	sbc r11,r31
	ldi r20,7
	add r8,r20
	adc r9,__zero_reg__
	rjmp .L80
.L78:
	movw r30,r14
	std Z+5,r13
	std Z+4,r12
	rjmp .L72
.L73:
	cp r22,r24
	cpc r23,r25
	brsh .L72
	ldi r24,lo8(7)
	mul r24,r22
	movw r6,r0
	mul r24,r23
	add r7,r0
	clr __zero_reg__
	movw r8,r22
	mov r10,__zero_reg__
	mov r11,__zero_reg__
.L82:
	movw r30,r14
	ldd r24,Z+4
	ldd r25,Z+5
	cp r8,r24
	cpc r9,r25
	brsh .L78
	movw r24,r6
	add r24,r10
	adc r25,r11
	ld r18,Z
	ldd r19,Z+1
	add r24,r18
	adc r25,r19
	call _ZNSt6vectorIcSaIcEED2Ev
	ldi r31,-1
	sub r8,r31
	sbc r9,r31
	ldi r20,7
	add r10,r20
	adc r11,__zero_reg__
	rjmp .L82
.L72:
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
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	ret
	.size	_ZNSt6vectorISsSaISsEE6resizeEjRKSs, .-_ZNSt6vectorISsSaISsEE6resizeEjRKSs
	.section	.text._ZNSs5eraseEPcS_,"axG",@progbits,_ZNSs5eraseEPcS_,comdat
	.weak	_ZNSs5eraseEPcS_
	.type	_ZNSs5eraseEPcS_, @function
_ZNSs5eraseEPcS_:
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
/* stack size = 7 */
.L__stack_usage = 7
	movw r16,r20
	sub r20,r22
	sbc r21,r23
	movw r30,r16
	movw r14,r16
	sub r14,r20
	sbc r15,r21
.L91:
	movw r26,r24
	adiw r26,4
	ld r22,X+
	ld r23,X
	sbiw r26,4+1
	ld r18,X+
	ld r19,X
	add r18,r22
	adc r19,r23
	cp r30,r18
	cpc r31,r19
	breq .L90
	ld r18,Z+
	movw r26,r14
	st X+,r18
	movw r14,r26
	rjmp .L91
.L90:
	std Y+1,__zero_reg__
	sub r22,r20
	sbc r23,r21
	movw r20,r28
	subi r20,-1
	sbci r21,-1
	call _ZNSt6vectorIcSaIcEE6resizeEjRKc
	movw r24,r16
/* epilogue start */
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	ret
	.size	_ZNSs5eraseEPcS_, .-_ZNSs5eraseEPcS_
	.text
.global	_Z11filterWhiteRSs
	.type	_Z11filterWhiteRSs, @function
_Z11filterWhiteRSs:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	ld r22,Y
	ldd r23,Y+1
	ldd r24,Y+4
	ldd r25,Y+5
	add r24,r22
	adc r25,r23
	movw r20,r22
.L95:
	cp r20,r24
	cpc r21,r25
	breq .L93
	movw r30,r20
	ld r18,Z+
	movw r20,r30
	cpi r18,lo8(32)
	breq .L95
	movw r30,r22
	st Z+,r18
	movw r22,r30
	rjmp .L95
.L93:
	movw r24,r28
	call _ZNSs5eraseEPcS_
	ld r22,Y
	ldd r23,Y+1
	ldd r24,Y+4
	ldd r25,Y+5
	add r24,r22
	adc r25,r23
	movw r20,r22
.L98:
	cp r20,r24
	cpc r21,r25
	breq .L96
	movw r30,r20
	ld r18,Z+
	movw r20,r30
	cpi r18,lo8(9)
	breq .L98
	movw r30,r22
	st Z+,r18
	movw r22,r30
	rjmp .L98
.L96:
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	jmp _ZNSs5eraseEPcS_
	.size	_Z11filterWhiteRSs, .-_Z11filterWhiteRSs
	.section	.text._Z5ltrimRSs,"axG",@progbits,_Z5ltrimRSs,comdat
	.weak	_Z5ltrimRSs
	.type	_Z5ltrimRSs, @function
_Z5ltrimRSs:
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
	movw r14,r24
	mov r12,__zero_reg__
	mov r13,__zero_reg__
.L109:
	movw r30,r14
	ld r10,Z
	ldd r11,Z+1
	movw r30,r10
	add r30,r12
	adc r31,r13
	ld r25,Z
	subi r25,lo8(-(-32))
	cpi r25,lo8(95)
	brlo .L112
	movw r24,r30
	call _Z11isBlankCharRc
	tst r24
	breq .L112
	movw r30,r14
	ldd r16,Z+4
	ldd r17,Z+5
	movw r22,r16
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .L108
	ldi r22,lo8(1)
	ldi r23,0
.L108:
	sub r16,r22
	sbc r17,r23
	add r22,r10
	adc r23,r11
	movw r20,r16
	movw r24,r10
	call memmove
	std Y+1,__zero_reg__
	movw r20,r28
	subi r20,-1
	sbci r21,-1
	movw r22,r16
	movw r24,r14
	call _ZNSt6vectorIcSaIcEE6resizeEjRKc
	ldi r31,-1
	sub r12,r31
	sbc r13,r31
	rjmp .L109
.L112:
	movw r24,r14
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
	.size	_Z5ltrimRSs, .-_Z5ltrimRSs
	.text
.global	_Z4trimRSs
	.type	_Z4trimRSs, @function
_Z4trimRSs:
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
/* stack size = 9 */
.L__stack_usage = 9
	movw r12,r24
	movw r14,r22
	movw r30,r22
	ld r16,Z
	ldd r17,Z+1
	ldd r24,Z+4
	ldd r25,Z+5
	add r16,r24
	adc r17,r25
.L120:
	subi r16,1
	sbc r17,__zero_reg__
	movw r30,r16
	ld r24,Z
	subi r24,lo8(-(-32))
	cpi r24,lo8(95)
	brlo .L117
	movw r24,r16
	call _Z11isBlankCharRc
	tst r24
	breq .L117
	movw r30,r14
	ldd r18,Z+4
	ldd r19,Z+5
	movw r24,r18
	sbiw r24,1
	cp r24,r18
	cpc r25,r19
	brsh .L120
	std Z+5,r25
	std Z+4,r24
	rjmp .L120
.L117:
	movw r24,r14
	call _Z5ltrimRSs
	movw r16,r28
	subi r16,-1
	sbci r17,-1
	ldi r18,lo8(-1)
	ldi r19,lo8(-1)
	ldi r20,0
	ldi r21,0
	movw r22,r24
	movw r24,r12
	call _ZNSsC1ERKSsjjRKSaIcE
	movw r24,r12
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
	ret
	.size	_Z4trimRSs, .-_Z4trimRSs
	.section	.text._ZNSsC2EPKcjRKSaIcE,"axG",@progbits,_ZNSsC5EPKcjRKSaIcE,comdat
	.weak	_ZNSsC2EPKcjRKSaIcE
	.type	_ZNSsC2EPKcjRKSaIcE, @function
_ZNSsC2EPKcjRKSaIcE:
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
/* stack size = 9 */
.L__stack_usage = 9
	movw r16,r24
	movw r14,r22
	movw r12,r20
	movw r26,r24
	adiw r26,1
	st X,__zero_reg__
	st -X,__zero_reg__
	ldi r24,lo8(8)
	ldi r25,0
	adiw r26,2+1
	st X,r25
	st -X,r24
	sbiw r26,2
	adiw r26,4+1
	st X,__zero_reg__
	st -X,__zero_reg__
	sbiw r26,4
	call _Znwj
	movw r30,r16
	std Z+1,r25
	st Z,r24
	ldi r31,-1
	cp r12,r31
	cpc r13,r31
	brne .L125
	ldi r24,0
	ldi r25,0
	call _ZSt20__throw_out_of_rangePKc
.L125:
	cp r14,__zero_reg__
	cpc r15,__zero_reg__
	breq .L124
	std Y+1,__zero_reg__
	movw r20,r28
	subi r20,-1
	sbci r21,-1
	movw r22,r12
	movw r24,r16
	call _ZNSt6vectorIcSaIcEE6resizeEjRKc
	movw r26,r16
	adiw r26,4
	ld r20,X+
	ld r21,X
	sbiw r26,4+1
	ld r16,X+
	ld r17,X
	ldi r24,0
	ldi r25,0
	movw r26,r24
	ldi r22,0
	ldi r23,0
.L127:
	cp r24,r20
	cpc r25,r21
	cpc r26,r22
	cpc r27,r23
	brsh .L124
	movw r30,r14
	ld r18,Z+
	movw r14,r30
	movw r30,r16
	st Z+,r18
	movw r16,r30
	adiw r24,1
	adc r26,__zero_reg__
	adc r27,__zero_reg__
	rjmp .L127
.L124:
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
	ret
	.size	_ZNSsC2EPKcjRKSaIcE, .-_ZNSsC2EPKcjRKSaIcE
	.weak	_ZNSsC1EPKcjRKSaIcE
	.set	_ZNSsC1EPKcjRKSaIcE,_ZNSsC2EPKcjRKSaIcE
	.text
.global	_Z5splitRKSsc
	.type	_Z5splitRKSsc, @function
_Z5splitRKSsc:
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
	sbiw r28,8
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 8 */
/* stack size = 21 */
.L__stack_usage = 21
	movw r12,r24
	movw r10,r22
	mov r7,r20
	movw r26,r24
	adiw r26,1
	st X,__zero_reg__
	st -X,__zero_reg__
	ldi r24,lo8(8)
	ldi r25,0
	adiw r26,2+1
	st X,r25
	st -X,r24
	sbiw r26,2
	adiw r26,4+1
	st X,__zero_reg__
	st -X,__zero_reg__
	sbiw r26,4
	ldi r24,lo8(56)
	ldi r25,0
	call _Znwj
	movw r30,r12
	std Z+1,r25
	st Z,r24
	movw r26,r10
	adiw r26,4
	ld r24,X+
	ld r25,X
	sbiw r26,4+1
	ldi r16,0
	ldi r17,0
.L135:
	cp r24,r16
	cpc r25,r17
	brne .L132
	ldi r16,lo8(-1)
	ldi r17,lo8(-1)
.L134:
	mov r14,__zero_reg__
	mov r15,__zero_reg__
	rjmp .L133
.L132:
	movw r26,r10
	ld r30,X+
	ld r31,X
	add r30,r16
	adc r31,r17
	ld r18,Z
	cp r7,r18
	breq .L134
	subi r16,-1
	sbci r17,-1
	rjmp .L135
.L145:
	movw r8,r16
	sub r8,r14
	sbc r9,r15
	cp r24,r14
	cpc r25,r15
	brsh .L137
	ldi r24,0
	ldi r25,0
	call _ZSt20__throw_out_of_rangePKc
.L137:
	movw r26,r10
	adiw r26,4
	ld r24,X+
	ld r25,X
	sbiw r26,4+1
	sub r24,r14
	sbc r25,r15
	movw r20,r8
	cp r24,r8
	cpc r25,r9
	brsh .L138
	movw r20,r24
.L138:
	movw r30,r10
	ld r22,Z
	ldd r23,Z+1
	add r22,r14
	adc r23,r15
	movw r18,r28
	subi r18,-8
	sbci r19,-1
	movw r24,r28
	adiw r24,1
	call _ZNSsC1EPKcjRKSaIcE
	movw r26,r12
	adiw r26,4
	ld r22,X+
	ld r23,X
	sbiw r26,4+1
	subi r22,-1
	sbci r23,-1
	movw r20,r28
	subi r20,-1
	sbci r21,-1
	movw r24,r12
	call _ZNSt6vectorISsSaISsEE6resizeEjRKSs
	movw r24,r28
	adiw r24,1
	call _ZNSt6vectorIcSaIcEED2Ev
	movw r14,r16
	ldi r27,-1
	sub r14,r27
	sbc r15,r27
	movw r30,r10
	ldd r24,Z+4
	ldd r25,Z+5
	movw r16,r14
.L140:
	cp r16,r24
	cpc r17,r25
	brlo .L144
	ldi r16,lo8(-1)
	ldi r17,lo8(-1)
.L133:
	movw r30,r10
	ldd r24,Z+4
	ldd r25,Z+5
	cpi r16,-1
	ldi r31,-1
	cpc r17,r31
	breq .+2
	rjmp .L145
	rjmp .L136
.L144:
	movw r26,r10
	ld r30,X+
	ld r31,X
	add r30,r16
	adc r31,r17
	ld r18,Z
	cp r7,r18
	breq .L133
	subi r16,-1
	sbci r17,-1
	rjmp .L140
.L136:
	movw r16,r14
	com r16
	com r17
	cp r24,r14
	cpc r25,r15
	brsh .L141
	ldi r24,0
	ldi r25,0
	call _ZSt20__throw_out_of_rangePKc
.L141:
	movw r30,r10
	ldd r24,Z+4
	ldd r25,Z+5
	sub r24,r14
	sbc r25,r15
	movw r20,r16
	cp r24,r16
	cpc r25,r17
	brsh .L142
	movw r20,r24
.L142:
	movw r26,r10
	ld r22,X+
	ld r23,X
	add r22,r14
	adc r23,r15
	movw r18,r28
	subi r18,-8
	sbci r19,-1
	movw r24,r28
	adiw r24,1
	call _ZNSsC1EPKcjRKSaIcE
	movw r30,r12
	ldd r22,Z+4
	ldd r23,Z+5
	subi r22,-1
	sbci r23,-1
	movw r20,r28
	subi r20,-1
	sbci r21,-1
	movw r24,r12
	call _ZNSt6vectorISsSaISsEE6resizeEjRKSs
	movw r24,r28
	adiw r24,1
	call _ZNSt6vectorIcSaIcEED2Ev
	movw r24,r12
/* epilogue start */
	adiw r28,8
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
	ret
	.size	_Z5splitRKSsc, .-_Z5splitRKSsc
	.ident	"GCC: (GNU) 5.4.0"
.global __do_copy_data
