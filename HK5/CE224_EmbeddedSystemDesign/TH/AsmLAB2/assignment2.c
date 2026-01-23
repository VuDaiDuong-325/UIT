#define RCC_BASE 0x40023800UL
#define RCC_CR   (*((volatile unsigned int*) (RCC_BASE + 0x00)))
#define RCC_CFGR (*((volatile unsigned int*) (RCC_BASE + 0x08)))

void SystemClock_Config(void)
{
    // 1. Bat HSE
	  RCC_CR &= ~(1U<<18); //Tat bypass
    RCC_CR |= (1U << 16);             // HSEON = 1
    while (!(RCC_CR & (1U << 17)));   // HSE clock is ready?

    // 2.AHB prescaler = 1 =>AHB = 8 MHz
    RCC_CFGR &= ~(0xFU << 4);         // HPRE = 0000
	
    // 3.APB1 prescaler = 4 =>AHB = 2 MHz
    RCC_CFGR &= ~(0x7U << 10);        // Xóa bit cu
    RCC_CFGR |= (0x5U << 10);         // PPRE1 = 0b101 

    // 4.APB2 prescaler = 2 =>AHB = 4 MHz
    RCC_CFGR &= ~(0x7U << 13);        // Xóa bit cu
    RCC_CFGR |= (0x4U << 13);         // PPRE2 = 0b100  
	// 5. Clock switch
    RCC_CFGR &= ~(0x3U << 0);         // Xóa SW[1:0]
    RCC_CFGR |= (0x1U << 0);          // SW = 01  HSE làm SYSCLK
    while (((RCC_CFGR >> 2) & 0x3U) != 0x1U); //  Kiem tra status cua clock switch . SWS = 01 ?(YES/NO) -> HSE là SYSCLK
}

int main(void)
{
    SystemClock_Config();

    while (1)
    {
        
    }
}
