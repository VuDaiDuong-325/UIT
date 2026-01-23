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

// Time = ((PSC + 1) x (ARR + 1)) / Clock_freq (16MHz)

//Asm2
void LED_PG13_Init(void)
{
    // 1. Enable GPIOG clock
    RCC_AHB1ENR |= (1 << 6);
    
    // 2. Set PA13 to General Purpose Output mode (0b01)
    GPIOG->MODER &= ~(3 << 26); // Clear bits 27:26
    GPIOG->MODER |= (1 << 26);  // Set to 0b01
    
    // 3. Set to Push-Pull output (default, 0)
    GPIOG->OTYPER &= ~(1 << 13);
}

volatile unsigned int g_msec_count_tim2 = 0;

void TIM2_Init_1ms(void)
{
    // 1. Enable TIM2 clock (on APB1)
    RCC_APB1ENR |= (1 << 0); 

    // 2. Set Prescaler and Auto-Reload Register cho 16MHz
    // 100kHz = 10us
    // 16,000,000 / 16000 = 1000 Hz
    TIM2->PSC = 15; 
    TIM2->ARR = 999;  

		TIM2->CR1 &= ~(1 << 4);
		TIM2->CNT = 0;
    // 3. Enable the Update Interrupt (UIE)
    TIM2->DIER |= (1 << 0);
   
    // 5. Clear the update interrupt flag
    TIM2->SR &= ~(1 << 0);
    
    // 6. Enable the TIM2 IRQ in the NVIC
    NVIC_ISER0 |= (1 << 28); 
    
    // 7. Start the timer
    TIM2->CR1 |= (1 << 0); 
}

void delay(unsigned int ms)
{
    if (ms == 0) return;
    
    // Read the start time from our global counter
    unsigned int start_time = g_msec_count_tim2;
    
    // Wait until the elapsed time (current_time - start_time)
    // reaches the desired delay
    while ((g_msec_count_tim2 - start_time) < ms);
}

int main(){
	LED_PG13_Init();
	//Asm3
	TIM2_Init_1ms();
	
	while(1){
		
		// Asm3
		GPIOG->ODR ^= (1 << 13);
		delay(500);
		//
	}
	return 0;
}

void TIM2_IRQHandler(void)
{
	if (TIM2->SR & (1 << 0)){	// Check flag
		TIM2->SR &= ~(1 << 0);
		g_msec_count_tim2++;
	}
}