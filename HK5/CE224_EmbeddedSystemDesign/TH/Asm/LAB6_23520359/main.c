#include <stdint.h>
#include <string.h>
#include <stdio.h>

#define __IO volatile

// Base Addresses
#define PERIPH_BASE         0x40000000UL
#define APB1PERIPH_BASE     PERIPH_BASE
#define APB2PERIPH_BASE     (PERIPH_BASE + 0x00010000UL)
#define AHB1PERIPH_BASE     (PERIPH_BASE + 0x00020000UL)

#define GPIOA_BASE          (AHB1PERIPH_BASE + 0x0000UL)
#define RCC_BASE            (AHB1PERIPH_BASE + 0x3800UL)
#define TIM2_BASE           (APB1PERIPH_BASE + 0x0000UL)
#define USART1_BASE         (APB2PERIPH_BASE + 0x1000UL)
#define SYSCFG_BASE         (APB2PERIPH_BASE + 0x3800UL)
#define EXTI_BASE           (APB2PERIPH_BASE + 0x3C00UL)

// NVIC (Core Peripheral)
#define NVIC_ISER0          (*((__IO uint32_t *)0xE000E100))
#define NVIC_ISER1          (*((__IO uint32_t *)0xE000E104))
#define NVIC_IPR            ((__IO uint8_t *)0xE000E400)

// Struct Definitions
typedef struct {
    __IO uint32_t MODER;   
    __IO uint32_t OTYPER;   
    __IO uint32_t OSPEEDR;  
    __IO uint32_t PUPDR;    
    __IO uint32_t IDR;     
    __IO uint32_t ODR;    
    __IO uint32_t BSRR;     
    __IO uint32_t LCKR;     
    __IO uint32_t AFR[2];   
} GPIO_TypeDef;

typedef struct {
    __IO uint32_t CR;
    __IO uint32_t PLLCFGR;
    __IO uint32_t CFGR;
    __IO uint32_t CIR;
    __IO uint32_t AHB1RSTR;
    __IO uint32_t AHB2RSTR;
    __IO uint32_t AHB3RSTR;
    uint32_t RESERVED0;
    __IO uint32_t APB1RSTR;
    __IO uint32_t APB2RSTR;
	
    uint32_t RESERVED_1[2];
    __IO uint32_t AHB1ENR;
    __IO uint32_t AHB2ENR;
    __IO uint32_t AHB3ENR;
    uint32_t RESERVED_2;
    __IO uint32_t APB1ENR;
    __IO uint32_t APB2ENR;
} RCC_TypeDef;

typedef struct {
    __IO uint32_t SR;
    __IO uint32_t DR;
    __IO uint32_t BRR;
    __IO uint32_t CR1;
    __IO uint32_t CR2;
    __IO uint32_t CR3;
    __IO uint32_t GTPR;
} USART_TypeDef;

typedef struct {
    __IO uint32_t CR1;
    __IO uint32_t CR2;
    __IO uint32_t SMCR;
    __IO uint32_t DIER;
    __IO uint32_t SR;
    __IO uint32_t EGR;
    __IO uint32_t CCMR1;
    __IO uint32_t CCMR2;
    __IO uint32_t CCER;
    __IO uint32_t CNT;
    __IO uint32_t PSC;
    __IO uint32_t ARR;
} TIM_TypeDef;

typedef struct {
    __IO uint32_t IMR;
    __IO uint32_t EMR;
    __IO uint32_t RTSR;
    __IO uint32_t FTSR;
    __IO uint32_t SWIER;
    __IO uint32_t PR;
} EXTI_TypeDef;

typedef struct {
    __IO uint32_t MEMRMP;
    __IO uint32_t PMC;
    __IO uint32_t EXTICR[4];
} SYSCFG_TypeDef;

#define GPIOA   ((GPIO_TypeDef *) GPIOA_BASE)
#define RCC     ((RCC_TypeDef *) RCC_BASE)
#define USART1  ((USART_TypeDef *) USART1_BASE)
#define TIM2    ((TIM_TypeDef *) TIM2_BASE)
#define EXTI    ((EXTI_TypeDef *) EXTI_BASE)
#define SYSCFG  ((SYSCFG_TypeDef *) SYSCFG_BASE)

#define UART_BUF_SIZE 64
#define MAX_LAPS 8
#define MSG_BUF_SIZE 50
char msg_buf[MSG_BUF_SIZE];
volatile uint32_t ms_counter = 0;       
volatile uint32_t system_millis = 0;
volatile uint8_t  flag_1s_update = 0;   
volatile uint8_t  stopwatch_running = 0;// 0: Stop, 1: Run
volatile uint32_t last_button_press = 0;

volatile char rx_buffer[UART_BUF_SIZE];
volatile uint8_t rx_index = 0;
volatile uint8_t flag_cmd_received = 0; 

uint32_t laps[MAX_LAPS];
uint8_t lap_count = 0;

void UART_SendChar(char c) {
    while (!(USART1->SR & (1 << 7))); 
    USART1->DR = c;
}

void UART_SendString(char *str) {
    while (*str) {
        UART_SendChar(*str++);
    }
}

void FormatTime(uint32_t total_ms, char *buffer, uint16_t max_len) {
    uint32_t seconds = total_ms / 1000;
    uint32_t h = seconds / 3600;
    uint32_t m = (seconds % 3600) / 60;
    uint32_t s = seconds % 60;
    snprintf(buffer, max_len, "%02d:%02d:%02d", (int)h, (int)m, (int)s);
}

void Init_Clock(void) {
    RCC->AHB1ENR |= (1 << 0); 
    RCC->APB1ENR |= (1 << 0); 
    RCC->APB2ENR |= (1 << 4) | (1 << 14); 
}

void Init_GPIO(void) {
    GPIOA->MODER &= ~((3 << 18) | (3 << 20)); 
    GPIOA->MODER |=  (2 << 18) | (2 << 20); 
    GPIOA->AFR[1] &= ~((0xF << 4) | (0xF << 8));
    GPIOA->AFR[1] |=  ((7 << 4) | (7 << 8));
    GPIOA->MODER &= ~(3 << 0); 
    GPIOA->PUPDR &= ~(3 << 0); 
}

void Init_USART1(void) {
    USART1->BRR = 0x683;  

    USART1->CR1 |= (1 << 2) | (1 << 3); 
    USART1->CR1 |= (1 << 5); 
    USART1->CR1 |= (1 << 13); 
    NVIC_ISER1 |= (1 << (37 - 32));
    NVIC_IPR[37] = (1 << 4); 
}

void Init_TIM2(void) {
    TIM2->PSC = 15; 
    TIM2->ARR = 999; 
    TIM2->DIER |= (1 << 0); 
    TIM2->CR1  |= (1 << 0); 
    NVIC_ISER0 |= (1 << 28);
    NVIC_IPR[28] = (2 << 4);
}

void Init_EXTI_PA0(void) {
    SYSCFG->EXTICR[0] &= ~(0xF); 
    EXTI->RTSR |= (1 << 0); 
    NVIC_ISER0 |= (1 << 6);
    NVIC_IPR[6] = (3 << 4);
}

void TIM2_IRQHandler(void) {
    if (TIM2->SR & (1 << 0)) { 
        TIM2->SR &= ~(1 << 0); 
        system_millis++; 
        if (stopwatch_running) {
            ms_counter++;
            if (ms_counter % 1000 == 0) {
                flag_1s_update = 1;
            }
        }
    }
}

void USART1_IRQHandler(void) {
    if (USART1->SR & (1 << 5)) { 
        char c = USART1->DR;
        if (c == '\n' || c == '\r') {
            rx_buffer[rx_index] = '\0'; 
            flag_cmd_received = 1;      
            rx_index = 0;               
        } else {
            if (rx_index < UART_BUF_SIZE - 1) {
                rx_buffer[rx_index++] = c;
            }
        }
    }
}

void EXTI0_IRQHandler(void) {
    if (EXTI->PR & (1 << 0)) { 
        EXTI->PR |= (1 << 0);  
        if ((system_millis - last_button_press) > 200) {
            
            stopwatch_running = !stopwatch_running;
            
            if(stopwatch_running) UART_SendString("BTN: START\r\n");
            else UART_SendString("BTN: STOP\r\n");
            last_button_press = system_millis;
        }
    }
}

int main(void) {
    Init_Clock();
    Init_GPIO();
    Init_TIM2();
    Init_USART1();
    Init_EXTI_PA0();

    UART_SendString("System Ready. Waiting for commands...\r\n");

			while (1) {
        if (flag_cmd_received) {
            flag_cmd_received = 0;
            if (strcmp((char*)rx_buffer, "START") == 0) {
                stopwatch_running = 1;
                UART_SendString("CMD: STARTED\r\n");
            } 
            else if (strcmp((char*)rx_buffer, "STOP") == 0) {
                stopwatch_running = 0;
                UART_SendString("CMD: STOPPED\r\n");
            } 
            else if (strcmp((char*)rx_buffer, "RESET") == 0) {
                stopwatch_running = 1;
                ms_counter = 0;
                UART_SendString("CMD: RESET OK\r\n");
            } 
            else if (strcmp((char*)rx_buffer, "LAP") == 0) {
                if (lap_count < MAX_LAPS) {
                    laps[lap_count] = ms_counter;
                    FormatTime(ms_counter, msg_buf, MSG_BUF_SIZE);
                    
                    UART_SendString("LAP SAVED: ");
                    UART_SendString(msg_buf);
                    UART_SendString("\r\n");
                    lap_count++;
                } else {
                    UART_SendString("ERR: LAP MEMORY FULL\r\n");
                }
            }
            else if (strcmp((char*)rx_buffer, "LAPS?") == 0) {
                UART_SendString("--- LAP LIST ---\r\n");
                for (int i = 0; i < lap_count; i++) {
                    FormatTime(laps[i], msg_buf, MSG_BUF_SIZE);
                    char line[64];
                    snprintf(line, 64, "Lap %d: %s\r\n", i+1, msg_buf);
                    
                    UART_SendString(line);
                }
                UART_SendString("----------------\r\n");
            }
            else {
                UART_SendString("ERR: UNKNOWN CMD\r\n");
            }
        }
        if (flag_1s_update) {
            flag_1s_update = 0; 
            FormatTime(ms_counter, msg_buf, MSG_BUF_SIZE); 
            
            UART_SendString("TIME: ");
            UART_SendString(msg_buf);
            UART_SendString("\r\n");
        }
    }
}