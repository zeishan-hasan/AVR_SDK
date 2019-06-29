	.file	"ethernet.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
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
	.section	.rodata
.LC0:
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.text
.global	_ZN8EthernetC2Ev
	.type	_ZN8EthernetC2Ev, @function
_ZN8EthernetC2Ev:
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
	sbiw r28,36
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 36 */
/* stack size = 44 */
.L__stack_usage = 44
	movw r16,r24
	ldi r24,lo8(6)
	movw r30,r28
	adiw r30,19
	movw r26,r28
	adiw r26,7
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	ldi r24,lo8(6)
	movw r30,r28
	adiw r30,13
	movw r26,r28
	adiw r26,1
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	ldi r24,lo8(7)
	ldi r30,lo8(.LC0)
	ldi r31,hi8(.LC0)
	movw r26,r16
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	ldi r24,lo8(-43)
	mov r15,r24
	movw r30,r16
	std Z+7,r15
	std Z+23,__zero_reg__
	std Z+22,__zero_reg__
	ldi r25,lo8(8)
	mov r12,r25
	mov r13,__zero_reg__
	std Z+25,r13
	std Z+24,r12
	std Z+27,__zero_reg__
	std Z+26,__zero_reg__
	ldi r24,lo8(8)
	ldi r25,0
	call _Znwj
	movw r30,r16
	std Z+23,r25
	std Z+22,r24
	ldi r24,lo8(6)
	movw r30,r28
	adiw r30,7
	movw r26,r16
	adiw r26,8
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	ldi r24,lo8(6)
	movw r30,r28
	adiw r30,1
	movw r26,r16
	adiw r26,14
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	movw r30,r16
	std Z+21,__zero_reg__
	std Z+20,__zero_reg__
	std Z+29,__zero_reg__
	std Z+30,__zero_reg__
	std Z+31,__zero_reg__
	std Z+32,__zero_reg__
	ldi r24,lo8(6)
	movw r30,r28
	adiw r30,31
	movw r26,r28
	adiw r26,19
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	ldi r24,lo8(6)
	movw r30,r28
	adiw r30,25
	movw r26,r28
	adiw r26,13
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	ldi r24,lo8(7)
	ldi r30,lo8(.LC0)
	ldi r31,hi8(.LC0)
	movw r26,r16
	adiw r26,45
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	movw r30,r16
	std Z+52,r15
	movw r14,r16
	ldi r31,71
	add r14,r31
	adc r15,__zero_reg__
	movw r30,r14
	std Z+1,__zero_reg__
	st Z,__zero_reg__
	std Z+3,r13
	std Z+2,r12
	std Z+5,__zero_reg__
	std Z+4,__zero_reg__
	ldi r24,lo8(8)
	ldi r25,0
	call _Znwj
	movw r30,r14
	std Z+1,r25
	st Z,r24
	ldi r24,lo8(6)
	movw r30,r28
	adiw r30,19
	movw r26,r16
	adiw r26,53
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	ldi r24,lo8(6)
	movw r30,r28
	adiw r30,13
	movw r26,r16
	adiw r26,59
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	movw r30,r16
	subi r30,-65
	sbci r31,-1
	st Z,__zero_reg__
	std Z+1,__zero_reg__
	std Z+2,__zero_reg__
	std Z+3,__zero_reg__
	adiw r30,4
	std Z+1,__zero_reg__
	st Z,__zero_reg__
	adiw r30,9
	st Z,__zero_reg__
	std Z+1,__zero_reg__
	std Z+2,__zero_reg__
	std Z+3,__zero_reg__
/* epilogue start */
	adiw r28,36
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
	ret
	.size	_ZN8EthernetC2Ev, .-_ZN8EthernetC2Ev
.global	_ZN8EthernetC1Ev
	.set	_ZN8EthernetC1Ev,_ZN8EthernetC2Ev
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Size : %u\r\n"
	.text
.global	_ZN8Ethernet11encapsulateERSt6vectorIhSaIhEE
	.type	_ZN8Ethernet11encapsulateERSt6vectorIhSaIhEE, @function
_ZN8Ethernet11encapsulateERSt6vectorIhSaIhEE:
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
	sbiw r28,7
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 7 */
/* stack size = 15 */
.L__stack_usage = 15
	movw r26,r22
	adiw r26,4
	ld r18,X+
	ld r19,X
	sbiw r26,4+1
	subi r18,46
	sbc r19,__zero_reg__
	cpi r18,-81
	sbci r19,5
	brlo .L32
	ldi r24,0
	rjmp .L31
.L32:
	movw r14,r22
	movw r16,r24
	lds r24,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	lds r25,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	or r24,r25
	brne .L25
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
.L25:
	lds r13,_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	lds r12,_ZZN13SerialManager11getInstanceE10SerialPortE8instance+1
	movw r24,r16
	adiw r24,22
	cp r14,r24
	cpc r15,r25
	brne .+2
	rjmp .L14
	movw r30,r14
	ldd r22,Z+4
	ldd r23,Z+5
	movw r26,r16
	adiw r26,24
	ld r18,X+
	ld r19,X
	sbiw r26,24+1
	cp r18,r22
	cpc r19,r23
	brsh .L15
	call _ZNSt6vectorIhSaIhEE7reserveEj.part.7
.L15:
	movw r30,r14
	ldd r24,Z+4
	ldd r25,Z+5
	movw r26,r16
	adiw r26,26
	ld r18,X+
	ld r19,X
	sbiw r26,26+1
	cp r24,r18
	cpc r25,r19
	brsh .L16
	movw r18,r24
.L16:
	ldi r24,0
	ldi r25,0
.L18:
	cp r18,r24
	cpc r19,r25
	breq .L17
	movw r26,r14
	ld r30,X+
	ld r31,X
	add r30,r24
	adc r31,r25
	ld r20,Z
	movw r26,r16
	adiw r26,22
	ld r30,X+
	ld r31,X
	sbiw r26,22+1
	add r30,r24
	adc r31,r25
	st Z,r20
	adiw r24,1
	rjmp .L18
.L17:
	movw r30,r16
	ldd r24,Z+26
	ldd r25,Z+27
	movw r26,r14
	adiw r26,4
	ld r18,X+
	ld r19,X
	sbiw r26,4+1
	cp r24,r18
	cpc r25,r19
	brsh .L19
.L21:
	movw r30,r14
	ldd r18,Z+4
	ldd r19,Z+5
	cp r24,r18
	cpc r25,r19
	brsh .L19
	ld r26,Z
	ldd r27,Z+1
	add r26,r24
	adc r27,r25
	movw r30,r16
	ldd r18,Z+22
	ldd r19,Z+23
	movw r30,r18
	add r30,r24
	adc r31,r25
	sbiw r30,0
	breq .L20
	ld r18,X
	st Z,r18
.L20:
	movw r26,r16
	adiw r26,26
	ld r18,X+
	ld r19,X
	sbiw r26,26+1
	subi r18,-1
	sbci r19,-1
	adiw r26,26+1
	st X,r19
	st -X,r18
	sbiw r26,26
	adiw r24,1
	rjmp .L21
.L19:
	movw r30,r14
	ldd r24,Z+4
	ldd r25,Z+5
	movw r26,r16
	adiw r26,26
	ld r18,X+
	ld r19,X
	sbiw r26,26+1
	cp r24,r18
	cpc r25,r19
	brsh .L14
	adiw r26,26+1
	st X,r25
	st -X,r24
	sbiw r26,26
.L14:
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
	sbiw r24,45
	brsh .L23
	ldi r22,lo8(45)
	ldi r23,0
	movw r24,r28
	adiw r24,1
	call _ZNSt6vectorIhSaIhEE7reserveEj.part.7
.L23:
	ldd r26,Y+1
	ldd r27,Y+2
	ldi r24,lo8(45)
	movw r30,r16
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	ldd r24,Y+6
	push r24
	ldd r24,Y+5
	push r24
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	push r25
	push r24
	push r12
	push r13
	call _ZN6Serial6printfEPKcz
	ldd r24,Y+1
	ldd r25,Y+2
	call _ZdlPv
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	ldi r24,lo8(1)
.L31:
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
	pop r13
	pop r12
	ret
	.size	_ZN8Ethernet11encapsulateERSt6vectorIhSaIhEE, .-_ZN8Ethernet11encapsulateERSt6vectorIhSaIhEE
.global	_ZN8Ethernet11decapsulateERSt6vectorIhSaIhEE
	.type	_ZN8Ethernet11decapsulateERSt6vectorIhSaIhEE, @function
_ZN8Ethernet11decapsulateERSt6vectorIhSaIhEE:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_ZN8Ethernet11decapsulateERSt6vectorIhSaIhEE, .-_ZN8Ethernet11decapsulateERSt6vectorIhSaIhEE
	.weak	_ZZN13SerialManager11getInstanceE10SerialPortE8instance
	.section	.bss._ZZN13SerialManager11getInstanceE10SerialPortE8instance,"awG",@nobits,_ZZN13SerialManager11getInstanceE10SerialPortE8instance,comdat
	.type	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, @object
	.size	_ZZN13SerialManager11getInstanceE10SerialPortE8instance, 8
_ZZN13SerialManager11getInstanceE10SerialPortE8instance:
	.zero	8
	.ident	"GCC: (GNU) 5.4.0"
.global __do_copy_data
.global __do_clear_bss
