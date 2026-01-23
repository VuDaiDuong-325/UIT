// --- Peripheral Base Addresses ---
#define RCC_BASE 0x40023800UL
#define PWR_BASE 0x40007000UL
#define FLASH_BASE 0x40023C00

#define NVIC_BASE 0xE000E100UL
#define SYSCFG_BASE 0x40013800UL
#define EXTI_BASE 0x40013C00UL

#define GPIOA_BASE 0x40020000UL
#define GPIOB_BASE 0x40020400UL
#define GPIOC_BASE 0x40020800UL
#define GPIOF_BASE 0x40021400UL
#define GPIOG_BASE 0x40021800UL

#define TIM2_BASE 0x40000000UL
#define USART1_BASE 0x40011000UL
#define USART2_BASE 0x40004400UL
#define SPI5_BASE 0x40015000UL

// --- Register Definitions ---
// RCC
#define RCC_CR *((volatile unsigned int*) (RCC_BASE + 0x00))
#define RCC_PLLCFGR *((volatile unsigned int*) (RCC_BASE + 0x04))
#define RCC_CFGR *((volatile unsigned int*) (RCC_BASE + 0x08))
#define RCC_AHB1ENR *((volatile unsigned int*) (RCC_BASE + 0x30)) // GPIOs are on AHB1
#define RCC_APB1ENR *((volatile unsigned int*) (RCC_BASE + 0x40)) // TIM2 is on APB1
#define RCC_APB2ENR *((volatile unsigned int*) (RCC_BASE + 0x44)) // USART1/SPI5 are on APB
	
// PWR
#define PWR_CR *((volatile unsigned int*) (PWR_BASE + 0x00))
#define PWR_CSR *((volatile unsigned int*) (PWR_BASE + 0x04))
	
// FLASH
#define FLASH_ACR *((volatile unsigned int*) (FLASH_BASE + 0x00))

// NVIC
#define NVIC_ISER0 *((volatile unsigned int*) (NVIC_BASE + 0x00))
#define NVIC_ISER1 *((volatile unsigned int*) (NVIC_BASE + 0x04))
	
typedef struct {
	volatile unsigned int MEMRMP;
	volatile unsigned int PMC;
	volatile unsigned int EXTICR1;
	volatile unsigned int EXTICR2;
	volatile unsigned int EXTICR3;
	volatile unsigned int EXTICR4;
	volatile unsigned int CMPCR;
} SYSCFGx;
#define SYSCFG1 ((SYSCFGx*) SYSCFG_BASE)

typedef struct {
	volatile unsigned int IMR;
	volatile unsigned int EMR;
	volatile unsigned int RTSR;
	volatile unsigned int FTSR;
	volatile unsigned int SWIER;
	volatile unsigned int PR;
} EXTIx;
#define EXTI1 ((EXTIx*) EXTI_BASE)

typedef struct {
	volatile unsigned int MODER;
	volatile unsigned int OTYPER;
	volatile unsigned int OSPEEDR;
	volatile unsigned int PUPDR;
	volatile unsigned int IDR;
	volatile unsigned int ODR;
	volatile unsigned int BSRR;
	volatile unsigned int LCKR;
	volatile unsigned int AFRL;
	volatile unsigned int AFRH;
} GPIOx;
#define GPIOA ((GPIOx*) GPIOA_BASE)
#define GPIOB ((GPIOx*) GPIOB_BASE)
#define GPIOC ((GPIOx*) GPIOC_BASE)
#define GPIOF ((GPIOx*) GPIOF_BASE)
#define GPIOG ((GPIOx*) GPIOG_BASE)

typedef struct {
	volatile unsigned int CR1;
	volatile unsigned int CR2;
	volatile unsigned int SMCR;
	volatile unsigned int DIER;
	volatile unsigned int SR;
	volatile unsigned int EGR;
	volatile unsigned int CCMR1;
	volatile unsigned int CCMR2;
	volatile unsigned int CCER;
	volatile unsigned int CNT;
	volatile unsigned int PSC;
	volatile unsigned int ARR;
	volatile unsigned int Reserved1;
	volatile unsigned int CCR1;
	volatile unsigned int CCR2;
	volatile unsigned int CCR3;
	volatile unsigned int CCR4;
	volatile unsigned int Reserved2;
	volatile unsigned int DCR;
	volatile unsigned int DMAR;
	volatile unsigned int TIM2_5_OR;
} TIMx;

#define TIM2 ((TIMx*) TIM2_BASE)

typedef struct {
	volatile unsigned int SR;
	volatile unsigned int DR;
	volatile unsigned int BRR;
	volatile unsigned int CR1;
	volatile unsigned int CR2;
	volatile unsigned int CR3;
	volatile unsigned int GTPR;
} USARTx;

#define USART1 ((USARTx*) USART1_BASE)
#define USART2 ((USARTx*) USART2_BASE)

typedef struct {
	volatile unsigned int CR1; // Control Register 1
	volatile unsigned int CR2; // Control Register 2
	volatile unsigned int SR;  // Status Register
	volatile unsigned int DR;  // Data Register
	volatile unsigned int CRCPR;
	volatile unsigned int RXCRCR;
	volatile unsigned int TXCRCR;
	volatile unsigned int I2SCFGR;
	volatile unsigned int I2SPR;
} SPIx;

#define SPI5 ((SPIx*) SPI5_BASE)

void SystemClock_Config_HSE(void)
{
    // 1. Enable HSE
    RCC_CR |= (1 << 16); // HSEON
    while (!(RCC_CR & (1 << 17))); // Wait for HSERDY

    // 2. Configure Flash (CRITICAL)
    // At 8MHz HCLK, 0 Wait States (WS) are needed.
    // This is the default reset value, but we set it explicitly.
    FLASH_ACR &= ~(0xF << 0); // Clear LATENCY bits
    FLASH_ACR |= (0 << 0);   // Set 0 Wait States

    // 3. Configure Clock Prescalers (in RCC_CFGR)
    
    // AHB_CLK = 8MHz (HPRE = /1 = 0b0xxx)
    RCC_CFGR &= ~(0xF << 4);
    
    // APB2_CLK = 4MHz (PPRE2 = /2 = 0b100)
    RCC_CFGR &= ~(0x7 << 13);
    RCC_CFGR |= (0b100 << 13);
    
    // APB1_CLK = 2MHz (PPRE1 = /4 = 0b101)
    RCC_CFGR &= ~(0x7 << 10);
    RCC_CFGR |= (0b101 << 10);
		
    // 4. Select HSE as System Clock Source
    RCC_CFGR &= ~(3 << 0); // Clear SW bits
    RCC_CFGR |= (1 << 0);  // Set SW to 0b01 (HSE)
    
    // Wait for SWS to match, indicating HSE is now SYSCLK
    while ((RCC_CFGR & (3 << 2)) != (1 << 2));
}

void PB1_EXTI(void)
{
	RCC_AHB1ENR |= (1 << 1);	// GPIOB EN
	RCC_APB2ENR |= (1 << 14);	// SYSCFG EN
	
	GPIOB->MODER &= ~(3 << (1 * 2));		// Analog mode
	GPIOB->PUPDR &= ~(3 << (1 * 2));		
	GPIOB->PUPDR |= (2 << (1 * 2));			// Pull Down
	
	SYSCFG1->EXTICR1 &= ~(0xF << 4); 	
  SYSCFG1->EXTICR1 |= (0b0001 << 4); // 0b0001 = Port B
	
  EXTI1->IMR |= (1 << 1); 	// not masked
  EXTI1->FTSR |= (1 << 1);	// Falling enable
  EXTI1->RTSR &= ~(1 << 1);	// Rising disable

  NVIC_ISER0 |= (1 << 7);		// EXTI1 enable
}
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
void EXTI1_IRQHandler(void)
{
  if (EXTI1->PR & (1 << 1)) {		// flag on (occur)
    EXTI1->PR = (1 << 1);				// clear flag (This bit is cleared by programming it to ‘1’)
  }
}

