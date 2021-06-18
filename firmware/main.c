/* -*- C -*-
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301, USA.
 *
 * Copyright (c) 2021 Dimitry Kloper <kloper@users.sf.net>
 *
 * main.c -- Main file for ST12
 *
 */

#include <libopencm3/stm32/adc.h>
#include <libopencm3/stm32/rcc.h>

#include "st12.h"
#include "st12_adc.h"
#include "st12_dma.h"
#include "st12_gpio.h"
#include "st12_ptimer.h"

int main(void) {
  for (int i = 0; i < 100000; i++) {	
    __asm__("nop");
  }
  
  rcc_clock_setup_in_hse_8mhz_out_48mhz();

  gpio_init();
  dma_init();
  adc_init();
  periodic_timer_init();
  
  adc_start_conversion_regular(ADC1);

  st12_adc_values_t state = {0};  
  while (1) {
    periodic_timer_get_state(&state);
    __asm__("wfi");
  }
}

/*
 * end of file
 */
