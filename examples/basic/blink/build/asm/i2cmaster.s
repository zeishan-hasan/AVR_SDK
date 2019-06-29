	.file	"i2cmaster.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	_ZN9I2CMasterC2Ev
	.type	_ZN9I2CMasterC2Ev, @function
_ZN9I2CMasterC2Ev:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_ZN9I2CMasterC2Ev, .-_ZN9I2CMasterC2Ev
.global	_ZN9I2CMasterC1Ev
	.set	_ZN9I2CMasterC1Ev,_ZN9I2CMasterC2Ev
.global	_ZN9I2CMaster6enableE5F_SCL
	.type	_ZN9I2CMaster6enableE5F_SCL, @function
_ZN9I2CMaster6enableE5F_SCL:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sts 184,r22
	ret
	.size	_ZN9I2CMaster6enableE5F_SCL, .-_ZN9I2CMaster6enableE5F_SCL
.global	_ZN9I2CMaster7disableEv
	.type	_ZN9I2CMaster7disableEv, @function
_ZN9I2CMaster7disableEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sts 184,__zero_reg__
	ret
	.size	_ZN9I2CMaster7disableEv, .-_ZN9I2CMaster7disableEv
.global	_ZN9I2CMaster5startEh
	.type	_ZN9I2CMaster5startEh, @function
_ZN9I2CMaster5startEh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sts 188,__zero_reg__
	ldi r24,lo8(-92)
	sts 188,r24
.L5:
	lds r24,188
	sbrs r24,7
	rjmp .L5
	lds r24,185
	andi r24,lo8(-8)
	cpi r24,lo8(8)
	breq .L6
.L9:
	ldi r24,lo8(1)
	ret
.L6:
	sts 187,r22
	ldi r24,lo8(-124)
	sts 188,r24
.L8:
	lds r24,188
	sbrs r24,7
	rjmp .L8
	lds r24,185
	andi r24,lo8(-8)
	cpi r24,lo8(24)
	breq .L10
	cpi r24,lo8(64)
	brne .L9
.L10:
	ldi r24,0
	ret
	.size	_ZN9I2CMaster5startEh, .-_ZN9I2CMaster5startEh
.global	_ZN9I2CMaster4stopEv
	.type	_ZN9I2CMaster4stopEv, @function
_ZN9I2CMaster4stopEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(-108)
	sts 188,r24
	ret
	.size	_ZN9I2CMaster4stopEv, .-_ZN9I2CMaster4stopEv
.global	_ZN9I2CMaster4sendEh
	.type	_ZN9I2CMaster4sendEh, @function
_ZN9I2CMaster4sendEh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sts 187,r22
	ldi r24,lo8(-124)
	sts 188,r24
.L16:
	lds r24,188
	sbrs r24,7
	rjmp .L16
	lds r25,185
	andi r25,lo8(-8)
	ldi r24,lo8(1)
	cpi r25,lo8(40)
	brne .L17
	ldi r24,0
.L17:
	ret
	.size	_ZN9I2CMaster4sendEh, .-_ZN9I2CMaster4sendEh
.global	_ZN9I2CMaster4sendEPhj
	.type	_ZN9I2CMaster4sendEPhj, @function
_ZN9I2CMaster4sendEPhj:
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
	movw r12,r24
	movw r28,r22
	movw r14,r22
	add r14,r20
	adc r15,r21
	ldi r17,lo8(1)
.L21:
	cp r28,r14
	cpc r29,r15
	breq .L20
	ld r22,Y+
	movw r24,r12
	call _ZN9I2CMaster4sendEh
	and r17,r24
	rjmp .L21
.L20:
	mov r24,r17
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r15
	pop r14
	pop r13
	pop r12
	ret
	.size	_ZN9I2CMaster4sendEPhj, .-_ZN9I2CMaster4sendEPhj
.global	_ZN9I2CMaster4sendEhPhj
	.type	_ZN9I2CMaster4sendEhPhj, @function
_ZN9I2CMaster4sendEhPhj:
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
/* stack size = 9 */
.L__stack_usage = 9
	movw r12,r24
	mov r11,r20
	mov r16,r21
	movw r14,r18
	call _ZN9I2CMaster5startEh
	mov r17,r24
	tst r24
	breq .L23
.L26:
	ldi r17,lo8(1)
	rjmp .L24
.L23:
	mov r28,r11
	mov r29,r16
	add r14,r28
	adc r15,r29
.L27:
	cp r28,r14
	cpc r29,r15
	breq .L25
	ld r22,Y+
	movw r24,r12
	call _ZN9I2CMaster4sendEh
	tst r24
	breq .L27
	rjmp .L26
.L25:
	ldi r24,lo8(-108)
	sts 188,r24
.L24:
	mov r24,r17
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
	ret
	.size	_ZN9I2CMaster4sendEhPhj, .-_ZN9I2CMaster4sendEhPhj
.global	_ZN9I2CMaster8writeRegEhhPhj
	.type	_ZN9I2CMaster8writeRegEhhPhj, @function
_ZN9I2CMaster8writeRegEhhPhj:
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
/* prologue: function */
/* frame size = 0 */
/* stack size = 10 */
.L__stack_usage = 10
	movw r14,r24
	mov r28,r20
	movw r10,r18
	movw r12,r16
	call _ZN9I2CMaster5startEh
	mov r17,r24
	tst r24
	breq .L29
.L32:
	ldi r17,lo8(1)
	rjmp .L30
.L29:
	mov r22,r28
	movw r24,r14
	call _ZN9I2CMaster4sendEh
	movw r28,r10
	add r12,r10
	adc r13,r11
.L33:
	cp r28,r12
	cpc r29,r13
	breq .L31
	ld r22,Y+
	movw r24,r14
	call _ZN9I2CMaster4sendEh
	tst r24
	breq .L33
	rjmp .L32
.L31:
	ldi r24,lo8(-108)
	sts 188,r24
.L30:
	mov r24,r17
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
	pop r10
	ret
	.size	_ZN9I2CMaster8writeRegEhhPhj, .-_ZN9I2CMaster8writeRegEhhPhj
.global	_ZN9I2CMaster4scanEv
	.type	_ZN9I2CMaster4scanEv, @function
_ZN9I2CMaster4scanEv:
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
/* stack size = 10 */
.L__stack_usage = 10
	movw r12,r24
	std Y+1,__zero_reg__
	std Y+2,__zero_reg__
	mov r14,__zero_reg__
	mov r15,__zero_reg__
	ldi r16,0
	ldi r17,0
.L37:
	mov r22,r16
	movw r24,r12
	call _ZN9I2CMaster5startEh
	cpse r24,__zero_reg__
	rjmp .L35
	ldi r30,lo8(1)
	ldi r31,0
	add r30,r28
	adc r31,r29
	add r30,r14
	adc r31,r15
	st Z,r16
	dec r14
	or r14,r15
	brne .L38
.L36:
	ldd r25,Y+2
	ldd r24,Y+1
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
	ret
.L38:
	clr r14
	inc r14
	mov r15,__zero_reg__
.L35:
	subi r16,-1
	sbci r17,-1
	cp r16,__zero_reg__
	ldi r24,1
	cpc r17,r24
	brne .L37
	rjmp .L36
	.size	_ZN9I2CMaster4scanEv, .-_ZN9I2CMaster4scanEv
.global	_ZN9I2CMaster12scanMultipleEv
	.type	_ZN9I2CMaster12scanMultipleEv, @function
_ZN9I2CMaster12scanMultipleEv:
	push r6
	push r7
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
/* stack size = 16 */
.L__stack_usage = 16
	movw r8,r24
	ldi r24,0
	ldi r25,0
	call malloc
	movw r14,r24
	std Y+1,__zero_reg__
	std Y+2,__zero_reg__
	mov r10,__zero_reg__
	mov r11,__zero_reg__
	ldi r16,0
	ldi r17,0
	mov r12,__zero_reg__
	mov r13,__zero_reg__
.L45:
	mov r22,r12
	movw r24,r8
	call _ZN9I2CMaster5startEh
	cpse r24,__zero_reg__
	rjmp .L44
	ldi r30,lo8(1)
	ldi r31,0
	add r30,r28
	adc r31,r29
	add r30,r16
	adc r31,r17
	st Z,r12
	cpi r16,1
	cpc r17,__zero_reg__
	brne .L46
	cp r14,__zero_reg__
	cpc r15,__zero_reg__
	breq .L48
	ldd r6,Y+1
	ldd r7,Y+2
	ldi r24,-1
	sub r10,r24
	sbc r11,r24
	movw r16,r10
	lsl r16
	rol r17
	movw r22,r16
	movw r24,r14
	call realloc
	movw r14,r24
	sbiw r24,0
	breq .L48
	subi r16,2
	sbc r17,__zero_reg__
	movw r30,r24
	add r30,r16
	adc r31,r17
	st Z,r6
	std Z+1,r7
	rjmp .L48
.L46:
	ldi r16,lo8(1)
	ldi r17,0
	rjmp .L44
.L48:
	ldi r16,0
	ldi r17,0
.L44:
	ldi r24,-1
	sub r12,r24
	sbc r13,r24
	cp r12,__zero_reg__
	ldi r24,1
	cpc r13,r24
	brne .L45
	movw r22,r14
	movw r24,r10
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
	pop r7
	pop r6
	ret
	.size	_ZN9I2CMaster12scanMultipleEv, .-_ZN9I2CMaster12scanMultipleEv
.global	_ZN9I2CMaster12read_sendAckEv
	.type	_ZN9I2CMaster12read_sendAckEv, @function
_ZN9I2CMaster12read_sendAckEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(-60)
	sts 188,r24
.L51:
	lds r24,188
	sbrs r24,7
	rjmp .L51
	lds r24,187
	ret
	.size	_ZN9I2CMaster12read_sendAckEv, .-_ZN9I2CMaster12read_sendAckEv
.global	_ZN9I2CMaster13read_sendNackEv
	.type	_ZN9I2CMaster13read_sendNackEv, @function
_ZN9I2CMaster13read_sendNackEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(-124)
	sts 188,r24
.L54:
	lds r24,188
	sbrs r24,7
	rjmp .L54
	lds r24,187
	ret
	.size	_ZN9I2CMaster13read_sendNackEv, .-_ZN9I2CMaster13read_sendNackEv
.global	_ZN9I2CMaster7receiveEh
	.type	_ZN9I2CMaster7receiveEh, @function
_ZN9I2CMaster7receiveEh:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	ori r22,lo8(1)
	call _ZN9I2CMaster5startEh
	cpse r24,__zero_reg__
	rjmp .L58
	movw r24,r28
	call _ZN9I2CMaster13read_sendNackEv
	ldi r25,lo8(-108)
	sts 188,r25
	rjmp .L57
.L58:
	ldi r24,0
.L57:
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZN9I2CMaster7receiveEh, .-_ZN9I2CMaster7receiveEh
.global	_ZN9I2CMaster7receiveEhPhj
	.type	_ZN9I2CMaster7receiveEhPhj, @function
_ZN9I2CMaster7receiveEhPhj:
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 11 */
.L__stack_usage = 11
	movw r12,r24
	movw r10,r20
	movw r16,r18
	ori r22,lo8(1)
	call _ZN9I2CMaster5startEh
	mov r15,r24
	cpse r24,__zero_reg__
	rjmp .L63
	movw r8,r10
	movw r28,r16
	sbiw r28,1
.L62:
	movw r24,r8
	sub r24,r10
	sbc r25,r11
	cp r24,r28
	cpc r25,r29
	brsh .L61
	movw r24,r12
	call _ZN9I2CMaster12read_sendAckEv
	movw r30,r8
	st Z+,r24
	movw r8,r30
	rjmp .L62
.L61:
	add r28,r10
	adc r29,r11
	movw r24,r12
	call _ZN9I2CMaster13read_sendNackEv
	st Y,r24
	ldi r24,lo8(-108)
	sts 188,r24
	rjmp .L60
.L63:
	clr r15
	inc r15
.L60:
	mov r24,r15
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	ret
	.size	_ZN9I2CMaster7receiveEhPhj, .-_ZN9I2CMaster7receiveEhPhj
.global	_ZN9I2CMaster7readRegEhhPhj
	.type	_ZN9I2CMaster7readRegEhhPhj, @function
_ZN9I2CMaster7readRegEhhPhj:
	push r10
	push r11
	push r12
	push r13
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 9 */
.L__stack_usage = 9
	movw r28,r24
	mov r15,r22
	mov r11,r20
	movw r12,r18
	call _ZN9I2CMaster5startEh
	tst r24
	breq .L65
.L67:
	clr r15
	inc r15
	rjmp .L66
.L65:
	mov r22,r11
	movw r24,r28
	call _ZN9I2CMaster4sendEh
	mov r22,r15
	ori r22,lo8(1)
	movw r24,r28
	call _ZN9I2CMaster5startEh
	mov r15,r24
	cpse r24,__zero_reg__
	rjmp .L67
	movw r10,r12
	subi r16,1
	sbc r17,__zero_reg__
.L69:
	movw r24,r10
	sub r24,r12
	sbc r25,r13
	cp r24,r16
	cpc r25,r17
	brsh .L68
	movw r24,r28
	call _ZN9I2CMaster12read_sendAckEv
	movw r30,r10
	st Z+,r24
	movw r10,r30
	rjmp .L69
.L68:
	add r16,r12
	adc r17,r13
	movw r24,r28
	call _ZN9I2CMaster13read_sendNackEv
	movw r30,r16
	st Z,r24
	ldi r24,lo8(-108)
	sts 188,r24
.L66:
	mov r24,r15
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r13
	pop r12
	pop r11
	pop r10
	ret
	.size	_ZN9I2CMaster7readRegEhhPhj, .-_ZN9I2CMaster7readRegEhhPhj
	.ident	"GCC: (GNU) 5.4.0"
