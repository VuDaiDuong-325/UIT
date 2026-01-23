#include "UARTAsm.h"
#include "stdint.h"

void GPIO_for_SPI_Init(void)
{
	// 1. Clock
	RCC_AHB1ENR |= (1 << 5); 	// GPIOF
	RCC_APB2ENR |= (1 << 20);	// SPI5
		
	// 2. GPIO (PF7, PF9)
  GPIOF->MODER &= ~((3 << (7 * 2)) | (3 << (9 * 2))); // Clear
  GPIOF->MODER |= ((2 << (7 * 2)) | (2 << (9 * 2)));  // Alternate Function mode
	GPIOF->OSPEEDR |= ((3 << (7 * 2)) | (3 << (9 * 2)));
	
	// AF5 cho SPI5
	GPIOF->AFRL &= ~(0xF << (7 * 4));
  GPIOF->AFRL |= (5 << (7 * 4));   // AF5 (PF7)
  GPIOF->AFRH &= ~(0xF << ((9-8) * 4));
  GPIOF->AFRH |= (5 << ((9-8) * 4)); // AF5 (PF9)
}

// Asm2
void ASM2_Init(void){
	GPIO_for_SPI_Init();
	// 3. SPI5
	SPI5->CR1 |= (0b011 << 3);	// Baud Rate = f/16
	SPI5->CR1 &= ~((1 << 0) | (1 << 1));	// CPOL = CPHA = 0
	SPI5->CR1 &= ~(1 << 11);		// 8 bit data
	SPI5->CR1 &= ~(1 << 7); 		// MSB
	SPI5->CR1 |= (1 << 9) | (1 << 8);		// SSM = 1, SSI = 1
	SPI5->CR1 |= (1 << 2);		// Master
	SPI5->CR1 |= ((1 << 14) | (1 << 15));		// Transmit only, 1 line
	SPI5->CR1 |= (1 << 6);
}
	
void SPI5_Send_Char(char a)
{
    while (!(SPI5->SR & (1 << 1)));		// TXE empty
    
    SPI5->DR = a;
    
    while (SPI5->SR & (1 << 7));	// Check flag
}

// Asm3
void ASM3_Init(void)
{
	GPIO_for_SPI_Init();
	// 3. SPI5
	SPI5->CR1 |= (0b010 << 3);	// Baud Rate = f/8
	SPI5->CR1 |= ((1 << 0) | (1 << 1));	// CPOL = CPHA = 1
	SPI5->CR1 |= (1 << 11);		// 16 bit data
	SPI5->CR1 &= ~(1 << 7); 		// MSB
	SPI5->CR1 |= (1 << 9) | (1 << 8);		// SSM = 1, SSI = 1
	SPI5->CR1 |= (1 << 2);		// Master
	SPI5->CR1 |= ((1 << 14) | (1 << 15));		// Transmit only, 1 line
	SPI5->CR1 |= (1 << 6);
}

void SPI5_Send_Data16(uint16_t data)
{
    while (!(SPI5->SR & (1 << 1)));
    
    SPI5->DR = data;
    
    while (SPI5->SR & (1 << 7));
}

// Asm4
void ASM2_Init(void);
void SPI5_Send_Char(char a);
void SPI5_Send_String(const char* str)
{
    while (*str)
    {
        SPI5_Send_Char(*str); 
        str++;                
    }
}