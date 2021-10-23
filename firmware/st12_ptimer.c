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
 * st12_ptimer.c -- Periodic timer for ST12
 *
 */
#include <libopencm3/cm3/nvic.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/timer.h>

#include "st12.h"
#include "st12_adc.h"
#include "st12_ptimer.h"

static volatile uint32_t g_timer_count = 0;

void tim14_isr(void) {
  adc_update_values();
  
  g_timer_count++;
  
  timer_clear_flag(TIM14, TIM_SR_UIF);
}

void periodic_timer_init(void) {
  rcc_periph_clock_enable(RCC_TIM14);
  rcc_periph_reset_pulse(RST_TIM14);

  timer_set_clock_division(TIM14, TIM_CR1_CKD_CK_INT);
  timer_enable_update_event(TIM14);
  timer_direction_up(TIM14);
  timer_enable_irq(TIM14, TIM_DIER_UIE);
  timer_set_counter(TIM14, 0);
  timer_set_prescaler(TIM14, 128 - 1);
  timer_set_period(TIM14, 375 - 1);
  timer_enable_counter(TIM14);

  nvic_set_priority(NVIC_TIM14_IRQ, 1);
  nvic_enable_irq(NVIC_TIM14_IRQ);
}

void periodic_timer_get_state(st12_adc_values_t *state) {
  timer_disable_irq(TIM14, TIM_DIER_UIE);
  adc_get_state(state);
  state->count = g_timer_count;  
  timer_enable_irq(TIM14, TIM_DIER_UIE);
}

uint32_t periodic_timer_get_count(void) {
  return g_timer_count;
}

/* 
 * end of file
 */
