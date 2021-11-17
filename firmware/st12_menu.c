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
 * st12_menu.c -- ST12 settings menu
 *
 */

#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "st12.h"
#include "st12_config.h"
#include "st12_term.h"
#include "st12_menu.h"

static term_st12_menu_item_t g_menu_items[];

typedef void (*interval_set_f)(int32_t value);
typedef int32_t (*interval_get_f)(void);

static char *_interval_render(term_st12_menu_item_state_t state,
                              term_st12_menu_item_t *menu_item,
                              const char *format) {
  snprintf(menu_item->text, sizeof(menu_item->text),
           format,
           (state == SELECTED) ? "[" : "",
           menu_item->value,
           (state == SELECTED) ? "]" : "");
  return menu_item->text;
}

static uint32_t _interval_on_event(term_st12_menu_item_state_t state,
                                   term_st12_menu_item_t *menu_item,
                                   term_event_t event,
                                   uint32_t event_data,
                                   int32_t max_value,
                                   int32_t min_value,
                                   interval_get_f get_callback,
                                   interval_set_f set_callback)
{
  uint32_t res = 1;

  switch (event) {
  case FORWARD:
    menu_item->value += event_data;
    menu_item->value = MIN(menu_item->value, max_value);
    break;
  case BACKWARD:
    menu_item->value -= event_data;
    menu_item->value = MAX(menu_item->value, min_value);
    break;
  case FOCUS:    
  case PRESS:
    switch(state) {
      case INVISIBLE:
      case NORMAL:
        menu_item->value = get_callback();
        break;
      case SELECTED:
        set_callback(menu_item->value);
        break;
      default:
        break;
    };
    break;
  default:
    res = 0;
    break;
  }

  return res;
}

static int32_t opw_get(void) {
  return (int32_t)config_get()->overshoot_period_width;
}

static char *opw_render(term_st12_menu_item_state_t state,
                        term_st12_menu_item_t *menu_item) {
  return _interval_render(state, menu_item, "\nHeat.Int.%s%lu%smS\n");
}

static uint32_t opw_on_event(term_st12_menu_item_state_t state,
                             term_st12_menu_item_t *menu_item,
                             term_event_t event,
                             uint32_t event_data)
{
  return _interval_on_event(state, menu_item, event, event_data,
                            2000, 250,
                            opw_get,
                            (interval_set_f)config_set_overshoot_period_width);
}

static int32_t mpw_get(void) {
  return (int32_t)config_get()->measure_period_width;
}

static char *mpw_render(term_st12_menu_item_state_t state,
                        term_st12_menu_item_t *menu_item) {
  return _interval_render(state, menu_item, "\nMeas.Int.%s%lu%smS\n");
}

static uint32_t mpw_on_event(term_st12_menu_item_state_t state,
                             term_st12_menu_item_t *menu_item,
                             term_event_t event,
                             uint32_t event_data)
{
  return _interval_on_event(state, menu_item, event, event_data,
                            1000, 40,
                            mpw_get,
                            (interval_set_f)config_set_measure_period_width);
}

static int32_t tscale_get(void) {
  return (int32_t)config_get()->temp_scale;
}

static char *tscale_render(term_st12_menu_item_state_t state,
                           term_st12_menu_item_t *menu_item) {
  return _interval_render(state, menu_item, "\nTscale %s%lu%s\n");
}

static uint32_t tscale_on_event(term_st12_menu_item_state_t state,
                                term_st12_menu_item_t *menu_item,
                                term_event_t event,
                                uint32_t event_data)
{
  return _interval_on_event(state, menu_item, event, event_data,
                            5000, 0,
                            tscale_get,
                            (interval_set_f)config_set_temperature_scale);
}

static int32_t toffset_get(void) {
  return config_get()->temp_offset;
}

static char *toffset_render(term_st12_menu_item_state_t state,
                           term_st12_menu_item_t *menu_item) {
  return _interval_render(state, menu_item, "\nToffs %s%ld%s\n");
}

static uint32_t toffset_on_event(term_st12_menu_item_state_t state,
                                term_st12_menu_item_t *menu_item,
                                term_event_t event,
                                uint32_t event_data)
{
  return _interval_on_event(state, menu_item, event, event_data,
                            4096, -4096,
                            toffset_get,
                            config_set_temperature_offset);
}

static int32_t iscale_get(void) {
  return (int32_t)config_get()->current_scale;
}

static char *iscale_render(term_st12_menu_item_state_t state,
                           term_st12_menu_item_t *menu_item) {
  return _interval_render(state, menu_item, "\nIscale %s%lu%s\n");
}

static uint32_t iscale_on_event(term_st12_menu_item_state_t state,
                                term_st12_menu_item_t *menu_item,
                                term_event_t event,
                                uint32_t event_data)
{
  return _interval_on_event(state, menu_item, event, event_data,
                            9000, 0,
                            iscale_get,
                            (interval_set_f)config_set_current_scale);
}

static int32_t ioffset_get(void) {
  return config_get()->current_offset;
}

static char *ioffset_render(term_st12_menu_item_state_t state,
                           term_st12_menu_item_t *menu_item) {
  return _interval_render(state, menu_item, "\nIoffs %s%ld%s\n");
}

static uint32_t ioffset_on_event(term_st12_menu_item_state_t state,
                                term_st12_menu_item_t *menu_item,
                                term_event_t event,
                                uint32_t event_data)
{
  return _interval_on_event(state, menu_item, event, event_data,
                            4096, -4096,
                            ioffset_get,
                            config_set_current_offset);
}

static int32_t idle_temperature_get(void) {
  return config_get()->idle_temperature / 1000;
}

static void idle_temperature_set(int32_t value) {
  config_set_idle_temperature(value * 1000);
}

static char *idle_temperature_render(term_st12_menu_item_state_t state,
                                     term_st12_menu_item_t *menu_item) {
  return _interval_render(state, menu_item, "\nT Idle %s%ld%sC\n");
}

static uint32_t idle_temperature_on_event(term_st12_menu_item_state_t state,
                                          term_st12_menu_item_t *menu_item,
                                          term_event_t event,
                                          uint32_t event_data)
{
  return _interval_on_event(state, menu_item, event, event_data,
                            200, 0,
                            idle_temperature_get,
                            idle_temperature_set);
}

static int32_t idle_timeout_get(void) {
  return config_get()->idle_timeout / 1000;
}

static void idle_timeout_set(int32_t value) {
  config_set_idle_timeout(value * 1000);
}

static char *idle_timeout_render(term_st12_menu_item_state_t state,
                                     term_st12_menu_item_t *menu_item) {
  return _interval_render(state, menu_item, "\nTout.Idle. %s%lu%sS\n");
}

static uint32_t idle_timeout_on_event(term_st12_menu_item_state_t state,
                                      term_st12_menu_item_t *menu_item,
                                      term_event_t event,
                                      uint32_t event_data)
{
  return _interval_on_event(state, menu_item, event, event_data,
                            360, 0,
                            idle_timeout_get,
                            idle_timeout_set);
}

static char *exit_render(term_st12_menu_item_state_t state,
                        term_st12_menu_item_t *menu_item)
{
  (void)state;
  
  snprintf(menu_item->text, sizeof(menu_item->text), "\nClose Menu...\n");
  return menu_item->text;
}


static term_st12_menu_item_t g_menu_items[] = {
    {.id = OVERSHOOT_PERIOD_WIDTH,
     .value = 0,
     .render = opw_render,
     .on_event = opw_on_event},  
    {.id = MEASURE_PERIOD_WIDTH,
     .value = 0,
     .render = mpw_render,
     .on_event = mpw_on_event},  
    {.id = TEMP_SCALE,
     .value = 0,
     .render = tscale_render,
     .on_event = tscale_on_event},  
    {.id = TEMP_OFFSET,
     .value = 0,
     .render = toffset_render,
     .on_event = toffset_on_event},  
    {.id = CURRENT_SCALE,
     .value = 0,
     .render = iscale_render,
     .on_event = iscale_on_event},  
    {.id = CURRENT_OFFSET,
     .value = 0,
     .render = ioffset_render,
     .on_event = ioffset_on_event},  
    {.id = IDLE_TEMPERATURE,
     .value = 0,
     .render = idle_temperature_render,
     .on_event = idle_temperature_on_event},  
    {.id = IDLE_TIMEOUT,
     .value = 0,
     .render = idle_timeout_render,
     .on_event = idle_timeout_on_event},  
    {.id = EXIT,
     .value = 0,
     .render = exit_render,
     .on_event = NULL},  
};

static const char *term_st12_config_menu_render(term_widget_t *widget) {
  term_st12_menu_t *menu = (term_st12_menu_t *)widget;
  term_st12_menu_item_t *menu_item = menu->items + menu->selection;
  if(menu->selection_state == INVISIBLE)
    return "\n";
  return menu_item->render(menu->selection_state, menu_item);
}

static uint32_t term_st12_config_menu_forward(term_widget_t *widget,
                                              uint32_t event_data) {
  term_st12_menu_t *menu = (term_st12_menu_t *)widget;
  term_st12_menu_item_t *menu_item = menu->items + menu->selection;

  if (menu->selection_state == INVISIBLE)
    return 0;

  if (menu->selection_state == SELECTED && menu_item->on_event)
    return menu_item->on_event(menu->selection_state,
                               menu_item,
                               FORWARD,
                               event_data);

  menu->selection += 1;
  if (menu->selection >= sizeof(g_menu_items)/sizeof(term_st12_menu_item_t))
    menu->selection = 0;

  menu_item = menu->items + menu->selection;
  if(menu_item->on_event)  
    return menu_item->on_event(menu->selection_state,
                               menu_item,
                               FOCUS,
                               1);
  return 1;
}

static uint32_t term_st12_config_menu_backward(term_widget_t *widget,
                                               uint32_t event_data) {
  term_st12_menu_t *menu = (term_st12_menu_t *)widget;
  term_st12_menu_item_t *menu_item = menu->items + menu->selection;

  if (menu->selection_state == INVISIBLE)
    return 0;
  
  if (menu->selection_state == SELECTED && menu_item->on_event)
    return menu_item->on_event(menu->selection_state,
                               menu_item,
                               BACKWARD,
                               event_data);

  if (menu->selection == 0)
    menu->selection = sizeof(g_menu_items) / sizeof(term_st12_menu_item_t);

  menu->selection -= 1;

  menu_item = menu->items + menu->selection;
  if(menu_item->on_event)
    return menu_item->on_event(menu->selection_state,
                               menu_item,
                               FOCUS,
                               1);
  return 1;
}

static uint32_t term_st12_config_menu_press(term_widget_t *widget,
                                            uint32_t event_data) {
  term_st12_menu_t *menu = (term_st12_menu_t *)widget;
  term_st12_menu_item_t *menu_item = menu->items + menu->selection;

  if(menu_item->id == EXIT) {
    menu->selection_state = INVISIBLE;
    menu->selection = 0;
    return 0;
  }
  
  if(menu_item->on_event) 
    menu_item->on_event(menu->selection_state,
                        menu_item,
                        PRESS,
                        event_data);      

  switch(menu->selection_state) {
    case INVISIBLE:
    case SELECTED:
      menu->selection_state = NORMAL;
      break;
    case NORMAL:
      menu->selection_state = SELECTED;
      break;
  }
  
  return 1;
}

static uint32_t term_st12_config_menu_focus(term_widget_t *widget,
                                            uint32_t event_data) {
  term_st12_menu_t *menu = (term_st12_menu_t *)widget;
  term_st12_menu_item_t *menu_item = menu->items + menu->selection;

  if(menu_item->on_event) 
    menu_item->on_event(menu->selection_state,
                        menu_item,
                        FOCUS,
                        event_data);      

  if(event_data && menu->selection_state == INVISIBLE) {
      menu->selection_state = NORMAL;
  }
  
  return 1;
}

void term_st12_menu_init(term_st12_menu_t *widget) {
  term_widget_init(&widget->base);
  widget->base.render = term_st12_config_menu_render;
  widget->base.on_forward = term_st12_config_menu_forward;
  widget->base.on_backward = term_st12_config_menu_backward;
  widget->base.on_press = term_st12_config_menu_press;
  widget->base.on_focus = term_st12_config_menu_focus;
  widget->selection = 0;
  widget->selection_state = INVISIBLE;
  widget->items = g_menu_items;
}

/*
 * end of file
 */
