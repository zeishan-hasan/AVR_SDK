	.file	"net_utils.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	_Z28__inet_ipv4_getBroadcastAddr10ipv4addr_tS_
	.type	_Z28__inet_ipv4_getBroadcastAddr10ipv4addr_tS_, @function
_Z28__inet_ipv4_getBroadcastAddr10ipv4addr_tS_:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r16,r18
	movw r18,r20
	com r16
	com r17
	com r18
	com r19
	or r22,r16
	or r23,r17
	or r24,r18
	or r25,r19
/* epilogue start */
	pop r17
	pop r16
	ret
	.size	_Z28__inet_ipv4_getBroadcastAddr10ipv4addr_tS_, .-_Z28__inet_ipv4_getBroadcastAddr10ipv4addr_tS_
.global	_Z26__inet_ipv4_getNetworkAddr10ipv4addr_tS_
	.type	_Z26__inet_ipv4_getNetworkAddr10ipv4addr_tS_, @function
_Z26__inet_ipv4_getNetworkAddr10ipv4addr_tS_:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	and r22,r18
	and r23,r19
	and r24,r20
	and r25,r21
	ret
	.size	_Z26__inet_ipv4_getNetworkAddr10ipv4addr_tS_, .-_Z26__inet_ipv4_getNetworkAddr10ipv4addr_tS_
.global	_Z28__inet_ipv4_getNumberClientsPKc
	.type	_Z28__inet_ipv4_getNumberClientsPKc, @function
_Z28__inet_ipv4_getNumberClientsPKc:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_Z28__inet_ipv4_getNumberClientsPKc, .-_Z28__inet_ipv4_getNumberClientsPKc
	.section	.text._Z21__inet_ipv4_itosubneth,"axG",@progbits,_Z21__inet_ipv4_itosubneth,comdat
	.weak	_Z21__inet_ipv4_itosubneth
	.type	_Z21__inet_ipv4_itosubneth, @function
_Z21__inet_ipv4_itosubneth:
	push r12
	push r13
	push r14
	push r15
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 5 */
.L__stack_usage = 5
	mov r28,r24
	ldi r20,lo8(32)
	ldi r21,0
	ldi r22,lo8(1)
	ldi r23,0
	ldi r25,0
	call _Z9isInRangejjj
	tst r24
	breq .L7
	ldi r25,lo8(30)
	sub r25,r28
	ldi r24,lo8(31)
	ldi r18,lo8(1)
	ldi r19,0
.L6:
	movw r20,r18
	mov r0,r24
	rjmp 2f
	1:
	lsl r20
	rol r21
	2:
	dec r0
	brpl 1b
	mov __tmp_reg__,r21
	lsl r0
	sbc r22,r22
	sbc r23,r23
	or r12,r20
	or r13,r21
	or r14,r22
	or r15,r23
	subi r24,lo8(-(-1))
	cpse r24,r25
	rjmp .L6
	movw r22,r12
	movw r24,r14
	rjmp .L5
.L7:
	ldi r22,0
	ldi r23,0
	ldi r24,0
	ldi r25,0
.L5:
/* epilogue start */
	pop r28
	pop r15
	pop r14
	pop r13
	pop r12
	ret
	.size	_Z21__inet_ipv4_itosubneth, .-_Z21__inet_ipv4_itosubneth
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"./"
	.text
.global	_Z25__inet_ipv4_netmask_splitPhPKc
	.type	_Z25__inet_ipv4_netmask_splitPhPKc, @function
_Z25__inet_ipv4_netmask_splitPhPKc:
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
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
/* stack size = 14 */
.L__stack_usage = 14
	movw r12,r24
	movw r16,r22
	movw r30,r22
	0:
	ld __tmp_reg__,Z+
	tst __tmp_reg__
	brne 0b
	movw r24,r30
	sbiw r24,1
	ldi r20,lo8(18)
	ldi r21,0
	ldi r22,lo8(9)
	ldi r23,0
	sub r24,r16
	sbc r25,r17
	call _Z9isInRangejjj
	tst r24
	breq .L10
	ldi r20,lo8(.LC0)
	ldi r21,hi8(.LC0)
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	movw r24,r16
	call _Z5splitPKcRPPcS0_
	sbiw r24,5
	brne .L10
	ldd r16,Y+1
	ldd r17,Y+2
	movw r14,r16
	movw r10,r12
	movw r8,r16
	ldi r31,8
	add r8,r31
	adc r9,__zero_reg__
.L12:
	movw r30,r14
	ld r24,Z+
	ld r25,Z+
	movw r14,r30
	call atoi
	movw r30,r10
	st Z+,r24
	movw r10,r30
	cp r14,r8
	cpc r15,r9
	brne .L12
	movw r30,r16
	ldd r24,Z+8
	ldd r25,Z+9
	call atoi
	call _Z21__inet_ipv4_itosubneth
	movw r30,r12
	std Z+4,r22
.L10:
/* epilogue start */
	pop __tmp_reg__
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
	ret
	.size	_Z25__inet_ipv4_netmask_splitPhPKc, .-_Z25__inet_ipv4_netmask_splitPhPKc
.global	_Z28__inet_ipv4_getBroadcastAddrPKc
	.type	_Z28__inet_ipv4_getBroadcastAddrPKc, @function
_Z28__inet_ipv4_getBroadcastAddrPKc:
	push r16
	push r17
	push r28
	push r29
	rcall .
	push __zero_reg__
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 5 */
/* stack size = 9 */
.L__stack_usage = 9
	movw r16,r24
	movw r30,r24
	0:
	ld __tmp_reg__,Z+
	tst __tmp_reg__
	brne 0b
	movw r24,r30
	sbiw r24,1
	ldi r20,lo8(18)
	ldi r21,0
	ldi r22,lo8(7)
	ldi r23,0
	sub r24,r16
	sbc r25,r17
	call _Z9isInRangejjj
	cpse r24,__zero_reg__
	rjmp .L19
	ldi r22,0
	ldi r23,0
	movw r24,r22
	rjmp .L20
.L19:
	movw r22,r16
	movw r24,r28
	adiw r24,1
	call _Z25__inet_ipv4_netmask_splitPhPKc
	ldd r24,Y+5
	call _Z21__inet_ipv4_itosubneth
	com r22
	com r23
	com r24
	com r25
.L20:
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_Z28__inet_ipv4_getBroadcastAddrPKc, .-_Z28__inet_ipv4_getBroadcastAddrPKc
.global	_Z26__inet_ipv4_getNetworkAddrPKc
	.type	_Z26__inet_ipv4_getNetworkAddrPKc, @function
_Z26__inet_ipv4_getNetworkAddrPKc:
	push r16
	push r17
	push r28
	push r29
	rcall .
	push __zero_reg__
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 5 */
/* stack size = 9 */
.L__stack_usage = 9
	movw r16,r24
	movw r30,r24
	0:
	ld __tmp_reg__,Z+
	tst __tmp_reg__
	brne 0b
	movw r24,r30
	sbiw r24,1
	ldi r20,lo8(18)
	ldi r21,0
	ldi r22,lo8(7)
	ldi r23,0
	sub r24,r16
	sbc r25,r17
	call _Z9isInRangejjj
	tst r24
	breq .L24
	movw r22,r16
	movw r24,r28
	adiw r24,1
	call _Z25__inet_ipv4_netmask_splitPhPKc
	ldd r24,Y+5
	call _Z21__inet_ipv4_itosubneth
.L24:
	ldi r22,0
	ldi r23,0
	movw r24,r22
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_Z26__inet_ipv4_getNetworkAddrPKc, .-_Z26__inet_ipv4_getNetworkAddrPKc
	.section	.rodata.str1.1
.LC1:
	.string	"/"
	.text
.global	_Z25__inet_ipv4_netmask_splitPKc
	.type	_Z25__inet_ipv4_netmask_splitPKc, @function
_Z25__inet_ipv4_netmask_splitPKc:
	push r17
	push r28
	push r29
	push __zero_reg__
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
/* stack size = 5 */
.L__stack_usage = 5
	ldi r20,lo8(.LC1)
	ldi r21,hi8(.LC1)
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	call _Z5splitPKcRPPcS0_
	sbiw r24,2
	breq .L26
.L28:
	ldi r24,0
	rjmp .L27
.L26:
	ldd r30,Y+1
	ldd r31,Y+2
	ldd r24,Z+2
	ldd r25,Z+3
	call atoi
	mov r17,r24
	ldi r20,lo8(18)
	ldi r21,0
	ldi r22,lo8(9)
	ldi r23,0
	ldi r25,0
	call _Z9isInRangejjj
	tst r24
	breq .L28
	mov r24,r17
.L27:
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	ret
	.size	_Z25__inet_ipv4_netmask_splitPKc, .-_Z25__inet_ipv4_netmask_splitPKc
.global	_Z21__inet_ipv4_isValidIPPKc
	.type	_Z21__inet_ipv4_isValidIPPKc, @function
_Z21__inet_ipv4_isValidIPPKc:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	rcall .
	push __zero_reg__
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 5 */
/* stack size = 11 */
.L__stack_usage = 11
	movw r16,r24
	movw r30,r24
	0:
	ld __tmp_reg__,Z+
	tst __tmp_reg__
	brne 0b
	movw r24,r30
	sbiw r24,1
	ldi r20,lo8(18)
	ldi r21,0
	ldi r22,lo8(9)
	ldi r23,0
	sub r24,r16
	sbc r25,r17
	call _Z9isInRangejjj
	tst r24
	breq .L33
	movw r22,r16
	movw r24,r28
	adiw r24,1
	call _Z25__inet_ipv4_netmask_splitPhPKc
	movw r16,r28
	subi r16,-1
	sbci r17,-1
	movw r14,r28
	ldi r31,5
	add r14,r31
	adc r15,__zero_reg__
.L35:
	movw r30,r16
	ld r24,Z+
	movw r16,r30
	ldi r25,0
	call atoi
	ldi r20,lo8(-1)
	ldi r21,0
	ldi r22,0
	ldi r23,0
	call _Z9isInRangejjj
	tst r24
	breq .L33
	cp r14,r16
	cpc r15,r17
	brne .L35
	ldd r24,Y+5
	ldi r25,0
	call atoi
	ldi r20,lo8(32)
	ldi r21,0
	ldi r22,lo8(1)
	ldi r23,0
	call _Z9isInRangejjj
.L33:
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	ret
	.size	_Z21__inet_ipv4_isValidIPPKc, .-_Z21__inet_ipv4_isValidIPPKc
	.section	.rodata.str1.1
.LC2:
	.string	"."
	.text
.global	_Z16__inet_ipv4_atonPKc
	.type	_Z16__inet_ipv4_atonPKc, @function
_Z16__inet_ipv4_atonPKc:
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
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 16 */
.L__stack_usage = 16
	movw r16,r24
	call _Z21__inet_ipv4_isValidIPPKc
	cpse r24,__zero_reg__
	rjmp .L44
.L45:
	ldd r22,Y+1
	ldd r23,Y+2
	ldd r24,Y+3
	ldd r25,Y+4
/* epilogue start */
	adiw r28,6
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
	ret
.L44:
	movw r10,r28
	ldi r24,5
	add r10,r24
	adc r11,__zero_reg__
	ldi r20,lo8(.LC2)
	ldi r21,hi8(.LC2)
	movw r22,r10
	movw r24,r16
	call _Z5splitPKcRPPcS0_
	sbiw r24,4
	brne .L45
	ldd r16,Y+5
	ldd r17,Y+6
	movw r12,r16
	movw r30,r28
	adiw r30,1
.L52:
	movw r14,r30
	cp r30,r10
	cpc r31,r11
	breq .L46
	movw r30,r12
	ld r24,Z+
	ld r25,Z+
	movw r12,r30
	call atoi
	movw r30,r14
	st Z+,r24
	rjmp .L52
.L46:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .L45
	movw r24,r16
	call _ZdaPv
	rjmp .L45
	.size	_Z16__inet_ipv4_atonPKc, .-_Z16__inet_ipv4_atonPKc
	.section	.rodata.str1.1
.LC3:
	.string	"%u.%u.%u.%u"
	.text
.global	_Z16__inet_ipv4_ntoaPc10ipv4addr_t
	.type	_Z16__inet_ipv4_ntoaPc10ipv4addr_t, @function
_Z16__inet_ipv4_ntoaPc10ipv4addr_t:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	push __zero_reg__
	push r23
	push __zero_reg__
	push r22
	push __zero_reg__
	push r21
	push __zero_reg__
	push r20
	ldi r18,lo8(.LC3)
	ldi r19,hi8(.LC3)
	push r19
	push r18
	push r25
	push r24
	call sprintf
	in r24,__SP_L__
	in r25,__SP_H__
	adiw r24,12
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25
	out __SREG__,__tmp_reg__
	out __SP_L__,r24
	ret
	.size	_Z16__inet_ipv4_ntoaPc10ipv4addr_t, .-_Z16__inet_ipv4_ntoaPc10ipv4addr_t
	.section	.rodata.str1.1
.LC4:
	.string	":-"
	.text
.global	_Z15__inet_eth_atonPKc
	.type	_Z15__inet_eth_atonPKc, @function
_Z15__inet_eth_atonPKc:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,14
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 14 */
/* stack size = 20 */
.L__stack_usage = 20
	std Y+7,__zero_reg__
	std Y+8,__zero_reg__
	std Y+9,__zero_reg__
	std Y+10,__zero_reg__
	std Y+11,__zero_reg__
	std Y+12,__zero_reg__
	ldi r20,lo8(.LC4)
	ldi r21,hi8(.LC4)
	movw r22,r28
	subi r22,-13
	sbci r23,-1
	call _Z5splitPKcRPPcS0_
	sbiw r24,6
	brne .L57
	movw r14,r28
	ldi r24,7
	add r14,r24
	adc r15,__zero_reg__
	ldi r16,0
	ldi r17,0
.L56:
	ldd r30,Y+13
	ldd r31,Y+14
	add r30,r16
	adc r31,r17
	ld r24,Z
	ldd r25,Z+1
	call _Z16hexByteStrToBytePKc
	movw r30,r14
	st Z+,r24
	movw r14,r30
	subi r16,-2
	sbci r17,-1
	cpi r16,12
	cpc r17,__zero_reg__
	brne .L56
	ldd r24,Y+13
	ldd r25,Y+14
	sbiw r24,0
	breq .L57
	call _ZdaPv
.L57:
	ldi r24,lo8(6)
	movw r30,r28
	adiw r30,7
	movw r26,r28
	adiw r26,1
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	ldd r18,Y+1
	ldd r19,Y+2
	ldd r20,Y+3
	ldd r21,Y+4
	ldd r22,Y+5
	ldd r23,Y+6
	ldi r24,0
	ldi r25,0
/* epilogue start */
	adiw r28,14
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
	.size	_Z15__inet_eth_atonPKc, .-_Z15__inet_eth_atonPKc
	.section	.rodata.str1.1
.LC5:
	.string	"%u:%u:%u:%u:%u:%u"
	.text
.global	_Z15__inet_eth_ntoaPc9macaddr_t
	.type	_Z15__inet_eth_ntoaPc9macaddr_t, @function
_Z15__inet_eth_ntoaPc9macaddr_t:
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
	std Y+1,r18
	std Y+2,r19
	std Y+3,r20
	std Y+4,r21
	std Y+5,r22
	push __zero_reg__
	push r23
	ldd r18,Y+5
	push __zero_reg__
	push r18
	ldd r18,Y+4
	push __zero_reg__
	push r18
	ldd r18,Y+3
	push __zero_reg__
	push r18
	ldd r18,Y+2
	push __zero_reg__
	push r18
	ldd r18,Y+1
	push __zero_reg__
	push r18
	ldi r18,lo8(.LC5)
	ldi r19,hi8(.LC5)
	push r19
	push r18
	push r25
	push r24
	call sprintf
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
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
	.size	_Z15__inet_eth_ntoaPc9macaddr_t, .-_Z15__inet_eth_ntoaPc9macaddr_t
	.section	.text._ZNSt6vectorISsSaISsEED2Ev,"axG",@progbits,_ZNSt6vectorISsSaISsEED5Ev,comdat
	.weak	_ZNSt6vectorISsSaISsEED2Ev
	.type	_ZNSt6vectorISsSaISsEED2Ev, @function
_ZNSt6vectorISsSaISsEED2Ev:
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
	ldi r28,0
	ldi r29,0
	ldi r16,0
	ldi r17,0
.L66:
	movw r30,r14
	ldd r18,Z+4
	ldd r19,Z+5
	ld r24,Z
	ldd r25,Z+1
	cp r16,r18
	cpc r17,r19
	brsh .L65
	movw r30,r24
	add r30,r28
	adc r31,r29
	ld r24,Z
	ldd r25,Z+1
	call _ZdlPv
	subi r16,-1
	sbci r17,-1
	adiw r28,7
	rjmp .L66
.L65:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	jmp _ZdlPv
	.size	_ZNSt6vectorISsSaISsEED2Ev, .-_ZNSt6vectorISsSaISsEED2Ev
	.weak	_ZNSt6vectorISsSaISsEED1Ev
	.set	_ZNSt6vectorISsSaISsEED1Ev,_ZNSt6vectorISsSaISsEED2Ev
	.section	.text._ZNSt6vectorIcSaIcEE7reserveEj,"axG",@progbits,_ZNSt6vectorIcSaIcEE7reserveEj,comdat
	.weak	_ZNSt6vectorIcSaIcEE7reserveEj
	.type	_ZNSt6vectorIcSaIcEE7reserveEj, @function
_ZNSt6vectorIcSaIcEE7reserveEj:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r30,r24
	ldd r18,Z+2
	ldd r19,Z+3
	cp r18,r22
	cpc r19,r23
	brsh .L67
	movw r28,r24
	ld r16,Z
	ldd r17,Z+1
	std Z+3,r23
	std Z+2,r22
	movw r24,r22
	call _Znwj
	std Y+1,r25
	st Y,r24
	movw r26,r16
.L71:
	movw r24,r26
	sub r24,r16
	sbc r25,r17
	ldd r18,Y+4
	ldd r19,Y+5
	cp r24,r18
	cpc r25,r19
	brsh .L69
	ld r30,Y
	ldd r31,Y+1
	add r30,r24
	adc r31,r25
	sbiw r30,0
	breq .L70
	ld r24,X
	st Z,r24
.L70:
	adiw r26,1
	rjmp .L71
.L69:
	movw r24,r16
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	jmp _ZdlPv
.L67:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_ZNSt6vectorIcSaIcEE7reserveEj, .-_ZNSt6vectorIcSaIcEE7reserveEj
	.section	.text._ZNKSs5c_strEv,"axG",@progbits,_ZNKSs5c_strEv,comdat
	.weak	_ZNKSs5c_strEv
	.type	_ZNKSs5c_strEv, @function
_ZNKSs5c_strEv:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	ldd r22,Y+4
	ldd r23,Y+5
	subi r22,-1
	sbci r23,-1
	call _ZNSt6vectorIcSaIcEE7reserveEj
	ld r30,Y
	ldd r31,Y+1
	ldd r24,Y+4
	ldd r25,Y+5
	add r30,r24
	adc r31,r25
	st Z,__zero_reg__
	ld r24,Y
	ldd r25,Y+1
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZNKSs5c_strEv, .-_ZNKSs5c_strEv
	.text
.global	_Z16__inet_ipv4_atonRKSs
	.type	_Z16__inet_ipv4_atonRKSs, @function
_Z16__inet_ipv4_atonRKSs:
	push r12
	push r13
	push r14
	push r15
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,11
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 11 */
/* stack size = 18 */
.L__stack_usage = 18
	movw r14,r24
	call _ZNKSs5c_strEv
	call _Z21__inet_ipv4_isValidIPPKc
	cpse r24,__zero_reg__
	rjmp .L77
	ldd r12,Y+8
	ldd r13,Y+9
	ldd r14,Y+10
	ldd r15,Y+11
	rjmp .L78
.L77:
	ldi r20,lo8(46)
	movw r22,r14
	movw r24,r28
	adiw r24,1
	call _Z5splitRKSsc
	ldd r24,Y+5
	ldd r25,Y+6
	sbiw r24,4
	brne .L79
	ldi r17,0
	rjmp .L80
.L79:
	ldd r12,Y+8
	ldd r13,Y+9
	ldd r14,Y+10
	ldd r15,Y+11
	movw r24,r28
	adiw r24,1
	call _ZNSt6vectorISsSaISsEED1Ev
	rjmp .L78
.L80:
	mov r14,r17
	mov r15,__zero_reg__
	ldd r24,Y+5
	ldd r25,Y+6
	cp r14,r24
	cpc r15,r25
	brsh .L79
	ldd r24,Y+1
	ldd r25,Y+2
	ldi r18,lo8(7)
	mul r17,r18
	add r24,r0
	adc r25,r1
	clr __zero_reg__
	call _ZNKSs5c_strEv
	call atoi
	ldi r30,lo8(8)
	ldi r31,0
	add r30,r28
	adc r31,r29
	add r30,r14
	adc r31,r15
	st Z,r24
	subi r17,lo8(-(1))
	rjmp .L80
.L78:
	movw r24,r14
	movw r22,r12
/* epilogue start */
	adiw r28,11
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	pop r15
	pop r14
	pop r13
	pop r12
	ret
	.size	_Z16__inet_ipv4_atonRKSs, .-_Z16__inet_ipv4_atonRKSs
.global	_Z15__inet_eth_atonRKSs
	.type	_Z15__inet_eth_atonRKSs, @function
_Z15__inet_eth_atonRKSs:
	push r14
	push r15
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,19
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 19 */
/* stack size = 24 */
.L__stack_usage = 24
	ldi r20,lo8(46)
	movw r22,r24
	movw r24,r28
	adiw r24,1
	call _Z5splitRKSsc
	std Y+14,__zero_reg__
	std Y+15,__zero_reg__
	std Y+16,__zero_reg__
	std Y+17,__zero_reg__
	std Y+18,__zero_reg__
	std Y+19,__zero_reg__
	ldd r24,Y+5
	ldd r25,Y+6
	sbiw r24,6
	brne .L82
	ldi r17,0
.L83:
	mov r14,r17
	mov r15,__zero_reg__
	ldd r24,Y+5
	ldd r25,Y+6
	cp r14,r24
	cpc r15,r25
	brsh .L82
	ldd r24,Y+1
	ldd r25,Y+2
	ldi r18,lo8(7)
	mul r17,r18
	add r24,r0
	adc r25,r1
	clr __zero_reg__
	call _ZNKSs5c_strEv
	call atoi
	ldi r30,lo8(14)
	ldi r31,0
	add r30,r28
	adc r31,r29
	add r30,r14
	adc r31,r15
	st Z,r24
	subi r17,lo8(-(1))
	rjmp .L83
.L82:
	ldi r24,lo8(6)
	movw r30,r28
	adiw r30,14
	movw r26,r28
	adiw r26,8
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	movw r24,r28
	adiw r24,1
	call _ZNSt6vectorISsSaISsEED1Ev
	ldd r18,Y+8
	ldd r19,Y+9
	ldd r20,Y+10
	ldd r21,Y+11
	ldd r22,Y+12
	ldd r23,Y+13
	ldi r24,0
	ldi r25,0
/* epilogue start */
	adiw r28,19
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	pop r15
	pop r14
	ret
	.size	_Z15__inet_eth_atonRKSs, .-_Z15__inet_eth_atonRKSs
.global	_Z16__inet_ipv4_ntoa10ipv4addr_t
	.type	_Z16__inet_ipv4_ntoa10ipv4addr_t, @function
_Z16__inet_ipv4_ntoa10ipv4addr_t:
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
	mov r17,r20
	mov r16,r21
	mov r15,r22
	mov r14,r23
	std Y+1,__zero_reg__
	st Y,__zero_reg__
	ldi r24,lo8(8)
	ldi r25,0
	std Y+3,r25
	std Y+2,r24
	std Y+5,__zero_reg__
	std Y+4,__zero_reg__
	call _Znwj
	std Y+1,r25
	st Y,r24
	ldi r22,lo8(4)
	ldi r23,0
	movw r24,r28
	call _ZNSt6vectorIcSaIcEE7reserveEj
	push __zero_reg__
	push r14
	push __zero_reg__
	push r15
	push __zero_reg__
	push r16
	push __zero_reg__
	push r17
	ldi r24,lo8(.LC3)
	ldi r25,hi8(.LC3)
	push r25
	push r24
	ldd r24,Y+1
	push r24
	ld r24,Y
	push r24
	call sprintf
	in r24,__SP_L__
	in r25,__SP_H__
	adiw r24,12
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25
	out __SREG__,__tmp_reg__
	out __SP_L__,r24
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	ret
	.size	_Z16__inet_ipv4_ntoa10ipv4addr_t, .-_Z16__inet_ipv4_ntoa10ipv4addr_t
.global	_Z15__inet_eth_ntoa9macaddr_t
	.type	_Z15__inet_eth_ntoa9macaddr_t, @function
_Z15__inet_eth_ntoa9macaddr_t:
	push r16
	push r17
	push r28
	push r29
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 10 */
.L__stack_usage = 10
	movw r16,r24
	std Y+1,r18
	std Y+2,r19
	std Y+3,r20
	std Y+4,r21
	std Y+5,r22
	std Y+6,r23
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
	ldi r22,lo8(6)
	ldi r23,0
	movw r24,r16
	call _ZNSt6vectorIcSaIcEE7reserveEj
	ldd r24,Y+6
	push __zero_reg__
	push r24
	ldd r24,Y+5
	push __zero_reg__
	push r24
	ldd r24,Y+4
	push __zero_reg__
	push r24
	ldd r24,Y+3
	push __zero_reg__
	push r24
	ldd r24,Y+2
	push __zero_reg__
	push r24
	ldd r24,Y+1
	push __zero_reg__
	push r24
	ldi r24,lo8(.LC5)
	ldi r25,hi8(.LC5)
	push r25
	push r24
	movw r30,r16
	ldd r24,Z+1
	push r24
	ld r24,Z
	push r24
	call sprintf
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	movw r24,r16
/* epilogue start */
	adiw r28,6
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_Z15__inet_eth_ntoa9macaddr_t, .-_Z15__inet_eth_ntoa9macaddr_t
	.ident	"GCC: (GNU) 5.4.0"
.global __do_copy_data
