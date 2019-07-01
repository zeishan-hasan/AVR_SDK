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
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"ddrx %02x\r\n"
	.text
.global	_ZN3Pin12setDirectionE4DDRx
	.type	_ZN3Pin12setDirectionE4DDRx, @function
_ZN3Pin12setDirectionE4DDRx:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	movw r28,r24
	mov r17,r22
	lds r24,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	lds r25,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	or r24,r25
	brne .L11
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
	sts _ZZN13SerialManager11getInstanceE10SerialPortE8instance+1,r25
	sts _ZZN13SerialManager11getInstanceE10SerialPortE8instance,r24
.L11:
	ld r30,Y
	ldd r31,Y+1
	ldd r19,Y+8
	cpi r17,lo8(1)
	brne .L12
	lds r18,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	lds r20,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	ld r21,Z
	ldi r24,lo8(1)
	ldi r25,0
	rjmp 2f
	1:
	lsl r24
	2:
	dec r19
	brpl 1b
	or r24,r21
	st Z,r24
	ld r30,Y
	ldd r31,Y+1
	ld r24,Z
	push __zero_reg__
	push r24
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	push r25
	push r24
	push r20
	push r18
	call _ZN6Serial6printfEPKcz
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	rjmp .L10
.L12:
	ld r18,Z
	ldi r24,lo8(1)
	ldi r25,0
	rjmp 2f
	1:
	lsl r24
	2:
	dec r19
	brpl 1b
	com r24
	and r24,r18
	st Z,r24
	cpi r17,lo8(2)
	brne .L10
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r17
	jmp _ZN3Pin2onEv
.L10:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	ret
	.size	_ZN3Pin12setDirectionE4DDRx, .-_ZN3Pin12setDirectionE4DDRx
	.section	.rodata.str1.1
.LC1:
	.string	"Pinx %p\r\nDdrx %p\r\nPortx %p\r\nRegbit %u\r\nControl bits 0x%04x\r\nPin no %u\r\n"
.LC2:
	.string	"Timer a 16 bit\r\n"
.LC3:
	.string	"Letter C\r\n"
.LC4:
	.string	"Setting direction\r\n"
	.text
.global	_ZN3PinC2Eh4DDRx
	.type	_ZN3PinC2Eh4DDRx, @function
_ZN3PinC2Eh4DDRx:
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
	mov r14,r22
	mov r15,r20
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
	std Y+7,r25
	std Y+6,r24
	std Y+11,__zero_reg__
	std Y+10,__zero_reg__
	std Y+13,__zero_reg__
	std Y+12,__zero_reg__
	std Y+15,__zero_reg__
	std Y+14,__zero_reg__
	std Y+17,__zero_reg__
	std Y+16,__zero_reg__
	std Y+19,__zero_reg__
	std Y+18,__zero_reg__
	std Y+21,__zero_reg__
	std Y+20,__zero_reg__
	std Y+23,__zero_reg__
	std Y+22,__zero_reg__
	std Y+25,__zero_reg__
	std Y+24,__zero_reg__
	std Y+27,__zero_reg__
	std Y+26,__zero_reg__
	std Y+29,__zero_reg__
	std Y+28,__zero_reg__
	lds r24,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	lds r25,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	or r24,r25
	brne .L15
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
	sts _ZZN13SerialManager11getInstanceE10SerialPortE8instance+1,r25
	sts _ZZN13SerialManager11getInstanceE10SerialPortE8instance,r24
.L15:
	ldi r18,lo8(70)
	cp r18,r14
	brsh .+2
	rjmp .L14
	lds r17,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	lds r16,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	ldi r19,lo8(5)
	mul r14,r19
	movw r24,r0
	clr __zero_reg__
	movw r30,r24
	subi r30,lo8(-(_ZL17__flashMappedPort))
	sbci r31,hi8(-(_ZL17__flashMappedPort))
/* #APP */
 ;  10 "libs/gpio/portmanager/portmanager.cpp" 1
	lpm r18, Z+
	lpm r19, Z
	
 ;  0 "" 2
/* #NOAPP */
	std Y+5,r19
	std Y+4,r18
	movw r20,r18
	subi r20,-1
	sbci r21,-1
	std Y+1,r21
	st Y,r20
	movw r22,r18
	subi r22,-2
	sbci r23,-1
	std Y+3,r23
	std Y+2,r22
	movw r30,r24
	subi r30,lo8(-(_ZL17__flashMappedPort+2))
	sbci r31,hi8(-(_ZL17__flashMappedPort+2))
/* #APP */
 ;  13 "libs/gpio/portmanager/portmanager.cpp" 1
	lpm r26, Z
	
 ;  0 "" 2
/* #NOAPP */
	std Y+8,r26
	movw r30,r24
	subi r30,lo8(-(_ZL17__flashMappedPort+3))
	sbci r31,hi8(-(_ZL17__flashMappedPort+3))
/* #APP */
 ;  14 "libs/gpio/portmanager/portmanager.cpp" 1
	lpm r24, Z+
	lpm r25, Z
	
 ;  0 "" 2
/* #NOAPP */
	std Y+34,r24
	std Y+35,r25
	std Y+36,r14
	push __zero_reg__
	push r14
	push r25
	push r24
	push __zero_reg__
	push r26
	push r23
	push r22
	push r21
	push r20
	push r19
	push r18
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	push r25
	push r24
	push r16
	push r17
	call _ZN6Serial6printfEPKcz
	ldd r24,Y+34
	ldd r25,Y+35
	in r18,__SP_L__
	in r19,__SP_H__
	subi r18,-16
	sbci r19,-1
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r19
	out __SREG__,__tmp_reg__
	out __SP_L__,r18
	sbrs r25,4
	rjmp .L17
	movw r30,r24
	lsl r30
	mov r30,r31
	rol r30
	sbc r31,r31
	neg r31
	mov r19,r30
	andi r19,lo8(7)
	mov r14,r19
	ldi r18,lo8(2)
	cpse r19,r18
	rjmp .L18
	lds r30,_ZL15__hw_timer_addr+4
	lds r31,_ZL15__hw_timer_addr+4+1
	std Y+23,r31
	std Y+22,r30
	movw r18,r30
	subi r18,-1
	sbci r19,-1
	std Y+25,r19
	std Y+24,r18
	subi r18,-1
	sbci r19,-1
	std Y+27,r19
	std Y+26,r18
	ldi r19,5
	1:
	lsr r25
	ror r24
	dec r19
	brne 1b
	andi r24,3
	clr r25
	sbiw r24,0
	breq .L20
	sbiw r24,1
	brne .L19
	movw r24,r30
	adiw r24,4
	std Y+29,r25
	std Y+28,r24
	ld r24,Z
	ori r24,lo8(48)
	rjmp .L33
.L20:
	movw r24,r30
	adiw r24,3
	std Y+29,r25
	std Y+28,r24
	ld r24,Z
	ori r24,lo8(-64)
.L33:
	st Z,r24
.L19:
	ldd r30,Y+22
	ldd r31,Y+23
	ld r24,Z
	ori r24,lo8(1)
	st Z,r24
	ldd r30,Y+24
	ldd r31,Y+25
	ld r24,Z
	st Z,r24
	ldd r30,Y+24
	ldd r31,Y+25
	rjmp .L35
.L18:
	tst r19
	brne .+2
	rjmp .L22
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	push r25
	push r24
	push r16
	push r17
	call _ZN6Serial6printfEPKcz
	mov r30,r14
	ldi r31,0
	lsl r30
	rol r31
	subi r30,lo8(-(_ZL15__hw_timer_addr))
	sbci r31,hi8(-(_ZL15__hw_timer_addr))
	ld __tmp_reg__,Z+
	ld r31,Z
	mov r30,__tmp_reg__
	std Y+11,r31
	std Y+10,r30
	movw r24,r30
	adiw r24,1
	std Y+13,r25
	std Y+12,r24
	adiw r24,1
	std Y+19,r25
	std Y+18,r24
	adiw r24,2
	std Y+15,r25
	std Y+14,r24
	adiw r24,2
	std Y+21,r25
	std Y+20,r24
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	ldd r24,Y+34
	ldd r25,Y+35
	ldi r18,5
	1:
	lsr r25
	ror r24
	dec r18
	brne 1b
	andi r24,3
	clr r25
	cpi r24,1
	cpc r25,__zero_reg__
	breq .L24
	brlo .L25
	sbiw r24,2
	brne .L23
	ldi r24,lo8(.LC3)
	ldi r25,hi8(.LC3)
	push r25
	push r24
	push r16
	push r17
	call _ZN6Serial6printfEPKcz
	ldd r24,Y+20
	ldd r25,Y+21
	adiw r24,6
	std Y+17,r25
	std Y+16,r24
	ldd r30,Y+10
	ldd r31,Y+11
	ld r24,Z
	ori r24,lo8(12)
	st Z,r24
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	rjmp .L23
.L25:
	movw r24,r30
	adiw r24,8
	std Y+17,r25
	std Y+16,r24
	ld r24,Z
	ori r24,lo8(-64)
	rjmp .L34
.L24:
	movw r24,r30
	adiw r24,10
	std Y+17,r25
	std Y+16,r24
	ld r24,Z
	ori r24,lo8(48)
.L34:
	st Z,r24
.L23:
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
.L35:
	ld r24,Z
	st Z,r24
	rjmp .L22
.L17:
	sbrs r24,4
	rjmp .L22
	movw r30,r24
	andi r30,15
	clr r31
	lsl r30
	rol r31
	subi r30,lo8(-(_ZL14__adc_channels))
	sbci r31,hi8(-(_ZL14__adc_channels))
	ld r24,Z
	ldd r25,Z+1
	std Y+7,r25
	std Y+6,r24
.L22:
	ldi r24,lo8(.LC4)
	ldi r25,hi8(.LC4)
	push r25
	push r24
	push r16
	push r17
	call _ZN6Serial6printfEPKcz
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	mov r22,r15
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	jmp _ZN3Pin12setDirectionE4DDRx
.L14:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
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
	ldd r24,Y+22
	ldd r25,Y+23
	or r24,r25
	brne .+2
	rjmp .L43
	ldd r24,Y+10
	ldd r25,Y+11
	or r24,r25
	brne .+2
	rjmp .L43
	mov r17,r18
	movw r24,r22
	movw r22,r20
	ldd r18,Y+35
	mov r20,r18
	lsr r20
	lsr r20
	ldi r21,0
	movw r18,r20
	andi r18,3
	clr r19
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	brne .+2
	rjmp .L38
	cpi r18,1
	cpc r19,__zero_reg__
	breq .+2
	rjmp .L43
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
	ldd r30,Y+16
	ldd r31,Y+17
	ldd r24,Y+32
	ldd r25,Y+33
	std Z+1,r25
	st Z,r24
	ldd r30,Y+12
	ldd r31,Y+13
	rjmp .L44
.L38:
	mov r22,r17
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
	ldd r30,Y+24
	ldd r31,Y+25
.L44:
	ld r24,Z
	ori r24,lo8(1)
	st Z,r24
	ldi r24,lo8(1)
	rjmp .L37
.L43:
	ldi r24,0
.L37:
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
	ldd r24,Y+22
	ldd r25,Y+23
	or r24,r25
	brne .+2
	rjmp .L46
	ldd r24,Y+10
	ldd r25,Y+11
	or r24,r25
	brne .+2
	rjmp .L46
	mov r17,r22
	ldd r18,Y+35
	mov r24,r18
	lsr r24
	lsr r24
	ldi r25,0
	andi r24,3
	clr r25
	sbiw r24,0
	breq .L47
	sbiw r24,1
	breq .+2
	rjmp .L46
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
	rjmp .L49
.L47:
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
.L49:
	rjmp .L45
.L46:
	ldi r24,0
.L45:
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
	cpi r24,lo8(1)
	brne .L59
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
	rjmp .L56
.L59:
	ldi r24,0
.L56:
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
	ldd r24,Z+35
	mov r18,r24
	lsr r18
	lsr r18
	ldi r19,0
	andi r18,3
	clr r19
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	breq .L62
	cpi r18,1
	cpc r19,__zero_reg__
	brne .L66
	std Z+13,__zero_reg__
	std Z+12,__zero_reg__
	rjmp .L64
.L62:
	std Z+25,__zero_reg__
	std Z+24,__zero_reg__
	rjmp .L64
.L66:
	ldi r24,0
	ret
.L64:
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
	ldd r19,Z+34
	sbrs r19,4
	rjmp .L72
	ldd r24,Z+6
	ldd r25,Z+7
	cpi r24,-1
	ldi r31,-1
	cpc r25,r31
	breq .L69
	ldi r23,0
	or r23,r18
	or r24,r22
	or r25,r23
	lds r18,122
	cpse r18,__zero_reg__
	rjmp .L70
	lds r18,122
	ori r18,lo8(-128)
	or r20,r18
	sts 122,r20
.L70:
	lds r18,122
	sts 123,r25
	sts 124,r24
	lds r24,122
	ori r24,lo8(64)
	sts 122,r24
.L71:
	lds r24,122
	sbrc r24,6
	rjmp .L71
	lds r24,120
	lds r25,120+1
	ret
.L72:
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
.L69:
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
	.weak	_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	.section	.bss._ZZN13SerialManager11getInstanceE10SerialPortE8instance,"awG",@nobits,_ZZN13SerialManager11getInstanceE10SerialPortE8instance,comdat
	.type	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, @object
	.size	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, 8
_ZZN13SerialManager11getInstanceE10SerialPortE8instance:
	.zero	8
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
	.word	4512
	.word	44
	.byte	5
	.word	4544
	.word	50
	.byte	5
	.word	4128
	.word	44
	.byte	3
	.word	4480
	.word	256
	.byte	3
	.word	4608
	.word	256
	.byte	4
	.word	4640
	.word	256
	.byte	5
	.word	4672
	.word	256
	.byte	6
	.word	4384
	.word	35
	.byte	4
	.word	4352
	.word	35
	.byte	5
	.word	4224
	.word	35
	.byte	6
	.word	4256
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
	.word	4800
	.word	265
	.byte	4
	.word	4768
	.word	265
	.byte	3
	.word	4736
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
.global __do_clear_bss
