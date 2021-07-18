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
 * st12_rotary.c -- ST12 rotary encoder stuff
 *
 */
#include <libopencm3/cm3/nvic.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/timer.h>
#include <libopencm3/stm32/gpio.h>

#include <stdint.h>

#include "st12.h"
#include "st12_gpio.h"
#include "st12_rotary.h"

static uint8_t g_scheduled = 0;
static uint8_t g_rotary_state = 0;
static int32_t g_rotary_counter = 0;
static uint32_t g_press_counter = 0;

#define BIT(s,b) (~((s)>>(b))&1)

void tim3_isr(void) {
  uint16_t rotary_state = gpio_get_rotary_state();

  if(BIT(rotary_state, 7)) {
    g_press_counter++;
  } else {
    g_rotary_state =
        ((g_rotary_state & 0x3) << 2) |
        (BIT(rotary_state, 5) << 1) |
        BIT(rotary_state, 6);
    switch(g_rotary_state) {
      case 0b0111:
        g_rotary_counter++;
        break;
      case 0b1011:
        g_rotary_counter--;
        break;
      default:
        break;
    }
  }
  
  g_scheduled = 0;

  timer_clear_flag(TIM3, TIM_SR_UIF);
}

void rotary_init(void) {
  rcc_periph_clock_enable(RCC_TIM3);
  rcc_periph_reset_pulse(RST_TIM3);

  timer_enable_update_event(TIM3);
  timer_direction_up(TIM3);
  timer_enable_irq(TIM3, TIM_DIER_UIE);  
  timer_set_counter(TIM3, 0);
  timer_set_prescaler(TIM3, 512-1);
  timer_set_period(TIM3, 212); 
  timer_one_shot_mode(TIM3);
  
  nvic_set_priority(NVIC_TIM3_IRQ, 2);
  nvic_enable_irq(NVIC_TIM3_IRQ);
}

void rotary_update_state(void) {
  if(!g_scheduled) {
    g_scheduled = 1;
    timer_enable_counter(TIM3);
  }
}

int32_t rotary_get_counter(void) {
  return g_rotary_counter;
}

uint32_t rotary_get_press_counter(void) {
  return g_press_counter;
}

/* 
 * end of file
 */
