#define NVIC_ISER0      *((volatile unsigned int*) (0xE000E100 ))
#define RCC_AHB1EN      *((volatile unsigned int*) (0x40023800 + 0x30))
#define RCC_APB2ENR     *((volatile unsigned int*) (0x40023800 + 0x44))
#define SYSCFG_EXTICR0  *((volatile unsigned int*) (0x40013800 + 0x08))
#define EXTI_FTSR       *((volatile unsigned int*) (0x40013C00 + 0x0C))
#define EXTI_IMR        *((volatile unsigned int*) (0x40013C00))
#define EXTI_PR         *((volatile unsigned int*) (0x40013C00 + 0x14 ))
#define	EXTI_PR_PR0     (0x01UL)
	
void EXTI0_IRQHandler(void);

int main()

{
	/* 1. Enable clock for GPIO Port  */
	/* 2. Set mode for pin            */
	/* 3. Set speed for pin           */
	/* 4. Set Pullup/down             */        
	/* 5. Set pin as input pin        */
	RCC_AHB1EN |= 1;

	/* 6. Enable clock for SYSCFG     */
	RCC_APB2ENR |= (1<<14);
	
	/* 7. Set External interrupt line */
	SYSCFG_EXTICR0 &= ~(1U<<15);
	
	/* 8. Set trigger selection       */
	EXTI_FTSR |= (1 << 0);
	
	/* 9. Set interrupt mask          */
	EXTI_IMR |= (1 << 0);
	
	/* 10. Enable interrupt NVIC     */
	NVIC_ISER0 |= (1<<6);
	NVIC_ISER0 |= (1<<28);
	NVIC_ISER0 |= (1<<25);
	
	while(1)
	{
		/* Task polling */
	}
}


void EXTI0_IRQHandler(void)
{
	/* Check if the interrupt is from EXTI0 */
	if(EXTI_PR & EXTI_PR_PR0)
	{
		/* Handle the interrupt here */
		
		/* Clear the interrupt flag  */
		EXTI_PR = EXTI_PR_PR0;
	}	
}
