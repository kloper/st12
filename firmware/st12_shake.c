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
 * st12_shake.c -- Shake sensor on base of TIM15 edge counter
 *
 */
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/timer.h>

#include "st12.h"
#include "st12_config.h"
#include "st12_shake.h"
#include "st12_ptimer.h"

static uint32_t g_last_shake_timestamp = 0;
static uint32_t g_shake_counter = 0;


void shake_update_state(void) {
  g_last_shake_timestamp = periodic_timer_get_count();
  g_shake_counter++;
}

int32_t shake_get_temperature(const st12_config_t *config, int *is_idle) {
  uint32_t timestamp = periodic_timer_get_count();
  if(g_last_shake_timestamp == 0)
    g_last_shake_timestamp = timestamp;
  
  if(!g_last_shake_timestamp ||
     timestamp - g_last_shake_timestamp < config->idle_timeout) {
    *is_idle = 0;
    return config->target_temperature;
  }
  *is_idle = 1;
  return MIN(config->idle_temperature, config->target_temperature);
}

/* 
 * end of file
 */
