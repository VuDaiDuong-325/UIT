#include "stm32f4xx.h"
#define RCC_AHB1ENR_BASE_ADD 0x40023800
#define RCC_AHB1ENR 		(*(volatile unsigned int*)(RCC_AHB1ENR_BASE_ADD + 0x30))
#define GPIOG_BASE_ADD 0x40021800
#define GPIOG_MODER 		(*(volatile unsigned int*)(GPIOG_BASE_ADD + 0x00))
#define GPIOG_OTYPER 		(*(volatile unsigned int*)(GPIOG_BASE_ADD + 0x04))
#define GPIOG_OSPEEDR 	(*(volatile unsigned int*)(GPIOG_BASE_ADD + 0x08))
#define GPIOG_PUPDR 		(*(volatile unsigned int*)(GPIOG_BASE_ADD + 0x0C))
int main(void) 
{
	
	RCC_AHB1ENR |= (1<<6);
	
	GPIOG_MODER &= ~(3 << (13*2)); // Clear prev bits
	GPIOG_MODER |= (1 << (13*2));	//SET as output mode
	
	GPIOG_OTYPER &= ~(1<<13);
	
	GPIOG_OSPEEDR &= ~(3 << (13*2));
	
	GPIOG_PUPDR &= ~(3<<(13*2));
	while (1){
		GPIOG->ORD ^= (1<<13);
		for (volatile int i = 0; i < 1000000; i++);
	}
}

		