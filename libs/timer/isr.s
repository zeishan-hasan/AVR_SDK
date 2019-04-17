/* Ralph Doncaster 2014 public domain software
 * 1s timer ISR
 */

;needed for <avr/io.h> to give io constant addresses
#define __SFR_OFFSET 0
#include <avr/io.h>


;; 1 byte variable in RAM
.lcomm ovfl_count, 2
.global ovfl_count
;
;; 4 byte (long) global variable in RAM
;; __system_time to match definition avr/time.h
;.lcomm __system_time, 4
;.global __system_time



.section .text
#define tmp8 r24
;.dseg
;var1:  .BYTE 2 ; reserve 1 byte to var1
.global __vector_21
__vector_21:
    cli
    ldi r30,lo8(ovfl_count) ; Load Z register low
    ldi r31,hi8(ovfl_count) ; Load Z register high
    ld XL,Z+
    ld XH,Z
    adiw X,1
    st -Z,XH
    st Z,XL
    sei
reti

.global __vector_default                ; Note [10]
__vector_default:
    ldi r16,99
    sts 0XCE,r16
reti





