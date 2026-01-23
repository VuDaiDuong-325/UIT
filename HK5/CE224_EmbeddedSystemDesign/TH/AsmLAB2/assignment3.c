#define RCC_baseadr (0x40023800)
#define GPIOA_baseadr (0x40020000)
#define GPIOG_baseadr (0x40021800)
#define SYSCFG_baseadr (0x40013800)
#define EXTI_baseadr (0x40013C00)
#define NVIC_baseadr (0xE000E100)

typedef struct {
	volatile unsigned int CR;
	volatile unsigned int PLLCFGR;
	volatile unsigned int CFGR;
	volatile unsigned int CIR;
	volatile unsigned int AHB1RSTR;
	volatile unsigned int AHB2RSTR;
	volatile unsigned int AHB3RSTR;
	volatile unsigned int RESERVED;
	volatile unsigned int APB1RSTR;
	volatile unsigned int APB2RSTR;
	volatile unsigned int RESERVED1;
	volatile unsigned int RESERVED2;
	volatile unsigned int AHB1ENR;
	volatile unsigned int AHB2ENR;
	volatile unsigned int AHB3ENR;
	volatile unsigned int RESERVED3;
	volatile unsigned int APB1ENR;
	volatile unsigned int APB2ENR;
	volatile unsigned int RESERVED4;
	volatile unsigned int RESERVED5;
	volatile unsigned int AHB1LPENR;
	volatile unsigned int AHB2LPENR;
	volatile unsigned int AHB3LPENR;
	volatile unsigned int RESERVED6;
	volatile unsigned int APB1LPENR;
	volatile unsigned int APB2LPENR;
	volatile unsigned int RESERVED7;
	volatile unsigned int RESERVED8;
	volatile unsigned int BDCR;
	volatile unsigned int CSR;
	volatile unsigned int RESERVED9;
	volatile unsigned int RESERVED10;
	volatile unsigned int SSCGR;
	volatile unsigned int PLLI2SCFGR;
	volatile unsigned int PLLSAICFGR;
	volatile unsigned int DCKCFGR;
}RCC_map;
#define RCC ((RCC_map*) RCC_baseadr)

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
}GPIOx;
#define GPIOA ((GPIOx*) GPIOA_baseadr)
#define GPIOG ((GPIOx*) GPIOG_baseadr)

typedef struct {
	volatile unsigned int MEMRMP;
	volatile unsigned int PMC;
	volatile unsigned int EXTICR1;
	volatile unsigned int EXTICR2;
	volatile unsigned int EXTICR3;
	volatile unsigned int EXTICR4;
	volatile unsigned int CMPCR;
}SYSCFGmap;
#define SYSCFG ((SYSCFGmap*) SYSCFG_baseadr)

typedef struct {
	volatile unsigned int IMR;
	volatile unsigned int EMR;
	volatile unsigned int RTSR;
	volatile unsigned int FTSR;
	volatile unsigned int SWIER;
	volatile unsigned int PR;
}EXTImap;
#define EXTI ((EXTImap*) EXTI_baseadr)

#define NVIC_ISER0 (*(volatile unsigned int*) NVIC_baseadr)

void EXTI0_IRQHandler(){
	if(EXTI->PR & (1UL << 0)){
		EXTI->PR |= (1UL << 0);
		GPIOG->ODR ^= ((1UL << 13) | (1UL << 14));
	}
}

int main(){
	RCC->AHB1ENR |= ((1UL << 0) | (1UL << 6));
	
	GPIOA->MODER &= ~(3UL << 0); 
	GPIOG->MODER &= ~((3UL << 13*2) | (3UL << 14*2));
	GPIOG->MODER |= ((1UL << 13*2) | (1UL << 14*2)); 
	
	GPIOG->OSPEEDR &= ~((3UL << 13*2) | (3UL << 14*2));
	GPIOG->OSPEEDR |= ((3UL << 13*2) | (3UL << 14*2));
	
	GPIOA->PUPDR &= ~(3UL << 0);
	GPIOA->PUPDR |= (2UL << 0);
	
	GPIOG->OTYPER &= ~((1UL << 13) | (1UL << 14));
	
	RCC->APB2ENR |= (1UL << 14);
	
	SYSCFG->EXTICR1 &= ~(15UL << 0);
	
	EXTI->RTSR |= (1UL << 0);
	
	EXTI->IMR |= (1UL << 0);
	
	NVIC_ISER0 |= (1UL << 6);
	
	GPIOG->ODR |= (1UL << 13);
	GPIOG->ODR &= ~(1UL << 14);
	
	while(1){}
	
	return 0;
}
