/*
 * source.c
 *
 *  Created on: Mar 16, 2026
 *      Author: admin
 */

#include <stdio.h>
#include <system.h>
#include <unistd.h>

int main() {
    volatile int *sw_ptr   = (volatile int *) SWITCHES_0_BASE;
    volatile int *hex_ptr  = (volatile int *) DECODER_7_SEG_0_BASE;

    int current_val;
    int i;

    while (1) {
        current_val = *sw_ptr;
        *hex_ptr = current_val;

        usleep(100000);
    }

    return 0;
}


