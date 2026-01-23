#define RCC_baseadr (0x40023800)
#define GPIOB_baseadr (0x40020400)
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
#define GPIOB ((GPIOx*) GPIOB_baseadr)

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
	
void EXTI1_IRQHandler(){
	if(EXTI->PR & (1UL << 1)){
		EXTI->PR |= (1UL << 1);
	}
}

int main(){
	

	RCC->AHB1ENR |= (1UL << 1);
	
	//Set mode for PB1
	GPIOB->MODER &= ~(3UL << 2); //INPUT MODE
	
	//Set pull down for PB1
	GPIOB->PUPDR &= ~(3UL << 2);
	GPIOB->PUPDR |= (2UL << 2);
	
	//Enable clock for SYSCFG
	RCC->APB2ENR |= (1UL << 14);
	
	//Set External interrupt line
	SYSCFG->EXTICR1 &= ~(15UL << 4);
	SYSCFG->EXTICR1 |= (1UL << 4);
	
	//Set falling trigger
	EXTI->FTSR |= (1UL << 1);
	
	//Set interrupt mask
	EXTI->IMR |= (1UL << 1);
	
	//Enable interrupt NVIC
	//Enable interrupt for EXTI1 (line 7)
	NVIC_ISER0 |= (1UL << 7);
	while(1){}
	
	return 0;
}
