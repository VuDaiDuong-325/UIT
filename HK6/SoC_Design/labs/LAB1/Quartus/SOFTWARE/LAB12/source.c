/*
 * source.c
 *
 *  Created on: Mar 12, 2026
 *      Author: admin
 */

#include <system.h>
#include <io.h>

unsigned char hex_map[] = {
    0x40, 0x79, 0x24, 0x30, 0x19, 0x12, 0x02, 0x78,
    0x00, 0x10, 0x08, 0x03, 0x46, 0x21, 0x06, 0x0E
};

int main() {
    volatile unsigned char *led_ptr = (volatile unsigned char *) PIO_HEX_BASE;
    volatile unsigned char *sw_ptr  = (volatile unsigned char *) SWITCH_BASE;

    while(1) {
        unsigned char sw_data = *sw_ptr & 0x0F;
        *led_ptr = hex_map[sw_data];
    }
    return 0;
}

