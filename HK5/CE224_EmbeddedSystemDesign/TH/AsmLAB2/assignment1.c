#define RCC_BASE 0x40023800UL
#define RCC_CR *((volatile unsigned int*) (RCC_BASE + 0x00))
#define RCC_PLLCFGR *((volatile unsigned int*)(RCC_BASE + 0x04))
#define RCC_CFGR *((volatile unsigned int*)(RCC_BASE + 0x08))

void SystemClock_Config(void)
{
RCC_CR &= ~(1U<<18); // Khong dung clock ngoai
RCC_CR |= (1<<16); // Enable HSE  ,SYSCLK = (HSE / PLLM) * PLLN / PLLP
while( !( (RCC_CR >> 17) & 0x01 ) ); //HSE clock is ready?

	//PLLCLK: M, N, P
RCC_PLLCFGR |= (1 << 1);        // PLLM = 2 
RCC_PLLCFGR |= (90 << 6);       // PLLN = 90
RCC_PLLCFGR &=~ (3U<< 16);      // PLLP = 2 => (8 / 2) * (90 / 2) = 180 => PLLCLK = 180MHz
RCC_PLLCFGR |= (1 << 22);       // HSE oscillator clock selected as PLL and PLLI2S clock entry

RCC_CR |= (1<<24); // Enable PLL
while (! (( RCC_CR >> 25 ) & 0x01 )); // Wait PLL enable


RCC_CFGR &= ~(15u<<4);              // HPRE = 0000 ,AHB prescaler = 1
RCC_CFGR |= (6<<10);          // APB1 prescaler = 8 => 180 /8 = 22.5
RCC_CFGR |= (5<<13);          // APB2 prescaler = 4	=> 180 / 4 = 45

RCC_CFGR |= (2<<0);						// PLL selected as system clock
// Wait for System clock switch 
while(! ((RCC_CFGR >> 3) & 0x01) );
}

int main(void)
{
SystemClock_Config();

while(1)
{
    
}


}