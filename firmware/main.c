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
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include <libopencm3/stm32/adc.h>
#include <libopencm3/stm32/rcc.h>

#include "st12.h"
#include "st12_adc.h"
#include "st12_dma.h"
#include "st12_gpio.h"
#include "st12_ptimer.h"
#include "st12_temp.h"
#include "st12_i2c.h"
#include "st12_config.h"
#include "st12_display.h"
#include "st12_rotary.h"

typedef enum _main_loop_state {
  STATE_IDLE,
  STATE_MEASURE_WAIT  
} main_loop_state_t;

int main(void) {
  const st12_config_t *config = NULL;

  //rcc_clock_setup_in_hse_8mhz_out_48mhz();
  rcc_clock_setup_in_hsi_out_48mhz();
  gpio_init();
  dma_init();
  adc_init();
  i2c_init();
  rotary_init();
  periodic_timer_init();
  config_init();

  config = config_get();
  
  adc_start_conversion_regular(ADC1);

  st12_adc_values_t adc_state = {0};
  main_loop_state_t state = STATE_IDLE;
  uint32_t idle_state_count = 0;
  uint32_t wait_state_count = 0;
  uint32_t prev_count = 0;
  uint32_t count = 0;
  int32_t temp = 0;
  char buffer[40];
  
  while (1) {
    if(temp > 0 && (idle_state_count == 0 || wait_state_count == 0)) {
      display_ctrl(1, 0, 0);
      snprintf(buffer, sizeof(buffer), "\f  %03ld [%03ld]\n  %ld %lu",
               temp / 1000, config->target_temperature / 1000,
               rotary_get_counter(), rotary_get_press_counter());
      
      display_print(buffer);
    }
    
    periodic_timer_get_state(&adc_state);
    
    count = adc_state.count - prev_count;
    prev_count = adc_state.count;

    
    switch(state) {
      case STATE_IDLE: {
        idle_state_count += count;
        if(idle_state_count >= config->overshoot_period_width) {
          idle_state_count = 0;
          state = STATE_MEASURE_WAIT;
          gpio_heater_control(0);
        }         
      } break;
      case STATE_MEASURE_WAIT: {
        wait_state_count += count;
        if(wait_state_count >= config->measure_period_width) {
          wait_state_count = 0;
          temp = temp_convert(&adc_state);
          temp = (prev_count % 100) * 1000;
          if(temp <= config->target_temperature) {            
            gpio_heater_control(1);
            state = STATE_IDLE;                      
          }
        }
      } break;        
    }
    __asm__("wfi");
  }
}

/*
 * end of file
 */
