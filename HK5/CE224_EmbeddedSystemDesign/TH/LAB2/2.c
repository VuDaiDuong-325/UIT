#include "stm32f4xx.h"

int main(void)
{
	SystemCoreClockUpdate();
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIOGEN;
	RCC->APB1ENR |= RCC_APB1ENR_TIM2EN;
	
	GPIOG->MODER &= ~(3UL << (13*2)); // Clear mode bits
	GPIOG->MODER |= (1UL << (13*2));	//SET as output mode
	
	TIM2->PSC = 15999;
	TIM2->ARR = 499;
	TIM2->CNT = 0;
	TIM2->CR1 |= TIM_CR1_CEN;
	
	while(1)
	{
		if (TIM2->SR & TIM_SR_UIF)
		{
			TIM2->SR &= ~TIM_SR_UIF;
			GPIOG->ODR ^= (1<<13);
		}
	}
}
