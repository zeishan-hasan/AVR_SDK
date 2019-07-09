	.file	"ipv4.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.type	_ZNSt6vectorIhSaIhEE7reserveEj.part.7, @function
_ZNSt6vectorIhSaIhEE7reserveEj.part.7:
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
	.size	_ZNSt6vectorIhSaIhEE7reserveEj.part.7, .-_ZNSt6vectorIhSaIhEE7reserveEj.part.7
.global	_ZN4IPv4C2Ev
	.type	_ZN4IPv4C2Ev, @function
_ZN4IPv4C2Ev:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	std Y+33,__zero_reg__
	std Y+32,__zero_reg__
	ldi r24,lo8(8)
	ldi r25,0
	std Y+35,r25
	std Y+34,r24
	std Y+37,__zero_reg__
	std Y+36,__zero_reg__
	call _Znwj
	std Y+33,r25
	std Y+32,r24
	movw r24,r28
	adiw r24,39
	call _ZN8EthernetC1Ev
	lds r24,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	lds r25,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	or r24,r25
	brne .L10
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
.L10:
	subi r28,-102
	sbci r29,-1
	lds r24,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	lds r25,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	std Y+1,r25
	st Y,r24
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZN4IPv4C2Ev, .-_ZN4IPv4C2Ev
.global	_ZN4IPv4C1Ev
	.set	_ZN4IPv4C1Ev,_ZN4IPv4C2Ev
.global	_ZN4IPv411decapsulateERSt6vectorIhSaIhEE
	.type	_ZN4IPv411decapsulateERSt6vectorIhSaIhEE, @function
_ZN4IPv411decapsulateERSt6vectorIhSaIhEE:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_ZN4IPv411decapsulateERSt6vectorIhSaIhEE, .-_ZN4IPv411decapsulateERSt6vectorIhSaIhEE
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"ip %lu\r\n"
	.text
.global	_ZN4IPv413setSrcAddressER10ipv4addr_t
	.type	_ZN4IPv413setSrcAddressER10ipv4addr_t, @function
_ZN4IPv413setSrcAddressER10ipv4addr_t:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	movw r26,r22
	ld r24,X
	adiw r26,1
	ld r25,X
	sbiw r26,1
	adiw r26,2
	ld r18,X
	sbiw r26,2
	adiw r26,3
	ld r19,X
	std Z+20,r24
	std Z+21,r25
	std Z+22,r18
	std Z+23,r19
	lds r20,debug
	tst r20
	breq .L12
	push r19
	push r18
	push r25
	push r24
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	push r25
	push r24
	subi r30,-102
	sbci r31,-1
	ldd r24,Z+1
	push r24
	ld r24,Z
	push r24
	call _ZN6Serial6printfEPKcz
	in r24,__SP_L__
	in r25,__SP_H__
	adiw r24,8
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25
	out __SREG__,__tmp_reg__
	out __SP_L__,r24
.L12:
	ret
	.size	_ZN4IPv413setSrcAddressER10ipv4addr_t, .-_ZN4IPv413setSrcAddressER10ipv4addr_t
.global	_ZN4IPv413setDstAddressER10ipv4addr_t
	.type	_ZN4IPv413setDstAddressER10ipv4addr_t, @function
_ZN4IPv413setDstAddressER10ipv4addr_t:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r22
	ld r20,Z
	ldd r21,Z+1
	ldd r22,Z+2
	ldd r23,Z+3
	movw r30,r24
	std Z+24,r20
	std Z+25,r21
	std Z+26,r22
	std Z+27,r23
	ret
	.size	_ZN4IPv413setDstAddressER10ipv4addr_t, .-_ZN4IPv413setDstAddressER10ipv4addr_t
.global	_ZNK4IPv411getProtocolEv
	.type	_ZNK4IPv411getProtocolEv, @function
_ZNK4IPv411getProtocolEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldd r24,Z+15
	ldi r25,0
	ret
	.size	_ZNK4IPv411getProtocolEv, .-_ZNK4IPv411getProtocolEv
.global	_ZN4IPv411setProtocolERK18HEAD_IPV4_PROTOCOL
	.type	_ZN4IPv411setProtocolERK18HEAD_IPV4_PROTOCOL, @function
_ZN4IPv411setProtocolERK18HEAD_IPV4_PROTOCOL:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r22
	ld r18,Z
	movw r30,r24
	std Z+15,r18
	ret
	.size	_ZN4IPv411setProtocolERK18HEAD_IPV4_PROTOCOL, .-_ZN4IPv411setProtocolERK18HEAD_IPV4_PROTOCOL
.global	_ZN4IPv44ntoaEm
	.type	_ZN4IPv44ntoaEm, @function
_ZN4IPv44ntoaEm:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_ZN4IPv44ntoaEm, .-_ZN4IPv44ntoaEm
	.section	.text._ZNSt6vectorIhSaIhEED2Ev,"axG",@progbits,_ZNSt6vectorIhSaIhEED5Ev,comdat
	.weak	_ZNSt6vectorIhSaIhEED2Ev
	.type	_ZNSt6vectorIhSaIhEED2Ev, @function
_ZNSt6vectorIhSaIhEED2Ev:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ld r24,Z
	ldd r25,Z+1
	jmp _ZdlPv
	.size	_ZNSt6vectorIhSaIhEED2Ev, .-_ZNSt6vectorIhSaIhEED2Ev
	.weak	_ZNSt6vectorIhSaIhEED1Ev
	.set	_ZNSt6vectorIhSaIhEED1Ev,_ZNSt6vectorIhSaIhEED2Ev
	.text
.global	_ZN4IPv4D2Ev
	.type	_ZN4IPv4D2Ev, @function
_ZN4IPv4D2Ev:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	subi r24,-79
	sbci r25,-1
	call _ZNSt6vectorIhSaIhEED1Ev
	movw r24,r28
	adiw r24,32
/* epilogue start */
	pop r29
	pop r28
	jmp _ZNSt6vectorIhSaIhEED1Ev
	.size	_ZN4IPv4D2Ev, .-_ZN4IPv4D2Ev
.global	_ZN4IPv4D1Ev
	.set	_ZN4IPv4D1Ev,_ZN4IPv4D2Ev
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
.L33:
	cp r14,r12
	cpc r15,r13
	brne .+2
	rjmp .L23
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
	brsh .L25
	ldd r24,Y+2
	ldd r25,Y+3
	cp r24,r8
	cpc r25,r9
	brsh .L26
	subi r22,-9
	sbci r23,-1
	cp r24,r22
	cpc r25,r23
	brsh .L26
	movw r24,r28
	call _ZNSt6vectorIhSaIhEE7reserveEj.part.7
.L26:
	ldd r24,Y+4
	ldd r25,Y+5
.L29:
	cp r24,r8
	cpc r25,r9
	brsh .L37
	ld r30,Y
	ldd r31,Y+1
	add r30,r24
	adc r31,r25
	sbiw r30,0
	breq .L28
	st Z,r11
.L28:
	adiw r24,1
	rjmp .L29
.L25:
	cp r8,r22
	cpc r9,r23
	brsh .L30
.L37:
	std Y+5,r9
	std Y+4,r8
.L30:
	ldd r18,Y+4
	ldd r19,Y+5
	subi r18,1
	sbc r19,__zero_reg__
.L32:
	ld r24,Y
	ldd r25,Y+1
	movw r30,r24
	cp r16,r18
	cpc r17,r19
	brsh .L31
	add r30,r18
	adc r31,r19
	subi r18,1
	sbc r19,__zero_reg__
	movw r26,r24
	add r26,r18
	adc r27,r19
	ld r24,X
	st Z,r24
	rjmp .L32
.L31:
	add r30,r16
	adc r31,r17
	st Z,r11
	subi r16,-1
	sbci r17,-1
	ld r22,Y
	ldd r23,Y+1
	add r22,r16
	adc r23,r17
	rjmp .L33
.L23:
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
	.section	.rodata.str1.1
.LC1:
	.string	"size header : %u\r\n"
.LC2:
	.string	"size bef : %u\r\n"
.LC3:
	.string	"Payload data %s\r\n"
.LC4:
	.string	"size after: %u\r\n"
.LC5:
	.string	"size : %u"
	.text
.global	_ZN4IPv411encapsulateERSt6vectorIhSaIhEE
	.type	_ZN4IPv411encapsulateERSt6vectorIhSaIhEE, @function
_ZN4IPv411encapsulateERSt6vectorIhSaIhEE:
	push r14
	push r15
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
/* stack size = 13 */
.L__stack_usage = 13
	movw r16,r24
	movw r14,r22
	lds r24,debug
	tst r24
	breq .L39
	push __zero_reg__
	ldi r24,lo8(35)
	push r24
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	push r25
	push r24
	movw r30,r16
	subi r30,-102
	sbci r31,-1
	ldd r24,Z+1
	push r24
	ld r24,Z
	push r24
	call _ZN6Serial6printfEPKcz
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
.L39:
	lds r24,debug
	tst r24
	breq .L40
	push __zero_reg__
	ldi r24,lo8(35)
	push r24
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	push r25
	push r24
	movw r30,r16
	subi r30,-102
	sbci r31,-1
	ldd r24,Z+1
	push r24
	ld r24,Z
	push r24
	call _ZN6Serial6printfEPKcz
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
.L40:
	lds r24,debug
	tst r24
	breq .L41
	movw r30,r14
	ldd r24,Z+1
	push r24
	ld r24,Z
	push r24
	ldi r24,lo8(.LC3)
	ldi r25,hi8(.LC3)
	push r25
	push r24
	movw r30,r16
	subi r30,-102
	sbci r31,-1
	ldd r24,Z+1
	push r24
	ld r24,Z
	push r24
	call _ZN6Serial6printfEPKcz
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
.L41:
	movw r30,r14
	ld r20,Z
	ldd r21,Z+1
	ldd r18,Z+4
	ldd r19,Z+5
	add r18,r20
	adc r19,r21
	movw r30,r16
	ldd r22,Z+32
	ldd r23,Z+33
	movw r24,r16
	adiw r24,32
	call _ZNSt6vectorIhSaIhEE21_insert_from_iteratorIPhEEvS3_T_S4_
	lds r24,debug
	tst r24
	breq .L42
	push __zero_reg__
	ldi r24,lo8(35)
	push r24
	ldi r24,lo8(.LC4)
	ldi r25,hi8(.LC4)
	push r25
	push r24
	movw r30,r16
	subi r30,-102
	sbci r31,-1
	ldd r24,Z+1
	push r24
	ld r24,Z
	push r24
	call _ZN6Serial6printfEPKcz
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
.L42:
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
	sbiw r24,35
	brsh .L43
	ldi r22,lo8(35)
	ldi r23,0
	movw r24,r28
	adiw r24,1
	call _ZNSt6vectorIhSaIhEE7reserveEj.part.7
.L43:
	ldi r24,lo8(35)
	movw r30,r16
	adiw r30,4
	movw r26,r28
	adiw r26,1
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	lds r24,debug
	tst r24
	breq .L44
	movw r30,r16
	ldd r24,Z+37
	push r24
	ldd r24,Z+36
	push r24
	ldi r24,lo8(.LC5)
	ldi r25,hi8(.LC5)
	push r25
	push r24
	subi r30,-102
	sbci r31,-1
	ldd r24,Z+1
	push r24
	ld r24,Z
	push r24
	call _ZN6Serial6printfEPKcz
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
.L44:
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	movw r24,r16
	adiw r24,39
	call _ZN8Ethernet11encapsulateERSt6vectorIhSaIhEE
	movw r24,r28
	adiw r24,1
	call _ZNSt6vectorIhSaIhEED1Ev
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
	pop r15
	pop r14
	ret
	.size	_ZN4IPv411encapsulateERSt6vectorIhSaIhEE, .-_ZN4IPv411encapsulateERSt6vectorIhSaIhEE
	.weak	_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	.section	.bss._ZZN13SerialManager11getInstanceE10SerialPortE8instance,"awG",@nobits,_ZZN13SerialManager11getInstanceE10SerialPortE8instance,comdat
	.type	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, @object
	.size	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, 2
_ZZN13SerialManager11getInstanceE10SerialPortE8instance:
	.zero	2
	.ident	"GCC: (GNU) 5.4.0"
.global __do_copy_data
.global __do_clear_bss
