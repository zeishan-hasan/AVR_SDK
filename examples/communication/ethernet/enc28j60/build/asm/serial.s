	.file	"serial.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
.global	__floatunsisf
.global	__divsf3
.global	__subsf3
.global	__fixunssfsi
	.text
.global	_ZN6Serial4initE4UART14SerialPriority
	.type	_ZN6Serial4initE4UART14SerialPriority, @function
_ZN6Serial4initE4UART14SerialPriority:
	push r14
	push r15
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 5 */
.L__stack_usage = 5
	movw r28,r24
	mov r17,r18
	movw r30,r24
	subi r30,-13
	sbci r31,-2
	ld __tmp_reg__,Z+
	ld r31,Z
	mov r30,__tmp_reg__
	st Z,__zero_reg__
	movw r30,r24
	subi r30,-15
	sbci r31,-2
	ld r14,Z
	ldd r15,Z+1
	movw r24,r22
	movw r22,r20
	call __floatunsisf
	movw r18,r22
	movw r20,r24
	ldi r22,0
	ldi r23,lo8(36)
	ldi r24,lo8(116)
	ldi r25,lo8(73)
	call __divsf3
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(-128)
	ldi r21,lo8(63)
	call __subsf3
	call round
	call __fixunssfsi
	movw r30,r14
	st Z,r22
	movw r30,r28
	subi r30,-9
	sbci r31,-2
	ld __tmp_reg__,Z+
	ld r31,Z
	mov r30,__tmp_reg__
	ldi r24,lo8(24)
	st Z,r24
	movw r30,r28
	subi r30,-11
	sbci r31,-2
	ld __tmp_reg__,Z+
	ld r31,Z
	mov r30,__tmp_reg__
	ldi r24,lo8(6)
	st Z,r24
	movw r30,r28
	subi r30,-19
	sbci r31,-2
	st Z,r17
	ldi r20,0
	ldi r21,lo8(1)
	ldi r22,lo8(-1)
	ldi r23,0
	movw r24,r28
	call memset
	movw r30,r28
	subi r30,-3
	sbci r31,-2
	std Z+1,r29
	st Z,r28
	adiw r30,2
	std Z+1,r29
	st Z,r28
	sbiw r30,3
	ldi r24,lo8(1)
	st Z,r24
	subi r28,-20
	sbci r29,-2
	std Y+1,__zero_reg__
	st Y,__zero_reg__
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r15
	pop r14
	ret
	.size	_ZN6Serial4initE4UART14SerialPriority, .-_ZN6Serial4initE4UART14SerialPriority
.global	_ZN6Serial5flushEv
	.type	_ZN6Serial5flushEv, @function
_ZN6Serial5flushEv:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r30,r24
	subi r30,-7
	sbci r31,-2
	ld r26,Z
	ldd r27,Z+1
	movw r28,r24
	subi r28,-17
	sbci r29,-2
.L4:
	ld r18,X
	sbrs r18,7
	rjmp .L2
	ld r30,Y
	ldd r31,Y+1
	ld r18,Z
	rjmp .L4
.L2:
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZN6Serial5flushEv, .-_ZN6Serial5flushEv
.global	_ZN6Serial16setRxISRCallBackEb
	.type	_ZN6Serial16setRxISRCallBackEb, @function
_ZN6Serial16setRxISRCallBackEb:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	subi r30,-9
	sbci r31,-2
	ld __tmp_reg__,Z+
	ld r31,Z
	mov r30,__tmp_reg__
	ld r24,Z
	tst r22
	breq .L7
	ori r24,lo8(-128)
	st Z,r24
/* #APP */
 ;  63 "libs/communication/uart/serial.cpp" 1
	sei
 ;  0 "" 2
/* #NOAPP */
	ret
.L7:
	andi r24,lo8(127)
	st Z,r24
	ret
	.size	_ZN6Serial16setRxISRCallBackEb, .-_ZN6Serial16setRxISRCallBackEb
.global	_ZN6Serial13setEchoServerEb
	.type	_ZN6Serial13setEchoServerEb, @function
_ZN6Serial13setEchoServerEb:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	inc r25
	movw r30,r24
	st Z,r22
	ret
	.size	_ZN6Serial13setEchoServerEb, .-_ZN6Serial13setEchoServerEb
.global	_ZN6Serial10insertDataEh
	.type	_ZN6Serial10insertDataEh, @function
_ZN6Serial10insertDataEh:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r30,r24
	subi r30,-5
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
	brlo .L11
	std Z+1,r19
	st Z,r18
	rjmp .L12
.L11:
	std Z+1,r25
	st Z,r24
.L12:
	ld r26,Z
	ldd r27,Z+1
	movw r28,r24
	subi r28,-3
	sbci r29,-2
	ld r18,Y
	ldd r19,Y+1
	cp r26,r18
	cpc r27,r19
	brne .L13
	sbiw r26,1
	cp r26,r24
	cpc r27,r25
	brsh .L14
	std Z+1,r21
	st Z,r20
	rjmp .L10
.L13:
	st X,r22
	rjmp .L10
.L14:
	std Z+1,r27
	st Z,r26
.L10:
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZN6Serial10insertDataEh, .-_ZN6Serial10insertDataEh
.global	_ZN6Serial11incReadDataEh
	.type	_ZN6Serial11incReadDataEh, @function
_ZN6Serial11incReadDataEh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	subi r30,-3
	sbci r31,-2
	ld r18,Z
	ldd r19,Z+1
	add r18,r22
	adc r19,__zero_reg__
	std Z+1,r19
	st Z,r18
	ret
	.size	_ZN6Serial11incReadDataEh, .-_ZN6Serial11incReadDataEh
.global	_ZN6Serial11enableShellEb
	.type	_ZN6Serial11enableShellEb, @function
_ZN6Serial11enableShellEb:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	subi r30,-1
	sbci r31,-2
	st Z,r22
	adiw r30,8
	ld __tmp_reg__,Z+
	ld r31,Z
	mov r30,__tmp_reg__
	ld r24,Z
	ori r24,lo8(-128)
	st Z,r24
/* #APP */
 ;  63 "libs/communication/uart/serial.cpp" 1
	sei
 ;  0 "" 2
/* #NOAPP */
	ret
	.size	_ZN6Serial11enableShellEb, .-_ZN6Serial11enableShellEb
.global	_ZN6Serial16registerCallbackEPFvvE
	.type	_ZN6Serial16registerCallbackEPFvvE, @function
_ZN6Serial16registerCallbackEPFvvE:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	subi r24,-20
	sbci r25,-2
	movw r30,r24
	std Z+1,r23
	st Z,r22
	ret
	.size	_ZN6Serial16registerCallbackEPFvvE, .-_ZN6Serial16registerCallbackEPFvvE
.global	_ZN6Serial10rxCallBackEv
	.type	_ZN6Serial10rxCallBackEv, @function
_ZN6Serial10rxCallBackEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	subi r24,-20
	sbci r25,-2
	movw r26,r24
	ld r30,X+
	ld r31,X
	sbiw r30,0
	breq .L20
	eijmp
.L20:
	ret
	.size	_ZN6Serial10rxCallBackEv, .-_ZN6Serial10rxCallBackEv
.global	_ZN6Serial14shellIsEnabledEv
	.type	_ZN6Serial14shellIsEnabledEv, @function
_ZN6Serial14shellIsEnabledEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	subi r24,-1
	sbci r25,-2
	movw r30,r24
	ld r24,Z
	ret
	.size	_ZN6Serial14shellIsEnabledEv, .-_ZN6Serial14shellIsEnabledEv
.global	_ZN6Serial16bufferIsReadableEv
	.type	_ZN6Serial16bufferIsReadableEv, @function
_ZN6Serial16bufferIsReadableEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r26,r24
	subi r26,-3
	sbci r27,-2
	movw r30,r24
	subi r30,-5
	sbci r31,-2
	ldi r24,lo8(1)
	ld r20,X+
	ld r21,X
	ld r18,Z
	ldd r19,Z+1
	cp r20,r18
	cpc r21,r19
	brne .L24
	ldi r24,0
.L24:
	ret
	.size	_ZN6Serial16bufferIsReadableEv, .-_ZN6Serial16bufferIsReadableEv
.global	_ZN6Serial11isAvailableEv
	.type	_ZN6Serial11isAvailableEv, @function
_ZN6Serial11isAvailableEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	subi r24,-7
	sbci r25,-2
	movw r26,r24
	ld r30,X+
	ld r31,X
	ld r24,Z
	rol r24
	clr r24
	rol r24
	ret
	.size	_ZN6Serial11isAvailableEv, .-_ZN6Serial11isAvailableEv
.global	_ZN6Serial13echoIsEnabledEv
	.type	_ZN6Serial13echoIsEnabledEv, @function
_ZN6Serial13echoIsEnabledEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	inc r25
	movw r30,r24
	ld r24,Z
	ret
	.size	_ZN6Serial13echoIsEnabledEv, .-_ZN6Serial13echoIsEnabledEv
.global	_ZN6Serial7receiveEv
	.type	_ZN6Serial7receiveEv, @function
_ZN6Serial7receiveEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	subi r30,-7
	sbci r31,-2
	ld __tmp_reg__,Z+
	ld r31,Z
	mov r30,__tmp_reg__
.L28:
	ld r18,Z
	sbrs r18,7
	rjmp .L28
	movw r30,r24
	subi r30,-17
	sbci r31,-2
	ld __tmp_reg__,Z+
	ld r31,Z
	mov r30,__tmp_reg__
	ld r24,Z
	ret
	.size	_ZN6Serial7receiveEv, .-_ZN6Serial7receiveEv
.global	_ZN6Serial9readUntilEPcc
	.type	_ZN6Serial9readUntilEPcc, @function
_ZN6Serial9readUntilEPcc:
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
	movw r14,r24
	movw r28,r22
	mov r16,r20
	ldi r17,0
.L32:
	movw r24,r14
	call _ZN6Serial7receiveEv
	ldi r25,lo8(1)
	add r25,r17
	cpse r24,r16
	rjmp .L31
	add r28,r25
	adc r29,__zero_reg__
	st Y,__zero_reg__
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	ret
.L31:
	movw r30,r28
	add r30,r17
	adc r31,__zero_reg__
	st Z,r24
	mov r17,r25
	rjmp .L32
	.size	_ZN6Serial9readUntilEPcc, .-_ZN6Serial9readUntilEPcc
.global	_ZN6Serial8readDataEv
	.type	_ZN6Serial8readDataEv, @function
_ZN6Serial8readDataEv:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r26,r24
	subi r26,-2
	sbci r27,-2
	st X,__zero_reg__
	movw r30,r24
	subi r30,-3
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
	brlo .L35
	std Z+1,r19
	st Z,r18
	rjmp .L36
.L35:
	std Z+1,r25
	st Z,r24
.L36:
	ld __tmp_reg__,Z+
	ld r31,Z
	mov r30,__tmp_reg__
	movw r28,r24
	subi r28,-5
	sbci r29,-2
	ld r24,Y
	ldd r25,Y+1
	cp r30,r24
	cpc r31,r25
	breq .L37
	ldi r24,lo8(1)
	st X,r24
.L37:
	ld r24,Z
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZN6Serial8readDataEv, .-_ZN6Serial8readDataEv
.global	_ZN6Serial11getPriorityEv
	.type	_ZN6Serial11getPriorityEv, @function
_ZN6Serial11getPriorityEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	subi r24,-19
	sbci r25,-2
	movw r30,r24
	ld r24,Z
	ret
	.size	_ZN6Serial11getPriorityEv, .-_ZN6Serial11getPriorityEv
.global	_ZN6Serial6_printEPKc
	.type	_ZN6Serial6_printEPKc, @function
_ZN6Serial6_printEPKc:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	ldi r18,0
	movw r26,r24
	subi r26,-7
	sbci r27,-2
	movw r28,r24
	subi r28,-17
	sbci r29,-2
.L42:
	movw r30,r22
	add r30,r18
	adc r31,__zero_reg__
	ld r19,Z
	tst r19
	breq .L39
	ld r30,X+
	ld r31,X
	sbiw r26,1
.L41:
	ld r20,Z
	sbrs r20,5
	rjmp .L41
	ld r30,Y
	ldd r31,Y+1
	st Z,r19
	subi r18,lo8(-(1))
	rjmp .L42
.L39:
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZN6Serial6_printEPKc, .-_ZN6Serial6_printEPKc
.global	_ZN6Serial6printfEPKcz
	.type	_ZN6Serial6printfEPKcz, @function
_ZN6Serial6printfEPKcz:
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	dec r29
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 256 */
/* stack size = 258 */
.L__stack_usage = 258
	movw r20,r28
	subi r20,-10
	sbci r21,-2
	subi r28,lo8(-264)
	sbci r29,hi8(-264)
	ld r22,Y
	ldd r23,Y+1
	subi r28,lo8(264)
	sbci r29,hi8(264)
	movw r24,r28
	adiw r24,1
	call vsprintf
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	subi r28,lo8(-262)
	sbci r29,hi8(-262)
	ld r24,Y
	ldd r25,Y+1
	subi r28,lo8(262)
	sbci r29,hi8(262)
	call _ZN6Serial6_printEPKc
/* epilogue start */
	inc r29
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	ret
	.size	_ZN6Serial6printfEPKcz, .-_ZN6Serial6printfEPKcz
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"\033[1;1H\033[2J"
	.text
.global	_ZN6Serial5clearEv
	.type	_ZN6Serial5clearEv, @function
_ZN6Serial5clearEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r18,lo8(.LC0)
	ldi r19,hi8(.LC0)
	push r19
	push r18
	push r25
	push r24
	call _ZN6Serial6printfEPKcz
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	ret
	.size	_ZN6Serial5clearEv, .-_ZN6Serial5clearEv
.global	__vector_25
	.type	__vector_25, @function
__vector_25:
	push r1
	push r0
	in r0,__SREG__
	push r0
	clr __zero_reg__
	in r0,__RAMPZ__
	push r0
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
	push r28
	push r29
	push r30
	push r31
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 19 */
.L__stack_usage = 19
	lds r24,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	lds r25,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	or r24,r25
	brne .L48
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
.L48:
	lds r28,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	lds r29,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	lds r17,198
	mov r22,r17
	movw r24,r28
	call _ZN6Serial10insertDataEh
	movw r30,r28
	inc r31
	ld r24,Z
	cpse r24,__zero_reg__
	rjmp .L49
.L50:
	movw r24,r28
	call _ZN6Serial10rxCallBackEv
/* epilogue start */
	pop r31
	pop r30
	pop r29
	pop r28
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
	pop r0
	out __RAMPZ__,r0
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
.L49:
	sts 198,r17
	rjmp .L50
	.size	__vector_25, .-__vector_25
.global	__vector_36
	.type	__vector_36, @function
__vector_36:
	push r1
	push r0
	in r0,__SREG__
	push r0
	clr __zero_reg__
	in r0,__RAMPZ__
	push r0
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
	push r28
	push r29
	push r30
	push r31
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 19 */
.L__stack_usage = 19
	lds r24,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+2
	lds r25,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+2+1
	or r24,r25
	brne .L53
	ldi r24,lo8(22)
	ldi r25,lo8(1)
	call _Znwj
	movw r30,r24
	subi r30,-7
	sbci r31,-2
	ldi r18,lo8(-56)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-55)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-54)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-51)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-52)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-50)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	sts _ZZN13SerialManager11getInstanceE10SerialPortE8instance+2+1,r25
	sts _ZZN13SerialManager11getInstanceE10SerialPortE8instance+2,r24
.L53:
	lds r28,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+2
	lds r29,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+2+1
	lds r17,206
	mov r22,r17
	movw r24,r28
	call _ZN6Serial10insertDataEh
	movw r30,r28
	inc r31
	ld r24,Z
	cpse r24,__zero_reg__
	rjmp .L54
.L55:
	movw r24,r28
	call _ZN6Serial10rxCallBackEv
/* epilogue start */
	pop r31
	pop r30
	pop r29
	pop r28
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
	pop r0
	out __RAMPZ__,r0
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
.L54:
	sts 206,r17
	rjmp .L55
	.size	__vector_36, .-__vector_36
.global	__vector_51
	.type	__vector_51, @function
__vector_51:
	push r1
	push r0
	in r0,__SREG__
	push r0
	clr __zero_reg__
	in r0,__RAMPZ__
	push r0
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
	push r28
	push r29
	push r30
	push r31
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 19 */
.L__stack_usage = 19
	lds r24,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+4
	lds r25,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+4+1
	or r24,r25
	brne .L58
	ldi r24,lo8(22)
	ldi r25,lo8(1)
	call _Znwj
	movw r30,r24
	subi r30,-7
	sbci r31,-2
	ldi r18,lo8(-48)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-47)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-46)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-43)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-44)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(-42)
	ldi r19,0
	std Z+1,r19
	st Z,r18
	sts _ZZN13SerialManager11getInstanceE10SerialPortE8instance+4+1,r25
	sts _ZZN13SerialManager11getInstanceE10SerialPortE8instance+4,r24
.L58:
	lds r28,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+4
	lds r29,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+4+1
	lds r17,214
	mov r22,r17
	movw r24,r28
	call _ZN6Serial10insertDataEh
	movw r30,r28
	inc r31
	ld r24,Z
	cpse r24,__zero_reg__
	rjmp .L59
.L60:
	movw r24,r28
	call _ZN6Serial10rxCallBackEv
/* epilogue start */
	pop r31
	pop r30
	pop r29
	pop r28
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
	pop r0
	out __RAMPZ__,r0
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
.L59:
	sts 214,r17
	rjmp .L60
	.size	__vector_51, .-__vector_51
.global	__vector_54
	.type	__vector_54, @function
__vector_54:
	push r1
	push r0
	in r0,__SREG__
	push r0
	clr __zero_reg__
	in r0,__RAMPZ__
	push r0
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
	push r28
	push r29
	push r30
	push r31
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 19 */
.L__stack_usage = 19
	lds r24,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+6
	lds r25,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+6+1
	or r24,r25
	brne .L63
	ldi r24,lo8(22)
	ldi r25,lo8(1)
	call _Znwj
	movw r30,r24
	subi r30,-7
	sbci r31,-2
	ldi r18,lo8(48)
	ldi r19,lo8(1)
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(49)
	ldi r19,lo8(1)
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(50)
	ldi r19,lo8(1)
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(53)
	ldi r19,lo8(1)
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(52)
	ldi r19,lo8(1)
	std Z+1,r19
	st Z,r18
	adiw r30,2
	ldi r18,lo8(54)
	ldi r19,lo8(1)
	std Z+1,r19
	st Z,r18
	sts _ZZN13SerialManager11getInstanceE10SerialPortE8instance+6+1,r25
	sts _ZZN13SerialManager11getInstanceE10SerialPortE8instance+6,r24
.L63:
	lds r28,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+6
	lds r29,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+6+1
	lds r17,310
	mov r22,r17
	movw r24,r28
	call _ZN6Serial10insertDataEh
	movw r30,r28
	inc r31
	ld r24,Z
	cpse r24,__zero_reg__
	rjmp .L64
.L65:
	movw r24,r28
	call _ZN6Serial10rxCallBackEv
/* epilogue start */
	pop r31
	pop r30
	pop r29
	pop r28
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
	pop r0
	out __RAMPZ__,r0
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
.L64:
	sts 310,r17
	rjmp .L65
	.size	__vector_54, .-__vector_54
	.weak	_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	.section	.bss._ZZN13SerialManager11getInstanceE10SerialPortE8instance,"awG",@nobits,_ZZN13SerialManager11getInstanceE10SerialPortE8instance,comdat
	.type	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, @object
	.size	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, 8
_ZZN13SerialManager11getInstanceE10SerialPortE8instance:
	.zero	8
	.ident	"GCC: (GNU) 5.4.0"
.global __do_copy_data
.global __do_clear_bss
