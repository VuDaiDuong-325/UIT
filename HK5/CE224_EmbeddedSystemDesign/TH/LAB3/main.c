#include "SPIAsm.h"

int main(void)
{
	SystemClock_Config_HSE();
	RCC_AHB1ENR |= (1 << 6);
	GPIOG->MODER |= (1 << (13 * 2));
	
	PB1_EXTI();
	while(1)
	{
		
	}

	return 0;
}


