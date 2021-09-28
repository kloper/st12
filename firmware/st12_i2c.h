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
 * st12_i2c.h -- I2C configuration for ST12
 *
 */

#pragma once

extern void i2c_init(void);
extern int i2c_send(const uint8_t addr,
                    const uint8_t *packet,
                    const uint8_t size,
                    const uint8_t send_stop);
extern int i2c_recv(const uint8_t addr,
                    uint8_t *packet,
                    const uint8_t size);

/* 
 * end of file
 */
