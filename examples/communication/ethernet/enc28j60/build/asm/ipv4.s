	.file	"ipv4.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
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
/* epilogue start */
	pop r29
	pop r28
	jmp _ZN8EthernetC1Ev
	.size	_ZN4IPv4C2Ev, .-_ZN4IPv4C2Ev
.global	_ZN4IPv4C1Ev
	.set	_ZN4IPv4C1Ev,_ZN4IPv4C2Ev
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
	movw r30,r24
	subi r30,-79
	sbci r31,-1
	ld r24,Z
	ldd r25,Z+1
	call _ZdlPv
	ldd r24,Y+32
	ldd r25,Y+33
/* epilogue start */
	pop r29
	pop r28
	jmp _ZdlPv
	.size	_ZN4IPv4D2Ev, .-_ZN4IPv4D2Ev
.global	_ZN4IPv4D1Ev
	.set	_ZN4IPv4D1Ev,_ZN4IPv4D2Ev
.global	_ZN4IPv411encapsulateERSt6vectorIhSaIhEE
	.type	_ZN4IPv411encapsulateERSt6vectorIhSaIhEE, @function
_ZN4IPv411encapsulateERSt6vectorIhSaIhEE:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_ZN4IPv411encapsulateERSt6vectorIhSaIhEE, .-_ZN4IPv411encapsulateERSt6vectorIhSaIhEE
.global	_ZN4IPv411decapsulateERSt6vectorIhSaIhEE
	.type	_ZN4IPv411decapsulateERSt6vectorIhSaIhEE, @function
_ZN4IPv411decapsulateERSt6vectorIhSaIhEE:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	_ZN4IPv411decapsulateERSt6vectorIhSaIhEE, .-_ZN4IPv411decapsulateERSt6vectorIhSaIhEE
.global	_ZN4IPv413setSrcAddressER10ipv4addr_t
	.type	_ZN4IPv413setSrcAddressER10ipv4addr_t, @function
_ZN4IPv413setSrcAddressER10ipv4addr_t:
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
	std Z+20,r20
	std Z+21,r21
	std Z+22,r22
	std Z+23,r23
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
	.ident	"GCC: (GNU) 5.4.0"
