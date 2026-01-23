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