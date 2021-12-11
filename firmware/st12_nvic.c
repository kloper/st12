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
 * st11_nvic.c -- Exception handling for ST12
 *
 */

#include <stdint.h>

#include <libopencm3/cm3/scb.h>

#include "st12.h"
#include "st12_nvic.h"

static void unexpected_exception_handler(uint8_t id) {
  volatile int block = 1;
  volatile int _id = id;
  
  while(block);
}

void wwdg_isr(void) {
  unexpected_exception_handler(WWDG_ISR);
}

void pvd_isr(void) {
  unexpected_exception_handler(PVD_ISR);
}

void rtc_isr(void) {
  unexpected_exception_handler(RTC_ISR);
}

void flash_isr(void) {
  unexpected_exception_handler(FLASH_ISR);
}

void rcc_isr(void) {
  unexpected_exception_handler(RCC_ISR);
}

void exti0_1_isr(void) {
  unexpected_exception_handler(EXTI0_1_ISR);
}

void tsc_isr(void) {
  unexpected_exception_handler(TSC_ISR);
}


void dma1_channel2_3_dma2_channel1_2_isr(void) {
  unexpected_exception_handler(DMA1_CHANNEL2_3_DMA2_CHANNEL1_2_ISR);
}

void dma1_channel4_7_dma2_channel3_5_isr(void) {
  unexpected_exception_handler(DMA1_CHANNEL4_7_DMA2_CHANNEL3_5_ISR);
}

void adc_comp_isr(void) {
  unexpected_exception_handler(ADC_COMP_ISR);
}

void tim1_brk_up_trg_com_isr(void) {
  unexpected_exception_handler(TIM1_BRK_UP_TRG_COM_ISR);
}

void tim1_cc_isr(void) {
  unexpected_exception_handler(TIM1_CC_ISR);
}

void tim2_isr(void) {
  unexpected_exception_handler(TIM2_ISR);
}

void tim6_dac_isr(void) {
  unexpected_exception_handler(TIM6_DAC_ISR);
}

void tim7_isr(void) {
  unexpected_exception_handler(TIM7_ISR);
}

void tim15_isr(void) {
  unexpected_exception_handler(TIM15_ISR);
}

void tim16_isr(void) {
  unexpected_exception_handler(TIM16_ISR);
}

void tim17_isr(void) {
  unexpected_exception_handler(TIM17_ISR);
}

void i2c1_isr(void) {
  unexpected_exception_handler(I2C1_ISR);
}

void i2c2_isr(void) {
  unexpected_exception_handler(I2C2_ISR);
}

void spi1_isr(void) {
  unexpected_exception_handler(SPI1_ISR);
}

void spi2_isr(void) {
  unexpected_exception_handler(SPI2_ISR);
}

void usart1_isr(void) {
  unexpected_exception_handler(USART1_ISR);
}

void usart2_isr(void) {
  unexpected_exception_handler(USART2_ISR);
}

void usart3_4_isr(void) {
  unexpected_exception_handler(USART3_4_ISR);
}

void cec_can_isr(void) {
  unexpected_exception_handler(CEC_CAN_ISR);
}

void usb_isr(void) {
  unexpected_exception_handler(USB_ISR);
}

void nmi_handler(void) {
  unexpected_exception_handler(NMI_ISR);
}

void hard_fault_handler(void) {
  //scb_reset_system();
  unexpected_exception_handler(HARD_FAULT_ISR);
}


/* 
 * end of file
 */
