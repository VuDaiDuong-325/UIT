#include "ResStruct.h"

// ------------ CLOCK -------------

void MCO1_Config_2MHz(void);
void MCO1_Config_1MHz(void);
// Asm1
void SystemClock_Config(void)
{
    // --- 1. Enable HSE & PWR Interface ---
    // Enable HSE
    RCC_CR |= (1 << 16); // HSEON
    while (!(RCC_CR & (1 << 17))); // Wait for HSERDY

    // Enable the Power Interface clock
    RCC_APB1ENR |= (1 << 28); // PWREN

    // --- 2. Configure Voltage Scale & Flash (CRITICAL) ---
    // Set Voltage Scaling to Scale 1 (required for 180MHz)
    // VOS[1:0] = 0b11 (bits 15:14)
    PWR_CR |= (3 << 14);

    // Configure Flash: 5 Wait States (WS), Prefetch, I/D Caches
    // LATENCY = 0b0101 (5 WS)
    FLASH_ACR = (1 << 8) | (1 << 9) | (1 << 10) | (5 << 0);
    while ((FLASH_ACR & 0xF) != 5); // Wait for WS to be set

		// --- 3. Configure Main PLL (180MHz) ---
    // PLLM = 8, PLLN = 360, PLLP = 2, PLLQ = 7
    // PLLSRC = HSE
    RCC_PLLCFGR = 0; // Reset
    RCC_PLLCFGR |= (1 << 22);   // PLLSRC = HSE
    RCC_PLLCFGR |= (8 << 0);    // PLLM = 8
    RCC_PLLCFGR |= (360 << 6);  // PLLN = 360
    RCC_PLLCFGR |= (0b00 << 16); // PLLP = 2 (SYSCLK = 180MHz)
    RCC_PLLCFGR |= (7 << 24);   // PLLQ = 7  (for USB/SDIO, 360/7=51.4MHz)

    // --- 4. Enable PLL & Overdrive (CRITICAL) ---
    // Enable PLL
    RCC_CR |= (1 << 24); // PLLON
    while (!(RCC_CR & (1 << 25))); // Wait for PLLRDY
		
    // --- 5. Configure Clock Prescalers ---
    // AHB_CLK = 180MHz (HPRE = /1 = 0b0xxx)
    RCC_CFGR &= ~(0xF << 4); // HPRE = 0
    // APB2_CLK = 45MHz (PPRE2 = /4 = 0b101)
    RCC_CFGR &= ~(0x7 << 13);
    RCC_CFGR |= (0b101 << 13);
    // APB1_CLK = 22.5MHz (PPRE1 = /8 = 0b110)
    RCC_CFGR &= ~(0x7 << 10);
    RCC_CFGR |= (0b110 << 10);

    // Enable Overdrive (required for 180MHz)
    PWR_CR |= (1 << 16); // ODEN
    while (!(PWR_CSR & (1 << 16))); // Wait for ODRDY
    PWR_CR |= (1 << 17); // ODSWEN
    while (!(PWR_CSR & (1 << 17))); // Wait for ODSWRDY

    // --- 6. Switch System Clock to PLL ---
    // Select PLL as System Clock Source
    RCC_CFGR &= ~(3 << 0); // Clear SW bits
    RCC_CFGR |= (2 << 0);  // Set SW to 0b10 (PLL)
    
    // Wait for SWS to match, indicating PLL is now SYSCLK
    while ((RCC_CFGR & (3 << 2)) != (2 << 2));
}

// Asm2
/**
 * @brief Configures the system clock to use HSE (8MHz) directly.
 *
 * This function initializes and enables the HSE (assumed 8MHz)
 * and sets it as the main system clock. The AHB and APB
 * prescalers are configured for the requested speeds.
 *
 * Clock Setup:
 * HSE = 8MHz (assumed)
 * SYSCLK = 8MHz (HSE selected as source)
 * AHB_CLK = 8MHz  (HPRE = /1)
 * APB2_CLK = 4MHz  (PPRE2 = /2)
 * APB1_CLK = 2MHz  (PPRE1 = /4)
 */
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
		
		// For MCO1
		MCO1_Config_1MHz();
		// MCO1_Config_2MHz();

    // 4. Select HSE as System Clock Source
    RCC_CFGR &= ~(3 << 0); // Clear SW bits
    RCC_CFGR |= (1 << 0);  // Set SW to 0b01 (HSE)
    
    // Wait for SWS to match, indicating HSE is now SYSCLK
    while ((RCC_CFGR & (3 << 2)) != (1 << 2));
}

// Asm3
void MCO1_Config_2MHz(void)
{
		// MCO1 Source = HSE (0b10 at bits 22:21)
    RCC_CFGR |= (0b10 << 21);
    // MCO1 Prescaler = /4 (0b110 at bits 26:24)
    RCC_CFGR |= (0b110 << 24);
}

// Asm4
void MCO1_Config_1MHz(void)
{
		// MCO1 Source = HSE (0b10 at bits 22:21)
    RCC_CFGR |= (0b10 << 21);
    // MCO1 Prescaler = /4 (0b110 at bits 26:24)
    RCC_CFGR |= (0b111 << 24);
}

// PCLK2 = 16MHz
void SystemClock_Config_128MHz_PCLK2_16MHz(void)
{
    // --- 1. Enable HSE & PWR Interface ---
    // Enable HSE
    RCC_CR |= (1 << 16); // HSEON
    while (!(RCC_CR & (1 << 17))); // Wait for HSERDY

    // Enable the Power Interface clock
    RCC_APB1ENR |= (1 << 28); // PWREN

    // --- 2. Configure Voltage Scale & Flash ---
    // Ð?t Voltage Scaling thành Scale 3 (T?i da 144MHz)
    // VOS[1:0] = 0b01 (bits 15:14)
    PWR_CR &= ~(3 << 14); // Xóa
    PWR_CR |= (1 << 14); // Ð?t 0b01

    // C?u hình Flash: 4 Wait States (WS), Prefetch, I/D Caches
    // LATENCY = 0b0100 (4 WS cho 120-144MHz)
    FLASH_ACR = (1 << 8) | (1 << 9) | (1 << 10) | (4 << 0);
    while ((FLASH_ACR & 0xF) != 4); // Wait for WS to be set

    // --- 3. Configure Main PLL (128MHz) ---
    // PLLM = 8, PLLN = 256, PLLP = 2
    // PLLSRC = HSE
    RCC_PLLCFGR = 0; // Reset
    RCC_PLLCFGR |= (1 << 22);      // PLLSRC = HSE
    RCC_PLLCFGR |= (8 << 0);       // PLLM = 8
    RCC_PLLCFGR |= (256 << 6);     // PLLN = 256
    RCC_PLLCFGR |= (0b00 << 16);   // PLLP = 2 (SYSCLK = 128MHz)
    // (Gi? PLLQ m?c d?nh ho?c cài d?t n?u c?n USB)

    // --- 4. Enable PLL ---
    // Enable PLL
    RCC_CR |= (1 << 24); // PLLON
    while (!(RCC_CR & (1 << 25))); // Wait for PLLRDY
    
    // (Overdrive KHÔNG c?n thi?t ? 128MHz)

    // --- 5. Configure Clock Prescalers ---
    // AHB_CLK = 128MHz (HPRE = /1 = 0b0xxx)
    RCC_CFGR &= ~(0xF << 4); // HPRE = 0
    
    // APB2_CLK = 16MHz (PPRE2 = /8 = 0b110)
    RCC_CFGR &= ~(0x7 << 13);
    RCC_CFGR |= (0b110 << 13);
    
    // APB1_CLK = 16MHz (PPRE1 = /8 = 0b110)
    RCC_CFGR &= ~(0x7 << 10);
    RCC_CFGR |= (0b110 << 10);

    // --- 6. Switch System Clock to PLL ---
    // Select PLL as System Clock Source
    RCC_CFGR &= ~(3 << 0); // Clear SW bits
    RCC_CFGR |= (2 << 0);  // Set SW to 0b10 (PLL)
    
    // Wait for SWS to match, indicating PLL is now SYSCLK
    while ((RCC_CFGR & (3 << 2)) != (2 << 2));
}