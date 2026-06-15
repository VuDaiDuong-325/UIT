/*
 * source.c
 *
 *  Created on: Mar 20, 2026
 *      Author: admin
 */

#include <stdio.h>
#include <system.h>

typedef struct {
    volatile int a;
    volatile int b;
    volatile int x;
    volatile int result;
} Compute_Regs;

int main() {
    Compute_Regs *compute_ptr = (Compute_Regs *) COMPUTE_0_BASE;

    int val_a, val_b, val_x, val_y;

    val_a = 2 & 0xf;
    val_b = 3 & 0xf;
    val_x = 5 & 0xf;

    compute_ptr->a = val_a;
    compute_ptr->b = val_b;
    compute_ptr->x = val_x;

    val_y = compute_ptr->result;

    printf("y = %d*x + %d = %d, x = %d\n", val_a, val_b, val_y, val_x);

    while(1);
}





