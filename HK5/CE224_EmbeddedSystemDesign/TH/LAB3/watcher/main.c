#include "ResStruct.h"
#include "stdint.h"

volatile uint32_t g_hours = 0;
volatile uint32_t g_minutes = 0;
volatile uint32_t g_seconds = 0;

/* ==================================================================== */
/* C?u hình Timer cho Ng?t 1 giây                       */
/* ==================================================================== */

/**
 * @brief C?u hình TIM2 d? t?o ng?t m?i 1 giây.
 * @note  Gi? d?nh TIM2CLK = 45MHz.
 * PSC = 44999 => T?c d? d?m = 45,000,000 / (44999 + 1) = 1000 Hz (1ms tick).
 * ARR = 999   => Th?i gian tràn = (999 + 1) * 1ms = 1000ms = 1 giây.
 */
void Stopwatch_TIM_Init(void)
{
    // 1. B?t clock cho TIM2 (trên bus APB1)
    RCC_APB1ENR |= (1 << 0);

    // 2. Cài d?t Prescaler (PSC)
    TIM2->PSC = 44999; 

    // 3. Cài d?t Auto-Reload Register (ARR)
    TIM2->ARR = 999;

    // 4. B?t ng?t Update (UIE)
    TIM2->DIER |= (1 << 0);

    // 5. Xóa c? ng?t (d? d?m b?o)
    TIM2->SR &= ~(1 << 0);
    
    // 6. B?t ng?t TIM2 trong NVIC (IRQ #28)
    NVIC_ISER0 |= (1 << 28);
    
    // 7. Kh?i d?ng Timer
    TIM2->CR1 |= (1 << 0); // CEN = 1
}

/* ==================================================================== */
/* Trình x? lý ng?t TIM2 (ISR)                          */
/* ==================================================================== */

/**
 * @brief Hàm này t? d?ng du?c g?i m?i 1 giây.
 */
void TIM2_IRQHandler(void)
{
    // 1. Ki?m tra xem c? ng?t Update (UIF) có du?c b?t không
    if (TIM2->SR & (1 << 0)) {
        
        // 2. XÓA C? NG?T (B?T BU?C!)
        TIM2->SR &= ~(1 << 0);
        
        // 3. C?p nh?t logic d?ng h?
        g_seconds++;
        if (g_seconds >= 60) {
            g_seconds = 0;
            g_minutes++;
            if (g_minutes >= 60) {
                g_minutes = 0;
                g_hours++;
                if (g_hours >= 24) {
                    g_hours = 0; // Quay v? 00:00:00
                }
            }
        }
    }
}

/* ==================================================================== */
/* Hàm Main                                             */
/* ==================================================================== */

int main(void)
{
    // 1. C?u hình System Clock (B?T BU?C)
    // Gi? s? hàm SystemClock_Config() (180MHz) c?a b?n du?c g?i ? dây
    // SystemClock_Config(); 

    // 2. Kh?i d?ng timer 1 giây
    Stopwatch_TIM_Init();
    
    // Vòng l?p vô t?n. Timer s? ch?y trong n?n (ng?t).
    while (1)
    {
        // CPU r?nh, có th? làm vi?c khác ? dây.
        // Ð?ng h? v?n d?m ng?m.
    }
}

/*
 * C?n cung c?p các hàm gi? (stub) cho startup file,
 * n?u không nó s? g?i Default_Handler và b? treo.
 */
void NMI_Handler(void) {}
void HardFault_Handler(void) { while(1); }
void MemManage_Handler(void) { while(1); }
void BusFault_Handler(void) { while(1); }
void UsageFault_Handler(void) { while(1); }
void SVC_Handler(void) {}
void DebugMon_Handler(void) {}
void PendSV_Handler(void) {}
void SysTick_Handler(void) {}