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
 * st12_i2c.c -- I2C configuration for ST12
 *
 */

#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/i2c.h>

#include "st12.h"
#include "st12_i2c.h"

void i2c_init(void) {
  rcc_periph_clock_enable(RCC_I2C1);
  
  i2c_peripheral_disable(I2C1);
  i2c_set_speed(I2C1, i2c_speed_sm_100k, 16 /* rcc_apb1_frequency / 1000000 */);
  i2c_enable_analog_filter(I2C1);
  i2c_set_digital_filter(I2C1, 1);
  i2c_disable_stretching(I2C1);
  i2c_set_7bit_addr_mode(I2C1);
  i2c_peripheral_enable(I2C1);  
}

/* 
 * end of file
 */
