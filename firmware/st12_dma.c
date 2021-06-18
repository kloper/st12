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
 * st12_dma.c -- DMA stuff for ST12
 *
 */
#include <stdlib.h>

#include <libopencm3/cm3/nvic.h>
#include <libopencm3/stm32/adc.h>
#include <libopencm3/stm32/dma.h>
#include <libopencm3/stm32/rcc.h>

#include "st12.h"
#include "st12_adc.h"
#include "st12_dma.h"

void dma1_channel1_isr(void) {
  adc_update_collectors();
  dma_clear_interrupt_flags(DMA1, DMA_CHANNEL1, DMA_TCIF);
}

void dma_init(void) {
  rcc_periph_clock_enable(RCC_DMA1);

  dma_channel_reset(DMA1, DMA_CHANNEL1);
  dma_set_peripheral_address(DMA1, DMA_CHANNEL1, (uint32_t)&ADC1_DR);
  dma_set_memory_address(DMA1, DMA_CHANNEL1,
                         (uint32_t)adc_get_raw_values(NULL));
  dma_set_number_of_data(DMA1, DMA_CHANNEL1, ST12_ADC_NCHANNELS);
  dma_set_read_from_peripheral(DMA1, DMA_CHANNEL1);
  dma_enable_memory_increment_mode(DMA1, DMA_CHANNEL1);
  dma_set_peripheral_size(DMA1, DMA_CHANNEL1, DMA_CCR_PSIZE_16BIT);
  dma_set_memory_size(DMA1, DMA_CHANNEL1, DMA_CCR_MSIZE_16BIT);
  dma_set_priority(DMA1, DMA_CHANNEL1, DMA_CCR_PL_MEDIUM);
  dma_enable_transfer_complete_interrupt(DMA1, DMA_CHANNEL1);
  dma_enable_circular_mode(DMA1, DMA_CHANNEL1);

  dma_enable_channel(DMA1, DMA_CHANNEL1);

  nvic_set_priority(NVIC_DMA1_CHANNEL1_IRQ, 2);
  nvic_enable_irq(NVIC_DMA1_CHANNEL1_IRQ);
}

/*
 * end of file
 */
