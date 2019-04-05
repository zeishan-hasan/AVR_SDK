#include "avr_sdk.h"



int main(){
Pin hSync(3,OUTPUT);
Pin vSync(9,OUTPUT);
Pin red(6,OUTPUT);

hSync.setPWM(5000,50);
vSync.setPWM(1000,50);
red.setPWM(15000,50);

while(1){

}

return 0;
}
