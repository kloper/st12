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
 * st12_current.c -- ST12 current calculations
 *
 */

#include <stdint.h>

#include "st12.h"
#include "st12_config.h"
#include "st12_current.h"

int32_t current_convert(const st12_config_t *config,
                        const st12_adc_values_t *adc_values) {
  return (adc_values->i_sense * config->current_scale +
          config->current_offset) / 4096;
}

/* 
 * end of file
 */
