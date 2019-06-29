	.file	"networkmanager.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	_ZN14NetworkManagerC2Ev
	.type	_ZN14NetworkManagerC2Ev, @function
_ZN14NetworkManagerC2Ev:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp _ZN4IPv4C1Ev
	.size	_ZN14NetworkManagerC2Ev, .-_ZN14NetworkManagerC2Ev
.global	_ZN14NetworkManagerC1Ev
	.set	_ZN14NetworkManagerC1Ev,_ZN14NetworkManagerC2Ev
.global	_ZN14NetworkManager12setupNetworkE9INTERFACEPKcS2_
	.type	_ZN14NetworkManager12setupNetworkE9INTERFACEPKcS2_, @function
_ZN14NetworkManager12setupNetworkE9INTERFACEPKcS2_:
	push r16
	push r17
	push r28
	push r29
	rcall .
	push __zero_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 4 */
/* stack size = 8 */
.L__stack_usage = 8
	movw r16,r24
	movw r24,r20
	call _Z16__inet_ipv4_atonPKc
	std Y+1,r22
	std Y+2,r23
	std Y+3,r24
	std Y+4,r25
	movw r22,r28
	subi r22,-1
	sbci r23,-1
	movw r24,r16
	call _ZN4IPv413setSrcAddressER10ipv4addr_t
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	pop r17
	pop r16
	ret
	.size	_ZN14NetworkManager12setupNetworkE9INTERFACEPKcS2_, .-_ZN14NetworkManager12setupNetworkE9INTERFACEPKcS2_
	.ident	"GCC: (GNU) 5.4.0"
