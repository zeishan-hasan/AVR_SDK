	.file	"portmanager.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	_ZN3PinD2Ev
	.type	_ZN3PinD2Ev, @function
_ZN3PinD2Ev:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_ZN3PinD2Ev, .-_ZN3PinD2Ev
.global	_ZN3PinD1Ev
	.set	_ZN3PinD1Ev,_ZN3PinD2Ev
.global	_ZN3Pin2onEv
	.type	_ZN3Pin2onEv, @function
_ZN3Pin2onEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r26,r24
	adiw r26,2
	ld r30,X+
	ld r31,X
	sbiw r26,2+1
	ld r20,Z
	ldi r18,lo8(1)
	ldi r19,0
	movw r24,r18
	adiw r26,8
	ld r0,X
	rjmp 2f
	1:
	lsl r24
	rol r25
	2:
	dec r0
	brpl 1b
	or r24,r20
	st Z,r24
	ret
	.size	_ZN3Pin2onEv, .-_ZN3Pin2onEv
.global	_ZN3Pin8setStateEb
	.type	_ZN3Pin8setStateEb, @function
_ZN3Pin8setStateEb:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r26,r24
	adiw r26,2
	ld r30,X+
	ld r31,X
	sbiw r26,2+1
	adiw r26,8
	ld r19,X
	ld r18,Z
	ldi r24,lo8(1)
	ldi r25,0
	rjmp 2f
	1:
	lsl r24
	2:
	dec r19
	brpl 1b
	tst r22
	breq .L4
	or r24,r18
	rjmp .L6
.L4:
	com r24
	and r24,r18
.L6:
	st Z,r24
	ret
	.size	_ZN3Pin8setStateEb, .-_ZN3Pin8setStateEb
.global	_ZN3Pin3offEv
	.type	_ZN3Pin3offEv, @function
_ZN3Pin3offEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r26,r24
	adiw r26,2
	ld r30,X+
	ld r31,X
	sbiw r26,2+1
	ld r20,Z
	ldi r18,lo8(1)
	ldi r19,0
	movw r22,r18
	adiw r26,8
	ld r0,X
	rjmp 2f
	1:
	lsl r22
	rol r23
	2:
	dec r0
	brpl 1b
	movw r24,r22
	com r24
	and r24,r20
	st Z,r24
	ret
	.size	_ZN3Pin3offEv, .-_ZN3Pin3offEv
.global	_ZN3Pin6toggleEv
	.type	_ZN3Pin6toggleEv, @function
_ZN3Pin6toggleEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r26,r24
	adiw r26,2
	ld r30,X+
	ld r31,X
	sbiw r26,2+1
	ld r20,Z
	ldi r18,lo8(1)
	ldi r19,0
	movw r24,r18
	adiw r26,8
	ld r0,X
	rjmp 2f
	1:
	lsl r24
	rol r25
	2:
	dec r0
	brpl 1b
	eor r24,r20
	st Z,r24
	ret
	.size	_ZN3Pin6toggleEv, .-_ZN3Pin6toggleEv
.global	_ZN3Pin12setDirectionE4DDRx
	.type	_ZN3Pin12setDirectionE4DDRx, @function
_ZN3Pin12setDirectionE4DDRx:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r26,r24
	ld r30,X+
	ld r31,X
	sbiw r26,1
	adiw r26,8
	ld r21,X
	cpi r22,lo8(1)
	brne .L11
	ld r18,Z
	ldi r24,lo8(1)
	ldi r25,0
	rjmp 2f
	1:
	lsl r24
	2:
	dec r21
	brpl 1b
	or r24,r18
	st Z,r24
	ret
.L11:
	ld r20,Z
	ldi r18,lo8(1)
	ldi r19,0
	rjmp 2f
	1:
	lsl r18
	2:
	dec r21
	brpl 1b
	com r18
	and r18,r20
	st Z,r18
	cpi r22,lo8(2)
	brne .L10
	jmp _ZN3Pin2onEv
.L10:
	ret
	.size	_ZN3Pin12setDirectionE4DDRx, .-_ZN3Pin12setDirectionE4DDRx
	.section	.rodata
.LC0:
	.word	36
	.word	128
	.word	176
	.word	144
	.word	160
	.word	288
.LC1:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	2048
	.word	2049
	.word	2050
	.word	2051
	.word	2052
	.word	2053
	.word	2054
	.word	2055
	.text
.global	_ZN3PinC2Eh4DDRx
	.type	_ZN3PinC2Eh4DDRx, @function
_ZN3PinC2Eh4DDRx:
	push r16
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,44
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 44 */
/* stack size = 48 */
.L__stack_usage = 48
	ldi r18,lo8(-1)
	ldi r19,lo8(-1)
	movw r26,r24
	adiw r26,6+1
	st X,r19
	st -X,r18
	sbiw r26,6
	ldi r18,lo8(-1)
	ldi r19,0
	adiw r26,10+1
	st X,r19
	st -X,r18
	sbiw r26,10
	adiw r26,12+1
	st X,r19
	st -X,r18
	sbiw r26,12
	adiw r26,14+1
	st X,r19
	st -X,r18
	sbiw r26,14
	adiw r26,16+1
	st X,r19
	st -X,r18
	sbiw r26,16
	adiw r26,18+1
	st X,r19
	st -X,r18
	sbiw r26,18
	adiw r26,20+1
	st X,r19
	st -X,r18
	sbiw r26,20
	adiw r26,22+1
	st X,r19
	st -X,r18
	sbiw r26,22
	adiw r26,24+1
	st X,r19
	st -X,r18
	sbiw r26,24
	adiw r26,26+1
	st X,r19
	st -X,r18
	sbiw r26,26
	adiw r26,28+1
	st X,r19
	st -X,r18
	sbiw r26,28
	ldi r18,lo8(12)
	ldi r30,lo8(.LC0)
	ldi r31,hi8(.LC0)
	movw r26,r28
	adiw r26,33
	0:
	ld r0,Z+
	st X+,r0
	dec r18
	brne 0b
	ldi r18,lo8(32)
	ldi r30,lo8(.LC1)
	ldi r31,hi8(.LC1)
	movw r26,r28
	adiw r26,1
	0:
	ld r0,Z+
	st X+,r0
	dec r18
	brne 0b
	ldi r27,lo8(5)
	mul r22,r27
	movw r18,r0
	clr __zero_reg__
	movw r30,r18
	subi r30,lo8(-(_ZL16_flashMappedPort))
	sbci r31,hi8(-(_ZL16_flashMappedPort))
/* #APP */
 ;  27 "libs/gpio/portmanager/portmanager.cpp" 1
	lpm r26, Z+
	lpm r27, Z
	
 ;  0 "" 2
/* #NOAPP */
	movw r30,r24
	std Z+5,r27
	std Z+4,r26
	movw r16,r26
	subi r16,-1
	sbci r17,-1
	std Z+1,r17
	st Z,r16
	adiw r26,2
	std Z+3,r27
	std Z+2,r26
	movw r30,r18
	subi r30,lo8(-(_ZL16_flashMappedPort+2))
	sbci r31,hi8(-(_ZL16_flashMappedPort+2))
/* #APP */
 ;  30 "libs/gpio/portmanager/portmanager.cpp" 1
	lpm r30, Z
	
 ;  0 "" 2
/* #NOAPP */
	movw r26,r24
	adiw r26,8
	st X,r30
	subi r18,lo8(-(_ZL16_flashMappedPort+3))
	sbci r19,hi8(-(_ZL16_flashMappedPort+3))
	movw r30,r18
/* #APP */
 ;  31 "libs/gpio/portmanager/portmanager.cpp" 1
	lpm r26, Z+
	lpm r27, Z
	
 ;  0 "" 2
/* #NOAPP */
	movw r30,r24
	std Z+35,r27
	std Z+34,r26
	std Z+36,r22
	movw r30,r18
/* #APP */
 ;  33 "libs/gpio/portmanager/portmanager.cpp" 1
	lpm r22, Z+
	lpm r23, Z
	
 ;  0 "" 2
/* #NOAPP */
	movw r30,r18
	sbrs r23,5
	rjmp .L14
/* #APP */
 ;  34 "libs/gpio/portmanager/portmanager.cpp" 1
	lpm r18, Z+
	lpm r19, Z
	
 ;  0 "" 2
/* #NOAPP */
	ldi r21,lo8(3)
	movw r26,r24
	adiw r26,9
	st X,r21
	sbiw r26,9
	movw r30,r18
	clr r30
	andi r31,28
	mov r30,r31
	clr r31
	lsr r30
	ldi r18,lo8(1)
	ldi r19,0
	add r18,r28
	adc r19,r29
	add r30,r18
	adc r31,r19
	ldd r18,Z+32
	ldd r19,Z+33
	adiw r26,10+1
	st X,r19
	st -X,r18
	sbiw r26,10
	movw r22,r18
	subi r22,-1
	sbci r23,-1
	adiw r26,12+1
	st X,r23
	st -X,r22
	sbiw r26,12
	subi r22,-1
	sbci r23,-1
	adiw r26,18+1
	st X,r23
	st -X,r22
	sbiw r26,18
	subi r22,-2
	sbci r23,-1
	adiw r26,14+1
	st X,r23
	st -X,r22
	sbiw r26,14
	subi r18,-6
	sbci r19,-1
	adiw r26,20+1
	st X,r19
	st -X,r18
	sbiw r26,20
	rjmp .L15
.L14:
/* #APP */
 ;  54 "libs/gpio/portmanager/portmanager.cpp" 1
	lpm r21, Z
	
 ;  0 "" 2
/* #NOAPP */
	sbrs r21,7
	rjmp .L15
	ldi r21,lo8(4)
	movw r26,r24
	adiw r26,9
	st X,r21
	sbiw r26,9
/* #APP */
 ;  56 "libs/gpio/portmanager/portmanager.cpp" 1
	lpm r18, Z+
	lpm r19, Z
	
 ;  0 "" 2
/* #NOAPP */
	movw r30,r18
	andi r30,120
	clr r31
	lsr r31
	ror r30
	lsr r31
	ror r30
	ldi r18,lo8(1)
	ldi r19,0
	add r18,r28
	adc r19,r29
	add r30,r18
	adc r31,r19
	ld r18,Z
	ldd r19,Z+1
	adiw r26,6+1
	st X,r19
	st -X,r18
	sbiw r26,6
.L15:
	mov r22,r20
/* epilogue start */
	adiw r28,44
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	pop r16
	jmp _ZN3Pin12setDirectionE4DDRx
	.size	_ZN3PinC2Eh4DDRx, .-_ZN3PinC2Eh4DDRx
.global	_ZN3PinC1Eh4DDRx
	.set	_ZN3PinC1Eh4DDRx,_ZN3PinC2Eh4DDRx
.global	__floatunsisf
.global	__divsf3
.global	__fixunssfsi
.global	__mulsf3
.global	__subsf3
.global	_ZN3Pin6setPWMEmh
	.type	_ZN3Pin6setPWMEmh, @function
_ZN3Pin6setPWMEmh:
	push r8
	push r9
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
/* stack size = 11 */
.L__stack_usage = 11
	movw r28,r24
	ldd r24,Y+9
	cpi r24,lo8(3)
	breq .+2
	rjmp .L24
	mov r17,r18
	movw r24,r22
	movw r22,r20
	call __floatunsisf
	movw r18,r22
	movw r20,r24
	ldi r22,0
	ldi r23,0
	ldi r24,lo8(-128)
	ldi r25,lo8(63)
	call __divsf3
	ldi r18,lo8(-67)
	ldi r19,lo8(55)
	ldi r20,lo8(-122)
	ldi r21,lo8(51)
	call __divsf3
	call __fixunssfsi
	movw r12,r22
	movw r14,r24
	std Y+31,r23
	std Y+30,r22
	ldi r24,0
	ldi r25,0
	call __floatunsisf
	movw r8,r22
	movw r10,r24
	mov r22,r17
	ldi r23,0
	ldi r24,0
	ldi r25,0
	call __floatunsisf
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(-56)
	ldi r21,lo8(66)
	call __divsf3
	movw r20,r10
	movw r18,r8
	call __mulsf3
	movw r18,r22
	movw r20,r24
	movw r24,r10
	movw r22,r8
	call __subsf3
	call __fixunssfsi
	std Y+33,r23
	std Y+32,r22
	ldd r30,Y+20
	ldd r31,Y+21
	std Z+1,r13
	st Z,r12
	ldd r24,Y+34
	ldd r25,Y+35
	clr r24
	andi r25,3
	mov r24,r25
	clr r25
	ldd r26,Y+10
	ldd r27,Y+11
	cpi r24,1
	cpc r25,__zero_reg__
	breq .L20
	brlo .L21
	sbiw r24,2
	brne .L19
	adiw r30,6
	std Y+17,r31
	std Y+16,r30
	ld r24,X
	ori r24,lo8(12)
	rjmp .L25
.L21:
	adiw r30,2
	std Y+17,r31
	std Y+16,r30
	ld r24,X
	ori r24,lo8(-64)
	rjmp .L25
.L20:
	adiw r30,4
	std Y+17,r31
	std Y+16,r30
	ld r24,X
	ori r24,lo8(48)
.L25:
	st X,r24
.L19:
	ldd r30,Y+16
	ldd r31,Y+17
	ldd r24,Y+32
	ldd r25,Y+33
	std Z+1,r25
	st Z,r24
	ldd r30,Y+10
	ldd r31,Y+11
	ld r24,Z
	ori r24,lo8(2)
	st Z,r24
	ldd r30,Y+12
	ldd r31,Y+13
	ld r24,Z
	ori r24,lo8(24)
	st Z,r24
	ldd r30,Y+12
	ldd r31,Y+13
	ld r24,Z
	ori r24,lo8(1)
	st Z,r24
	ldi r24,lo8(1)
	rjmp .L17
.L24:
	ldi r24,0
.L17:
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
	pop r9
	pop r8
	ret
	.size	_ZN3Pin6setPWMEmh, .-_ZN3Pin6setPWMEmh
.global	__floatsisf
.global	__addsf3
.global	_ZN3Pin7setDutyEh
	.type	_ZN3Pin7setDutyEh, @function
_ZN3Pin7setDutyEh:
	push r12
	push r13
	push r14
	push r15
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 7 */
.L__stack_usage = 7
	movw r28,r24
	mov r17,r22
	ldd r24,Y+9
	cpi r24,lo8(2)
	breq .L28
	cpi r24,lo8(3)
	breq .+2
	rjmp .L33
	ldd r22,Y+30
	ldd r23,Y+31
	ldi r24,0
	ldi r25,0
	call __floatunsisf
	movw r12,r22
	movw r14,r24
	mov r22,r17
	ldi r23,0
	ldi r24,0
	ldi r25,0
	call __floatunsisf
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(-56)
	ldi r21,lo8(66)
	call __divsf3
	movw r20,r14
	movw r18,r12
	call __mulsf3
	movw r18,r22
	movw r20,r24
	movw r24,r14
	movw r22,r12
	call __subsf3
	call __fixunssfsi
	std Y+33,r23
	std Y+32,r22
	ldd r30,Y+16
	ldd r31,Y+17
	std Z+1,r23
	st Z,r22
	rjmp .L32
.L28:
	ldi r23,0
	ldi r24,0
	ldi r25,0
	call __floatsisf
	ldi r18,lo8(51)
	ldi r19,lo8(51)
	ldi r20,lo8(35)
	ldi r21,lo8(-64)
	call __mulsf3
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(127)
	ldi r21,lo8(67)
	call __addsf3
	call __fixunssfsi
	std Y+32,r22
	std Y+33,r23
	ldd r30,Y+28
	ldd r31,Y+29
	st Z,r22
.L32:
	ldi r24,lo8(1)
	rjmp .L27
.L33:
	ldi r24,0
.L27:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r15
	pop r14
	pop r13
	pop r12
	ret
	.size	_ZN3Pin7setDutyEh, .-_ZN3Pin7setDutyEh
.global	_ZN3Pin7setFreqEj
	.type	_ZN3Pin7setFreqEj, @function
_ZN3Pin7setFreqEj:
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 10 */
.L__stack_usage = 10
	movw r28,r24
	movw r14,r22
	ldd r24,Y+30
	ldd r25,Y+31
	ldd r22,Y+32
	ldd r23,Y+33
	call __udivmodhi4
	ldi r24,0
	ldi r25,0
	call __floatunsisf
	movw r8,r22
	movw r10,r24
	movw r22,r14
	ldi r24,0
	ldi r25,0
	call __floatunsisf
	movw r18,r22
	movw r20,r24
	ldi r22,0
	ldi r23,0
	ldi r24,lo8(-128)
	ldi r25,lo8(63)
	call __divsf3
	ldi r18,lo8(-67)
	ldi r19,lo8(55)
	ldi r20,lo8(-122)
	ldi r21,lo8(51)
	call __divsf3
	call __fixunssfsi
	movw r12,r22
	movw r14,r24
	std Y+31,r23
	std Y+30,r22
	ldi r24,0
	ldi r25,0
	call __floatunsisf
	movw r20,r10
	movw r18,r8
	call __divsf3
	call __fixunssfsi
	std Y+33,r23
	std Y+32,r22
	ldd r24,Y+9
	cpi r24,lo8(3)
	brne .L38
	ldd r30,Y+20
	ldd r31,Y+21
	std Z+1,r13
	st Z,r12
	ldd r30,Y+16
	ldd r31,Y+17
	ldd r24,Y+32
	ldd r25,Y+33
	std Z+1,r25
	st Z,r24
	ldi r24,lo8(1)
	rjmp .L35
.L38:
	ldi r24,0
.L35:
/* epilogue start */
	pop r29
	pop r28
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	ret
	.size	_ZN3Pin7setFreqEj, .-_ZN3Pin7setFreqEj
.global	_ZN3Pin11digitalReadEv
	.type	_ZN3Pin11digitalReadEv, @function
_ZN3Pin11digitalReadEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r26,r24
	adiw r26,4
	ld r30,X+
	ld r31,X
	sbiw r26,4+1
	ld r18,Z
	ldi r19,0
	movw r30,r18
	adiw r26,8
	ld r0,X
	rjmp 2f
	1:
	asr r31
	ror r30
	2:
	dec r0
	brpl 1b
	movw r24,r30
	andi r24,lo8(1)
	ret
	.size	_ZN3Pin11digitalReadEv, .-_ZN3Pin11digitalReadEv
.global	_ZN3Pin10analogReadE6_ADMUX17_ADCSRA_PRESCALER19_ADCSRB_AUTOTRIGGER
	.type	_ZN3Pin10analogReadE6_ADMUX17_ADCSRA_PRESCALER19_ADCSRB_AUTOTRIGGER, @function
_ZN3Pin10analogReadE6_ADMUX17_ADCSRA_PRESCALER19_ADCSRB_AUTOTRIGGER:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldd r19,Z+9
	tst r19
	breq .L44
	ldd r24,Z+6
	ldd r25,Z+7
	cpi r24,-1
	ldi r31,-1
	cpc r25,r31
	breq .L41
	ldi r23,0
	or r23,r18
	or r24,r22
	or r25,r23
	lds r18,122
	cpse r18,__zero_reg__
	rjmp .L42
	lds r18,122
	ori r18,lo8(-128)
	or r20,r18
	sts 122,r20
.L42:
	lds r18,122
	sts 123,r25
	sts 124,r24
	lds r24,122
	ori r24,lo8(64)
	sts 122,r24
.L43:
	lds r24,122
	sbrc r24,6
	rjmp .L43
	lds r24,120
	lds r25,120+1
	ret
.L44:
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
.L41:
	ret
	.size	_ZN3Pin10analogReadE6_ADMUX17_ADCSRA_PRESCALER19_ADCSRB_AUTOTRIGGER, .-_ZN3Pin10analogReadE6_ADMUX17_ADCSRA_PRESCALER19_ADCSRB_AUTOTRIGGER
.global	_ZN3Pin10getPinDataEv
	.type	_ZN3Pin10getPinDataEv, @function
_ZN3Pin10getPinDataEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_ZN3Pin10getPinDataEv, .-_ZN3Pin10getPinDataEv
.global	_ZN3Pin12getPinNumberEv
	.type	_ZN3Pin12getPinNumberEv, @function
_ZN3Pin12getPinNumberEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldd r24,Z+36
	ret
	.size	_ZN3Pin12getPinNumberEv, .-_ZN3Pin12getPinNumberEv
.global	_ZN3Pin6getPWMEv
	.type	_ZN3Pin6getPWMEv, @function
_ZN3Pin6getPWMEv:
	push r12
	push r13
	push r14
	push r15
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r28,r24
	ldd r22,Y+30
	ldd r23,Y+31
	ldi r24,0
	ldi r25,0
	call __floatunsisf
	movw r12,r22
	movw r14,r24
	ldd r22,Y+32
	ldd r23,Y+33
	ldi r24,0
	ldi r25,0
	call __floatunsisf
	movw r18,r22
	movw r20,r24
	movw r24,r14
	movw r22,r12
	call __subsf3
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(-56)
	ldi r21,lo8(66)
	call __mulsf3
	movw r20,r14
	movw r18,r12
	call __divsf3
	call __fixunssfsi
	mov r24,r22
/* epilogue start */
	pop r29
	pop r28
	pop r15
	pop r14
	pop r13
	pop r12
	ret
	.size	_ZN3Pin6getPWMEv, .-_ZN3Pin6getPWMEv
.global	_ZN3Pin14getRegisterBitEv
	.type	_ZN3Pin14getRegisterBitEv, @function
_ZN3Pin14getRegisterBitEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldd r24,Z+8
	ret
	.size	_ZN3Pin14getRegisterBitEv, .-_ZN3Pin14getRegisterBitEv
.global	_ZN3Pin11getPINxAddrEv
	.type	_ZN3Pin11getPINxAddrEv, @function
_ZN3Pin11getPINxAddrEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldd r24,Z+4
	ldd r25,Z+5
	ret
	.size	_ZN3Pin11getPINxAddrEv, .-_ZN3Pin11getPINxAddrEv
.global	_ZN3Pin14calculateTicksEm
	.type	_ZN3Pin14calculateTicksEm, @function
_ZN3Pin14calculateTicksEm:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r24,r22
	movw r22,r20
	call __floatunsisf
	movw r18,r22
	movw r20,r24
	ldi r22,0
	ldi r23,0
	ldi r24,lo8(-128)
	ldi r25,lo8(63)
	call __divsf3
	ldi r18,lo8(-67)
	ldi r19,lo8(55)
	ldi r20,lo8(-122)
	ldi r21,lo8(51)
	call __divsf3
	call __fixunssfsi
	movw r24,r22
	ret
	.size	_ZN3Pin14calculateTicksEm, .-_ZN3Pin14calculateTicksEm
	.section	.progmem.data,"a",@progbits
	.type	_ZL16_flashMappedPort, @object
	.size	_ZL16_flashMappedPort, 350
_ZL16_flashMappedPort:
	.word	44
	.byte	0
	.word	4
	.word	44
	.byte	1
	.word	4
	.word	44
	.byte	4
	.word	11520
	.word	44
	.byte	5
	.word	11776
	.word	50
	.byte	5
	.word	8448
	.word	44
	.byte	3
	.word	11264
	.word	256
	.byte	3
	.word	12288
	.word	256
	.byte	4
	.word	12544
	.word	256
	.byte	5
	.word	12800
	.word	256
	.byte	6
	.word	10496
	.word	35
	.byte	4
	.word	10240
	.word	35
	.byte	5
	.word	9216
	.word	35
	.byte	6
	.word	9472
	.word	35
	.byte	7
	.word	9728
	.word	259
	.byte	1
	.word	7
	.word	259
	.byte	0
	.word	7
	.word	256
	.byte	1
	.word	6
	.word	256
	.byte	0
	.word	6
	.word	41
	.byte	3
	.word	5
	.word	41
	.byte	2
	.word	5
	.word	41
	.byte	1
	.word	0
	.word	41
	.byte	0
	.word	0
	.word	32
	.byte	0
	.word	0
	.word	32
	.byte	1
	.word	0
	.word	32
	.byte	2
	.word	0
	.word	32
	.byte	3
	.word	0
	.word	32
	.byte	4
	.word	0
	.word	32
	.byte	5
	.word	0
	.word	32
	.byte	6
	.word	0
	.word	32
	.byte	7
	.word	0
	.word	38
	.byte	7
	.word	0
	.word	38
	.byte	6
	.word	0
	.word	38
	.byte	5
	.word	0
	.word	38
	.byte	4
	.word	0
	.word	38
	.byte	3
	.word	0
	.word	38
	.byte	2
	.word	0
	.word	38
	.byte	1
	.word	0
	.word	38
	.byte	0
	.word	0
	.word	41
	.byte	7
	.word	0
	.word	50
	.byte	2
	.word	0
	.word	50
	.byte	1
	.word	0
	.word	50
	.byte	0
	.word	0
	.word	265
	.byte	7
	.word	0
	.word	265
	.byte	6
	.word	0
	.word	265
	.byte	5
	.word	13824
	.word	265
	.byte	4
	.word	13568
	.word	265
	.byte	3
	.word	13312
	.word	265
	.byte	2
	.word	0
	.word	265
	.byte	1
	.word	0
	.word	265
	.byte	0
	.word	0
	.word	35
	.byte	3
	.word	0
	.word	35
	.byte	2
	.word	0
	.word	35
	.byte	1
	.word	0
	.word	35
	.byte	0
	.word	0
	.word	47
	.byte	0
	.word	128
	.word	47
	.byte	1
	.word	136
	.word	47
	.byte	2
	.word	144
	.word	47
	.byte	3
	.word	152
	.word	47
	.byte	4
	.word	160
	.word	47
	.byte	5
	.word	168
	.word	47
	.byte	6
	.word	176
	.word	47
	.byte	7
	.word	184
	.word	262
	.byte	0
	.word	192
	.word	262
	.byte	1
	.word	200
	.word	262
	.byte	2
	.word	208
	.word	262
	.byte	3
	.word	216
	.word	262
	.byte	4
	.word	224
	.word	262
	.byte	5
	.word	232
	.word	262
	.byte	6
	.word	240
	.word	262
	.byte	7
	.word	248
	.ident	"GCC: (GNU) 5.4.0"
.global __do_copy_data
