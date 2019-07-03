	.file	"enc28j60.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
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
	ldi r24,lo8(119)
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
	ldi r22,lo8(4)
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	jmp _ZN9MasterSPI8setClockE10SPI_CLKSEL
	.size	_ZN8Enc28j606setSPIEhhhh, .-_ZN8Enc28j606setSPIEhhhh
.global	_ZN8Enc28j6016registerCallbackEPFv12ENC28J60_INTE
	.type	_ZN8Enc28j6016registerCallbackEPFv12ENC28J60_INTE, @function
_ZN8Enc28j6016registerCallbackEPFv12ENC28J60_INTE:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	std Z+22,r23
	std Z+21,r22
	ret
	.size	_ZN8Enc28j6016registerCallbackEPFv12ENC28J60_INTE, .-_ZN8Enc28j6016registerCallbackEPFv12ENC28J60_INTE
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
.global	_ZN8Enc28j6015_spi_readOpcodeEj
	.type	_ZN8Enc28j6015_spi_readOpcodeEj, @function
_ZN8Enc28j6015_spi_readOpcodeEj:
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 5 */
.L__stack_usage = 5
	movw r28,r24
	movw r16,r22
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
	mov r15,r24
	clr r16
	andi r17,12
	or r16,r17
	breq .L11
	ldi r22,0
	ld r24,Y
	ldd r25,Y+1
	call _ZN9MasterSPI8transferEh
	mov r15,r24
.L11:
	ldi r22,0
	ld r24,Y
	ldd r25,Y+1
	call _ZN9MasterSPI12disableSlaveEh
	mov r24,r15
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	ret
	.size	_ZN8Enc28j6015_spi_readOpcodeEj, .-_ZN8Enc28j6015_spi_readOpcodeEj
.global	_ZN8Enc28j6015_spi_selectBankEh
	.type	_ZN8Enc28j6015_spi_selectBankEh, @function
_ZN8Enc28j6015_spi_selectBankEh:
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
	cpi r22,lo8(4)
	brsh .L15
	movw r30,r24
	ldd r18,Z+10
	cp r22,r18
	breq .L15
	mov r17,r22
	movw r14,r24
	std Z+10,r22
	ldi r22,lo8(31)
	ldi r23,0
	call _ZN8Enc28j6015_spi_readOpcodeEj
	andi r24,lo8(-4)
	mov r22,r24
	or r22,r17
	std Y+1,r22
	ldi r18,lo8(1)
	ldi r19,0
	movw r20,r28
	subi r20,-1
	sbci r21,-1
	ldi r22,lo8(95)
	movw r24,r14
	call _ZN8Enc28j6016_spi_writeOpCodeEhPhj
.L15:
/* epilogue start */
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r15
	pop r14
	ret
	.size	_ZN8Enc28j6015_spi_selectBankEh, .-_ZN8Enc28j6015_spi_selectBankEh
.global	_ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	.type	_ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh, @function
_ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
/* stack size = 7 */
.L__stack_usage = 7
	movw r14,r24
	movw r16,r22
	std Y+1,r20
	movw r24,r22
	clr r24
	andi r25,3
	mov r22,r25
	movw r24,r14
	call _ZN8Enc28j6015_spi_selectBankEh
	mov r22,r16
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
	pop r16
	pop r15
	pop r14
	ret
	.size	_ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh, .-_ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
.global	_ZN8Enc28j6015enableInterruptEh
	.type	_ZN8Enc28j6015enableInterruptEh, @function
_ZN8Enc28j6015enableInterruptEh:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	mov r20,r22
	ori r20,lo8(-128)
	ldi r22,lo8(27)
	ldi r23,0
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	movw r18,r28
	ldi r20,lo8(gs(_ZN8Enc28j609_callbackEhPv))
	ldi r21,hi8(gs(_ZN8Enc28j609_callbackEhPv))
	ldi r22,lo8(2)
	ldi r24,lo8(13)
/* epilogue start */
	pop r29
	pop r28
	jmp _ZN9Interrupt15attachInterruptEh8INT_EDGEPFvhEPv
	.size	_ZN8Enc28j6015enableInterruptEh, .-_ZN8Enc28j6015enableInterruptEh
.global	_ZN8Enc28j6016disableInterruptEv
	.type	_ZN8Enc28j6016disableInterruptEv, @function
_ZN8Enc28j6016disableInterruptEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r20,0
	ldi r22,lo8(27)
	ldi r23,0
	jmp _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	.size	_ZN8Enc28j6016disableInterruptEv, .-_ZN8Enc28j6016disableInterruptEv
.global	_ZN8Enc28j609_callbackEhPv
	.type	_ZN8Enc28j609_callbackEhPv, @function
_ZN8Enc28j609_callbackEhPv:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L20
	movw r28,r22
	ldi r20,0
	ldi r22,lo8(28)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r30,Y+21
	ldd r31,Y+22
	sbiw r30,0
	breq .L20
	ldi r24,lo8(3)
/* epilogue start */
	pop r29
	pop r28
	eijmp
.L20:
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZN8Enc28j609_callbackEhPv, .-_ZN8Enc28j609_callbackEhPv
.global	_ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	.type	_ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS, @function
_ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r16,r24
	movw r28,r22
	movw r24,r22
	clr r24
	andi r25,3
	mov r22,r25
	movw r24,r16
	call _ZN8Enc28j6015_spi_selectBankEh
	movw r22,r28
	andi r22,31
	movw r24,r16
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	jmp _ZN8Enc28j6015_spi_readOpcodeEj
	.size	_ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS, .-_ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
.global	_ZN8Enc28j6015getUnreadPacketEv
	.type	_ZN8Enc28j6015getUnreadPacketEv, @function
_ZN8Enc28j6015getUnreadPacketEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r22,lo8(25)
	ldi r23,lo8(1)
	jmp _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	.size	_ZN8Enc28j6015getUnreadPacketEv, .-_ZN8Enc28j6015getUnreadPacketEv
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
	ldi r23,lo8(10)
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	mov r20,r16
	ldi r22,lo8(22)
	ldi r23,lo8(10)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	mov r20,r17
	ldi r22,lo8(23)
	ldi r23,lo8(10)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
.L30:
	ldi r22,lo8(10)
	ldi r23,lo8(11)
	movw r24,r28
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	sbrc r24,0
	rjmp .L30
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_ZN8Enc28j6013_spi_writePhyE16ENC28J60_PHY_REGj, .-_ZN8Enc28j6013_spi_writePhyE16ENC28J60_PHY_REGj
.global	_ZN8Enc28j6016_spi_bitFieldSetE13ENC28J60_REGSh
	.type	_ZN8Enc28j6016_spi_bitFieldSetE13ENC28J60_REGSh, @function
_ZN8Enc28j6016_spi_bitFieldSetE13ENC28J60_REGSh:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
/* stack size = 7 */
.L__stack_usage = 7
	movw r14,r24
	movw r16,r22
	std Y+1,r20
	movw r24,r22
	clr r24
	andi r25,3
	mov r22,r25
	movw r24,r14
	call _ZN8Enc28j6015_spi_selectBankEh
	mov r22,r16
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
	pop r16
	pop r15
	pop r14
	ret
	.size	_ZN8Enc28j6016_spi_bitFieldSetE13ENC28J60_REGSh, .-_ZN8Enc28j6016_spi_bitFieldSetE13ENC28J60_REGSh
.global	_ZN8Enc28j6018_spi_bitFieldClearE13ENC28J60_REGSh
	.type	_ZN8Enc28j6018_spi_bitFieldClearE13ENC28J60_REGSh, @function
_ZN8Enc28j6018_spi_bitFieldClearE13ENC28J60_REGSh:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
/* stack size = 7 */
.L__stack_usage = 7
	movw r14,r24
	movw r16,r22
	std Y+1,r20
	movw r24,r22
	clr r24
	andi r25,3
	mov r22,r25
	movw r24,r14
	call _ZN8Enc28j6015_spi_selectBankEh
	mov r22,r16
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
	pop r16
	pop r15
	pop r14
	ret
	.size	_ZN8Enc28j6018_spi_bitFieldClearE13ENC28J60_REGSh, .-_ZN8Enc28j6018_spi_bitFieldClearE13ENC28J60_REGSh
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
	ldi r23,lo8(10)
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,lo8(1)
	ldi r22,lo8(18)
	ldi r23,lo8(10)
	movw r24,r28
	call _ZN8Enc28j6016_spi_bitFieldSetE13ENC28J60_REGSh
	ldi r20,lo8(80)
1:	dec r20
	brne 1b
.L35:
	ldi r22,lo8(10)
	ldi r23,lo8(11)
	movw r24,r28
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	sbrc r24,0
	rjmp .L35
	ldi r20,lo8(1)
	ldi r22,lo8(18)
	ldi r23,lo8(10)
	movw r24,r28
	call _ZN8Enc28j6018_spi_bitFieldClearE13ENC28J60_REGSh
	ldi r22,lo8(25)
	ldi r23,lo8(10)
	movw r24,r28
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	mov r17,r24
	ldi r22,lo8(24)
	ldi r23,lo8(10)
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
.global	_ZN8Enc28j6015isReceivingDataEv
	.type	_ZN8Enc28j6015isReceivingDataEv, @function
_ZN8Enc28j6015isReceivingDataEv:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	ldi r22,lo8(17)
	ldi r23,0
	call _ZN8Enc28j6012_spi_readPhyE16ENC28J60_PHY_REG
	sbrc r25,4
	rjmp .L39
	ldi r22,lo8(29)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	bst r24,2
	clr r24
	bld r24,0
	rjmp .L38
.L39:
	ldi r24,lo8(1)
.L38:
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZN8Enc28j6015isReceivingDataEv, .-_ZN8Enc28j6015isReceivingDataEv
.global	_ZN8Enc28j608isLinkUpEv
	.type	_ZN8Enc28j608isLinkUpEv, @function
_ZN8Enc28j608isLinkUpEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r22,lo8(17)
	ldi r23,0
	call _ZN8Enc28j6012_spi_readPhyE16ENC28J60_PHY_REG
	bst r25,2
	clr r24
	bld r24,0
	ret
	.size	_ZN8Enc28j608isLinkUpEv, .-_ZN8Enc28j608isLinkUpEv
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
.L42:
	ldi r22,lo8(29)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	tst r24
	breq .L42
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZN8Enc28j6010_spi_resetEv, .-_ZN8Enc28j6010_spi_resetEv
.global	_ZN8Enc28j6015_spi_readBufferEPhj
	.type	_ZN8Enc28j6015_spi_readBufferEPhj, @function
_ZN8Enc28j6015_spi_readBufferEPhj:
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
	movw r12,r22
	movw r16,r20
	ldi r22,0
	movw r30,r24
	ld r24,Z
	ldd r25,Z+1
	call _ZN9MasterSPI11enableSlaveEh
	ldi r22,lo8(58)
	movw r30,r14
	ld r24,Z
	ldd r25,Z+1
	call _ZN9MasterSPI8transferEh
	movw r28,r12
	add r16,r12
	adc r17,r13
.L47:
	movw r30,r14
	ld r24,Z
	ldd r25,Z+1
	ldi r22,0
	cp r28,r16
	cpc r29,r17
	breq .L46
	call _ZN9MasterSPI8transferEh
	st Y+,r24
	rjmp .L47
.L46:
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	jmp _ZN9MasterSPI12disableSlaveEh
	.size	_ZN8Enc28j6015_spi_readBufferEPhj, .-_ZN8Enc28j6015_spi_readBufferEPhj
.global	_ZN8Enc28j6013receivePacketEPhj
	.type	_ZN8Enc28j6013receivePacketEPhj, @function
_ZN8Enc28j6013receivePacketEPhj:
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
/* stack size = 11 */
.L__stack_usage = 11
	movw r28,r24
	movw r8,r22
	movw r14,r20
	ldi r22,lo8(25)
	ldi r23,lo8(1)
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	cpse r24,__zero_reg__
	rjmp .L49
.L51:
	ldi r24,0
	ldi r25,0
	rjmp .L50
.L49:
	ldd r20,Y+11
	ldi r22,0
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+12
	ldi r22,lo8(1)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r22,lo8(58)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6015_spi_readOpcodeEj
	ldi r25,0
	std Y+12,r25
	std Y+11,r24
	ldi r22,lo8(58)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6015_spi_readOpcodeEj
	ldd r18,Y+11
	ldd r19,Y+12
	or r19,r24
	std Y+12,r19
	std Y+11,r18
	ldi r22,lo8(58)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6015_spi_readOpcodeEj
	mov r16,r24
	ldi r22,lo8(58)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6015_spi_readOpcodeEj
	mov r13,r24
	ldi r22,lo8(58)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6015_spi_readOpcodeEj
	mov r10,r24
	ldi r22,lo8(58)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6015_spi_readOpcodeEj
	sbrs r10,7
	rjmp .L51
	movw r20,r14
	movw r22,r8
	movw r24,r28
	call _ZN8Enc28j6015_spi_readBufferEPhj
	ldd r20,Y+11
	ldd r21,Y+12
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	brne .L52
	ldi r20,lo8(-1)
	ldi r22,lo8(12)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,lo8(23)
	rjmp .L58
.L52:
	subi r20,lo8(-(-1))
	ldi r22,lo8(12)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r24,Y+11
	ldd r25,Y+12
	sbiw r24,1
	mov r20,r25
.L58:
	ldi r22,lo8(13)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r24,1
	sub r14,r24
	sbc r15,__zero_reg__
	ldi r17,0
	or r17,r13
	subi r16,4
	sbc r17,__zero_reg__
	cp r14,r16
	cpc r15,r17
	brsh .L54
	movw r16,r14
.L54:
	ldi r20,lo8(64)
	ldi r22,lo8(30)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6016_spi_bitFieldSetE13ENC28J60_REGSh
	movw r24,r16
.L50:
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
	ret
	.size	_ZN8Enc28j6013receivePacketEPhj, .-_ZN8Enc28j6013receivePacketEPhj
.global	_ZN8Enc28j6016_spi_writeBufferEPhj
	.type	_ZN8Enc28j6016_spi_writeBufferEPhj, @function
_ZN8Enc28j6016_spi_writeBufferEPhj:
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
	movw r16,r24
	movw r12,r22
	movw r14,r20
	ldi r22,0
	movw r30,r24
	ld r24,Z
	ldd r25,Z+1
	call _ZN9MasterSPI11enableSlaveEh
	ldi r22,lo8(122)
	movw r30,r16
	ld r24,Z
	ldd r25,Z+1
	call _ZN9MasterSPI8transferEh
	ldi r22,0
	movw r30,r16
	ld r24,Z
	ldd r25,Z+1
	call _ZN9MasterSPI8transferEh
	movw r28,r12
	add r14,r12
	adc r15,r13
.L61:
	movw r30,r16
	ld r24,Z
	ldd r25,Z+1
	cp r28,r14
	cpc r29,r15
	breq .L60
	ld r22,Y+
	call _ZN9MasterSPI8transferEh
	rjmp .L61
.L60:
	ldi r22,0
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	jmp _ZN9MasterSPI12disableSlaveEh
	.size	_ZN8Enc28j6016_spi_writeBufferEPhj, .-_ZN8Enc28j6016_spi_writeBufferEPhj
.global	_ZN8Enc28j6010sendPacketEPhj
	.type	_ZN8Enc28j6010sendPacketEPhj, @function
_ZN8Enc28j6010sendPacketEPhj:
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
	movw r14,r22
	movw r16,r20
	ldd r20,Y+17
	ldi r22,lo8(2)
	ldi r23,0
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+18
	ldi r22,lo8(3)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+17
	add r20,r16
	ldi r22,lo8(6)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r24,Y+17
	ldd r25,Y+18
	add r24,r16
	adc r25,r17
	mov r20,r25
	ldi r22,lo8(7)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	movw r20,r16
	movw r22,r14
	movw r24,r28
	call _ZN8Enc28j6016_spi_writeBufferEPhj
	ldi r20,lo8(8)
	ldi r22,lo8(31)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6016_spi_bitFieldSetE13ENC28J60_REGSh
	ldi r20,lo8(8)
	ldi r22,lo8(31)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6018_spi_bitFieldClearE13ENC28J60_REGSh
	ldi r20,lo8(10)
	ldi r22,lo8(28)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6018_spi_bitFieldClearE13ENC28J60_REGSh
	ldi r20,lo8(8)
	ldi r22,lo8(31)
	ldi r23,0
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	jmp _ZN8Enc28j6016_spi_bitFieldSetE13ENC28J60_REGSh
	.size	_ZN8Enc28j6010sendPacketEPhj, .-_ZN8Enc28j6010sendPacketEPhj
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
	breq .L64
	std Y+16,r23
	std Y+15,r22
.L64:
	ldd r20,Y+14
	ldi r22,lo8(9)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+15
	ldi r22,lo8(8)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+16
	ldi r22,lo8(11)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+15
	ldi r22,lo8(10)
	ldi r23,0
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
	ldi r23,0
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	mov r28,r24
	ldi r22,lo8(10)
	ldi r23,0
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
.global	_ZN8Enc28j6020_spi_setTxBufferSizeEj
	.type	_ZN8Enc28j6020_spi_setTxBufferSizeEj, @function
_ZN8Enc28j6020_spi_setTxBufferSizeEj:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	ldd r24,Y+15
	ldd r25,Y+16
	adiw r24,1
	std Y+18,r25
	std Y+17,r24
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L70
	add r22,r24
	adc r23,r25
	std Y+20,r23
	std Y+19,r22
	cp r22,__zero_reg__
	sbci r23,32
	brlo .L71
.L70:
	ldi r18,lo8(-1)
	ldi r19,lo8(31)
	std Y+20,r19
	std Y+19,r18
.L71:
	mov r20,r25
	ldi r22,lo8(5)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+19
	ldi r22,lo8(4)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+20
	ldi r22,lo8(7)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+19
	ldi r22,lo8(6)
	ldi r23,0
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	jmp _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	.size	_ZN8Enc28j6020_spi_setTxBufferSizeEj, .-_ZN8Enc28j6020_spi_setTxBufferSizeEj
.global	_ZN8Enc28j6020_spi_getTxBufferSizeEv
	.type	_ZN8Enc28j6020_spi_getTxBufferSizeEv, @function
_ZN8Enc28j6020_spi_getTxBufferSizeEv:
	push r16
	push r17
	push r28
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	movw r16,r24
	ldi r22,lo8(7)
	ldi r23,0
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	mov r28,r24
	ldi r22,lo8(6)
	ldi r23,0
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
	.size	_ZN8Enc28j6020_spi_getTxBufferSizeEv, .-_ZN8Enc28j6020_spi_getTxBufferSizeEv
.global	_ZN8Enc28j6011_spi_setMACEv
	.type	_ZN8Enc28j6011_spi_setMACEv, @function
_ZN8Enc28j6011_spi_setMACEv:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	ldd r20,Y+2
	ldi r22,lo8(1)
	ldi r23,lo8(7)
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+3
	ldi r22,0
	ldi r23,lo8(7)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+4
	ldi r22,lo8(3)
	ldi r23,lo8(7)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+5
	ldi r22,lo8(2)
	ldi r23,lo8(7)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+6
	ldi r22,lo8(5)
	ldi r23,lo8(7)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+7
	ldi r22,lo8(4)
	ldi r23,lo8(7)
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	jmp _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	.size	_ZN8Enc28j6011_spi_setMACEv, .-_ZN8Enc28j6011_spi_setMACEv
.global	_ZN8Enc28j60C2ER9macaddr_t
	.type	_ZN8Enc28j60C2ER9macaddr_t, @function
_ZN8Enc28j60C2ER9macaddr_t:
	push r16
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	movw r28,r24
	ldi r24,lo8(-96)
	std Y+2,r24
	ldi r24,lo8(-79)
	std Y+3,r24
	ldi r24,lo8(-62)
	std Y+4,r24
	ldi r24,lo8(-45)
	std Y+5,r24
	ldi r24,lo8(-28)
	std Y+6,r24
	ldi r24,lo8(-11)
	std Y+7,r24
	std Y+8,__zero_reg__
	ldi r24,lo8(1)
	std Y+9,r24
	std Y+10,__zero_reg__
	std Y+12,__zero_reg__
	std Y+11,__zero_reg__
	std Y+14,__zero_reg__
	std Y+13,__zero_reg__
	ldi r24,lo8(-1)
	ldi r25,lo8(23)
	std Y+16,r25
	std Y+15,r24
	ldi r24,0
	ldi r25,lo8(24)
	std Y+18,r25
	std Y+17,r24
	ldi r24,lo8(-1)
	ldi r25,lo8(31)
	std Y+20,r25
	std Y+19,r24
	ld r24,Y
	ldd r25,Y+1
	call _ZN9MasterSPI15isInitilizedSPIEv
	cpse r24,__zero_reg__
	rjmp .L78
	ldi r16,lo8(53)
	ldi r18,lo8(52)
	ldi r20,lo8(51)
	ldi r22,lo8(50)
	movw r24,r28
	call _ZN8Enc28j606setSPIEhhhh
.L78:
	movw r24,r28
	call _ZN8Enc28j6010_spi_resetEv
	ldi r20,0
	ldi r22,lo8(4)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,lo8(24)
	ldi r22,lo8(5)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,lo8(31)
	ldi r22,lo8(7)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,lo8(31)
	ldi r22,lo8(7)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,0
	ldi r22,lo8(8)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,0
	ldi r22,lo8(9)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,0
	ldi r22,lo8(12)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,0
	ldi r22,lo8(13)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,lo8(-1)
	ldi r22,lo8(10)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,lo8(23)
	ldi r22,lo8(11)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,lo8(-93)
	ldi r22,lo8(24)
	ldi r23,lo8(1)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	movw r24,r28
	call _ZN8Enc28j6011_spi_setMACEv
	ldi r20,0
	ldi r22,0
	ldi r23,lo8(1)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,0
	ldi r22,lo8(1)
	ldi r23,lo8(1)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,0
	ldi r22,lo8(2)
	ldi r23,lo8(1)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,0
	ldi r22,lo8(3)
	ldi r23,lo8(1)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,0
	ldi r22,lo8(4)
	ldi r23,lo8(1)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,0
	ldi r22,lo8(5)
	ldi r23,lo8(1)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,0
	ldi r22,lo8(6)
	ldi r23,lo8(1)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,0
	ldi r22,lo8(7)
	ldi r23,lo8(1)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,lo8(1)
	ldi r22,lo8(21)
	ldi r23,lo8(3)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,lo8(13)
	ldi r22,0
	ldi r23,lo8(6)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r24,Y+9
	tst r24
	breq .L79
	ldi r20,lo8(51)
	ldi r22,lo8(2)
	ldi r23,lo8(6)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,0
	ldi r21,lo8(1)
	ldi r22,0
	ldi r23,0
	rjmp .L83
.L79:
	ldi r20,lo8(50)
	ldi r22,lo8(2)
	ldi r23,lo8(6)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,0
	ldi r21,0
	ldi r22,0
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6013_spi_writePhyE16ENC28J60_PHY_REGj
	ldi r20,0
	ldi r21,lo8(1)
	ldi r22,lo8(16)
	ldi r23,0
.L83:
	movw r24,r28
	call _ZN8Enc28j6013_spi_writePhyE16ENC28J60_PHY_REGj
	ldi r20,lo8(64)
	ldi r22,lo8(3)
	ldi r23,lo8(6)
	movw r24,r28
	call _ZN8Enc28j6016_spi_bitFieldSetE13ENC28J60_REGSh
	ldi r20,lo8(18)
	ldi r22,lo8(6)
	ldi r23,lo8(6)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,lo8(12)
	ldi r22,lo8(7)
	ldi r23,lo8(6)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r24,Y+9
	cpse r24,__zero_reg__
	rjmp .L82
	ldi r20,lo8(18)
	rjmp .L81
.L82:
	ldi r20,lo8(21)
.L81:
	ldi r22,lo8(4)
	ldi r23,lo8(6)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,lo8(-18)
	ldi r22,lo8(10)
	ldi r23,lo8(6)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,lo8(5)
	ldi r22,lo8(11)
	ldi r23,lo8(6)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,lo8(63)
	ldi r22,lo8(9)
	ldi r23,lo8(6)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,0
	ldi r22,lo8(28)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r22,lo8(91)
	movw r24,r28
	call _ZN8Enc28j6015enableInterruptEh
	ldi r20,lo8(18)
	ldi r21,0
	ldi r22,lo8(18)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6013_spi_writePhyE16ENC28J60_PHY_REGj
	ldi r20,lo8(-128)
	ldi r22,lo8(30)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,lo8(4)
	ldi r22,lo8(31)
	ldi r23,0
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r16
	jmp _ZN8Enc28j6016_spi_bitFieldSetE13ENC28J60_REGSh
	.size	_ZN8Enc28j60C2ER9macaddr_t, .-_ZN8Enc28j60C2ER9macaddr_t
.global	_ZN8Enc28j60C1ER9macaddr_t
	.set	_ZN8Enc28j60C1ER9macaddr_t,_ZN8Enc28j60C2ER9macaddr_t
.global	_ZN8Enc28j6011_spi_getMACEPh
	.type	_ZN8Enc28j6011_spi_getMACEPh, @function
_ZN8Enc28j6011_spi_getMACEPh:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r16,r24
	movw r28,r22
	ldi r22,lo8(1)
	ldi r23,lo8(7)
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	st Y,r24
	ldi r22,0
	ldi r23,lo8(7)
	movw r24,r16
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	std Y+1,r24
	ldi r22,lo8(3)
	ldi r23,lo8(7)
	movw r24,r16
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	std Y+2,r24
	ldi r22,lo8(2)
	ldi r23,lo8(7)
	movw r24,r16
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	std Y+3,r24
	ldi r22,lo8(5)
	ldi r23,lo8(7)
	movw r24,r16
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	std Y+4,r24
	ldi r22,lo8(4)
	ldi r23,lo8(7)
	movw r24,r16
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	std Y+5,r24
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_ZN8Enc28j6011_spi_getMACEPh, .-_ZN8Enc28j6011_spi_getMACEPh
	.ident	"GCC: (GNU) 5.4.0"
