	.file	"main.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"Interrupt dal pin %u\r\n"
	.text
.global	_Z4funch
	.type	_Z4funch, @function
_Z4funch:
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
	lds r24,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	lds r25,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	or r24,r25
	brne .L2
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
.L2:
	push __zero_reg__
	push r28
	ldi r24,lo8(.LC3)
	ldi r25,hi8(.LC3)
	push r25
	push r24
	lds r24,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	push r24
	lds r24,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	push r24
	call _ZN6Serial6printfEPKcz
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
/* epilogue start */
	pop r28
	ret
	.size	_Z4funch, .-_Z4funch
	.section	.rodata.str1.1
.LC4:
	.string	"\r\nPacket size: %u\r\n"
.LC5:
	.string	"Ethernet:\r\n"
.LC6:
	.string	"\tDestination : %02X:%02X:%02X:%02X:%02X:%02X\r\n"
.LC7:
	.string	"\tSource      : %02X:%02X:%02X:%02X:%02X:%02X\r\n"
.LC8:
	.string	"\tEtherType   : 0x%04X\r\n"
.LC9:
	.string	"ARP:\r\n"
.LC10:
	.string	"\tHardware Type  : 0x%04X\r\n"
.LC11:
	.string	"\tProtocol Type  : 0x%04X\r\n"
.LC12:
	.string	"\tHardware len   : 0x%02X\r\n"
.LC13:
	.string	"\tProtocol len   : 0x%02x\r\n"
.LC14:
	.string	"\tOpcode         : 0x%04x\r\n"
.LC15:
	.string	"\tSrc hw addr    : %02X:%02X:%02X:%02X:%02X:%02X\r\n"
.LC16:
	.string	"\tSrc proto addr : %d.%d.%d.%d\r\n"
.LC17:
	.string	"\tDst hw addr    : %02X:%02X:%02X:%02X:%02X:%02X\r\n"
.LC18:
	.string	"\tDst proto addr : %d.%d.%d.%d\r\n"
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	subi r28,54
	sbci r29,2
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 566 */
/* stack size = 568 */
.L__stack_usage = 568
	lds r24,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	lds r25,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	or r24,r25
	brne .L5
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
.L5:
	lds r17,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	lds r15,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	ldi r18,0
	ldi r20,lo8(64)
	ldi r21,lo8(66)
	ldi r22,lo8(15)
	ldi r23,0
	mov r24,r17
	mov r25,r15
	call _ZN6Serial4initE4UART14SerialPriority
	ldi r22,0
	mov r24,r17
	mov r25,r15
	call _ZN6Serial16setRxISRCallBackEb
	ldi r22,0
	mov r24,r17
	mov r25,r15
	call _ZN6Serial13setEchoServerEb
	mov r24,r17
	mov r25,r15
	call _ZN6Serial5clearEv
	movw r12,r28
	ldi r18,-1
	sub r12,r18
	ldi r18,-3
	sbc r13,r18
	movw r24,r12
	call _ZN8Enc28j60C1Ev
	ldi r16,lo8(53)
	ldi r18,lo8(52)
	ldi r20,lo8(51)
	ldi r22,lo8(50)
	movw r24,r12
	call _ZN8Enc28j606setSPIEhhhh
	movw r24,r12
	call _ZN8Enc28j604initEv
	subi r28,lo8(-565)
	sbci r29,hi8(-565)
	st Y,r12
	subi r28,lo8(565)
	sbci r29,hi8(565)
	subi r28,lo8(-566)
	sbci r29,hi8(-566)
	st Y,r13
	subi r28,lo8(566)
	sbci r29,hi8(566)
	ldi r24,lo8(25)
	ldi r25,lo8(2)
	add r24,r28
	adc r25,r29
	adiw r24,12
	subi r28,lo8(-563)
	sbci r29,hi8(-563)
	std Y+1,r25
	st Y,r24
	subi r28,lo8(563)
	sbci r29,hi8(563)
.L9:
	ldi r20,0
	ldi r21,lo8(2)
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	subi r28,lo8(-565)
	sbci r29,hi8(-565)
	ld r24,Y
	subi r28,lo8(565)
	sbci r29,hi8(565)
	subi r28,lo8(-566)
	sbci r29,hi8(-566)
	ld r25,Y
	subi r28,lo8(566)
	sbci r29,hi8(566)
	call _ZN8Enc28j6013receivePacketEPhj
	sbiw r24,0
	brne .+2
	rjmp .L7
	push r25
	push r24
	ldi r24,lo8(.LC4)
	ldi r25,hi8(.LC4)
	push r25
	push r24
	push r15
	push r17
	call _ZN6Serial6printfEPKcz
	ldi r24,lo8(14)
	movw r30,r28
	adiw r30,1
	movw r26,r28
	subi r26,-25
	sbci r27,-3
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	ldi r24,lo8(.LC5)
	ldi r25,hi8(.LC5)
	push r25
	push r24
	push r15
	push r17
	call _ZN6Serial6printfEPKcz
	subi r28,lo8(-542)
	sbci r29,hi8(-542)
	ld r24,Y
	subi r28,lo8(542)
	sbci r29,hi8(542)
	push __zero_reg__
	push r24
	subi r28,lo8(-541)
	sbci r29,hi8(-541)
	ld r24,Y
	subi r28,lo8(541)
	sbci r29,hi8(541)
	push __zero_reg__
	push r24
	subi r28,lo8(-540)
	sbci r29,hi8(-540)
	ld r24,Y
	subi r28,lo8(540)
	sbci r29,hi8(540)
	push __zero_reg__
	push r24
	subi r28,lo8(-539)
	sbci r29,hi8(-539)
	ld r24,Y
	subi r28,lo8(539)
	sbci r29,hi8(539)
	push __zero_reg__
	push r24
	subi r28,lo8(-538)
	sbci r29,hi8(-538)
	ld r24,Y
	subi r28,lo8(538)
	sbci r29,hi8(538)
	push __zero_reg__
	push r24
	subi r28,lo8(-537)
	sbci r29,hi8(-537)
	ld r24,Y
	subi r28,lo8(537)
	sbci r29,hi8(537)
	push __zero_reg__
	push r24
	ldi r24,lo8(.LC6)
	ldi r25,hi8(.LC6)
	push r25
	push r24
	push r15
	push r17
	call _ZN6Serial6printfEPKcz
	subi r28,lo8(-548)
	sbci r29,hi8(-548)
	ld r24,Y
	subi r28,lo8(548)
	sbci r29,hi8(548)
	push __zero_reg__
	push r24
	subi r28,lo8(-547)
	sbci r29,hi8(-547)
	ld r24,Y
	subi r28,lo8(547)
	sbci r29,hi8(547)
	push __zero_reg__
	push r24
	subi r28,lo8(-546)
	sbci r29,hi8(-546)
	ld r24,Y
	subi r28,lo8(546)
	sbci r29,hi8(546)
	push __zero_reg__
	push r24
	subi r28,lo8(-545)
	sbci r29,hi8(-545)
	ld r24,Y
	subi r28,lo8(545)
	sbci r29,hi8(545)
	push __zero_reg__
	push r24
	subi r28,lo8(-544)
	sbci r29,hi8(-544)
	ld r24,Y
	subi r28,lo8(544)
	sbci r29,hi8(544)
	push __zero_reg__
	push r24
	subi r28,lo8(-543)
	sbci r29,hi8(-543)
	ld r24,Y
	subi r28,lo8(543)
	sbci r29,hi8(543)
	push __zero_reg__
	push r24
	ldi r24,lo8(.LC7)
	ldi r25,hi8(.LC7)
	push r25
	push r24
	push r15
	push r17
	call _ZN6Serial6printfEPKcz
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	ldi r20,lo8(2)
	ldi r21,0
	ldi r22,lo8(2)
	ldi r23,0
	subi r28,lo8(-563)
	sbci r29,hi8(-563)
	ld r24,Y
	ldd r25,Y+1
	subi r28,lo8(563)
	sbci r29,hi8(563)
	call _Z12__swapEndianPhjj
	subi r28,lo8(-550)
	sbci r29,hi8(-550)
	ld r24,Y
	subi r28,lo8(550)
	sbci r29,hi8(550)
	push r24
	subi r28,lo8(-549)
	sbci r29,hi8(-549)
	ld r24,Y
	subi r28,lo8(549)
	sbci r29,hi8(549)
	push r24
	ldi r24,lo8(.LC8)
	ldi r25,hi8(.LC8)
	push r25
	push r24
	push r15
	push r17
	call _ZN6Serial6printfEPKcz
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	subi r28,lo8(-549)
	sbci r29,hi8(-549)
	ld r24,Y
	ldd r25,Y+1
	subi r28,lo8(549)
	sbci r29,hi8(549)
	cpi r24,6
	sbci r25,8
	breq .+2
	rjmp .L7
	ldi r24,lo8(.LC9)
	ldi r25,hi8(.LC9)
	push r25
	push r24
	push r15
	push r17
	call _ZN6Serial6printfEPKcz
	ldd r3,Y+17
	ldd r2,Y+18
	ldd r4,Y+19
	ldd r5,Y+20
	ldd r7,Y+21
	ldd r6,Y+22
	ldd r13,Y+23
	ldd r12,Y+24
	ldd r11,Y+25
	ldd r10,Y+26
	ldd r9,Y+27
	ldd r8,Y+28
	ldd r24,Y+29
	subi r28,lo8(-551)
	sbci r29,hi8(-551)
	st Y,r24
	subi r28,lo8(551)
	sbci r29,hi8(551)
	ldd r25,Y+30
	subi r28,lo8(-552)
	sbci r29,hi8(-552)
	st Y,r25
	subi r28,lo8(552)
	sbci r29,hi8(552)
	ldd r16,Y+31
	ldd r14,Y+32
	ldd r18,Y+33
	subi r28,lo8(-553)
	sbci r29,hi8(-553)
	st Y,r18
	subi r28,lo8(553)
	sbci r29,hi8(553)
	ldd r24,Y+34
	subi r28,lo8(-554)
	sbci r29,hi8(-554)
	st Y,r24
	subi r28,lo8(554)
	sbci r29,hi8(554)
	ldd r25,Y+35
	subi r28,lo8(-555)
	sbci r29,hi8(-555)
	st Y,r25
	subi r28,lo8(555)
	sbci r29,hi8(555)
	ldd r18,Y+36
	subi r28,lo8(-556)
	sbci r29,hi8(-556)
	st Y,r18
	subi r28,lo8(556)
	sbci r29,hi8(556)
	ldd r24,Y+37
	subi r28,lo8(-557)
	sbci r29,hi8(-557)
	st Y,r24
	subi r28,lo8(557)
	sbci r29,hi8(557)
	ldd r25,Y+38
	subi r28,lo8(-558)
	sbci r29,hi8(-558)
	st Y,r25
	subi r28,lo8(558)
	sbci r29,hi8(558)
	ldd r18,Y+39
	subi r28,lo8(-559)
	sbci r29,hi8(-559)
	st Y,r18
	subi r28,lo8(559)
	sbci r29,hi8(559)
	ldd r24,Y+40
	subi r28,lo8(-560)
	sbci r29,hi8(-560)
	st Y,r24
	subi r28,lo8(560)
	sbci r29,hi8(560)
	ldd r25,Y+41
	subi r28,lo8(-561)
	sbci r29,hi8(-561)
	st Y,r25
	subi r28,lo8(561)
	sbci r29,hi8(561)
	ldd r18,Y+42
	subi r28,lo8(-562)
	sbci r29,hi8(-562)
	st Y,r18
	subi r28,lo8(562)
	sbci r29,hi8(562)
	ldd r24,Y+16
	push r24
	ldd r24,Y+15
	push r24
	ldi r24,lo8(.LC10)
	ldi r25,hi8(.LC10)
	push r25
	push r24
	push r15
	push r17
	call _ZN6Serial6printfEPKcz
	push r2
	push r3
	ldi r24,lo8(.LC11)
	ldi r25,hi8(.LC11)
	push r25
	push r24
	push r15
	push r17
	call _ZN6Serial6printfEPKcz
	push __zero_reg__
	push r4
	ldi r24,lo8(.LC12)
	ldi r25,hi8(.LC12)
	push r25
	push r24
	push r15
	push r17
	call _ZN6Serial6printfEPKcz
	push __zero_reg__
	push r5
	ldi r24,lo8(.LC13)
	ldi r25,hi8(.LC13)
	push r25
	push r24
	push r15
	push r17
	call _ZN6Serial6printfEPKcz
	push r6
	push r7
	ldi r24,lo8(.LC14)
	ldi r25,hi8(.LC14)
	push r25
	push r24
	push r15
	push r17
	call _ZN6Serial6printfEPKcz
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	push __zero_reg__
	push r8
	push __zero_reg__
	push r9
	push __zero_reg__
	push r10
	push __zero_reg__
	push r11
	push __zero_reg__
	push r12
	push __zero_reg__
	push r13
	ldi r24,lo8(.LC15)
	ldi r25,hi8(.LC15)
	push r25
	push r24
	push r15
	push r17
	call _ZN6Serial6printfEPKcz
	push __zero_reg__
	push r14
	push __zero_reg__
	push r16
	push __zero_reg__
	subi r28,lo8(-552)
	sbci r29,hi8(-552)
	ld r25,Y
	subi r28,lo8(552)
	sbci r29,hi8(552)
	push r25
	push __zero_reg__
	subi r28,lo8(-551)
	sbci r29,hi8(-551)
	ld r18,Y
	subi r28,lo8(551)
	sbci r29,hi8(551)
	push r18
	ldi r24,lo8(.LC16)
	ldi r25,hi8(.LC16)
	push r25
	push r24
	push r15
	push r17
	call _ZN6Serial6printfEPKcz
	push __zero_reg__
	subi r28,lo8(-558)
	sbci r29,hi8(-558)
	ld r24,Y
	subi r28,lo8(558)
	sbci r29,hi8(558)
	push r24
	push __zero_reg__
	subi r28,lo8(-557)
	sbci r29,hi8(-557)
	ld r25,Y
	subi r28,lo8(557)
	sbci r29,hi8(557)
	push r25
	push __zero_reg__
	subi r28,lo8(-556)
	sbci r29,hi8(-556)
	ld r18,Y
	subi r28,lo8(556)
	sbci r29,hi8(556)
	push r18
	push __zero_reg__
	subi r28,lo8(-555)
	sbci r29,hi8(-555)
	ld r24,Y
	subi r28,lo8(555)
	sbci r29,hi8(555)
	push r24
	push __zero_reg__
	subi r28,lo8(-554)
	sbci r29,hi8(-554)
	ld r25,Y
	subi r28,lo8(554)
	sbci r29,hi8(554)
	push r25
	push __zero_reg__
	subi r28,lo8(-553)
	sbci r29,hi8(-553)
	ld r18,Y
	subi r28,lo8(553)
	sbci r29,hi8(553)
	push r18
	ldi r24,lo8(.LC17)
	ldi r25,hi8(.LC17)
	push r25
	push r24
	push r15
	push r17
	call _ZN6Serial6printfEPKcz
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	push __zero_reg__
	subi r28,lo8(-562)
	sbci r29,hi8(-562)
	ld r25,Y
	subi r28,lo8(562)
	sbci r29,hi8(562)
	push r25
	push __zero_reg__
	subi r28,lo8(-561)
	sbci r29,hi8(-561)
	ld r18,Y
	subi r28,lo8(561)
	sbci r29,hi8(561)
	push r18
	push __zero_reg__
	subi r28,lo8(-560)
	sbci r29,hi8(-560)
	ld r24,Y
	subi r28,lo8(560)
	sbci r29,hi8(560)
	push r24
	push __zero_reg__
	subi r28,lo8(-559)
	sbci r29,hi8(-559)
	ld r25,Y
	subi r28,lo8(559)
	sbci r29,hi8(559)
	push r25
	ldi r24,lo8(.LC18)
	ldi r25,hi8(.LC18)
	push r25
	push r24
	push r15
	push r17
	call _ZN6Serial6printfEPKcz
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
.L7:
	ldi r25,lo8(1599999)
	ldi r18,hi8(1599999)
	ldi r24,hlo8(1599999)
1:	subi r25,1
	sbci r18,0
	sbci r24,0
	brne 1b
	rjmp .
	nop
	rjmp .L9
	.size	main, .-main
.global	debug
	.data
	.type	debug, @object
	.size	debug, 1
debug:
	.byte	1
	.weak	_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	.section	.bss._ZZN13SerialManager11getInstanceE10SerialPortE8instance,"awG",@nobits,_ZZN13SerialManager11getInstanceE10SerialPortE8instance,comdat
	.type	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, @object
	.size	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, 8
_ZZN13SerialManager11getInstanceE10SerialPortE8instance:
	.zero	8
	.ident	"GCC: (GNU) 5.4.0"
.global __do_copy_data
.global __do_clear_bss
