#include "stm32f4xx.h"

void delay_ms(uint32_t ms) {
	//Simple delay loop
	//Default HSI frequency = 16MHz, this loop is nly approximate
	for (uint32_t i = 0; i < ms * 4000; i++) {
		__NOP(); // No operation (keeps the CPU busy)
	}
}

int main (void) {
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIOGEN;
	
	GPIOG->MODER &= ~((3UL << (13*2)) | (3UL << (14*2))); // Clear mode bits
	GPIOG->MODER |= ((1UL << (13*2)) | (1UL << (14*2)));	//SET as output mode
	
	uint32_t led_states[4] = {
		0x00000000,
		(1UL << 14),
		(1UL << 13),
		(1UL << 13) | (1UL << 14)
	};
	
	while (1) {
		for(int i = 0; i < 4; i++){
			GPIOG->ODR &= ~((1UL << 13) | (1UL << 14));
			GPIOG->ODR |= led_states[i];
			delay_ms(220);
		}
	}
}