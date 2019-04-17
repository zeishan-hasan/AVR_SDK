/* Ralph Doncaster 2014 public domain software
 * 1s timer ISR
 */

;needed for <avr/io.h> to give io constant addresses
#define __SFR_OFFSET 0
#include <avr/io.h>

; 1 byte variable in RAM
.lcomm ovfl_count, 1
.global ovfl_count

; 4 byte (long) global variable in RAM
; __system_time to match definition avr/time.h
.lcomm __system_time, 4
.global __system_time

.section .text
#define tmp8 r24 

.global TIMER0_COMPA_vect
TIMER0_COMPA_vect:
    push r24
    in r24, 0x3F
    push r24                        ; save SREG
    push ZH
    push ZL
    ldi r16,0xFF
    in r17,PORTB
    eor r16,r17
    out PORTB,r16
    ldi ZL, lo8(ovfl_count)
    ldi ZH, hi8(ovfl_count)
    ld r24, Z                       ; load seconds fraction
    cpi r24, 0                      ; skip counts 1-6
    brne adder
    ldi r24, 6                      ; reset fractions counter
adder:
    sbci r24, -1                    ; subtract -1 = add 1
    st Z+, r24
    ld r24, Z
    brcc adder
    pop ZL
    pop ZH
    pop r24
    out 0x3F, r24
    pop r24
reti



.global __vector_default                ; Note [10]
__vector_default:
reti
