#ifndef PRINTF_H
#define PRINTF_H
#include <macros.h>
#include <avr/io.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include <stdarg.h>


inline char* itoa(char *__dst, u8t size, int val, u8t  base){
    u8t i = size-2;
    //__dst[size-1] = 0;
    bool neg = false;
    if(val < 0){
        val = ABS(val);
        neg = true;
    }

    do{
        __dst[i] = "0123456789abcdef"[val % base];
        --i;
    }while (val /= base);


    if(neg){
        __dst[i] = '-';
        return &__dst[i];
    }

    return &__dst[i+1];
}

char* ___ftoa(float n, char *__dst, int afterpoint);



inline u8t __getc(volatile u8t* UCSRxA){
    loop_until_bit_is_set(*UCSRxA, RXC0);
    return _UDRx(UCSRxA);
}




inline void __putc(u8t c, volatile u8t* UCSRxA){
    loop_until_bit_is_set(*UCSRxA, UDRE0);
    _UDRx(UCSRxA) = c;
}
inline void __puts(const char *str, volatile u8t* UCSRxA){
    while (*str) {
        __putc(*str++, UCSRxA);
    }
}





inline int __vfprintf(volatile u8t* __stdout, const char *fmt, va_list arg)
{
    size_t length = 0;
    char ch, char_temp;
    char* string_temp;
    char buffer[32] = {0};
    //buffer[31] = 0;
    //u8t i;
    //int int_temp;
				while ( (ch = *fmt++) ) {
        if ( '%' == ch ) {
            switch (ch = *fmt++) {
            /* %c: print out a character    */
            case 'c':
                char_temp = va_arg(arg, int);
                __putc(char_temp, __stdout);
                length++;
                break;

                /* %s: print out a string       */
            case 's':
                string_temp = va_arg(arg, char*);
                __puts(string_temp, __stdout);
                length += strlen(string_temp);
                break;

                /* %d: print out an int         */
            case 'd':
                string_temp = itoa(buffer, SIZE_OF_ARRAY(buffer), va_arg(arg, int), 10);
                __puts(string_temp, __stdout);
                length += strlen(buffer);
                break;
                /* %d: print out an int         */
            case 'u':
                string_temp = itoa(buffer, SIZE_OF_ARRAY(buffer), ABS(va_arg(arg, int)), 10);
                __puts(string_temp, __stdout);
                length += strlen(buffer);
                break;

                /* %x: print out an int in hex  */
            case 'x':
                string_temp = itoa(buffer, SIZE_OF_ARRAY(buffer), va_arg(arg, int), 16);
                __puts(string_temp, __stdout);
                length += strlen(buffer);
                break;
                /* %x: print out an int in hex  */
            case 'X':
                string_temp = itoa(buffer, SIZE_OF_ARRAY(buffer), va_arg(arg, int), 16);
                __puts(string_temp, __stdout);
                length += strlen(buffer);
                break;

            case 'p':
                string_temp = itoa(buffer, SIZE_OF_ARRAY(buffer), (uintptr_t)va_arg(arg, void*), 16);
                __puts(string_temp, __stdout);
                length += strlen(buffer);
                break;
            //case 'f':
            //    string_temp = ___ftoa(va_arg(arg, double), buffer, 4);
            //    __puts(string_temp, __stdout);
            //    length += strlen(buffer);
            //    break;
            }
        }
        else {
            __putc(ch, __stdout);
            length++;
        }
    }
    return length;
}





#endif // PRINTF_H
