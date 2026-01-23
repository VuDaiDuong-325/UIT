#include <stdint.h>
#include <string.h>

#define RCC_BASE 0x40023800UL
#define GPIOA_BASE 0x40020000UL
#define GPIOG_BASE 0x40021800UL
#define USART1_BASE 0x40011000UL
#define NVIC_BASE 0xE000E100UL

// --- Register Definitions ---
#define RCC_AHB1ENR *((volatile unsigned int*) (RCC_BASE + 0x30))
#define RCC_APB2ENR *((volatile unsigned int*) (RCC_BASE + 0x44))
#define NVIC_ISER1 *((volatile unsigned int*) (NVIC_BASE + 0x04))

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
#define GPIOG ((GPIOx*) GPIOG_BASE)

typedef struct {
    volatile unsigned int SR;
    volatile unsigned int DR;
    volatile unsigned int BRR;
    volatile unsigned int CR1;
    volatile unsigned int CR2;
    volatile unsigned int CR3;
    volatile unsigned int GTPR;
} USARTx;
#define USART1 ((USARTx*) USART1_BASE)

// --- Global Variables ---
volatile char rxBuffer[50];
volatile uint8_t rxIndex = 0;
volatile uint8_t stringReceived = 0;

// --- Functions ---

void USART1_Init(void)
{
    RCC_AHB1ENR |= (1 << 0); 
    RCC_APB2ENR |= (1 << 4); 

    GPIOA->MODER &= ~((3 << (9 * 2)) | (3 << (10 * 2))); 
    GPIOA->MODER |= ((2 << (9 * 2)) | (2 << (10 * 2)));  

    // Speed: Very high
    GPIOA->OSPEEDR |= ((3 << (9 * 2)) | (3 << (10 * 2))); 

    // AF7 (Alternate Function 7) cho USART1
    GPIOA->AFRH &= ~((0xF << 4) | (0xF << 8)); // Clear
    GPIOA->AFRH |= ((7 << 4) | (7 << 8));      // Set AF7

    // 3. USART1
    USART1->CR1 &= ~(1 << 13); // Disable USART
    USART1->CR1 &= ~(1 << 15); // OVER16 
    
    // Baud rate = 9600 @ 16MHz
    // DIV = 16MHz / (16 * 9600) = 104.166... => Mantissa=104, Fraction=3
    USART1->BRR = 0x0683;

    USART1->CR1 &= ~((1 << 12) | (1 << 10)); // 8 data bit, no parity
    USART1->CR2 &= ~(3 << 12); // 1 stop bit
}

void USART1_TE_Init(){
    USART1_Init();
    USART1->CR1 |= (1 << 3) | (1 << 13); // TE=1, UE=1
}

void USART1_Send_Char(char a)
{
    while (!(USART1->SR & (1 << 7))); // Wait TXE
    USART1->DR = a;
}

void USART1_Send_String (const char* str)
{
    while (*str)
    {
        USART1_Send_Char(*str);
        str++;
    }
}

void PG13_Init(void) {
    RCC_AHB1ENR |= (1 << 6); // GPIOG Clock
    GPIOG->MODER &= ~(3 << (13 * 2)); 
    GPIOG->MODER |=  (1 << (13 * 2)); // Output mode
    GPIOG->ODR &= ~(1 << 13); // Led off
}

void USART1_RE_Init(){
    USART1_Init();
    // TE=1, RE=1, RXNEIE=1 (Interrupt Enable)
    USART1->CR1 |= ((1 << 3) | (1 << 2) | (1 << 5));    
    
    NVIC_ISER1 |= (1 << 5); // Enable NVIC IRQ for USART1
    
    USART1->CR1 |= (1 << 13); // UE = 1
}

void USART1_IRQHandler(void) {
    if (USART1->SR & (1 << 5)) {    // RXNE (Read Data Register Not Empty)
        char a = (char)(USART1->DR); // Read data clears the flag
        
        if (rxIndex < 49 && stringReceived == 0){
            rxBuffer[rxIndex++] = a;
            
            if (a == ']') {        // Last character detection
                rxBuffer[rxIndex] = '\0';
                stringReceived = 1;
                rxIndex = 0;
            }
        }
    }
}

int main ()
{
	/*
		USART1_TE_Init();
		USART1_Send_String("Hello World/r/n"); */
		
    // Khoi tao LED
    PG13_Init();
    
    // Khoi tao UART che do Nhan (Receive Interrupt)
    USART1_RE_Init();
    
    while (1) {
        if (stringReceived){
            if (strcmp((char*)rxBuffer, "[LEDON]") == 0) {
                GPIOG->ODR |= (1 << 13);  // Bat LED
            }
            else if (strcmp((char*)rxBuffer, "[LEDOFF]") == 0) {
                GPIOG->ODR &= ~(1 << 13); // Tat LED
            }
            // Reset co
            stringReceived = 0;
        }
    }
		
    return 0;
}