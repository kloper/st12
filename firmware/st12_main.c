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
#include "st12_config.h"
#include "st12_adc.h"
#include "st12_dma.h"
#include "st12_gpio.h"
#include "st12_ptimer.h"
#include "st12_temp.h"
#include "st12_i2c.h"
#include "st12_display.h"
#include "st12_rotary.h"
#include "st12_current.h"
#include "st12_shake.h"
#include "st12_term.h"
#include "st12_menu.h"

typedef enum _main_loop_state {
  STATE_HEATING,
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
  main_loop_state_t state = STATE_HEATING;
  uint32_t idle_state_count = 0;
  uint32_t wait_state_count = 0;
  uint32_t print_count = 0;
  uint32_t prev_count = 0;
  uint32_t count = 0;
  int32_t rotary_counter = 0;
  uint32_t rotary_press_counter = 0;

  term_st12_temp_label_t st12_temp_label;
  term_st12_menu_t st12_menu;  
  term_frame_t root_frame;
  int disable_heater = 0;
  
  term_st12_temp_label_init(&st12_temp_label, config);
  term_st12_menu_init(&st12_menu);
  term_frame_init(&root_frame);

  term_frame_add_child(&root_frame, (term_widget_t*)&st12_temp_label, 1);
  term_frame_add_child(&root_frame, (term_widget_t*)&st12_menu, 0);
  
  while (1) {
    if( print_count++ % 2000 == 0 ) {      
      display_ctrl(1, 0, 0);
      term_frame_render(&root_frame);
    }
    
    periodic_timer_get_state(&adc_state);

    count = adc_state.count - prev_count;
    prev_count = adc_state.count;

    st12_temp_label.current = current_convert(config, &adc_state);

    // overcurrent protection
    if(st12_temp_label.current >= 2600) {
      gpio_heater_control(0);          
      disable_heater = 1;
      st12_temp_label.overcurrent = 1;
    }
    
    switch(state) {
      case STATE_HEATING: {
        idle_state_count += count;
        if(idle_state_count >= config->overshoot_period_width) {
          idle_state_count = 0;
          gpio_heater_control(0);          
          state = STATE_MEASURE_WAIT;
        }
      } break;
      case STATE_MEASURE_WAIT: {
        wait_state_count += count;
        if(wait_state_count >= config->measure_period_width) {
          wait_state_count = 0;
          st12_temp_label.temperature = temp_convert(config, &adc_state);
          if(!disable_heater &&
             st12_temp_label.temperature <=
             shake_get_temperature(config, &st12_temp_label.is_idle))
          {            
            gpio_heater_control(1);
            //gpio_heater_control(0);
            state = STATE_HEATING;                      
          }
        }
      } break;        
    }

    int32_t counter = rotary_get_counter();

    if(counter < rotary_counter) {
      term_frame_dispatch(&root_frame, BACKWARD, rotary_counter - counter);
      rotary_counter = counter; 
    }

    if(counter > rotary_counter) {
      term_frame_dispatch(&root_frame, FORWARD, counter - rotary_counter);
      rotary_counter = counter; 
    }
    
    uint32_t press_counter = rotary_get_press_counter();
    if(press_counter > rotary_press_counter) {
      term_frame_dispatch(&root_frame, PRESS,
                          press_counter - rotary_press_counter);
      rotary_press_counter = press_counter; 
    }
    
    __asm__("wfi");
  }
}

/*
 * end of file
 */
