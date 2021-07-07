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
 * st12_adc.c -- ADC stuff for ST12
 *
 */

#include <stdlib.h>
#include <string.h>

#include <libopencm3/cm3/nvic.h>
#include <libopencm3/stm32/adc.h>
#include <libopencm3/stm32/rcc.h>

#include "st12.h"
#include "st12_adc.h"
#include "st12_gpio.h"

/**
 * @brief Array of ADC channels read in a single ADC scan
 *
 * This includes the internal reference channel for later Vdd compensation.
 */
static volatile uint16_t g_adc_raw_values[ST12_ADC_NCHANNELS] = {0};

/**
 * @brief Array of voltage compensated ADC channel sums
 *
 * This array contains sums of voltage compensated ADC values for each
 * channel.
 *
 * Sums and @ref g_adc_count are updated by DMA completion interrupt.
 *
 * Sums and @ref g_adc_count are cleared by periodic timer click,
 * while averages and differentials are propagated to @ref
 * g_adc_values. Internal voltage reference is omitted from this
 * array.
 */
static volatile uint32_t g_adc_collectors[ST12_ADC_NCHANNELS - 1] = {0};

/**
 * @brief Array of voltage compensated ADC channel averages and their
 * differentials
 *
 * This array is updated on every periodic timer tick.
 */
static volatile int32_t g_adc_values[(ST12_ADC_NCHANNELS - 1) * 2] = {0};

/**
 * @brief Count of completed ADC DMA requests.
 */
static volatile uint32_t g_adc_count = 0;

void adc_init(void) {
  uint8_t adc_channels[] = {ST12_ADC_ISENSE_CHAN, ST12_ADC_TSENSE_CHAN,
                            ST12_ADC_CJ_CHAN, ST12_ADC_VREF_CHAN};

  rcc_periph_clock_enable(RCC_ADC1);

  adc_power_off(ADC1);
  adc_set_clk_source(ADC1, ADC_CFGR2_CKMODE_PCLK_DIV4);
  adc_set_resolution(ADC1, ADC_CFGR1_RES_12_BIT);
  adc_set_operation_mode(ADC1, ADC_MODE_SCAN);
  adc_set_continuous_conversion_mode(ADC1);
  adc_disable_external_trigger_regular(ADC1);
  adc_set_right_aligned(ADC1);
  adc_set_sample_time_on_all_channels(ADC1, ADC_SMPR_SMP_239DOT5);
  adc_set_regular_sequence(ADC1, ST12_ADC_NCHANNELS, adc_channels);
  adc_enable_dma_circular_mode(ADC1);
  adc_enable_vrefint();
  adc_calibrate(ADC1);
  adc_clear_eoc_sequence_flag(ADC1);
  adc_enable_dma(ADC1);
  adc_power_on(ADC1);
}

void adc_clear_collectors(void) {
  for (int i = 0; i < ST12_ADC_NCHANNELS - 1; i++) {
    g_adc_collectors[i] = 0;    
  }
  g_adc_count = 0;
}

void adc_update_collectors(void) {
  for (int i = 0; i < ST12_ADC_NCHANNELS - 1; i++) {
    g_adc_collectors[i] += (uint32_t)g_adc_raw_values[i] * ST12_VREF_CALIB /
                           (uint32_t)g_adc_raw_values[ST12_ADC_VREF_INDEX];
  }  
  g_adc_count++;
}

void adc_update_values(void) {  
  volatile uint32_t collectors[ST12_ADC_NCHANNELS - 1];
  volatile uint32_t adc_count = g_adc_count;
  
  if (adc_count != 0) {
    memcpy((char *)collectors, (char *)g_adc_collectors, sizeof(collectors));

    g_adc_count = 0;
    memset((char *)g_adc_collectors, 0, sizeof(g_adc_collectors));

    for (int i = 0; i < ST12_ADC_NCHANNELS - 1; i++) {
      int32_t value = collectors[i] / adc_count;
      g_adc_values[2 * i + 1] = value - g_adc_values[2 * i];
      g_adc_values[2 * i] = value;
    }
  }
}

volatile uint16_t *adc_get_raw_values(uint32_t *size) {
  if (size != NULL) {
    *size = sizeof(g_adc_raw_values);
  }
  return g_adc_raw_values;
}

volatile int32_t *adc_get_values(uint32_t *size) {
  if (size != NULL) {
    *size = sizeof(g_adc_values);
  }
  return g_adc_values;
}

void adc_get_state(st12_adc_values_t *state) {
  state->i_sense = g_adc_values[ST12_ADC_ISENSE_INDEX * 2];
  state->i_sense_der = g_adc_values[ST12_ADC_ISENSE_INDEX * 2 + 1];
  state->t_sense = g_adc_values[ST12_ADC_TSENSE_INDEX * 2];
  state->t_sense_der = g_adc_values[ST12_ADC_TSENSE_INDEX * 2 + 1];
  state->cj_sense = g_adc_values[ST12_ADC_CJ_INDEX * 2];
  state->cj_sense_der = g_adc_values[ST12_ADC_CJ_INDEX * 2 + 1];
}

/*
 * end of file
 */
