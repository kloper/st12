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
 * st12_config.h -- ST12 persistent configuration, based on EEPROM
 *
 */

#pragma once

#define FLASH_ADDR(addr) ((((addr) & 0xff) << 8) | (((addr) & 0xff00) >> 8))

typedef struct _st12_config {
  uint32_t crc;
  int32_t target_temperature;
  uint32_t overshoot_period_width;
  uint32_t measure_period_width;
  uint32_t temp_scale;
  int32_t temp_offset;
} st12_config_t;

const st12_config_t *config_get(void);
void config_init(void);
void config_save(void);
void config_set_target_temperature(int32_t temp);
void config_set_temperature_scale(uint32_t scale);
void config_set_temperature_offset(int32_t offset);
void config_set_overshoot_period_width(uint32_t width);
void config_set_measure_period_width(uint32_t width);


/* 
 * end of file
 */
