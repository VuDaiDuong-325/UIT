#include "BaseAddr.h"

// --- Structure Definitions ---

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
} USART_Type;

#define USART1 ((USART_Type*) USART1_BASE)

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