/*
 * source.c
 *
 *  Created on: Mar 30, 2026
 *      Author: admin
 */

#include <stdio.h>
#include "system.h"

void main() {
    int data;
    int i;

    volatile int *mem_ptr = (volatile int *) MEMORY32X128_0_BASE;

    for (i = 0; i < 128; i++) {
        mem_ptr[i] = i;
    }

    for (i = 0; i < 128; i++) {
        data = mem_ptr[i];
        printf("data[%d] = %d\n", i, data);
    }
}


