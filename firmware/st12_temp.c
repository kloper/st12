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
 * st12_temp.c -- ST12 temperature calculations
 *
 */

#include <stdint.h>
#include <stdlib.h>

#include "st12.h"
#include "st12_config.h"
#include "st12_linapprox.h"
#include "st12_temp.h"

static point_t t_sense_to_temp_celsius[] = {
    {0, 0},
    {30, 15106},
    {87, 42130},
    {198, 91840},
    {343, 152422},
    {500, 214252},
    {602, 252958},
    {801, 325892},
    {1003, 397563},
    {1298, 499461}};

static point_t cj_sense_to_t_sense[] = {
  {225, 217},
  {281, 198},
  {337, 183},
  {417, 166},
  {486, 154},
  {576, 141},
  {693, 127},
  {942, 104},
  {1243, 83},
  {1602, 63},
  {2046, 42},
  {3017, 0}
};

static const size_t cj_sense_to_t_sense_size =
    sizeof(cj_sense_to_t_sense) / sizeof(point_t);
static const size_t t_sense_to_temp_celsius_size =
    sizeof(t_sense_to_temp_celsius) / sizeof(point_t);

int32_t temp_convert(const st12_config_t *config,
                     const st12_adc_values_t *adc_values) {
  int32_t cj_t_sense = linapprox(cj_sense_to_t_sense, cj_sense_to_t_sense_size,
                                 adc_values->cj_sense);
  int32_t t_sense =
      (adc_values->t_sense + cj_t_sense) * \
      config->temp_scale / 1000 + config->temp_offset;
  
  return linapprox(t_sense_to_temp_celsius, t_sense_to_temp_celsius_size,
                   t_sense);
}

/*
 * end of file
 */
