	.file	"enc28j60.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	_ZN8Enc28j60C2Ev
	.type	_ZN8Enc28j60C2Ev, @function
_ZN8Enc28j60C2Ev:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldi r24,lo8(-96)
	std Z+2,r24
	ldi r24,lo8(-79)
	std Z+3,r24
	ldi r24,lo8(-62)
	std Z+4,r24
	ldi r24,lo8(-45)
	std Z+5,r24
	ldi r24,lo8(-28)
	std Z+6,r24
	ldi r24,lo8(-11)
	std Z+7,r24
	std Z+8,__zero_reg__
	ldi r24,lo8(1)
	std Z+9,r24
	std Z+10,__zero_reg__
	std Z+14,__zero_reg__
	std Z+13,__zero_reg__
	ldi r24,lo8(-1)
	ldi r25,lo8(25)
	std Z+16,r25
	std Z+15,r24
	ldi r24,0
	ldi r25,lo8(26)
	std Z+18,r25
	std Z+17,r24
	ldi r24,lo8(-1)
	ldi r25,lo8(31)
	std Z+20,r25
	std Z+19,r24
	ret
	.size	_ZN8Enc28j60C2Ev, .-_ZN8Enc28j60C2Ev
.global	_ZN8Enc28j60C1Ev
	.set	_ZN8Enc28j60C1Ev,_ZN8Enc28j60C2Ev
.global	_ZN8Enc28j606setSPIEhhhh
	.type	_ZN8Enc28j606setSPIEhhhh, @function
_ZN8Enc28j606setSPIEhhhh:
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
	movw r14,r24
	mov r17,r22
	mov r13,r20
	mov r12,r18
	ldi r24,lo8(122)
	ldi r25,0
	call _Znwj
	movw r28,r24
	mov r18,r12
	mov r20,r13
	mov r22,r17
	call _ZN9MasterSPIC1Ehhhh
	movw r30,r14
	std Z+1,r29
	st Z,r28
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
	.size	_ZN8Enc28j606setSPIEhhhh, .-_ZN8Enc28j606setSPIEhhhh
.global	_ZN8Enc28j6016_spi_writeOpCodeEhPhj
	.type	_ZN8Enc28j6016_spi_writeOpCodeEhPhj, @function
_ZN8Enc28j6016_spi_writeOpCodeEhPhj:
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 7 */
.L__stack_usage = 7
	movw r16,r24
	mov r13,r22
	movw r28,r20
	movw r14,r18
	ldi r22,0
	movw r30,r24
	ld r24,Z
	ldd r25,Z+1
	call _ZN9MasterSPI11enableSlaveEh
	mov r22,r13
	movw r30,r16
	ld r24,Z
	ldd r25,Z+1
	call _ZN9MasterSPI8transferEh
	sbiw r28,0
	breq .L4
	add r14,r28
	adc r15,r29
.L5:
	cp r28,r14
	cpc r29,r15
	breq .L4
	ld r22,Y+
	movw r30,r16
	ld r24,Z
	ldd r25,Z+1
	call _ZN9MasterSPI8transferEh
	rjmp .L5
.L4:
	ldi r22,0
	movw r30,r16
	ld r24,Z
	ldd r25,Z+1
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	jmp _ZN9MasterSPI12disableSlaveEh
	.size	_ZN8Enc28j6016_spi_writeOpCodeEhPhj, .-_ZN8Enc28j6016_spi_writeOpCodeEhPhj
.global	_ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	.type	_ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh, @function
_ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh:
	push r14
	push r15
	push r17
	push r28
	push r29
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r14,r24
	mov r17,r22
	mov r22,r23
	std Y+1,r20
	call _ZN8Enc28j6015_spi_selectBankEh
	mov r22,r17
	ori r22,lo8(64)
	ldi r18,lo8(1)
	ldi r19,0
	movw r20,r28
	subi r20,-1
	sbci r21,-1
	movw r24,r14
	call _ZN8Enc28j6016_spi_writeOpCodeEhPhj
/* epilogue start */
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r15
	pop r14
	ret
	.size	_ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh, .-_ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
.global	_ZN8Enc28j6015_spi_selectBankEh
	.type	_ZN8Enc28j6015_spi_selectBankEh, @function
_ZN8Enc28j6015_spi_selectBankEh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	mov r20,r22
	cpi r22,lo8(4)
	brsh .L11
	movw r30,r24
	ldd r18,Z+10
	cp r22,r18
	breq .L11
	std Z+10,r22
	ldi r22,lo8(31)
	ldi r23,lo8(-80)
	jmp _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
.L11:
	ret
	.size	_ZN8Enc28j6015_spi_selectBankEh, .-_ZN8Enc28j6015_spi_selectBankEh
.global	_ZN8Enc28j6015_spi_readOpcodeEh
	.type	_ZN8Enc28j6015_spi_readOpcodeEh, @function
_ZN8Enc28j6015_spi_readOpcodeEh:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r24
	mov r16,r22
	ldi r22,0
	ld r24,Y
	ldd r25,Y+1
	call _ZN9MasterSPI11enableSlaveEh
	mov r22,r16
	ld r24,Y
	ldd r25,Y+1
	call _ZN9MasterSPI8transferEh
	ldi r22,0
	ld r24,Y
	ldd r25,Y+1
	call _ZN9MasterSPI8transferEh
	mov r17,r24
	sbrs r16,7
	rjmp .L14
	ldi r22,0
	ld r24,Y
	ldd r25,Y+1
	call _ZN9MasterSPI8transferEh
	mov r17,r24
.L14:
	ldi r22,0
	ld r24,Y
	ldd r25,Y+1
	call _ZN9MasterSPI12disableSlaveEh
	mov r24,r17
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_ZN8Enc28j6015_spi_readOpcodeEh, .-_ZN8Enc28j6015_spi_readOpcodeEh
.global	_ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	.type	_ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS, @function
_ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	movw r28,r24
	mov r17,r22
	mov r22,r23
	call _ZN8Enc28j6015_spi_selectBankEh
	mov r22,r17
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r17
	jmp _ZN8Enc28j6015_spi_readOpcodeEh
	.size	_ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS, .-_ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
.global	_ZN8Enc28j6012_spi_readPhyE16ENC28J60_PHY_REG
	.type	_ZN8Enc28j6012_spi_readPhyE16ENC28J60_PHY_REG, @function
_ZN8Enc28j6012_spi_readPhyE16ENC28J60_PHY_REG:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	movw r28,r24
	mov r20,r22
	ldi r22,lo8(20)
	ldi r23,lo8(-78)
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,lo8(1)
	ldi r22,lo8(18)
	ldi r23,lo8(-78)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,lo8(80)
1:	dec r20
	brne 1b
.L17:
	ldi r22,lo8(10)
	ldi r23,lo8(-77)
	movw r24,r28
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	sbrc r24,0
	rjmp .L17
	ldi r20,0
	ldi r22,lo8(18)
	ldi r23,lo8(-78)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r22,lo8(25)
	ldi r23,lo8(-78)
	movw r24,r28
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	mov r17,r24
	ldi r22,lo8(24)
	ldi r23,lo8(-78)
	movw r24,r28
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	mov r18,r17
	ldi r19,0
	mov r19,r18
	clr r18
	movw r20,r18
	or r20,r24
	movw r24,r20
/* epilogue start */
	pop r29
	pop r28
	pop r17
	ret
	.size	_ZN8Enc28j6012_spi_readPhyE16ENC28J60_PHY_REG, .-_ZN8Enc28j6012_spi_readPhyE16ENC28J60_PHY_REG
.global	_ZN8Enc28j6013_spi_writePhyE16ENC28J60_PHY_REGj
	.type	_ZN8Enc28j6013_spi_writePhyE16ENC28J60_PHY_REGj, @function
_ZN8Enc28j6013_spi_writePhyE16ENC28J60_PHY_REGj:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r24
	movw r16,r20
	mov r20,r22
	ldi r22,lo8(20)
	ldi r23,lo8(-78)
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	mov r20,r16
	ldi r22,lo8(24)
	ldi r23,lo8(-78)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	mov r20,r17
	ldi r22,lo8(25)
	ldi r23,lo8(-78)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
.L21:
	ldi r22,lo8(10)
	ldi r23,lo8(-77)
	movw r24,r28
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	sbrs r24,0
	rjmp .L19
	ldi r24,lo8(80)
1:	dec r24
	brne 1b
	rjmp .L21
.L19:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_ZN8Enc28j6013_spi_writePhyE16ENC28J60_PHY_REGj, .-_ZN8Enc28j6013_spi_writePhyE16ENC28J60_PHY_REGj
.global	_ZN8Enc28j6016_spi_bitFieldSetEhh
	.type	_ZN8Enc28j6016_spi_bitFieldSetEhh, @function
_ZN8Enc28j6016_spi_bitFieldSetEhh:
	push r14
	push r15
	push r17
	push r28
	push r29
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r14,r24
	mov r17,r22
	std Y+1,r20
	ldi r22,0
	call _ZN8Enc28j6015_spi_selectBankEh
	mov r22,r17
	ori r22,lo8(-128)
	ldi r18,lo8(1)
	ldi r19,0
	movw r20,r28
	subi r20,-1
	sbci r21,-1
	movw r24,r14
	call _ZN8Enc28j6016_spi_writeOpCodeEhPhj
/* epilogue start */
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r15
	pop r14
	ret
	.size	_ZN8Enc28j6016_spi_bitFieldSetEhh, .-_ZN8Enc28j6016_spi_bitFieldSetEhh
.global	_ZN8Enc28j6018_spi_bitFieldClearEhh
	.type	_ZN8Enc28j6018_spi_bitFieldClearEhh, @function
_ZN8Enc28j6018_spi_bitFieldClearEhh:
	push r14
	push r15
	push r17
	push r28
	push r29
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r14,r24
	mov r17,r22
	std Y+1,r20
	ldi r22,0
	call _ZN8Enc28j6015_spi_selectBankEh
	mov r22,r17
	ori r22,lo8(-96)
	ldi r18,lo8(1)
	ldi r19,0
	movw r20,r28
	subi r20,-1
	sbci r21,-1
	movw r24,r14
	call _ZN8Enc28j6016_spi_writeOpCodeEhPhj
/* epilogue start */
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r15
	pop r14
	ret
	.size	_ZN8Enc28j6018_spi_bitFieldClearEhh, .-_ZN8Enc28j6018_spi_bitFieldClearEhh
.global	_ZN8Enc28j6010_spi_resetEv
	.type	_ZN8Enc28j6010_spi_resetEv, @function
_ZN8Enc28j6010_spi_resetEv:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	ldi r18,0
	ldi r19,0
	ldi r20,0
	ldi r21,0
	ldi r22,lo8(-1)
	call _ZN8Enc28j6016_spi_writeOpCodeEhPhj
.L25:
	ldi r22,lo8(29)
	ldi r23,lo8(-80)
	movw r24,r28
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	tst r24
	breq .L25
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZN8Enc28j6010_spi_resetEv, .-_ZN8Enc28j6010_spi_resetEv
.global	_ZN8Enc28j604initEv
	.type	_ZN8Enc28j604initEv, @function
_ZN8Enc28j604initEv:
	push r16
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	movw r28,r24
	ld r24,Y
	ldd r25,Y+1
	call _ZN9MasterSPI15isInitilizedSPIEv
	cpse r24,__zero_reg__
	rjmp .L29
	ldi r16,lo8(53)
	ldi r18,lo8(52)
	ldi r20,lo8(51)
	ldi r22,lo8(50)
	movw r24,r28
	call _ZN8Enc28j606setSPIEhhhh
.L29:
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r16
	jmp _ZN8Enc28j6010_spi_resetEv
	.size	_ZN8Enc28j604initEv, .-_ZN8Enc28j604initEv
.global	_ZN8Enc28j6020_spi_setRxBufferSizeEj
	.type	_ZN8Enc28j6020_spi_setRxBufferSizeEj, @function
_ZN8Enc28j6020_spi_setRxBufferSizeEj:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L31
	std Y+16,r23
	std Y+15,r22
.L31:
	ldd r20,Y+14
	ldi r22,lo8(9)
	ldi r23,lo8(-80)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+15
	ldi r22,lo8(8)
	ldi r23,lo8(-80)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+16
	ldi r22,lo8(11)
	ldi r23,lo8(-80)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+15
	ldi r22,lo8(10)
	ldi r23,lo8(-80)
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	jmp _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	.size	_ZN8Enc28j6020_spi_setRxBufferSizeEj, .-_ZN8Enc28j6020_spi_setRxBufferSizeEj
.global	_ZN8Enc28j6020_spi_getRxBufferSizeEv
	.type	_ZN8Enc28j6020_spi_getRxBufferSizeEv, @function
_ZN8Enc28j6020_spi_getRxBufferSizeEv:
	push r16
	push r17
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	movw r16,r24
	ldi r22,lo8(11)
	ldi r23,lo8(-80)
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	mov r28,r24
	ldi r22,lo8(10)
	ldi r23,lo8(-80)
	movw r24,r16
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	mov r18,r28
	ldi r19,0
	mov r19,r18
	clr r18
	movw r20,r18
	or r20,r24
	movw r24,r20
/* epilogue start */
	pop r28
	pop r17
	pop r16
	ret
	.size	_ZN8Enc28j6020_spi_getRxBufferSizeEv, .-_ZN8Enc28j6020_spi_getRxBufferSizeEv
	.ident	"GCC: (GNU) 5.4.0"
