#include "ClockAsm.h"

// ------------- INTERRUPT -------------
/**
 * @brief Configures GPIOG Pin 13 as a push-pull output for the LED.
 */
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

/** POLLING TECHNIQUE	
 * @brief Initializes TIM2 to set an update flag every 500ms.
 *
 * Assumes a 180MHz SystemClock_Config, which results in
 * TIM2CLK = 45MHz (APB1=22.5MHz * 2).
 *
 * We want a 1ms tick (1000 Hz):
 * PSC = (45,000,000 / 1000) - 1 = 44999
 */
void TIM2_Polling_Init(void)
{
    // 1. Enable TIM2 clock (on APB1)
    RCC_APB1ENR |= (1 << 0);

    // 2. Set Prescaler to get 1ms tick
    TIM2->PSC = 44999; 

    // 3. Set Auto-Reload Register (ARR) to 499
    // This will cause an overflow every (499 + 1) * 1ms = 500ms
    TIM2->ARR = 499;

    // 4. Generate an update event to load the PSC
    TIM2->EGR |= (1 << 0);
    
    // 5. Clear the update interrupt flag
    TIM2->SR &= ~(1 << 0);
    
    // 6. Start the timer
    TIM2->CR1 |= (1 << 0); // CEN = 1
}

/**		INTERRUPT TECHNIQUE
 * @brief Initializes TIM2 to generate an interrupt every 500ms.
 *
 * Assumes a 180MHz SystemClock_Config (TIM2CLK = 45MHz).
 * PSC = 44999 (for 1ms tick)
 * ARR = 500   (for 500ms period)
 */
void TIM2_Interrupt_Init(void)
{
    // 1. Enable TIM2 clock (on APB1)
    RCC_APB1ENR |= (1 << 0);

    // 2. Set Prescaler to get 1ms tick
    TIM2->PSC = 44999; 

    // 3. Set Auto-Reload Register (ARR) to 500
    TIM2->ARR = 499;

    // 4. Enable the Update Interrupt (UIE)
    TIM2->DIER |= (1 << 0);

    // 5. Generate an update event to load the PSC
    TIM2->EGR |= (1 << 0);
    
    // 6. Clear the update interrupt flag
    TIM2->SR &= ~(1 << 0);
	
		// 7. Enable the TIM2 IRQ in the NVIC
		NVIC_ISER0 |= (1 << 28);
    
    // 8. Start the timer
    TIM2->CR1 |= (1 << 0); // CEN = 1
}

// DELAY 1MS FUNCTION
volatile unsigned int g_msec_count_tim2 = 0;
/**
 * @brief Initializes TIM2 to generate an interrupt every 1ms.
 *
 * @note Assumes 180MHz SystemClock_Config (TIM2CLK = 45MHz).
 */
void TIM2_Init_1ms(void)
{
    // 1. Enable TIM2 clock (on APB1)
    RCC_APB1ENR |= (1 << 0); // TIM2 is bit 0

    // 2. Set Prescaler and Auto-Reload Register
    TIM2->PSC = 449; // (45,000,000 / (449+1)) = 100,000 Hz
    TIM2->ARR = 99;  // (100,000 Hz / (99+1)) = 1,000 Hz = 1ms

    // 3. Enable the Update Interrupt (UIE)
    TIM2->DIER |= (1 << 0);

    // 4. Generate an update event to load the PSC/ARR
    TIM2->EGR |= (1 << 0);
    
    // 5. Clear the update interrupt flag
    TIM2->SR &= ~(1 << 0);
    
    // 6. Enable the TIM2 IRQ in the NVIC
    // TIM2 is IRQ #28
    NVIC_ISER0 = (1 << 28);
    
    // 7. Start the timer
    TIM2->CR1 |= (1 << 0); // CEN = 1
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

void TIM2_IRQHandler(void)
{
	if (TIM2->SR & (1 << 0)){	// Check flag
		TIM2->SR &= ~(1 << 0);
		GPIOG->ODR ^= (1 << 13); // Toggle PG13
		
		// for delay1ms function
		// g_msec_count_tim2++;
	}
}