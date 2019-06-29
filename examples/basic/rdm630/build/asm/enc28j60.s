	.file	"enc28j60.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.type	_ZN8Enc28j6012_spi_writeOPE12ENC28J60_ISA.isra.1, @function
_ZN8Enc28j6012_spi_writeOPE12ENC28J60_ISA.isra.1:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
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
	mov r22,r17
	ld r24,Y
	ldd r25,Y+1
	call _ZN9MasterSPI8transferEh
	ldi r22,0
	ld r24,Y
	ldd r25,Y+1
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	jmp _ZN9MasterSPI12disableSlaveEh
	.size	_ZN8Enc28j6012_spi_writeOPE12ENC28J60_ISA.isra.1, .-_ZN8Enc28j6012_spi_writeOPE12ENC28J60_ISA.isra.1
.global	_ZN8Enc28j60C2Ev
	.type	_ZN8Enc28j60C2Ev, @function
_ZN8Enc28j60C2Ev:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	std Z+12,__zero_reg__
	std Z+11,__zero_reg__
	ldi r24,lo8(-1)
	ldi r25,lo8(25)
	std Z+14,r25
	std Z+13,r24
	ldi r24,0
	ldi r25,lo8(26)
	std Z+16,r25
	std Z+15,r24
	ldi r24,lo8(-1)
	ldi r25,lo8(31)
	std Z+18,r25
	std Z+17,r24
	ret
	.size	_ZN8Enc28j60C2Ev, .-_ZN8Enc28j60C2Ev
.global	_ZN8Enc28j60C1Ev
	.set	_ZN8Enc28j60C1Ev,_ZN8Enc28j60C2Ev
.global	_ZN8Enc28j6019_spi_readBuffMemoryERSt6vectorIhSaIhEEj
	.type	_ZN8Enc28j6019_spi_readBuffMemoryERSt6vectorIhSaIhEEj, @function
_ZN8Enc28j6019_spi_readBuffMemoryERSt6vectorIhSaIhEEj:
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
/* prologue: function */
/* frame size = 0 */
/* stack size = 13 */
.L__stack_usage = 13
	movw r14,r24
	movw r28,r22
	movw r12,r20
	ldi r22,0
	movw r30,r24
	ldd r24,Z+19
	ldd r25,Z+20
	call _ZN9MasterSPI11enableSlaveEh
	ldi r22,lo8(58)
	movw r30,r14
	ldd r24,Z+19
	ldd r25,Z+20
	call _ZN9MasterSPI8transferEh
	ldi r16,0
	ldi r17,0
.L14:
	movw r30,r14
	ldd r24,Z+19
	ldd r25,Z+20
	ldi r22,0
	cp r16,r12
	cpc r17,r13
	brne .+2
	rjmp .L4
	call _ZN9MasterSPI8transferEh
	mov r7,r24
	ldd r24,Y+4
	ldd r25,Y+5
	movw r10,r24
	ldi r31,-1
	sub r10,r31
	sbc r11,r31
	cp r24,r10
	cpc r25,r11
	brsh .L5
	ldd r18,Y+2
	ldd r19,Y+3
	cp r18,r10
	cpc r19,r11
	brsh .L6
	adiw r24,9
	cp r18,r24
	cpc r19,r25
	brsh .L6
	ld r8,Y
	ldd r9,Y+1
	std Y+3,r25
	std Y+2,r24
	call _Znwj
	std Y+1,r25
	st Y,r24
	movw r26,r8
.L9:
	movw r24,r26
	sub r24,r8
	sbc r25,r9
	ldd r18,Y+4
	ldd r19,Y+5
	cp r24,r18
	cpc r25,r19
	brsh .L7
	ld r30,Y
	ldd r31,Y+1
	add r30,r24
	adc r31,r25
	sbiw r30,0
	breq .L8
	ld r24,X
	st Z,r24
.L8:
	adiw r26,1
	rjmp .L9
.L7:
	movw r24,r8
	call _ZdlPv
.L6:
	ldd r24,Y+4
	ldd r25,Y+5
.L12:
	cp r24,r10
	cpc r25,r11
	brsh .L21
	ld r30,Y
	ldd r31,Y+1
	add r30,r24
	adc r31,r25
	sbiw r30,0
	breq .L11
	st Z,r7
.L11:
	adiw r24,1
	rjmp .L12
.L5:
	cp r10,r24
	cpc r11,r25
	brsh .L13
.L21:
	std Y+5,r11
	std Y+4,r10
.L13:
	subi r16,-1
	sbci r17,-1
	rjmp .L14
.L4:
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
	pop r9
	pop r8
	pop r7
	jmp _ZN9MasterSPI12disableSlaveEh
	.size	_ZN8Enc28j6019_spi_readBuffMemoryERSt6vectorIhSaIhEEj, .-_ZN8Enc28j6019_spi_readBuffMemoryERSt6vectorIhSaIhEEj
.global	_ZN8Enc28j6020_spi_writeBuffMemoryERSt6vectorIhSaIhEE
	.type	_ZN8Enc28j6020_spi_writeBuffMemoryERSt6vectorIhSaIhEE, @function
_ZN8Enc28j6020_spi_writeBuffMemoryERSt6vectorIhSaIhEE:
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
	movw r16,r24
	movw r14,r22
	ldi r22,0
	movw r26,r24
	adiw r26,19
	ld r24,X+
	ld r25,X
	sbiw r26,19+1
	call _ZN9MasterSPI11enableSlaveEh
	ldi r22,lo8(122)
	movw r30,r16
	ldd r24,Z+19
	ldd r25,Z+20
	call _ZN9MasterSPI8transferEh
	ldi r28,0
	ldi r29,0
.L25:
	movw r26,r14
	adiw r26,4
	ld r18,X+
	ld r19,X
	sbiw r26,4+1
	movw r30,r16
	ldd r24,Z+19
	ldd r25,Z+20
	cp r28,r18
	cpc r29,r19
	brsh .L24
	ld r30,X+
	ld r31,X
	add r30,r28
	adc r31,r29
	ld r22,Z
	call _ZN9MasterSPI8transferEh
	adiw r28,1
	rjmp .L25
.L24:
	ldi r22,0
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	jmp _ZN9MasterSPI12disableSlaveEh
	.size	_ZN8Enc28j6020_spi_writeBuffMemoryERSt6vectorIhSaIhEE, .-_ZN8Enc28j6020_spi_writeBuffMemoryERSt6vectorIhSaIhEE
.global	_ZN8Enc28j6020_spi_writeBuffMemoryEPhj
	.type	_ZN8Enc28j6020_spi_writeBuffMemoryEPhj, @function
_ZN8Enc28j6020_spi_writeBuffMemoryEPhj:
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
	ldd r24,Z+19
	ldd r25,Z+20
	call _ZN9MasterSPI11enableSlaveEh
	ldi r22,lo8(122)
	movw r30,r14
	ldd r24,Z+19
	ldd r25,Z+20
	call _ZN9MasterSPI8transferEh
	movw r28,r12
	add r16,r12
	adc r17,r13
.L28:
	movw r30,r14
	ldd r24,Z+19
	ldd r25,Z+20
	cp r28,r16
	cpc r29,r17
	breq .L27
	ld r22,Y+
	call _ZN9MasterSPI8transferEh
	rjmp .L28
.L27:
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
	.size	_ZN8Enc28j6020_spi_writeBuffMemoryEPhj, .-_ZN8Enc28j6020_spi_writeBuffMemoryEPhj
.global	_ZN8Enc28j607receiveERSt6vectorIhSaIhEE
	.type	_ZN8Enc28j607receiveERSt6vectorIhSaIhEE, @function
_ZN8Enc28j607receiveERSt6vectorIhSaIhEE:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r22
	ldd r20,Z+4
	ldd r21,Z+5
	jmp _ZN8Enc28j6019_spi_readBuffMemoryERSt6vectorIhSaIhEEj
	.size	_ZN8Enc28j607receiveERSt6vectorIhSaIhEE, .-_ZN8Enc28j607receiveERSt6vectorIhSaIhEE
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
	std Z+20,r29
	std Z+19,r28
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
	.section	.text._ZN8Enc28j6012_spi_readRegEh,"axG",@progbits,_ZN8Enc28j6012_spi_readRegEh,comdat
	.weak	_ZN8Enc28j6012_spi_readRegEh
	.type	_ZN8Enc28j6012_spi_readRegEh, @function
_ZN8Enc28j6012_spi_readRegEh:
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
	ldd r24,Y+19
	ldd r25,Y+20
	call _ZN9MasterSPI11enableSlaveEh
	mov r22,r16
	ldd r24,Y+19
	ldd r25,Y+20
	call _ZN9MasterSPI8transferEh
	ldi r22,0
	ldd r24,Y+19
	ldd r25,Y+20
	call _ZN9MasterSPI11sendReceiveEh
	mov r17,r24
	sbrs r16,7
	rjmp .L32
	ldi r22,0
	ldd r24,Y+19
	ldd r25,Y+20
	call _ZN9MasterSPI11sendReceiveEh
	mov r17,r24
.L32:
	ldi r22,0
	ldd r24,Y+19
	ldd r25,Y+20
	call _ZN9MasterSPI12disableSlaveEh
	mov r24,r17
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_ZN8Enc28j6012_spi_readRegEh, .-_ZN8Enc28j6012_spi_readRegEh
	.text
.global	_ZN8Enc28j6010_spi_resetEv
	.type	_ZN8Enc28j6010_spi_resetEv, @function
_ZN8Enc28j6010_spi_resetEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r28,r24
	ldi r22,lo8(-1)
	ldi r23,0
	adiw r24,19
	call _ZN8Enc28j6012_spi_writeOPE12ENC28J60_ISA.isra.1
.L34:
	ldi r22,lo8(29)
	movw r24,r28
	call _ZN8Enc28j6012_spi_readRegEh
	rjmp .L34
	.size	_ZN8Enc28j6010_spi_resetEv, .-_ZN8Enc28j6010_spi_resetEv
.global	_ZN8Enc28j604initEv
	.type	_ZN8Enc28j604initEv, @function
_ZN8Enc28j604initEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r28,r24
	ldd r24,Y+19
	ldd r25,Y+20
	call _ZN9MasterSPI15isInitilizedSPIEv
	cpse r24,__zero_reg__
	rjmp .L36
	ldi r16,lo8(53)
	ldi r18,lo8(52)
	ldi r20,lo8(51)
	ldi r22,lo8(50)
	movw r24,r28
	call _ZN8Enc28j606setSPIEhhhh
.L36:
	movw r24,r28
	call _ZN8Enc28j6010_spi_resetEv
	.size	_ZN8Enc28j604initEv, .-_ZN8Enc28j604initEv
	.section	.text._ZN8Enc28j6013_spi_writeRegEhh,"axG",@progbits,_ZN8Enc28j6013_spi_writeRegEhh,comdat
	.weak	_ZN8Enc28j6013_spi_writeRegEhh
	.type	_ZN8Enc28j6013_spi_writeRegEhh, @function
_ZN8Enc28j6013_spi_writeRegEhh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r21,0
	mov r21,r20
	clr r20
	ori r22,lo8(64)
	movw r18,r20
	or r18,r22
	movw r22,r18
	adiw r24,19
	call _ZN8Enc28j6012_spi_writeOPE12ENC28J60_ISA.isra.1
	ret
	.size	_ZN8Enc28j6013_spi_writeRegEhh, .-_ZN8Enc28j6013_spi_writeRegEhh
	.section	.text._ZN8Enc28j6015_spi_selectBankEh,"axG",@progbits,_ZN8Enc28j6015_spi_selectBankEh,comdat
	.weak	_ZN8Enc28j6015_spi_selectBankEh
	.type	_ZN8Enc28j6015_spi_selectBankEh, @function
_ZN8Enc28j6015_spi_selectBankEh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	mov r20,r22
	cpi r22,lo8(4)
	brsh .L38
	ldi r22,lo8(31)
	jmp _ZN8Enc28j6013_spi_writeRegEhh
.L38:
	ret
	.size	_ZN8Enc28j6015_spi_selectBankEh, .-_ZN8Enc28j6015_spi_selectBankEh
	.section	.text._ZN8Enc28j6013_spi_writePhyE16ENC28J60_PHY_REGj,"axG",@progbits,_ZN8Enc28j6013_spi_writePhyE16ENC28J60_PHY_REGj,comdat
	.weak	_ZN8Enc28j6013_spi_writePhyE16ENC28J60_PHY_REGj
	.type	_ZN8Enc28j6013_spi_writePhyE16ENC28J60_PHY_REGj, @function
_ZN8Enc28j6013_spi_writePhyE16ENC28J60_PHY_REGj:
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
	mov r15,r22
	movw r16,r20
	ldi r22,lo8(2)
	call _ZN8Enc28j6015_spi_selectBankEh
	mov r20,r15
	ldi r22,lo8(20)
	movw r24,r28
	call _ZN8Enc28j6013_spi_writeRegEhh
	mov r20,r16
	ldi r22,lo8(24)
	movw r24,r28
	call _ZN8Enc28j6013_spi_writeRegEhh
	mov r20,r17
	ldi r22,lo8(25)
	movw r24,r28
	call _ZN8Enc28j6013_spi_writeRegEhh
	ldi r22,lo8(3)
	movw r24,r28
	call _ZN8Enc28j6015_spi_selectBankEh
	ldi r22,lo8(10)
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	jmp _ZN8Enc28j6012_spi_readRegEh
	.size	_ZN8Enc28j6013_spi_writePhyE16ENC28J60_PHY_REGj, .-_ZN8Enc28j6013_spi_writePhyE16ENC28J60_PHY_REGj
	.text
.global	_ZN8Enc28j6013configureLedsEj
	.type	_ZN8Enc28j6013configureLedsEj, @function
_ZN8Enc28j6013configureLedsEj:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r20,r22
	ldi r22,lo8(20)
	ldi r23,0
	jmp _ZN8Enc28j6013_spi_writePhyE16ENC28J60_PHY_REGj
	.size	_ZN8Enc28j6013configureLedsEj, .-_ZN8Enc28j6013configureLedsEj
.global	_ZN8Enc28j608writePhyE16ENC28J60_PHY_REGj
	.type	_ZN8Enc28j608writePhyE16ENC28J60_PHY_REGj, @function
_ZN8Enc28j608writePhyE16ENC28J60_PHY_REGj:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp _ZN8Enc28j6013_spi_writePhyE16ENC28J60_PHY_REGj
	.size	_ZN8Enc28j608writePhyE16ENC28J60_PHY_REGj, .-_ZN8Enc28j608writePhyE16ENC28J60_PHY_REGj
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
	movw r28,r24
	movw r16,r22
	ldi r22,lo8(3)
	call _ZN8Enc28j6015_spi_selectBankEh
	ldi r22,lo8(1)
	movw r24,r28
	call _ZN8Enc28j6012_spi_readRegEh
	movw r30,r16
	st Z,r24
	ldi r22,0
	movw r24,r28
	call _ZN8Enc28j6012_spi_readRegEh
	movw r30,r16
	std Z+1,r24
	ldi r22,lo8(3)
	movw r24,r28
	call _ZN8Enc28j6012_spi_readRegEh
	movw r30,r16
	std Z+2,r24
	ldi r22,lo8(2)
	movw r24,r28
	call _ZN8Enc28j6012_spi_readRegEh
	movw r30,r16
	std Z+3,r24
	ldi r22,lo8(5)
	movw r24,r28
	call _ZN8Enc28j6012_spi_readRegEh
	movw r30,r16
	std Z+4,r24
	ldi r22,lo8(4)
	movw r24,r28
	call _ZN8Enc28j6012_spi_readRegEh
	movw r30,r16
	std Z+5,r24
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_ZN8Enc28j6011_spi_getMACEPh, .-_ZN8Enc28j6011_spi_getMACEPh
.global	_ZN8Enc28j6021_spi_enableMacReceiveEv
	.type	_ZN8Enc28j6021_spi_enableMacReceiveEv, @function
_ZN8Enc28j6021_spi_enableMacReceiveEv:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	ldi r22,lo8(2)
	call _ZN8Enc28j6015_spi_selectBankEh
	ldd r24,Y+7
	cpse r24,__zero_reg__
	rjmp .L46
	ldi r20,lo8(1)
	rjmp .L45
.L46:
	ldi r20,lo8(13)
.L45:
	ldi r22,0
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	jmp _ZN8Enc28j6013_spi_writeRegEhh
	.size	_ZN8Enc28j6021_spi_enableMacReceiveEv, .-_ZN8Enc28j6021_spi_enableMacReceiveEv
.global	_ZN8Enc28j6021_spi_enableAutoPadCrcEv
	.type	_ZN8Enc28j6021_spi_enableAutoPadCrcEv, @function
_ZN8Enc28j6021_spi_enableAutoPadCrcEv:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	ldi r22,lo8(2)
	call _ZN8Enc28j6015_spi_selectBankEh
	ldd r24,Y+7
	cpse r24,__zero_reg__
	rjmp .L49
	ldi r20,lo8(49)
	rjmp .L48
.L49:
	ldi r20,lo8(51)
.L48:
	ldi r22,lo8(2)
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	jmp _ZN8Enc28j6013_spi_writeRegEhh
	.size	_ZN8Enc28j6021_spi_enableAutoPadCrcEv, .-_ZN8Enc28j6021_spi_enableAutoPadCrcEv
.global	_ZN8Enc28j6021_spi_setMaxPacketSizeEv
	.type	_ZN8Enc28j6021_spi_setMaxPacketSizeEv, @function
_ZN8Enc28j6021_spi_setMaxPacketSizeEv:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	ldi r22,lo8(2)
	call _ZN8Enc28j6015_spi_selectBankEh
	adiw r28,19
	ldi r22,lo8(74)
	ldi r23,lo8(-18)
	movw r24,r28
	call _ZN8Enc28j6012_spi_writeOPE12ENC28J60_ISA.isra.1
	ldi r22,lo8(75)
	ldi r23,lo8(5)
	movw r24,r28
	call _ZN8Enc28j6012_spi_writeOPE12ENC28J60_ISA.isra.1
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	_ZN8Enc28j6021_spi_setMaxPacketSizeEv, .-_ZN8Enc28j6021_spi_setMaxPacketSizeEv
.global	_ZN8Enc28j6018_spi_getRevisionIDEv
	.type	_ZN8Enc28j6018_spi_getRevisionIDEv, @function
_ZN8Enc28j6018_spi_getRevisionIDEv:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
	ldi r22,lo8(3)
	call _ZN8Enc28j6015_spi_selectBankEh
	ldi r22,lo8(18)
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	jmp _ZN8Enc28j6012_spi_readRegEh
	.size	_ZN8Enc28j6018_spi_getRevisionIDEv, .-_ZN8Enc28j6018_spi_getRevisionIDEv
.global	_ZN8Enc28j604sendEPhj
	.type	_ZN8Enc28j604sendEPhj, @function
_ZN8Enc28j604sendEPhj:
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
	movw r14,r22
	movw r16,r20
	ldi r22,0
	call _ZN8Enc28j6015_spi_selectBankEh
	movw r12,r28
	ldi r24,19
	add r12,r24
	adc r13,__zero_reg__
.L54:
	ldi r22,lo8(31)
	movw r24,r28
	call _ZN8Enc28j6012_spi_readRegEh
	sbrs r24,3
	rjmp .L53
	ldi r22,lo8(28)
	movw r24,r28
	call _ZN8Enc28j6012_spi_readRegEh
	sbrs r24,1
	rjmp .L54
	ldi r22,lo8(-97)
	ldi r23,lo8(7)
	movw r24,r12
	call _ZN8Enc28j6012_spi_writeOPE12ENC28J60_ISA.isra.1
	ldi r22,lo8(-65)
	ldi r23,lo8(7)
	movw r24,r12
	call _ZN8Enc28j6012_spi_writeOPE12ENC28J60_ISA.isra.1
	rjmp .L54
.L53:
	ldi r22,0
	movw r24,r28
	call _ZN8Enc28j6015_spi_selectBankEh
	ldd r20,Y+15
	ldi r22,lo8(2)
	movw r24,r28
	call _ZN8Enc28j6013_spi_writeRegEhh
	ldd r20,Y+16
	ldi r22,lo8(3)
	movw r24,r28
	call _ZN8Enc28j6013_spi_writeRegEhh
	ldd r20,Y+15
	add r20,r16
	ldi r22,lo8(6)
	movw r24,r28
	call _ZN8Enc28j6013_spi_writeRegEhh
	ldd r24,Y+15
	ldd r25,Y+16
	add r24,r16
	adc r25,r17
	mov r20,r25
	ldi r22,lo8(7)
	movw r24,r28
	call _ZN8Enc28j6013_spi_writeRegEhh
	movw r20,r16
	movw r22,r14
	movw r24,r28
	call _ZN8Enc28j6020_spi_writeBuffMemoryEPhj
	ldi r22,lo8(-97)
	ldi r23,lo8(7)
	movw r24,r28
	adiw r24,19
	call _ZN8Enc28j6012_spi_writeOPE12ENC28J60_ISA.isra.1
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
	.size	_ZN8Enc28j604sendEPhj, .-_ZN8Enc28j604sendEPhj
.global	_ZN8Enc28j6020_spi_setRxBufferSizeEj
	.type	_ZN8Enc28j6020_spi_setRxBufferSizeEj, @function
_ZN8Enc28j6020_spi_setRxBufferSizeEj:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r24
	movw r16,r22
	ldi r22,0
	call _ZN8Enc28j6015_spi_selectBankEh
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .L59
	std Y+14,r17
	std Y+13,r16
.L59:
	ldd r20,Y+12
	ldi r22,lo8(9)
	movw r24,r28
	call _ZN8Enc28j6013_spi_writeRegEhh
	ldd r20,Y+13
	ldi r22,lo8(8)
	movw r24,r28
	call _ZN8Enc28j6013_spi_writeRegEhh
	ldd r20,Y+14
	ldi r22,lo8(11)
	movw r24,r28
	call _ZN8Enc28j6013_spi_writeRegEhh
	ldd r20,Y+13
	ldi r22,lo8(10)
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	jmp _ZN8Enc28j6013_spi_writeRegEhh
	.size	_ZN8Enc28j6020_spi_setRxBufferSizeEj, .-_ZN8Enc28j6020_spi_setRxBufferSizeEj
.global	_ZN8Enc28j6020_spi_getRxBufferSizeEv
	.type	_ZN8Enc28j6020_spi_getRxBufferSizeEv, @function
_ZN8Enc28j6020_spi_getRxBufferSizeEv:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r16,r24
	ldi r22,0
	call _ZN8Enc28j6015_spi_selectBankEh
	ldi r22,lo8(11)
	movw r24,r16
	call _ZN8Enc28j6012_spi_readRegEh
	mov r28,r24
	ldi r29,0
	mov r29,r28
	clr r28
	ldi r22,lo8(10)
	movw r24,r16
	call _ZN8Enc28j6012_spi_readRegEh
	movw r18,r28
	or r18,r24
	movw r24,r18
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_ZN8Enc28j6020_spi_getRxBufferSizeEv, .-_ZN8Enc28j6020_spi_getRxBufferSizeEv
.global	_ZN8Enc28j6020_spi_setTxBufferSizeEj
	.type	_ZN8Enc28j6020_spi_setTxBufferSizeEj, @function
_ZN8Enc28j6020_spi_setTxBufferSizeEj:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r24
	movw r16,r22
	ldi r22,0
	call _ZN8Enc28j6015_spi_selectBankEh
	ldd r24,Y+13
	ldd r25,Y+14
	adiw r24,1
	std Y+16,r25
	std Y+15,r24
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .L65
	add r16,r24
	adc r17,r25
	std Y+18,r17
	std Y+17,r16
	cp r16,__zero_reg__
	sbci r17,32
	brlo .L66
.L65:
	ldi r18,lo8(-1)
	ldi r19,lo8(31)
	std Y+18,r19
	std Y+17,r18
.L66:
	mov r20,r25
	ldi r22,lo8(5)
	movw r24,r28
	call _ZN8Enc28j6013_spi_writeRegEhh
	ldd r20,Y+17
	ldi r22,lo8(4)
	movw r24,r28
	call _ZN8Enc28j6013_spi_writeRegEhh
	ldd r20,Y+18
	ldi r22,lo8(7)
	movw r24,r28
	call _ZN8Enc28j6013_spi_writeRegEhh
	ldd r20,Y+17
	ldi r22,lo8(6)
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	jmp _ZN8Enc28j6013_spi_writeRegEhh
	.size	_ZN8Enc28j6020_spi_setTxBufferSizeEj, .-_ZN8Enc28j6020_spi_setTxBufferSizeEj
.global	_ZN8Enc28j6020_spi_getTxBufferSizeEv
	.type	_ZN8Enc28j6020_spi_getTxBufferSizeEv, @function
_ZN8Enc28j6020_spi_getTxBufferSizeEv:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r16,r24
	ldi r22,0
	call _ZN8Enc28j6015_spi_selectBankEh
	ldi r22,lo8(7)
	movw r24,r16
	call _ZN8Enc28j6012_spi_readRegEh
	mov r28,r24
	ldi r29,0
	mov r29,r28
	clr r28
	ldi r22,lo8(6)
	movw r24,r16
	call _ZN8Enc28j6012_spi_readRegEh
	movw r18,r28
	or r18,r24
	movw r24,r18
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_ZN8Enc28j6020_spi_getTxBufferSizeEv, .-_ZN8Enc28j6020_spi_getTxBufferSizeEv
.global	_ZN8Enc28j6021_spi_getNextPacketPtrEv
	.type	_ZN8Enc28j6021_spi_getNextPacketPtrEv, @function
_ZN8Enc28j6021_spi_getNextPacketPtrEv:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r16,r24
	ldi r22,0
	call _ZN8Enc28j6015_spi_selectBankEh
	ldi r22,lo8(15)
	movw r24,r16
	call _ZN8Enc28j6012_spi_readRegEh
	mov r28,r24
	ldi r29,0
	mov r29,r28
	clr r28
	ldi r22,lo8(14)
	movw r24,r16
	call _ZN8Enc28j6012_spi_readRegEh
	movw r18,r28
	or r18,r24
	movw r24,r18
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_ZN8Enc28j6021_spi_getNextPacketPtrEv, .-_ZN8Enc28j6021_spi_getNextPacketPtrEv
	.section	.text._ZN8Enc28j6012_spi_readPhyE16ENC28J60_PHY_REG,"axG",@progbits,_ZN8Enc28j6012_spi_readPhyE16ENC28J60_PHY_REG,comdat
	.weak	_ZN8Enc28j6012_spi_readPhyE16ENC28J60_PHY_REG
	.type	_ZN8Enc28j6012_spi_readPhyE16ENC28J60_PHY_REG, @function
_ZN8Enc28j6012_spi_readPhyE16ENC28J60_PHY_REG:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r24
	mov r17,r22
	ldi r22,lo8(2)
	call _ZN8Enc28j6015_spi_selectBankEh
	mov r20,r17
	ldi r22,lo8(20)
	movw r24,r28
	call _ZN8Enc28j6013_spi_writeRegEhh
	movw r16,r28
	subi r16,-19
	sbci r17,-1
	ldi r22,lo8(82)
	ldi r23,0
	movw r24,r16
	call _ZN8Enc28j6012_spi_writeOPE12ENC28J60_ISA.isra.1
	ldi r20,lo8(80)
1:	dec r20
	brne 1b
	ldi r22,lo8(3)
	movw r24,r28
	call _ZN8Enc28j6015_spi_selectBankEh
	ldi r22,lo8(10)
	movw r24,r28
	call _ZN8Enc28j6012_spi_readRegEh
	ldi r22,lo8(2)
	movw r24,r28
	call _ZN8Enc28j6015_spi_selectBankEh
	ldi r22,lo8(82)
	ldi r23,0
	movw r24,r16
	call _ZN8Enc28j6012_spi_writeOPE12ENC28J60_ISA.isra.1
	ldi r22,lo8(25)
	movw r24,r28
	call _ZN8Enc28j6012_spi_readRegEh
	mov r17,r24
	ldi r22,lo8(24)
	movw r24,r28
	call _ZN8Enc28j6012_spi_readRegEh
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
	pop r16
	ret
	.size	_ZN8Enc28j6012_spi_readPhyE16ENC28J60_PHY_REG, .-_ZN8Enc28j6012_spi_readPhyE16ENC28J60_PHY_REG
	.text
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
	movw r18,r24
	andi r18,10
	clr r19
	ldi r24,lo8(1)
	or r18,r19
	brne .L74
	ldi r24,0
.L74:
	ret
	.size	_ZN8Enc28j608isLinkUpEv, .-_ZN8Enc28j608isLinkUpEv
.global	_ZN8Enc28j6015getDuplexStatusEv
	.type	_ZN8Enc28j6015getDuplexStatusEv, @function
_ZN8Enc28j6015getDuplexStatusEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r22,lo8(17)
	ldi r23,0
	call _ZN8Enc28j6012_spi_readPhyE16ENC28J60_PHY_REG
	movw r18,r24
	andi r18,9
	clr r19
	ldi r24,lo8(1)
	or r18,r19
	brne .L76
	ldi r24,0
.L76:
	ret
	.size	_ZN8Enc28j6015getDuplexStatusEv, .-_ZN8Enc28j6015getDuplexStatusEv
.global	_ZN8Enc28j6017getPolarityStatusEv
	.type	_ZN8Enc28j6017getPolarityStatusEv, @function
_ZN8Enc28j6017getPolarityStatusEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r22,lo8(17)
	ldi r23,0
	call _ZN8Enc28j6012_spi_readPhyE16ENC28J60_PHY_REG
	movw r18,r24
	andi r18,5
	clr r19
	ldi r24,lo8(1)
	or r18,r19
	brne .L78
	ldi r24,0
.L78:
	ret
	.size	_ZN8Enc28j6017getPolarityStatusEv, .-_ZN8Enc28j6017getPolarityStatusEv
.global	_ZN8Enc28j6015isReceivingDataEv
	.type	_ZN8Enc28j6015isReceivingDataEv, @function
_ZN8Enc28j6015isReceivingDataEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r22,lo8(17)
	ldi r23,0
	call _ZN8Enc28j6012_spi_readPhyE16ENC28J60_PHY_REG
	movw r18,r24
	andi r18,12
	clr r19
	ldi r24,lo8(1)
	or r18,r19
	brne .L80
	ldi r24,0
.L80:
	ret
	.size	_ZN8Enc28j6015isReceivingDataEv, .-_ZN8Enc28j6015isReceivingDataEv
.global	_ZN8Enc28j6017isTrasmittingDataEv
	.type	_ZN8Enc28j6017isTrasmittingDataEv, @function
_ZN8Enc28j6017isTrasmittingDataEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r22,lo8(17)
	ldi r23,0
	call _ZN8Enc28j6012_spi_readPhyE16ENC28J60_PHY_REG
	movw r18,r24
	andi r18,13
	clr r19
	ldi r24,lo8(1)
	or r18,r19
	brne .L82
	ldi r24,0
.L82:
	ret
	.size	_ZN8Enc28j6017isTrasmittingDataEv, .-_ZN8Enc28j6017isTrasmittingDataEv
.global	_ZN8Enc28j6018getCollisionStatusEv
	.type	_ZN8Enc28j6018getCollisionStatusEv, @function
_ZN8Enc28j6018getCollisionStatusEv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r22,lo8(17)
	ldi r23,0
	call _ZN8Enc28j6012_spi_readPhyE16ENC28J60_PHY_REG
	movw r18,r24
	andi r18,11
	clr r19
	ldi r24,lo8(1)
	or r18,r19
	brne .L84
	ldi r24,0
.L84:
	ret
	.size	_ZN8Enc28j6018getCollisionStatusEv, .-_ZN8Enc28j6018getCollisionStatusEv
.global	_ZN8Enc28j607readPhyE16ENC28J60_PHY_REG
	.type	_ZN8Enc28j607readPhyE16ENC28J60_PHY_REG, @function
_ZN8Enc28j607readPhyE16ENC28J60_PHY_REG:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp _ZN8Enc28j6012_spi_readPhyE16ENC28J60_PHY_REG
	.size	_ZN8Enc28j607readPhyE16ENC28J60_PHY_REG, .-_ZN8Enc28j607readPhyE16ENC28J60_PHY_REG
.global	_ZN8Enc28j6011_spi_setMACEPh
	.type	_ZN8Enc28j6011_spi_setMACEPh, @function
_ZN8Enc28j6011_spi_setMACEPh:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r24
	movw r16,r22
	ldi r22,lo8(3)
	call _ZN8Enc28j6015_spi_selectBankEh
	movw r30,r16
	ld r20,Z
	ldi r22,lo8(1)
	movw r24,r28
	call _ZN8Enc28j6013_spi_writeRegEhh
	movw r30,r16
	ldd r20,Z+1
	ldi r22,0
	movw r24,r28
	call _ZN8Enc28j6013_spi_writeRegEhh
	movw r30,r16
	ldd r20,Z+2
	ldi r22,lo8(3)
	movw r24,r28
	call _ZN8Enc28j6013_spi_writeRegEhh
	movw r30,r16
	ldd r20,Z+3
	ldi r22,lo8(2)
	movw r24,r28
	call _ZN8Enc28j6013_spi_writeRegEhh
	movw r30,r16
	ldd r20,Z+4
	ldi r22,lo8(5)
	movw r24,r28
	call _ZN8Enc28j6013_spi_writeRegEhh
	movw r30,r16
	ldd r20,Z+5
	ldi r22,lo8(4)
	movw r24,r28
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	jmp _ZN8Enc28j6013_spi_writeRegEhh
	.size	_ZN8Enc28j6011_spi_setMACEPh, .-_ZN8Enc28j6011_spi_setMACEPh
.global	_ZN8Enc28j606setMACEPh
	.type	_ZN8Enc28j606setMACEPh, @function
_ZN8Enc28j606setMACEPh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp _ZN8Enc28j6011_spi_setMACEPh
	.size	_ZN8Enc28j606setMACEPh, .-_ZN8Enc28j606setMACEPh
.global	_ZN8Enc28j606setMACE9macaddr_t
	.type	_ZN8Enc28j606setMACE9macaddr_t, @function
_ZN8Enc28j606setMACE9macaddr_t:
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
	std Y+6,r23
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	call _ZN8Enc28j6011_spi_setMACEPh
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
	.size	_ZN8Enc28j606setMACE9macaddr_t, .-_ZN8Enc28j606setMACE9macaddr_t
.global	_ZN8Enc28j606setMACEPKc
	.type	_ZN8Enc28j606setMACEPKc, @function
_ZN8Enc28j606setMACEPKc:
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
	movw r24,r22
	call _Z15__inet_eth_atonPKc
	std Y+1,r18
	std Y+2,r19
	std Y+3,r20
	std Y+4,r21
	std Y+5,r22
	std Y+6,r23
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	movw r24,r16
	call _ZN8Enc28j6011_spi_setMACEPh
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
	.size	_ZN8Enc28j606setMACEPKc, .-_ZN8Enc28j606setMACEPKc
.global	_ZN8Enc28j606setMACERSt6vectorIhSaIhEE
	.type	_ZN8Enc28j606setMACERSt6vectorIhSaIhEE, @function
_ZN8Enc28j606setMACERSt6vectorIhSaIhEE:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r22
	ld r22,Z
	ldd r23,Z+1
	jmp _ZN8Enc28j6011_spi_setMACEPh
	.size	_ZN8Enc28j606setMACERSt6vectorIhSaIhEE, .-_ZN8Enc28j606setMACERSt6vectorIhSaIhEE
	.ident	"GCC: (GNU) 5.4.0"
