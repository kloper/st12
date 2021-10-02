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
#include "st12_i2c.h"

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

static int query(pato_packet_t *request) {
  int rc = i2c_send(PATO_I2C_ADDR,
                    (uint8_t*)request,
                    sizeof(pato_packet_t),
                    1);
  for(int i = 0; i < 1000; i++);
  return rc;
}

int display_ctrl(int display_on, int cursor_on, int blink_on) {
  pato_packet_t request = {0};
  
  request.cmd = PATO_CMD_DIRECT;
  request.data0 = HD44780_CMD_DISPLAY;
  request.data1 = 0x8 |
      (display_on? 0x4: 0) |
      (cursor_on? 0x2: 0)|
      (blink_on? 0x1: 0);
  request.crc = crc8((uint8_t*)&request, 3);
  request.zero = 0;

  return query(&request);
}

void display_print(char *str) {
  int len = strlen(str);
  pato_packet_t request = {0};
  int rc;
  
  request.cmd = PATO_CMD_PRINT_SETADDR;
  request.data0 = 0;
  request.data1 = 0;
  request.crc = crc8((uint8_t*)&request, 3);
  request.zero = 0;

  rc = query(&request);
  if(!rc)
    return;
  
  while(1) {
    request.cmd = PATO_CMD_PRINT_PUT;
    request.data0 = (*str != 0) ? *str++ : 0;    
    request.data1 = (*str != 0) ? *str++ : 0;
    request.crc = crc8((uint8_t*)&request, 3);
    request.zero = 0;

    rc = query(&request);
    if(!rc)
      return;
    
    if(*str == 0)
      break;
  }

  request.cmd = PATO_CMD_PRINT_COMMIT;
  request.data0 = 0;
  request.data1 = 0;
  request.crc = crc8((uint8_t*)&request, 3);
  request.zero = 0;

  query(&request);  
}

/* 
 * end of file
 */
