	.file	"arptable.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.type	_ZNSt6vectorI11arp_table_tSaIS0_EE6resizeEjRKS0_.part.8, @function
_ZNSt6vectorI11arp_table_tSaIS0_EE6resizeEjRKS0_.part.8:
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
	movw r16,r22
	movw r14,r20
	ldd r18,Y+2
	ldd r19,Y+3
	cp r18,r22
	cpc r19,r23
	brsh .L2
	movw r24,r22
	adiw r24,8
	cp r18,r24
	cpc r19,r25
	brsh .L2
	ld r12,Y
	ldd r13,Y+1
	std Y+3,r25
	std Y+2,r24
	ldi r18,lo8(10)
	movw r20,r24
	mul r18,r20
	movw r24,r0
	mul r18,r21
	add r25,r0
	clr __zero_reg__
	call _Znwj
	std Y+1,r25
	st Y,r24
	movw r18,r12
	ldi r20,0
	ldi r21,0
.L5:
	ldd r24,Y+4
	ldd r25,Y+5
	cp r20,r24
	cpc r21,r25
	brsh .L3
	ld r26,Y
	ldd r27,Y+1
	movw r24,r18
	sub r24,r12
	sbc r25,r13
	add r26,r24
	adc r27,r25
	sbiw r26,0
	breq .L4
	ldi r24,lo8(10)
	movw r30,r18
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
.L4:
	subi r20,-1
	sbci r21,-1
	subi r18,-10
	sbci r19,-1
	rjmp .L5
.L3:
	movw r24,r12
	call _ZdlPv
.L2:
	ldd r18,Y+4
	ldd r19,Y+5
	ldi r24,lo8(10)
	mul r24,r18
	movw r22,r0
	mul r24,r19
	add r23,r0
	clr __zero_reg__
	ldi r20,0
	ldi r21,0
.L8:
	cp r18,r16
	cpc r19,r17
	brsh .L6
	ld r26,Y
	ldd r27,Y+1
	movw r24,r20
	add r24,r22
	adc r25,r23
	add r26,r24
	adc r27,r25
	sbiw r26,0
	breq .L7
	ldi r24,lo8(10)
	movw r30,r14
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
.L7:
	subi r18,-1
	sbci r19,-1
	subi r20,-10
	sbci r21,-1
	rjmp .L8
.L6:
	std Y+5,r17
	std Y+4,r16
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
	.size	_ZNSt6vectorI11arp_table_tSaIS0_EE6resizeEjRKS0_.part.8, .-_ZNSt6vectorI11arp_table_tSaIS0_EE6resizeEjRKS0_.part.8
.global	_ZN8ArpTableC2Ev
	.type	_ZN8ArpTableC2Ev, @function
_ZN8ArpTableC2Ev:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	std Y+1,__zero_reg__
	st Y,__zero_reg__
	ldi r24,lo8(8)
	ldi r25,0
	std Y+3,r25
	std Y+2,r24
	std Y+5,__zero_reg__
	std Y+4,__zero_reg__
	ldi r24,lo8(80)
	ldi r25,0
	call _Znwj
	std Y+1,r25
	st Y,r24
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZN8ArpTableC2Ev, .-_ZN8ArpTableC2Ev
.global	_ZN8ArpTableC1Ev
	.set	_ZN8ArpTableC1Ev,_ZN8ArpTableC2Ev
.global	_ZN8ArpTable9addRecordE11arp_table_t
	.type	_ZN8ArpTable9addRecordE11arp_table_t, @function
_ZN8ArpTable9addRecordE11arp_table_t:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,10
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 10 */
/* stack size = 16 */
.L__stack_usage = 16
	std Y+1,r14
	std Y+2,r15
	std Y+3,r16
	std Y+4,r17
	std Y+5,r18
	std Y+6,r19
	std Y+7,r20
	std Y+8,r21
	std Y+9,r22
	std Y+10,r23
	movw r30,r24
	ldd r18,Z+4
	ldd r19,Z+5
	movw r22,r18
	subi r22,-1
	sbci r23,-1
	cp r18,r22
	cpc r19,r23
	brsh .L18
	movw r20,r28
	subi r20,-1
	sbci r21,-1
	call _ZNSt6vectorI11arp_table_tSaIS0_EE6resizeEjRKS0_.part.8
	rjmp .L17
.L18:
	cp r22,r18
	cpc r23,r19
	brsh .L17
	movw r30,r24
	std Z+5,r23
	std Z+4,r22
.L17:
/* epilogue start */
	adiw r28,10
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
	.size	_ZN8ArpTable9addRecordE11arp_table_t, .-_ZN8ArpTable9addRecordE11arp_table_t
.global	_ZN8ArpTable9addRecordEmPh
	.type	_ZN8ArpTable9addRecordEmPh, @function
_ZN8ArpTable9addRecordEmPh:
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,12
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 12 */
/* stack size = 14 */
.L__stack_usage = 14
	std Y+12,r19
	std Y+11,r18
	std Y+1,r20
	std Y+2,r21
	std Y+3,r22
	std Y+4,r23
	ldi r18,lo8(6)
	movw r30,r28
	adiw r30,11
	movw r26,r28
	adiw r26,5
	0:
	ld r0,Z+
	st X+,r0
	dec r18
	brne 0b
	movw r30,r24
	ldd r18,Z+4
	ldd r19,Z+5
	movw r22,r18
	subi r22,-1
	sbci r23,-1
	cp r18,r22
	cpc r19,r23
	brsh .L21
	movw r20,r28
	subi r20,-1
	sbci r21,-1
	call _ZNSt6vectorI11arp_table_tSaIS0_EE6resizeEjRKS0_.part.8
	rjmp .L20
.L21:
	cp r22,r18
	cpc r23,r19
	brsh .L20
	movw r30,r24
	std Z+5,r23
	std Z+4,r22
.L20:
/* epilogue start */
	adiw r28,12
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	ret
	.size	_ZN8ArpTable9addRecordEmPh, .-_ZN8ArpTable9addRecordEmPh
	.ident	"GCC: (GNU) 5.4.0"
