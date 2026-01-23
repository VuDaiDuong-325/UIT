#define RCC_CR      (*((unsigned int*) (0x40023800 + 0x00)))
#define RCC_PLLCFGR (*((unsigned int*) (0x40023800 + 0x04)))
#define RCC_CFGR    (*((unsigned int*) (0x40023800 + 0x08)))
int main()
{
	unsigned int tempPLLCFGR = 0;
	/* Enable HSE - High Speed External   */
	/* 1. HSE clock bypass  */
	RCC_CR &= ~(1U<<18);
	/* 2. HSE clock enable  */
	RCC_CR |= (1<<16); 
	/* 3. Wait for HSE to stabilize  */
	while( !( (RCC_CR >> 17) & 0x01 ) );

	/* PLL - Phase Locked Loop   */
	/* PLLCLK = 180MHz           */
	/* HSE oscillator clock selected as PLL */

	/* 1. Select Division factor M */
	tempPLLCFGR |= (1 << 1);
	/* 2. Select multiplication factor N */
	tempPLLCFGR |= (90 << 6);
	/* 3. Select division factor for main system clock */
	tempPLLCFGR &=~ (3U<< 16);
	/* 4. Select division factor for PLLQ_CLK */
	tempPLLCFGR |= (2 << 24);
	/* 5 Select clock source */
	tempPLLCFGR |= (1 << 22);

	RCC_PLLCFGR = tempPLLCFGR;

	/* 6. Main PLL (PLL) enable */
	RCC_CR |= (1 << 24);
	/* 7.Wait for PLL to enable */
	while (! (( RCC_CR >> 25 ) & 0x01 ));

	/* Assignment 1 */
	/* 1. Select AHB prescaler */
	RCC_CFGR &= ~(15u<<4);
	/* 2. Select APB Low speed prescaler  */
	RCC_CFGR |= (6<<10);
	/* 3. Select APB high-speed prescaler  */
	RCC_CFGR |= (5<<13);
	/* 4. Select the System clock switch  */
	RCC_CFGR |= (2<<0);
	/* 5. Wait for System clock switch  */
	while(! ((RCC_CFGR >> 3) & 1) )

	while(1)
	{




	}

}
