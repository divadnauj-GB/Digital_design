
#define GPIO_BASE 0x40000000
#define GPIO_OUT ((volatile unsigned int *)GPIO_BASE)
#define GPIO_IN ((volatile unsigned int *)(GPIO_BASE+4))

unsigned int led;

void delay(unsigned int delay)
{
    unsigned int i;
    for(i=0;i<delay;i++){
        __asm__("nop");
    }
}

int main(void){
    led = 0xfffffffe;

    while (1) {
        *GPIO_OUT = led;        
        led^=1;
        if((*GPIO_IN)&0x1==0x1){
            delay(500000);
        } else {
            delay(1000000);
        }
        
    }  
}