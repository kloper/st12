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
 * st12_menu.h -- ST12 settings menu
 *
 */

#pragma once

#define TERM_MENU_MAX_WIDTH 20

typedef enum _st12_menu_item {
  OVERSHOOT_PERIOD_WIDTH,
  MEASURE_PERIOD_WIDTH,
  TEMP_SCALE,
  TEMP_OFFSET,
  CURRENT_SCALE,
  CURRENT_OFFSET,
  IDLE_TIMEOUT,
  IDLE_TEMPERATURE,
  RESET,
  EXIT
} st12_menu_item_t;

typedef enum _term_st12_menu_item_state {
  INVISIBLE,
  NORMAL,
  SELECTED
} term_st12_menu_item_state_t;

struct _term_st12_menu_item;

typedef char *(*term_st12_item_display_f)(
    term_st12_menu_item_state_t state, struct _term_st12_menu_item *menu_item);
typedef uint32_t (*term_st12_item_event_f)(
    term_st12_menu_item_state_t state,
    struct _term_st12_menu_item *menu_item,
    term_event_t event,
    uint32_t event_data);

typedef struct _term_st12_menu_item {
  const st12_menu_item_t id;
  int32_t value;
  term_st12_item_display_f render;
  term_st12_item_event_f on_event;
  char text[TERM_MENU_MAX_WIDTH];  
} term_st12_menu_item_t;

typedef struct _term_st12_menu {
  term_widget_t base;
  term_st12_menu_item_t *items;
  uint32_t selection;
  term_st12_menu_item_state_t selection_state;
} term_st12_menu_t;

void term_st12_menu_init(term_st12_menu_t *widget);

/*
 * end of file
 */
