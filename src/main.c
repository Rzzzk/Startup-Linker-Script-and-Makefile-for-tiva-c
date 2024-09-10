
#include "../inc/std_types.h"

#define SYSCTRL_RCG2_R           *((volatile u32*)0x400FE108)
#define GPIO_PORTF_DIR_R         *((volatile u32*)0x40025400)
#define GPIO_PORTF_DEN_R         *((volatile u32*)0x4002551C)
#define GPIO_PORTF_DATA_R        *((volatile u32*)0x400253FC)


void delay(u32 delay_count)
{
    volatile u32 i;
    for(i=0; i<delay_count; i++)
    {
        i = i;
    }
}


int main(void)
{
    SYSCTRL_RCG2_R = 0x20;
    delay(200);

    GPIO_PORTF_DIR_R|=(1<<3);
    GPIO_PORTF_DEN_R|=(1<<3);

    while (1)
    {
       GPIO_PORTF_DATA_R|=(1<<3);
       delay(20000);
       GPIO_PORTF_DATA_R&=~(1<<3);
       delay(20000);
    }
    
}