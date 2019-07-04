	.file	"enc28j60.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	_ZN8Enc28j608callbackEh
	.type	_ZN8Enc28j608callbackEh, @function
_ZN8Enc28j608callbackEh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_ZN8Enc28j608callbackEh, .-_ZN8Enc28j608callbackEh
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
	std Z+3,r29
	std Z+2,r28
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
	std Z+24,r23
	std Z+23,r22
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
	ldd r24,Z+2
	ldd r25,Z+3
	call _ZN9MasterSPI11enableSlaveEh
	mov r22,r13
	movw r30,r16
	ldd r24,Z+2
	ldd r25,Z+3
	call _ZN9MasterSPI8transferEh
	sbiw r28,0
	breq .L5
	add r14,r28
	adc r15,r29
.L6:
	cp r28,r14
	cpc r29,r15
	breq .L5
	ld r22,Y+
	movw r30,r16
	ldd r24,Z+2
	ldd r25,Z+3
	call _ZN9MasterSPI8transferEh
	rjmp .L6
.L5:
	ldi r22,0
	movw r30,r16
	ldd r24,Z+2
	ldd r25,Z+3
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
	ldd r24,Y+2
	ldd r25,Y+3
	call _ZN9MasterSPI11enableSlaveEh
	mov r22,r16
	ldd r24,Y+2
	ldd r25,Y+3
	call _ZN9MasterSPI8transferEh
	ldi r22,0
	ldd r24,Y+2
	ldd r25,Y+3
	call _ZN9MasterSPI8transferEh
	mov r15,r24
	clr r16
	andi r17,12
	or r16,r17
	breq .L12
	ldi r22,0
	ldd r24,Y+2
	ldd r25,Y+3
	call _ZN9MasterSPI8transferEh
	mov r15,r24
.L12:
	ldi r22,0
	ldd r24,Y+2
	ldd r25,Y+3
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
	brsh .L16
	movw r30,r24
	ldd r18,Z+12
	cp r22,r18
	breq .L16
	mov r17,r22
	movw r14,r24
	std Z+12,r22
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
.L16:
/* epilogue start */
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r15
	pop r14
	ret
	.size	_ZN8Enc28j6015_spi_selectBankEh, .-_ZN8Enc28j6015_spi_selectBankEh
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
	movw r20,r28
	ldi r22,lo8(2)
	ldi r24,lo8(13)
/* epilogue start */
	pop r29
	pop r28
	jmp _ZN9Interrupt15attachInterruptEh8INT_EDGEP18SystemEventHandler
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
.L24:
	ldi r22,lo8(10)
	ldi r23,lo8(11)
	movw r24,r28
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	sbrc r24,0
	rjmp .L24
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
.L29:
	ldi r22,lo8(10)
	ldi r23,lo8(11)
	movw r24,r28
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	sbrc r24,0
	rjmp .L29
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
	rjmp .L33
	ldi r22,lo8(29)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	bst r24,2
	clr r24
	bld r24,0
	rjmp .L32
.L33:
	ldi r24,lo8(1)
.L32:
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
.L36:
	ldi r22,lo8(29)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6019_spi_readControlRegE13ENC28J60_REGS
	tst r24
	breq .L36
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
	ldd r24,Z+2
	ldd r25,Z+3
	call _ZN9MasterSPI11enableSlaveEh
	ldi r22,lo8(58)
	movw r30,r14
	ldd r24,Z+2
	ldd r25,Z+3
	call _ZN9MasterSPI8transferEh
	movw r28,r12
	add r16,r12
	adc r17,r13
.L41:
	movw r30,r14
	ldd r24,Z+2
	ldd r25,Z+3
	ldi r22,0
	cp r28,r16
	cpc r29,r17
	breq .L40
	call _ZN9MasterSPI8transferEh
	st Y+,r24
	rjmp .L41
.L40:
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
	rjmp .L43
.L45:
	ldi r24,0
	ldi r25,0
	rjmp .L44
.L43:
	ldd r20,Y+13
	ldi r22,0
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+14
	ldi r22,lo8(1)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r22,lo8(58)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6015_spi_readOpcodeEj
	ldi r25,0
	std Y+14,r25
	std Y+13,r24
	ldi r22,lo8(58)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6015_spi_readOpcodeEj
	ldd r18,Y+13
	ldd r19,Y+14
	or r19,r24
	std Y+14,r19
	std Y+13,r18
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
	rjmp .L45
	movw r20,r14
	movw r22,r8
	movw r24,r28
	call _ZN8Enc28j6015_spi_readBufferEPhj
	ldd r20,Y+13
	ldd r21,Y+14
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	brne .L46
	ldi r20,lo8(-1)
	ldi r22,lo8(12)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,lo8(23)
	rjmp .L52
.L46:
	subi r20,lo8(-(-1))
	ldi r22,lo8(12)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r24,Y+13
	ldd r25,Y+14
	sbiw r24,1
	mov r20,r25
.L52:
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
	brsh .L48
	movw r16,r14
.L48:
	ldi r20,lo8(64)
	ldi r22,lo8(30)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6016_spi_bitFieldSetE13ENC28J60_REGSh
	movw r24,r16
.L44:
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
	ldd r24,Z+2
	ldd r25,Z+3
	call _ZN9MasterSPI11enableSlaveEh
	ldi r22,lo8(122)
	movw r30,r16
	ldd r24,Z+2
	ldd r25,Z+3
	call _ZN9MasterSPI8transferEh
	ldi r22,0
	movw r30,r16
	ldd r24,Z+2
	ldd r25,Z+3
	call _ZN9MasterSPI8transferEh
	movw r28,r12
	add r14,r12
	adc r15,r13
.L55:
	movw r30,r16
	ldd r24,Z+2
	ldd r25,Z+3
	cp r28,r14
	cpc r29,r15
	breq .L54
	ld r22,Y+
	call _ZN9MasterSPI8transferEh
	rjmp .L55
.L54:
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
	ldd r20,Y+19
	ldi r22,lo8(2)
	ldi r23,0
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+20
	ldi r22,lo8(3)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+19
	add r20,r16
	ldi r22,lo8(6)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r24,Y+19
	ldd r25,Y+20
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
	breq .L58
	std Y+18,r23
	std Y+17,r22
.L58:
	ldd r20,Y+16
	ldi r22,lo8(9)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+17
	ldi r22,lo8(8)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+18
	ldi r22,lo8(11)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+17
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
	ldd r24,Y+17
	ldd r25,Y+18
	adiw r24,1
	std Y+20,r25
	std Y+19,r24
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L64
	add r22,r24
	adc r23,r25
	std Y+22,r23
	std Y+21,r22
	cp r22,__zero_reg__
	sbci r23,32
	brlo .L65
.L64:
	ldi r18,lo8(-1)
	ldi r19,lo8(31)
	std Y+22,r19
	std Y+21,r18
.L65:
	mov r20,r25
	ldi r22,lo8(5)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+21
	ldi r22,lo8(4)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+22
	ldi r22,lo8(7)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+21
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
	ldd r20,Y+4
	ldi r22,lo8(1)
	ldi r23,lo8(7)
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+5
	ldi r22,0
	ldi r23,lo8(7)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+6
	ldi r22,lo8(3)
	ldi r23,lo8(7)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+7
	ldi r22,lo8(2)
	ldi r23,lo8(7)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+8
	ldi r22,lo8(5)
	ldi r23,lo8(7)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r20,Y+9
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
	call _ZN18SystemEventHandlerC2Ev
	ldi r24,lo8(_ZTV8Enc28j60+4)
	ldi r25,hi8(_ZTV8Enc28j60+4)
	std Y+1,r25
	st Y,r24
	ldi r24,lo8(-96)
	std Y+4,r24
	ldi r24,lo8(-79)
	std Y+5,r24
	ldi r24,lo8(-62)
	std Y+6,r24
	ldi r24,lo8(-45)
	std Y+7,r24
	ldi r24,lo8(-28)
	std Y+8,r24
	ldi r24,lo8(-11)
	std Y+9,r24
	std Y+10,__zero_reg__
	ldi r24,lo8(1)
	std Y+11,r24
	std Y+12,__zero_reg__
	std Y+14,__zero_reg__
	std Y+13,__zero_reg__
	std Y+16,__zero_reg__
	std Y+15,__zero_reg__
	ldi r24,lo8(-1)
	ldi r25,lo8(23)
	std Y+18,r25
	std Y+17,r24
	ldi r24,0
	ldi r25,lo8(24)
	std Y+20,r25
	std Y+19,r24
	ldi r24,lo8(-1)
	ldi r25,lo8(31)
	std Y+22,r25
	std Y+21,r24
	ldd r24,Y+2
	ldd r25,Y+3
	call _ZN9MasterSPI15isInitilizedSPIEv
	cpse r24,__zero_reg__
	rjmp .L72
	ldi r16,lo8(53)
	ldi r18,lo8(52)
	ldi r20,lo8(51)
	ldi r22,lo8(50)
	movw r24,r28
	call _ZN8Enc28j606setSPIEhhhh
.L72:
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
	ldd r24,Y+11
	tst r24
	breq .L73
	ldi r20,lo8(51)
	ldi r22,lo8(2)
	ldi r23,lo8(6)
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldi r20,0
	ldi r21,lo8(1)
	ldi r22,0
	ldi r23,0
	rjmp .L77
.L73:
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
.L77:
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
	ldd r24,Y+11
	cpse r24,__zero_reg__
	rjmp .L76
	ldi r20,lo8(18)
	rjmp .L75
.L76:
	ldi r20,lo8(21)
.L75:
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
.global	_ZN8Enc28j609_callbackEhPv
	.type	_ZN8Enc28j609_callbackEhPv, @function
_ZN8Enc28j609_callbackEhPv:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	breq .L79
	movw r28,r20
	ldi r20,0
	ldi r22,lo8(28)
	ldi r23,0
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeControlRegE13ENC28J60_REGSh
	ldd r30,Y+23
	ldd r31,Y+24
	sbiw r30,0
	breq .L79
	ldi r24,lo8(3)
/* epilogue start */
	pop r29
	pop r28
	eijmp
.L79:
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZN8Enc28j609_callbackEhPv, .-_ZN8Enc28j609_callbackEhPv
	.weak	_ZTV8Enc28j60
	.section	.rodata._ZTV8Enc28j60,"aG",@progbits,_ZTV8Enc28j60,comdat
	.type	_ZTV8Enc28j60, @object
	.size	_ZTV8Enc28j60, 6
_ZTV8Enc28j60:
	.word	0
	.word	0
	.word	gs(_ZN8Enc28j608callbackEh)
	.ident	"GCC: (GNU) 5.4.0"
.global __do_copy_data
