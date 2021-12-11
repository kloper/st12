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

int i2c_send(const uint8_t addr,
             const uint8_t *packet,
             const uint8_t size,
             const uint8_t send_stop) {
  I2C_ICR(I2C1) |= I2C_ICR_ADDRCF | I2C_ICR_NACKCF | I2C_ICR_BERRCF;    

  i2c_set_7bit_address(I2C1, addr);
  i2c_set_write_transfer_dir(I2C1);
  i2c_set_bytes_to_transfer(I2C1, size);
  i2c_disable_autoend(I2C1);
  
  int count;
  int res = 1;  

  i2c_send_start(I2C1);
  
  for(size_t i = 0; i < size; i++) {
    count = 10000;
    while(!i2c_nack(I2C1) && !i2c_transmit_int_status(I2C1) && --count);
    if(i2c_nack(I2C1) || !count) {
        res = 0;
        break;
    }
    i2c_send_data(I2C1, packet[i]);
  }

  count = 10000;
  while(!i2c_nack(I2C1) & !i2c_transfer_complete(I2C1) && --count);
  if(i2c_nack(I2C1) || !count) 
    res = 0;

  if(send_stop) 
    i2c_send_stop(I2C1);  

  return res;
}

int i2c_recv(const uint8_t addr, uint8_t *packet, const uint8_t size) {
    I2C_ICR(I2C1) |= I2C_ICR_ADDRCF | I2C_ICR_NACKCF | I2C_ICR_BERRCF;    

  i2c_set_7bit_address(I2C1, addr);
  i2c_set_read_transfer_dir(I2C1);
  i2c_set_bytes_to_transfer(I2C1, size);
  i2c_disable_autoend(I2C1);
  
  int res = 1;
  
  i2c_send_start(I2C1);  
  for(size_t i = 0; i < size; i++) {
    int count = 10000;
    while(!i2c_nack(I2C1) && !i2c_received_data(I2C1) && --count);
    if(i2c_nack(I2C1) || !count) {
      res = 0;
      break;
    }
    packet[i] = i2c_get_data(I2C1);
  }

  i2c_send_stop(I2C1);
  return res;
}


/* 
 * end of file
 */
