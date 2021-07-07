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
 * st12_adc.h -- ADC stuff for ST12
 *
 */

#pragma once

#define ST12_ADC_ISENSE_CHAN 0
#define ST12_ADC_TSENSE_CHAN 1
#define ST12_ADC_CJ_CHAN 3
#define ST12_ADC_VREF_CHAN 17

#define ST12_ADC_ISENSE_INDEX 0
#define ST12_ADC_TSENSE_INDEX 1
#define ST12_ADC_CJ_INDEX 2
#define ST12_ADC_VREF_INDEX 3

#define ST12_VREF_CALIB (*(uint16_t *)0x1FFFF7BA)

#define ST12_ADC_NCHANNELS (ST12_ADC_VREF_INDEX + 1)

extern void adc_init(void);
extern void adc_update_collectors(void);
extern void adc_update_values(void);
extern volatile uint16_t *adc_get_raw_values(uint32_t *size);
extern volatile int32_t *adc_get_values(uint32_t *size);
extern void adc_get_state(st12_adc_values_t *state);
extern void adc_clear_collectors(void);
/*
 * end of file
 */
