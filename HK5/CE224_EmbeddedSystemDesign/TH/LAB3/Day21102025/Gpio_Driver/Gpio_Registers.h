#ifndef GPIO_REGISTER_H
#define GPIO_REGISTER_H

/** GPIO - Register Layout Typedef */
typedef struct {
    volatile unsigned int Reg;
	volatile unsigned int Reg2;
	volatile unsigned int Reg3;
	.......
} Gpio_Type;

/** Peripheral GPIOA base address */
#define GPIOD_BASE                               (xxxxx)

/** Peripheral GPIOA base pointer */
#define GPIOD    ((Gpio_Type *)GPIOD_BASE)

#endif
