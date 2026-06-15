#include <stdio.h>
#include <unistd.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "altera_avalon_timer_regs.h"
#include "sys/alt_irq.h"

const unsigned char hex_table[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};

volatile int s = 0, m = 0, h = 0;
volatile int ms_count = 0;
volatile int timer_running = 1;

void timer_isr(void* context) {
    IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE, 0);

    if (timer_running) {
        ms_count++;
        if (ms_count >= 1000) {
            ms_count = 0;
            s++;

            if (s >= 60) {
                s = 0; m++;
                if (m >= 60) {
                    m = 0; h++;
                    if (h >= 24) h = 0;
                }
            }
        }
    }
}

void init_timer() {
    IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE, 0x0008);
    IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE, 0);
    alt_ic_isr_register(TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID, TIMER_0_IRQ, timer_isr, NULL, 0);
    IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE, 0x0007);
}

int main() {
    init_timer();
    int last_sw = 0;

    while (1) {
        int sw_val = IORD_ALTERA_AVALON_PIO_DATA(PIO_SW_BASE);

        int adj_s = (sw_val >> 0) & 1;
        int adj_m = (sw_val >> 1) & 1;
        int adj_h = (sw_val >> 2) & 1;
        int res_s = (sw_val >> 3) & 1;
        int res_m = (sw_val >> 4) & 1;
        int res_h = (sw_val >> 5) & 1;

        if (adj_s || adj_m || adj_h) timer_running = 0;
        else timer_running = 1;

        if (res_s) { s = 0; ms_count = 0; }
        if (res_m) { m = 0; ms_count = 0; }
        if (res_h) { h = 0; ms_count = 0; }

        if (adj_s && !((last_sw >> 0) & 1)) { s++; ms_count = 0; if(s>=60) s=0; }
        if (adj_m && !((last_sw >> 1) & 1)) { m++; ms_count = 0; if(m>=60) m=0; }
        if (adj_h && !((last_sw >> 2) & 1)) { h++; ms_count = 0; if(h>=24) h=0; }

        last_sw = sw_val;

        unsigned int hex_ms_data = 0;
        unsigned int hex_h_data = 0;

        hex_ms_data |= (hex_table[s % 10] << 0);
        hex_ms_data |= (hex_table[s / 10] << 8);
        hex_ms_data |= (hex_table[m % 10] << 16);
        hex_ms_data |= (hex_table[m / 10] << 24);

        hex_h_data |= (hex_table[h % 10] << 0);
        hex_h_data |= (hex_table[h / 10] << 8);


        IOWR_ALTERA_AVALON_PIO_DATA(PIO_HEX_MS_BASE, hex_ms_data);
        IOWR_ALTERA_AVALON_PIO_DATA(PIO_HEX_H_BASE, hex_h_data);

        usleep(10000);
    }
    return 0;
}
