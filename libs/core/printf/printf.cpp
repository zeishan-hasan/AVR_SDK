#include "printf.h"

char *___ftoa(float n, char *__dst, int afterpoint){

    //const float pow10[] = { 1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000 };
    int iPart = toInt(n);
    int fPart = ((n - toInt(n)) * 10000);

    char * b = itoa(__dst, 32, ABS(fPart), 10);
    if(__dst+31 - b < afterpoint--){
        while (afterpoint--) {
            *(--b) = '0';
        }
    }
    *(--b) = '.';
    b = itoa(__dst, 31 - (__dst+30 - b  ), iPart , 10);

    return b;
}
