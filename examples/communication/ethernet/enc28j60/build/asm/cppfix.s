	.file	"cppfix.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	__cxa_guard_acquire
	.type	__cxa_guard_acquire, @function
__cxa_guard_acquire:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	ldi r24,lo8(1)
	ldi r25,0
	ld r18,Z
	tst r18
	breq .L2
	ldi r24,0
	ldi r25,0
.L2:
	ret
	.size	__cxa_guard_acquire, .-__cxa_guard_acquire
.global	__cxa_guard_release
	.type	__cxa_guard_release, @function
__cxa_guard_release:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r18,lo8(1)
	movw r30,r24
	st Z,r18
	ret
	.size	__cxa_guard_release, .-__cxa_guard_release
.global	__cxa_guard_abort
	.type	__cxa_guard_abort, @function
__cxa_guard_abort:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	__cxa_guard_abort, .-__cxa_guard_abort
.global	__cxa_pure_virtual
	.type	__cxa_pure_virtual, @function
__cxa_pure_virtual:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.size	__cxa_pure_virtual, .-__cxa_pure_virtual
.global	_Znwj
	.type	_Znwj, @function
_Znwj:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp malloc
	.size	_Znwj, .-_Znwj
.global	_ZdlPv
	.type	_ZdlPv, @function
_ZdlPv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp free
	.size	_ZdlPv, .-_ZdlPv
.global	_Znaj
	.type	_Znaj, @function
_Znaj:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbiw r24,0
	brne .L13
	ldi r24,lo8(1)
	ldi r25,0
.L13:
	jmp malloc
	.size	_Znaj, .-_Znaj
.global	_ZdaPv
	.type	_ZdaPv, @function
_ZdaPv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp free
	.size	_ZdaPv, .-_ZdaPv
	.ident	"GCC: (GNU) 5.4.0"
