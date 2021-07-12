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
 * st12_gpio.c -- GPIO stuff for ST12
 *
 */

#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/rcc.h>

#include "st12_gpio.h"

void gpio_init(void) {
  rcc_periph_clock_enable(RCC_GPIOA);

  gpio_mode_setup(GPIOA, GPIO_MODE_ANALOG, GPIO_PUPD_NONE, GPIO0 | GPIO1 | GPIO3);  

  gpio_mode_setup(GPIOA, GPIO_MODE_AF, GPIO_PUPD_NONE, GPIO9 | GPIO10);  
  gpio_set_af(GPIOA, GPIO_AF4, GPIO9 | GPIO10);
  
  gpio_mode_setup(GPIOA, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO4);
}

void gpio_heater_control(uint8_t is_on) {
  if (is_on) {
    gpio_set(GPIOA, GPIO4);
  } else {
    gpio_clear(GPIOA, GPIO4);
  }
}

void gpio_heater_toggle(void) {
    gpio_toggle(GPIOA, GPIO4);
}

/*
 * end of file
 */
