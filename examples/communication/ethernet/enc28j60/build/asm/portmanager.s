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
.global	_ZN3PinC2Eh4DDRx
	.type	_ZN3PinC2Eh4DDRx, @function
_ZN3PinC2Eh4DDRx:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r26,r24
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
	adiw r26,6+1
	st X,r25
	st -X,r24
	sbiw r26,6
	adiw r26,9+1
	st X,__zero_reg__
	st -X,__zero_reg__
	sbiw r26,9
	adiw r26,11+1
	st X,__zero_reg__
	st -X,__zero_reg__
	sbiw r26,11
	adiw r26,13+1
	st X,__zero_reg__
	st -X,__zero_reg__
	sbiw r26,13
	adiw r26,15+1
	st X,__zero_reg__
	st -X,__zero_reg__
	sbiw r26,15
	adiw r26,17+1
	st X,__zero_reg__
	st -X,__zero_reg__
	sbiw r26,17
	adiw r26,19+1
	st X,__zero_reg__
	st -X,__zero_reg__
	sbiw r26,19
	adiw r26,21+1
	st X,__zero_reg__
	st -X,__zero_reg__
	sbiw r26,21
	adiw r26,23+1
	st X,__zero_reg__
	st -X,__zero_reg__
	sbiw r26,23
	adiw r26,25+1
	st X,__zero_reg__
	st -X,__zero_reg__
	sbiw r26,25
	adiw r26,27+1
	st X,__zero_reg__
	st -X,__zero_reg__
	sbiw r26,27
	cpi r22,lo8(71)
	brlo .+2
	rjmp .L13
	ldi r18,lo8(5)
	mul r22,r18
	movw r24,r0
	clr __zero_reg__
	movw r30,r24
	subi r30,lo8(-(_ZL17__flashMappedPort))
	sbci r31,hi8(-(_ZL17__flashMappedPort))
/* #APP */
 ;  9 "libs/gpio/portmanager/portmanager.cpp" 1
	lpm r18, Z+
	lpm r19, Z
	
 ;  0 "" 2
/* #NOAPP */
	adiw r26,4+1
	st X,r19
	st -X,r18
	sbiw r26,4
	movw r30,r18
	adiw r30,1
	adiw r26,1
	st X,r31
	st -X,r30
	subi r18,-2
	sbci r19,-1
	adiw r26,2+1
	st X,r19
	st -X,r18
	sbiw r26,2
	movw r30,r24
	subi r30,lo8(-(_ZL17__flashMappedPort+2))
	sbci r31,hi8(-(_ZL17__flashMappedPort+2))
/* #APP */
 ;  12 "libs/gpio/portmanager/portmanager.cpp" 1
	lpm r30, Z
	
 ;  0 "" 2
/* #NOAPP */
	adiw r26,8
	st X,r30
	sbiw r26,8
	movw r30,r24
	subi r30,lo8(-(_ZL17__flashMappedPort+3))
	sbci r31,hi8(-(_ZL17__flashMappedPort+3))
/* #APP */
 ;  13 "libs/gpio/portmanager/portmanager.cpp" 1
	lpm r24, Z+
	lpm r25, Z
	
 ;  0 "" 2
/* #NOAPP */
	adiw r26,33+1
	st X,r25
	st -X,r24
	sbiw r26,33
	adiw r26,35
	st X,r22
	sbiw r26,35
	sbrs r25,4
	rjmp .L15
	lsl r24
	mov r24,r25
	rol r24
	sbc r25,r25
	neg r25
	andi r24,lo8(7)
	cpi r24,lo8(2)
	brne .L16
	lds r24,_ZL15__hw_timer_addr+4
	lds r25,_ZL15__hw_timer_addr+4+1
	adiw r26,21+1
	st X,r25
	st -X,r24
	sbiw r26,21
	movw r18,r24
	subi r18,-1
	sbci r19,-1
	adiw r26,23+1
	st X,r19
	st -X,r18
	sbiw r26,23
	adiw r24,2
	adiw r26,25+1
	st X,r25
	st -X,r24
	sbiw r26,25
	rjmp .L17
.L16:
	tst r24
	breq .L17
	mov r30,r24
	ldi r31,0
	lsl r30
	rol r31
	subi r30,lo8(-(_ZL15__hw_timer_addr))
	sbci r31,hi8(-(_ZL15__hw_timer_addr))
	ld r24,Z
	ldd r25,Z+1
	adiw r26,9+1
	st X,r25
	st -X,r24
	sbiw r26,9
	movw r18,r24
	subi r18,-1
	sbci r19,-1
	adiw r26,11+1
	st X,r19
	st -X,r18
	sbiw r26,11
	subi r18,-1
	sbci r19,-1
	adiw r26,17+1
	st X,r19
	st -X,r18
	sbiw r26,17
	subi r18,-2
	sbci r19,-1
	adiw r26,13+1
	st X,r19
	st -X,r18
	sbiw r26,13
	adiw r24,6
	adiw r26,19+1
	st X,r25
	st -X,r24
	sbiw r26,19
	rjmp .L17
.L15:
	sbrs r24,4
	rjmp .L17
	movw r30,r24
	andi r30,15
	clr r31
	lsl r30
	rol r31
	subi r30,lo8(-(_ZL14__adc_channels))
	sbci r31,hi8(-(_ZL14__adc_channels))
	ld r24,Z
	ldd r25,Z+1
	adiw r26,6+1
	st X,r25
	st -X,r24
	sbiw r26,6
.L17:
	mov r22,r20
	movw r24,r26
	jmp _ZN3Pin12setDirectionE4DDRx
.L13:
	ret
	.size	_ZN3PinC2Eh4DDRx, .-_ZN3PinC2Eh4DDRx
.global	_ZN3PinC1Eh4DDRx
	.set	_ZN3PinC1Eh4DDRx,_ZN3PinC2Eh4DDRx
.global	__floatsisf
.global	__mulsf3
.global	__addsf3
.global	__fixunssfsi
.global	__floatunsisf
.global	__divsf3
.global	__subsf3
.global	_ZN3Pin6setPWMEmh
	.type	_ZN3Pin6setPWMEmh, @function
_ZN3Pin6setPWMEmh:
	push r4
	push r5
	push r6
	push r7
	push r8
	push r9
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
/* stack size = 15 */
.L__stack_usage = 15
	movw r28,r24
	ldd r14,Y+21
	ldd r15,Y+22
	cp r14,__zero_reg__
	cpc r15,__zero_reg__
	brne .L25
	ldd r24,Y+9
	ldd r25,Y+10
	or r24,r25
	brne .+2
	rjmp .L38
.L25:
	mov r13,r18
	movw r24,r22
	movw r22,r20
	ldd r16,Y+33
	ldd r17,Y+34
	movw r18,r16
	mov r18,r19
	clr r19
	lsr r18
	lsr r18
	andi r18,3
	clr r19
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	breq .L27
	cpi r18,1
	cpc r19,__zero_reg__
	brne .+2
	rjmp .L28
	rjmp .L38
.L27:
	mov r22,r13
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
	std Y+32,r23
	std Y+31,r22
	ldi r19,5
	1:
	lsr r17
	ror r16
	dec r19
	brne 1b
	andi r16,3
	clr r17
	ldd r24,Y+25
	ldd r25,Y+26
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .L30
	cpi r16,1
	cpc r17,__zero_reg__
	brne .L29
	adiw r24,2
	std Y+28,r25
	std Y+27,r24
	movw r30,r14
	ld r24,Z
	ori r24,lo8(48)
	rjmp .L39
.L30:
	adiw r24,1
	std Y+28,r25
	std Y+27,r24
	movw r30,r14
	ld r24,Z
	ori r24,lo8(-64)
.L39:
	st Z,r24
.L29:
	ldd r30,Y+25
	ldd r31,Y+26
	ldi r24,lo8(10)
	std Z+2,r24
	ldd r30,Y+27
	ldd r31,Y+28
	ldd r24,Y+31
	st Z,r24
	ldd r30,Y+21
	ldd r31,Y+22
	ld r24,Z
	ori r24,lo8(1)
	st Z,r24
	ldd r30,Y+23
	ldd r31,Y+24
	ld r24,Z
	st Z,r24
	ldd r30,Y+23
	ldd r31,Y+24
	ld r24,Z
	ori r24,lo8(2)
	rjmp .L41
.L28:
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
	movw r8,r22
	movw r10,r24
	std Y+30,r23
	std Y+29,r22
	ldi r24,0
	ldi r25,0
	call __floatunsisf
	movw r4,r22
	movw r6,r24
	mov r22,r13
	ldi r23,0
	ldi r24,0
	ldi r25,0
	call __floatunsisf
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(-56)
	ldi r21,lo8(66)
	call __divsf3
	movw r20,r6
	movw r18,r4
	call __mulsf3
	movw r18,r22
	movw r20,r24
	movw r24,r6
	movw r22,r4
	call __subsf3
	call __fixunssfsi
	std Y+32,r23
	std Y+31,r22
	ldd r30,Y+19
	ldd r31,Y+20
	std Z+1,r9
	st Z,r8
	ldd r24,Y+33
	ldd r25,Y+34
	ldi r18,5
	1:
	lsr r25
	ror r24
	dec r18
	brne 1b
	andi r24,3
	clr r25
	ldd r26,Y+9
	ldd r27,Y+10
	cpi r24,1
	cpc r25,__zero_reg__
	breq .L33
	brlo .L34
	sbiw r24,2
	brne .L32
	adiw r30,6
	std Y+16,r31
	std Y+15,r30
	ld r24,X
	ori r24,lo8(12)
	rjmp .L40
.L34:
	adiw r30,2
	std Y+16,r31
	std Y+15,r30
	ld r24,X
	ori r24,lo8(-64)
	rjmp .L40
.L33:
	adiw r30,4
	std Y+16,r31
	std Y+15,r30
	ld r24,X
	ori r24,lo8(48)
.L40:
	st X,r24
.L32:
	ldd r30,Y+15
	ldd r31,Y+16
	ldd r24,Y+31
	ldd r25,Y+32
	std Z+1,r25
	st Z,r24
	ldd r30,Y+9
	ldd r31,Y+10
	ld r24,Z
	ori r24,lo8(2)
	st Z,r24
	ldd r30,Y+11
	ldd r31,Y+12
	ld r24,Z
	ori r24,lo8(24)
	st Z,r24
	ldd r30,Y+11
	ldd r31,Y+12
	ld r24,Z
	ori r24,lo8(1)
.L41:
	st Z,r24
	ldi r24,lo8(1)
	rjmp .L26
.L38:
	ldi r24,0
.L26:
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
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	ret
	.size	_ZN3Pin6setPWMEmh, .-_ZN3Pin6setPWMEmh
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
	ldd r24,Y+21
	ldd r25,Y+22
	or r24,r25
	brne .L43
	ldd r24,Y+9
	ldd r25,Y+10
	or r24,r25
	brne .+2
	rjmp .L44
.L43:
	mov r17,r22
	ldd r18,Y+34
	mov r24,r18
	lsr r24
	lsr r24
	ldi r25,0
	andi r24,3
	clr r25
	sbiw r24,0
	breq .L45
	sbiw r24,1
	breq .+2
	rjmp .L44
	ldd r22,Y+29
	ldd r23,Y+30
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
	std Y+32,r23
	std Y+31,r22
	ldd r30,Y+15
	ldd r31,Y+16
	std Z+1,r23
	st Z,r22
	rjmp .L47
.L45:
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
	std Y+31,r22
	std Y+32,r23
	ldd r30,Y+27
	ldd r31,Y+28
	st Z,r22
.L47:
	rjmp .L42
.L44:
	ldi r24,0
.L42:
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
	movw r30,r24
	ldd r18,Z+9
	ldd r19,Z+10
	or r18,r19
	brne .+2
	rjmp .L53
	movw r14,r22
	movw r28,r24
	ldd r24,Z+29
	ldd r25,Z+30
	ldd r22,Z+31
	ldd r23,Z+32
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
	std Y+30,r23
	std Y+29,r22
	ldi r24,0
	ldi r25,0
	call __floatunsisf
	movw r20,r10
	movw r18,r8
	call __divsf3
	call __fixunssfsi
	std Y+32,r23
	std Y+31,r22
	ldd r30,Y+19
	ldd r31,Y+20
	std Z+1,r13
	st Z,r12
	ldd r30,Y+15
	ldd r31,Y+16
	ldd r24,Y+31
	ldd r25,Y+32
	std Z+1,r25
	st Z,r24
	ldi r24,lo8(1)
	rjmp .L52
.L53:
	ldi r24,0
.L52:
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
.global	_ZN3Pin7stopPWMEv
	.type	_ZN3Pin7stopPWMEv, @function
_ZN3Pin7stopPWMEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldd r24,Z+34
	mov r18,r24
	lsr r18
	lsr r18
	ldi r19,0
	andi r18,3
	clr r19
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	breq .L56
	cpi r18,1
	cpc r19,__zero_reg__
	brne .L60
	std Z+12,__zero_reg__
	std Z+11,__zero_reg__
	rjmp .L58
.L56:
	std Z+24,__zero_reg__
	std Z+23,__zero_reg__
	rjmp .L58
.L60:
	ldi r24,0
	ret
.L58:
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
	ldd r19,Z+33
	sbrs r19,4
	rjmp .L66
	ldd r24,Z+6
	ldd r25,Z+7
	cpi r24,-1
	ldi r31,-1
	cpc r25,r31
	breq .L63
	ldi r23,0
	or r23,r18
	or r24,r22
	or r25,r23
	lds r18,122
	cpse r18,__zero_reg__
	rjmp .L64
	lds r18,122
	ori r18,lo8(-128)
	or r20,r18
	sts 122,r20
.L64:
	lds r18,122
	sts 123,r25
	sts 124,r24
	lds r24,122
	ori r24,lo8(64)
	sts 122,r24
.L65:
	lds r24,122
	sbrc r24,6
	rjmp .L65
	lds r24,120
	lds r25,120+1
	ret
.L66:
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
.L63:
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
	ldd r24,Z+35
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
	ldd r22,Y+29
	ldd r23,Y+30
	ldi r24,0
	ldi r25,0
	call __floatunsisf
	movw r12,r22
	movw r14,r24
	ldd r22,Y+31
	ldd r23,Y+32
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
	.section	.rodata
	.type	_ZL14__adc_channels, @object
	.size	_ZL14__adc_channels, 32
_ZL14__adc_channels:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.data
	.type	_ZL15__hw_timer_addr, @object
	.size	_ZL15__hw_timer_addr, 12
_ZL15__hw_timer_addr:
	.word	36
	.word	128
	.word	176
	.word	144
	.word	160
	.word	288
	.section	.progmem.data,"a",@progbits
	.type	_ZL17__flashMappedPort, @object
	.size	_ZL17__flashMappedPort, 350
_ZL17__flashMappedPort:
	.word	44
	.byte	0
	.word	0
	.word	44
	.byte	1
	.word	0
	.word	44
	.byte	4
	.word	5536
	.word	44
	.byte	5
	.word	5568
	.word	50
	.byte	5
	.word	4128
	.word	44
	.byte	3
	.word	5504
	.word	256
	.byte	3
	.word	5632
	.word	256
	.byte	4
	.word	5664
	.word	256
	.byte	5
	.word	5696
	.word	256
	.byte	6
	.word	4384
	.word	35
	.byte	4
	.word	4352
	.word	35
	.byte	5
	.word	5248
	.word	35
	.byte	6
	.word	5280
	.word	35
	.byte	7
	.word	5312
	.word	259
	.byte	1
	.word	0
	.word	259
	.byte	0
	.word	0
	.word	256
	.byte	1
	.word	0
	.word	256
	.byte	0
	.word	0
	.word	41
	.byte	3
	.word	0
	.word	41
	.byte	2
	.word	0
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
	.word	5824
	.word	265
	.byte	4
	.word	5792
	.word	265
	.byte	3
	.word	5760
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
	.word	16
	.word	47
	.byte	1
	.word	17
	.word	47
	.byte	2
	.word	18
	.word	47
	.byte	3
	.word	19
	.word	47
	.byte	4
	.word	20
	.word	47
	.byte	5
	.word	21
	.word	47
	.byte	6
	.word	22
	.word	47
	.byte	7
	.word	23
	.word	262
	.byte	0
	.word	24
	.word	262
	.byte	1
	.word	25
	.word	262
	.byte	2
	.word	26
	.word	262
	.byte	3
	.word	27
	.word	262
	.byte	4
	.word	28
	.word	262
	.byte	5
	.word	29
	.word	262
	.byte	6
	.word	30
	.word	262
	.byte	7
	.word	31
	.ident	"GCC: (GNU) 5.4.0"
.global __do_copy_data
