/*
 * source.c
 *
 *  Created on: Mar 20, 2026
 *      Author: admin
 */

#include <stdio.h>
#include "system.h"
#include <unistd.h>

int main()
{
    volatile int *sw_ptr      = (int *) SWITCHES_0_BASE;
    volatile int *compute_ptr = (int *) COMPUTE_0_BASE;
    volatile int *led_ptr     = (int *) LEDG_0_BASE;

    int sw, a, b, x, y;

    while(1)
    {
        sw = *sw_ptr;
        a =  sw        & 0xF;        // SW[3:0]
        b = (sw >> 4)  & 0xF;        // SW[7:4]
        x = (sw >> 8)  & 0xF;        // SW[11:8]

        *(compute_ptr + 0) = a;
        *(compute_ptr + 1) = b;
        *(compute_ptr + 2) = x;

        y = *(compute_ptr + 3);

        *led_ptr = y & 0xFF;

        usleep(100000); // 100ms
    }

    return 0;
}



