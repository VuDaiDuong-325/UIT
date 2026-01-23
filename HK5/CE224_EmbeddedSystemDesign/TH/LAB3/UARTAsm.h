#include "EtnInterrupt.h"
#include "string.h"

// Asm2
void USART1_TE_Init(void)
{
    // --- 1.Clock ---
    RCC_AHB1ENR |= (1 << 6); // GPIOG

    RCC_APB2ENR |= (1 << 4); // USART1

    // --- 2. GPIO (PG14 & PG9) ---
    GPIOG->MODER &= ~((3 << (9 * 2)) | (3 << (14 * 2))); // Clear
    GPIOG->MODER |= ((2 << (9 * 2)) | (2 << (14 * 2)));  // Alternative function mode

    GPIOG->OSPEEDR |= ((3 << (9 * 2)) | (3 << (14 * 2))); // Very high speed

    //  AF8 (Alternate Function 8) cho USART1
    GPIOG->AFRH &= ~((0xF << (4)) | (0xF << (24))); // Clear (High -> (9-8)*4 & (14 - 8)*4
    GPIOG->AFRH |= ((8 << (4)) | (8 << (24)));     // 1000 (AF8)

    // --- 3. USART1 ---
    
    USART1->CR1 &= ~(1 << 13);	// Disable USART
		USART1->CR1 &= ~(1 << 15); // OVER16
    
    // Baud rate = 9600;	fCK = 16MHz, OVER16 = 0
		// USARTDIV = 104.1667
		// DIV_Mantissa = 104 (0x68);		Fraction = 16 * 0.1667 = 2.6672 ~ 3 (0x3)
		// BRR = 0x0683
    USART1->BRR = 0x0683;

    USART1->CR1 &= ~((1 << 12) | (1 << 10)); // 8 data bit, no parity
    USART1->CR2 &= ~(3 << 12); // 1 stop bit

    USART1->CR1 |= (1 << 3) | (1 << 13); // TE=1, UE=1
}

void USART1_Send_Char(char a)
{
		while (!(USART1->SR & (1 << 7)));	// Tranfer done
		USART1->DR = a;
}

// Asm3
void USART1_RE_Init(void)
{
    // --- 1.Clock ---
    RCC_AHB1ENR |= (1 << 6); // GPIOG

    RCC_APB2ENR |= (1 << 4); // USART1

    // --- 2. GPIO (PG14 & PG9) ---
    GPIOG->MODER &= ~((3 << (9 * 2)) | (3 << (14 * 2))); // Clear
    GPIOG->MODER |= ((2 << (9 * 2)) | (2 << (14 * 2)));  // Alternative function mode

    GPIOG->OSPEEDR |= ((3 << (9 * 2)) | (3 << (14 * 2))); // Very high speed

    //  AF8 (Alternate Function 8) cho USART1
    GPIOG->AFRH &= ~((0xF << (4)) | (0xF << (24))); // Clear (High -> (9-8)*4 & (14 - 8)*4
    GPIOG->AFRH |= ((8 << (4)) | (8 << (24)));     // 1000 (AF8)

    // --- 3. USART1 ---
    
    USART1->CR1 &= ~(1 << 13);	// Disable USART
		USART1->CR1 |= (0 << 15); // OVER16
    
    // Baud rate = 9600;	fCK = 16MHz, OVER16 = 0
		// USARTDIV = 104.1667
		// DIV_Mantissa = 104 (0x68);		Fraction = 16 * 0.1667 = 2.6672 ~ 3 (0x3)
		// BRR = 0x0683
    USART1->BRR = 0x0683;

    USART1->CR1 &= ~((1 << 12) | (1 << 10)); // 8 data bit, no parity
    USART1->CR2 &= ~(3 << 12); // 1 stop bit

    USART1->CR1 |= (1 << 2) | (1 << 13); // RE=1, UE=1
}

char USART1_Receive_Char(void){
		while (!(USART1->SR & (1 << 5)));	// Ready to read
		return (char)(USART1->DR & 0xFF);	// Read DR & clear flag RXNE
}

void LED_State(char a){
		if (a == '1'){
			GPIOG->BSRR = (1 << 13);				// Set PG13
		}
		else if (a == '0'){
			GPIOG->BSRR = (1 << (13 + 16));	// Reset PG13
		}
}

// Asm4
void USART1_TE_Init(void);
void USART1_Send_Char(char a);

void USART1_Send_String (const char* str)
{
		while (*str)
		{
			USART1_Send_Char(*str);	// Send current char
			str++;						// Move to next char
		}
}

// Asm5
void USART1_RE_Init_Interrupt(void)
{
	NVIC_ISER1 |= (1 <<5);
	USART1_RE_Init();
	USART1->CR1 |= (1 << 5); // RXNEIE = 1
}
	
void USART1_IRQHandler(void)
{
    if (USART1->SR & (1 << 5))		// Ready to read
    {
      char received = (char)(USART1->DR & 0xFF);		// Read DR & Clear RXNE
			LED_State(received);
    }
}

// Asm6
void USART2_RE_Init(void)
{
    // --- 1.Clock ---
    RCC_AHB1ENR |= (1 << 6); // GPIOG

    RCC_APB1ENR |= (1 << 17); // USART2

    // --- 2. GPIO (PA2 & PA3) ---
    GPIOA->MODER &= ~((3 << (2 * 2)) | (3 << (3 * 2))); // Clear
    GPIOA->MODER |= ((2 << (2 * 2)) | (2 << (3 * 2)));  // Alternative function mode

    GPIOA->OSPEEDR |= ((3 << (2 * 2)) | (3 << (3 * 2))); // Very high speed

    //  AF7 (Alternate Function 8) cho USART2
    GPIOA->AFRL &= ~((0xF << (2 * 4)) | (0xF << (3 * 4))); // Clear 
    GPIOA->AFRL |= ((7 << (2 * 4)) | (7 << (3 * 4)));     // 0111 (AF7)

    // --- 3. USART2 ---
    
    USART2->CR1 &= ~(1 << 13);	// Disable USART
		USART2->CR1 &= ~(1 << 15); // OVER16
    
    // Baud rate = 9600;	fCK = 16MHz, OVER16 = 0
		// USARTDIV = 104.1667
		// DIV_Mantissa = 104 (0x68);		Fraction = 16 * 0.1667 = 2.6672 ~ 3 (0x3)
		// BRR = 0x0683
    USART2->BRR = 0x0683;

    USART2->CR1 &= ~((1 << 12) | (1 << 10)); // 8 data bit, no parity
    USART2->CR2 &= ~(3 << 12); // 1 stop bit

    USART2->CR1 |= (1 << 2) | (1 << 13); // RE=1, UE=1
}

void USART2_RE_Init_Interrupt(void)
{
	NVIC_ISER1 |= (1 << (38 - 32)); // Bit 6
	
	USART2_RE_Init();
	
	USART2->CR1 |= (1 << 5); // RXNEIE = 1
}

void USART1_Receive_String(const char* str){
	  if (strcmp(str, "[LEDON]") == 0)
		{   
			GPIOG->BSRR = (1 << 13);				// Set PG13
		}
		else if (strcmp(str, "[LEDOFF]") == 0)
		{
			GPIOG->BSRR = (1 << (13 + 16));	// Reset PG13
		}
}

