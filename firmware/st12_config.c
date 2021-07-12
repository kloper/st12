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
 * st12_config.c -- ST12 persistent configuration, based on EEPROM
 *
 */
#include <string.h>

#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/i2c.h>
#include <libopencm3/stm32/crc.h>

#include "st12.h"
#include "st12_config.h"

#define CONFIG_I2C_OFFSET 0
#define CONFIG_I2C_ADDR 0x50
#define CONFIG_I2C_BADDR 0x54

typedef struct _st12_config_packet {
  uint16_t alignment_bytes1;
  uint16_t addr;
  st12_config_t config;
  uint32_t alignment_bytes2;
} st12_config_packet_t;

static st12_config_packet_t g_config_packet = {0};
static st12_config_t *g_config = &g_config_packet.config;

static uint32_t config_get_crc(void) {
  crc_reset();
  return crc_calculate_block(
      (uint32_t*)((uint8_t*)g_config + sizeof(g_config->crc)),
      (sizeof(st12_config_t) -
       sizeof(g_config->crc) +
       sizeof(uint32_t) - 1) / sizeof(uint32_t)
  );
}

static void config_default(void) {
  g_config->target_temperature = 100000; // Milli-Celsius
  g_config->overshoot_period_width = 300; // milliseconds (periodic timer period)
  g_config->measure_period_width = 25; // milliseconds (period timer period)  
  g_config->crc = config_get_crc();
}

void config_save(void) {
  i2c_transfer7(
      I2C1, CONFIG_I2C_ADDR,
      (uint8_t*)&g_config_packet.addr,
      sizeof(g_config_packet.addr) + sizeof(g_config_packet.config),
      NULL, 0
  );
}

const st12_config_t *config_get(void) {
  return g_config;
}

void config_init() {
  rcc_periph_clock_enable(RCC_CRC);

  g_config_packet.addr = CONFIG_I2C_OFFSET;
  i2c_transfer7(
      I2C1, CONFIG_I2C_ADDR,
      (uint8_t*)&g_config_packet.addr, sizeof(g_config_packet.addr),
      (uint8_t*)&g_config_packet.config, sizeof(g_config_packet.config)
  );
  uint32_t crc = config_get_crc();
  if(crc != g_config->crc) {
    config_default();
    config_save();
  }
}

static void config_write_field(size_t offset, size_t size) {
  struct {
    uint16_t alignment_bytes1;
    uint16_t addr;
    uint8_t  data[MAX(size, sizeof(g_config->crc))];
    uint32_t alignment_bytes2;
  } packet;

  packet.addr = CONFIG_I2C_OFFSET + offset;
  memcpy((char*)packet.data, (char*)g_config + offset, size);
  
  i2c_transfer7(
      I2C1, CONFIG_I2C_ADDR,
      (uint8_t*)&packet.addr, sizeof(packet.addr) + size,
      NULL, 0
  );

  packet.addr = CONFIG_I2C_OFFSET;
  memcpy((char*)packet.data, (char*)&g_config->crc, sizeof(g_config->crc));
  
  i2c_transfer7(
      I2C1, CONFIG_I2C_ADDR,
      (uint8_t*)&packet.addr, sizeof(packet.addr) + sizeof(g_config->crc),
      NULL, 0
  );  
}

void config_set_target_temperature(int32_t temp) {
  g_config->target_temperature = temp;
  g_config->crc = config_get_crc();
  config_write_field(offsetof(st12_config_t, target_temperature),
                     sizeof(g_config->target_temperature));
}

void config_set_overshoot_period_width(uint32_t width) {
  g_config->overshoot_period_width = width;
  g_config->crc = config_get_crc();  
  config_write_field(offsetof(st12_config_t, overshoot_period_width),
                     sizeof(g_config->overshoot_period_width));
  
}

void config_set_measure_period_width(uint32_t width) {
  g_config->measure_period_width = width;
  g_config->crc = config_get_crc();    
  config_write_field(offsetof(st12_config_t, measure_period_width),
                     sizeof(g_config->measure_period_width));
}


/* 
 * end of file
 */