/* Ralph Doncaster 2014 public domain software
 * 1s timer ISR
 */

;needed for <avr/io.h> to give io constant addresses
#define __SFR_OFFSET 0
#include <avr/io.h>
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
__TCNT0__ = 0x26
XL = r26
XH = r27
YL = r28
YH = r29
ZL = r30
ZH = r31






.global	_Z6microsv
.type	_Z6microsv, @function
_Z6microsv:
        cli                 ; 1 cycle
        lds r24,ovfl_count  ; 2 cycles
        mov r25,r24         ; 1 cycle
        sei                 ; 1 cycle
        in r21, __TCNT0__   ; 1 cycle
                            ;
        swap r21            ; 1 cycle
        cbr r21,0xF0        ; 1 cycle
                            ;
        cbr r25,0x0F        ; 1 cycle
        swap r25            ; 1 cycle
        cbr r24,0xF0        ; 1 cycle
        swap r24            ; 1 cycle
        add r24,r21         ; 1 cycle
        ret                 ; 5 cycles
                            ; 18 cycles -> 18*0.0625 = 1.125 uS

.global __vector_21
.type	__vector_21, @function
 __vector_21:
         push r24               ; 2 cycles
         lds r24,ovfl_count     ; 2 cycles    
         inc r24                ; 2 cycles
         sts ovfl_count,r24     ; 2 cycles
         pop r24                ; 2 cycles
         reti                   ; 5 cycles
                                ; 15 cycles -> 15*0.0625 = 0.9375 uS
.size	__vector_21, .-__vector_21

.global __vector_default
__vector_default:
    nop
reti

