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
 * st12_nvic.h -- Exception handling for ST12
 *
 */

#pragma once

#define WWDG_ISR 1
#define PVD_ISR 2
#define RTC_ISR 3
#define FLASH_ISR 4
#define RCC_ISR 5
#define EXTI0_1_ISR 6
#define EXTI2_3_ISR 7
#define EXTI4_15_ISR 8
#define TSC_ISR 9
#define DMA1_CHANNEL1_ISR 10
#define DMA1_CHANNEL2_3_DMA2_CHANNEL1_2_ISR 11
#define DMA1_CHANNEL4_7_DMA2_CHANNEL3_5_ISR 12
#define ADC_COMP_ISR 13
#define TIM1_BRK_UP_TRG_COM_ISR 14
#define TIM1_CC_ISR 15
#define TIM2_ISR 16
#define TIM3_ISR 17
#define TIM6_DAC_ISR 18
#define TIM7_ISR 19
#define TIM14_ISR 20
#define TIM15_ISR 21
#define TIM16_ISR 22
#define TIM17_ISR 23
#define I2C1_ISR 24
#define I2C2_ISR 25
#define SPI1_ISR 26
#define SPI2_ISR 27
#define USART1_ISR 28
#define USART2_ISR 29
#define USART3_4_ISR 30
#define CEC_CAN_ISR 31
#define USB_ISR 32
#define NMI_ISR 33
#define HARD_FAULT_ISR 34

void wwdg_isr(void);
void pvd_isr(void);
void rtc_isr(void);
void flash_isr(void);
void rcc_isr(void);
void exti0_1_isr(void);
void exti2_3_isr(void);
void exti4_15_isr(void);
void tsc_isr(void);
void dma1_channel1_isr(void);
void dma1_channel2_3_dma2_channel1_2_isr(void);
void dma1_channel4_7_dma2_channel3_5_isr(void);
void adc_comp_isr(void);
void tim1_brk_up_trg_com_isr(void);
void tim1_cc_isr(void);
void tim2_isr(void);
void tim3_isr(void);
void tim6_dac_isr(void);
void tim7_isr(void);
void tim14_isr(void);
void tim15_isr(void);
void tim16_isr(void);
void tim17_isr(void);
void i2c1_isr(void);
void i2c2_isr(void);
void spi1_isr(void);
void spi2_isr(void);
void usart1_isr(void);
void usart2_isr(void);
void usart3_4_isr(void);
void cec_can_isr(void);
void usb_isr(void);
void nmi_handler(void);
void hard_fault_handler(void);

/* 
 * end of file
 */
