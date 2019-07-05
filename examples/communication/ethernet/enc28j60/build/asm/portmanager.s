	.file	"portmanager.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
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
	ld r30,X+
	ld r31,X
	sbiw r26,1
	ldd r20,Z+2
	ldi r18,lo8(1)
	ldi r19,0
	movw r24,r18
	adiw r26,4
	ld r0,X
	rjmp 2f
	1:
	lsl r24
	rol r25
	2:
	dec r0
	brpl 1b
	or r24,r20
	std Z+2,r24
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
	ld r30,X+
	ld r31,X
	sbiw r26,1
	adiw r26,4
	ld r19,X
	ldd r18,Z+2
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
	std Z+2,r24
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
	ld r30,X+
	ld r31,X
	sbiw r26,1
	ldd r20,Z+2
	ldi r18,lo8(1)
	ldi r19,0
	movw r22,r18
	adiw r26,4
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
	std Z+2,r24
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
	ld r30,X+
	ld r31,X
	sbiw r26,1
	ldd r20,Z+2
	ldi r18,lo8(1)
	ldi r19,0
	movw r24,r18
	adiw r26,4
	ld r0,X
	rjmp 2f
	1:
	lsl r24
	rol r25
	2:
	dec r0
	brpl 1b
	eor r24,r20
	std Z+2,r24
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
	adiw r26,4
	ld r21,X
	cpi r22,lo8(1)
	brne .L11
	ldd r18,Z+1
	ldi r24,lo8(1)
	ldi r25,0
	rjmp 2f
	1:
	lsl r24
	2:
	dec r21
	brpl 1b
	or r24,r18
	std Z+1,r24
	ret
.L11:
	ldd r20,Z+1
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
	std Z+1,r18
	cpi r22,lo8(2)
	brne .L10
	jmp _ZN3Pin2onEv
.L10:
	ret
	.size	_ZN3Pin12setDirectionE4DDRx, .-_ZN3Pin12setDirectionE4DDRx
.global	_ZN3PinC2Eh4DDRx
	.type	_ZN3PinC2Eh4DDRx, @function
_ZN3PinC2Eh4DDRx:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r26,r24
	mov r24,r22
	cpi r22,lo8(23)
	brlo .+2
	rjmp .L13
	ldi r25,lo8(5)
	mul r22,r25
	movw r18,r0
	clr __zero_reg__
	movw r30,r18
	subi r30,lo8(-(_ZL17__flashMappedPort))
	sbci r31,hi8(-(_ZL17__flashMappedPort))
/* #APP */
 ;  53 "libs/gpio/portmanager/portmanager.cpp" 1
	lpm r22, Z+
	lpm r23, Z
	
 ;  0 "" 2
/* #NOAPP */
	adiw r26,1
	st X,r23
	st -X,r22
	movw r30,r18
	subi r30,lo8(-(_ZL17__flashMappedPort+2))
	sbci r31,hi8(-(_ZL17__flashMappedPort+2))
/* #APP */
 ;  56 "libs/gpio/portmanager/portmanager.cpp" 1
	lpm r30, Z
	
 ;  0 "" 2
/* #NOAPP */
	adiw r26,4
	st X,r30
	sbiw r26,4
	movw r30,r18
	subi r30,lo8(-(_ZL17__flashMappedPort+3))
	sbci r31,hi8(-(_ZL17__flashMappedPort+3))
/* #APP */
 ;  57 "libs/gpio/portmanager/portmanager.cpp" 1
	lpm r18, Z+
	lpm r19, Z
	
 ;  0 "" 2
/* #NOAPP */
	adiw r26,9+1
	st X,r19
	st -X,r18
	sbiw r26,9
	adiw r26,11
	st X,r24
	sbiw r26,11
	sbrs r19,4
	rjmp .L15
	movw r30,r18
	lsl r30
	mov r30,r31
	rol r30
	sbc r31,r31
	neg r31
	andi r30,7
	clr r31
	sbiw r30,0
	breq .L15
	subi r30,lo8(-(_ZL15__hw_timer_addr))
	sbci r31,hi8(-(_ZL15__hw_timer_addr))
/* #APP */
 ;  63 "libs/gpio/portmanager/portmanager.cpp" 1
	lpm r24, Z+
	lpm r25, Z
	
 ;  0 "" 2
/* #NOAPP */
	adiw r26,2+1
	st X,r25
	st -X,r24
	sbiw r26,2
.L15:
	mov r22,r20
	movw r24,r26
	jmp _ZN3Pin12setDirectionE4DDRx
.L13:
	ret
	.size	_ZN3PinC2Eh4DDRx, .-_ZN3PinC2Eh4DDRx
.global	_ZN3PinC1Eh4DDRx
	.set	_ZN3PinC1Eh4DDRx,_ZN3PinC2Eh4DDRx
.global	_ZN3Pin6setPWMEmh
	.type	_ZN3Pin6setPWMEmh, @function
_ZN3Pin6setPWMEmh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldd r24,Z+2
	ldd r25,Z+3
	or r24,r25
	brne .L23
	ldi r24,0
	ret
.L23:
	ret
	.size	_ZN3Pin6setPWMEmh, .-_ZN3Pin6setPWMEmh
.global	_ZN3Pin7setDutyEh
	.type	_ZN3Pin7setDutyEh, @function
_ZN3Pin7setDutyEh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_ZN3Pin7setDutyEh, .-_ZN3Pin7setDutyEh
.global	_ZN3Pin7setFreqEj
	.type	_ZN3Pin7setFreqEj, @function
_ZN3Pin7setFreqEj:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_ZN3Pin7setFreqEj, .-_ZN3Pin7setFreqEj
.global	_ZN3Pin7stopPWMEv
	.type	_ZN3Pin7stopPWMEv, @function
_ZN3Pin7stopPWMEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_ZN3Pin7stopPWMEv, .-_ZN3Pin7stopPWMEv
.global	_ZN3Pin11digitalReadEv
	.type	_ZN3Pin11digitalReadEv, @function
_ZN3Pin11digitalReadEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r26,r24
	ld r30,X+
	ld r31,X
	sbiw r26,1
	ld r18,Z
	ldi r19,0
	movw r30,r18
	adiw r26,4
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
	sbrs r19,4
	rjmp .L32
	ldd r24,Z+11
	ldi r25,0
	sbiw r24,14
	or r24,r22
	or r25,r18
	lds r18,122
	cpse r18,__zero_reg__
	rjmp .L30
	lds r18,122
	ori r18,lo8(-128)
	or r20,r18
	sts 122,r20
.L30:
	lds r18,122
	sts 123,r25
	sts 124,r24
	lds r24,122
	ori r24,lo8(64)
	sts 122,r24
.L31:
	lds r24,122
	sbrc r24,6
	rjmp .L31
	lds r24,120
	lds r25,120+1
	ret
.L32:
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
	ret
	.size	_ZN3Pin10analogReadE6_ADMUX17_ADCSRA_PRESCALER19_ADCSRB_AUTOTRIGGER, .-_ZN3Pin10analogReadE6_ADMUX17_ADCSRA_PRESCALER19_ADCSRB_AUTOTRIGGER
.global	_ZN3Pin12getPinNumberEv
	.type	_ZN3Pin12getPinNumberEv, @function
_ZN3Pin12getPinNumberEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldd r24,Z+11
	ret
	.size	_ZN3Pin12getPinNumberEv, .-_ZN3Pin12getPinNumberEv
.global	__floatunsisf
.global	__subsf3
.global	__mulsf3
.global	__divsf3
.global	__fixunssfsi
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
	ldd r22,Y+5
	ldd r23,Y+6
	ldi r24,0
	ldi r25,0
	call __floatunsisf
	movw r12,r22
	movw r14,r24
	ldd r22,Y+7
	ldd r23,Y+8
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
	ldd r24,Z+4
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
	ld r24,Z
	ldd r25,Z+1
	ret
	.size	_ZN3Pin11getPINxAddrEv, .-_ZN3Pin11getPINxAddrEv
	.section	.progmem.data,"a",@progbits
	.type	_ZL15__hw_timer_addr, @object
	.size	_ZL15__hw_timer_addr, 3
_ZL15__hw_timer_addr:
	.byte	36
	.byte	-128
	.byte	-80
	.type	_ZL17__flashMappedPort, @object
	.size	_ZL17__flashMappedPort, 110
_ZL17__flashMappedPort:
	.word	41
	.byte	0
	.word	0
	.word	41
	.byte	1
	.word	0
	.word	41
	.byte	2
	.word	0
	.word	41
	.byte	3
	.word	4384
	.word	41
	.byte	4
	.word	0
	.word	41
	.byte	5
	.word	4128
	.word	41
	.byte	6
	.word	4096
	.word	41
	.byte	7
	.word	0
	.word	35
	.byte	0
	.word	0
	.word	35
	.byte	1
	.word	4224
	.word	35
	.byte	2
	.word	4256
	.word	35
	.byte	3
	.word	4352
	.word	35
	.byte	4
	.word	0
	.word	35
	.byte	5
	.word	0
	.word	38
	.byte	0
	.word	16
	.word	38
	.byte	1
	.word	17
	.word	38
	.byte	2
	.word	18
	.word	38
	.byte	3
	.word	19
	.word	38
	.byte	4
	.word	20
	.word	38
	.byte	5
	.word	21
	.word	0
	.byte	-1
	.word	22
	.word	0
	.byte	-1
	.word	23
	.ident	"GCC: (GNU) 5.4.0"
