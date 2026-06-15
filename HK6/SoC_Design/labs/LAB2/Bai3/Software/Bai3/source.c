/*
 * source.c
 *
 *  Created on: Mar 16, 2026
 *      Author: admin
 */

#include <stdio.h>
#include <system.h>

int main() {
    volatile short *switches_ptr = (volatile short *) SWITCHES_0_BASE;
    volatile short *red_leds_ptr = (volatile short *) RED_LEDS_0_BASE;

    short temp;

    while (1) {
        temp = *switches_ptr;
        *red_leds_ptr = temp;
    }

    return 0;
}




