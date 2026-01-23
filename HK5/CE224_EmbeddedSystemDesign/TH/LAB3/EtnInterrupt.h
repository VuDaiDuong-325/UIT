#include "InterruptAsm.h"

void EXTI1_IRQHandler(void);
// Asm1
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

// Asm2
void PC6_EXTI(void)
{
	RCC_AHB1ENR |= (1 << 2);	// GPIOC EN
	RCC_APB2ENR |= (1 << 14);	// SYSCFG EN
	
	GPIOB->MODER &= ~(3 << (6 * 2));		// Analog mode
	GPIOB->PUPDR &= ~(3 << (6 * 2));		
	GPIOB->PUPDR |= (1 << (6 * 2));			// Pull Up
	
	SYSCFG1->EXTICR2 &= ~(0xF << 8); 	
  SYSCFG1->EXTICR2 |= (0b0010 << 8); // 0b0001 = Port C
	
	EXTI1->IMR |= (1 << 1); 	// not masked
  EXTI1->FTSR |= (1 << 1);	// Falling enable
  EXTI1->RTSR |= (1 << 1);	// Rising enable

  NVIC_ISER0 |= (1 << 7);		// EXTI1 enable
}

void EXTI1_IRQHandler(void)
{
  if (EXTI1->PR & (1 << 1)) {		// flag on (occur)
    EXTI1->PR = (1 << 1);				// clear flag (This bit is cleared by programming it to ‘1’)
  }
}