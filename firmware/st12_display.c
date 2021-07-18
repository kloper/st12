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
 * st12_display.c -- Display interface for ST12
 *
 */

#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include <libopencm3/stm32/i2c.h>

#include "st12.h"
#include "st12_display.h"

#define PATO_I2C_ADDR 0x41

#define PATO_CMD_DIRECT 0x01
#define PATO_CMD_PRINT_PUT 0x07
#define PATO_CMD_PRINT_COMMIT  0x08
#define PATO_CMD_PRINT_SETADDR 0x05

#define HD44780_CMD_DISPLAY 0x04

typedef struct _pato_packet {
  uint8_t cmd;
  uint8_t data0;
  uint8_t data1;
  uint8_t crc;
  uint8_t zero;
} pato_packet_t;

static uint8_t _crc(uint8_t crc, uint8_t data)
 {
     uint8_t i;

     crc = crc ^ data;
     for (i = 0; i < 8; i++)
     {
         if (crc & 0x01)
             crc = (crc >> 1) ^ 0x8C;
         else
             crc >>= 1;
     }

     return crc;
 }

static uint8_t crc8(uint8_t *ptr, uint16_t size)
{
   uint8_t crc = 0;

   while(size--) {
      crc = _crc(crc, *ptr);
      ptr++;
   }

   return crc;
}

static void send_packet(pato_packet_t *packet) {
  i2c_set_7bit_address(I2C1, PATO_I2C_ADDR);
  i2c_set_write_transfer_dir(I2C1);
  i2c_set_bytes_to_transfer(I2C1, sizeof(pato_packet_t));
  i2c_disable_autoend(I2C1);

  i2c_send_start(I2C1);
  while(!i2c_transmit_int_status(I2C1));
  i2c_send_data(I2C1, packet->cmd);
  while(!i2c_transmit_int_status(I2C1));
  i2c_send_data(I2C1, packet->data0);
  while(!i2c_transmit_int_status(I2C1));
  i2c_send_data(I2C1, packet->data1);
  while(!i2c_transmit_int_status(I2C1));
  i2c_send_data(I2C1, packet->crc);
  while(!i2c_transmit_int_status(I2C1));
  i2c_send_data(I2C1, packet->zero);
  while (!i2c_transfer_complete(I2C1));
  i2c_send_stop(I2C1);
}

static void recv_packet(pato_packet_t *packet) {
  i2c_set_7bit_address(I2C1, PATO_I2C_ADDR);
  i2c_set_read_transfer_dir(I2C1);
  i2c_set_bytes_to_transfer(I2C1, sizeof(pato_packet_t));
  i2c_disable_autoend(I2C1);

  i2c_send_start(I2C1);  
  while (!i2c_received_data(I2C1));
  packet->cmd = i2c_get_data(I2C1);
  while (!i2c_received_data(I2C1));
  packet->data0 = i2c_get_data(I2C1);
  while (!i2c_received_data(I2C1));
  packet->data1 = i2c_get_data(I2C1);
  while (!i2c_received_data(I2C1));
  packet->crc = i2c_get_data(I2C1);
  while (!i2c_received_data(I2C1));
  packet->zero = i2c_get_data(I2C1);
  i2c_send_stop(I2C1);
}

void display_ctrl(int display_on, int cursor_on, int blink_on) {
  pato_packet_t request = {0};
  pato_packet_t reply = {0};

  request.cmd = PATO_CMD_DIRECT;
  request.data0 = HD44780_CMD_DISPLAY;
  request.data1 = 0x8 |
      (display_on? 0x4: 0) |
      (cursor_on? 0x2: 0)|
      (blink_on? 0x1: 0);
  request.crc = crc8((uint8_t*)&request, 3);
  request.zero = 0;

  send_packet(&request);
  for(volatile int i = 0; i < 10000; i++);
  recv_packet(&reply);    
}

void display_print(char *str) {
  int len = strlen(str);
  pato_packet_t request = {0};
  pato_packet_t reply = {0};

  request.cmd = PATO_CMD_PRINT_SETADDR;
  request.data0 = 0;
  request.data1 = 0;
  request.crc = crc8((uint8_t*)&request, 3);
  request.zero = 0;

  send_packet(&request);
  for(volatile int i = 0; i < 10000; i++);
  recv_packet(&reply);  
  
  while(1) {
    request.cmd = PATO_CMD_PRINT_PUT;
    request.data0 = (*str != 0) ? *str++ : 0;    
    request.data1 = (*str != 0) ? *str++ : 0;
    request.crc = crc8((uint8_t*)&request, 3);
    request.zero = 0;

    send_packet(&request);
    for(volatile int i = 0; i < 10000; i++);
    recv_packet(&reply);
    
    if(*str == 0)
      break;
  }

  request.cmd = PATO_CMD_PRINT_COMMIT;
  request.data0 = 0;
  request.data1 = 0;
  request.crc = crc8((uint8_t*)&request, 3);
  request.zero = 0;

  send_packet(&request);
  for(volatile int i = 0; i < 10000; i++);
  recv_packet(&reply);  
}

/* 
 * end of file
 */
