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
 * st12_term.h -- Minimal terminal graphics framework
 *
 */

#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "st12.h"
#include "st12_config.h"
#include "st12_display.h"
#include "st12_term.h"

static char g_inverse_text[10];

static uint32_t term_widget_dispatch(term_widget_t *widget, term_event_t event,
                                     uint32_t event_data) {
  switch (event) {
  case PRESS:
    if (widget->on_press)
      return widget->on_press(widget, event_data);
    break;
  case FORWARD:
    if (widget->on_forward)
      return widget->on_forward(widget, event_data);
    break;
  case BACKWARD:
    if (widget->on_backward)
      return widget->on_backward(widget, event_data);
    break;
  case FOCUS:
    if (widget->on_focus)
      return widget->on_focus(widget, event_data);
    break;
  case TICK:
    if (widget->on_tick)
      return widget->on_tick(widget, event_data);
    break;
  }

  return 0;
}

void term_widget_init(term_widget_t *widget) {
  widget->on_event = term_widget_dispatch;
  widget->on_press = NULL;
  widget->on_forward = NULL;
  widget->on_backward = NULL;
  widget->on_focus = NULL;
  widget->on_tick = NULL;
  widget->render = NULL;
}

static const char *term_label_render(term_widget_t *widget) {
  term_label_t *label = (term_label_t *)widget;

  return label->text;
}

void term_label_init(term_label_t *widget, const char *text) {
  term_widget_init(&widget->base);
  widget->base.render = term_label_render;
  widget->text = text;
}

static const char *term_int_label_render(term_widget_t *widget) {
  term_int_label_t *label = (term_int_label_t *)widget;

  snprintf(label->text, sizeof(label->text), label->base.text, label->value);

  return label->text;
}

void term_int_label_init(term_int_label_t *widget, const char *format,
                         int value) {
  term_label_init(&widget->base, format);
  widget->base.base.render = term_int_label_render;
  widget->value = value;
}

static const char *term_float_label_render(term_widget_t *widget) {
  term_float_label_t *label = (term_float_label_t *)widget;

  snprintf(label->text, sizeof(label->text), label->base.text,
           label->value / label->divider, label->value % label->divider);

  return label->text;
}

void term_float_label_init(term_float_label_t *widget, const char *format,
                           int value, int divider) {
  term_label_init(&widget->base, format);
  widget->base.base.render = term_float_label_render;
  widget->value = value;
  widget->divider = divider;
}

static uint32_t term_st12_temp_label_forward(term_widget_t *widget,
                                             uint32_t event_data) {
  term_st12_temp_label_t *label = (term_st12_temp_label_t *)widget;

  config_set_target_temperature(label->config->target_temperature +
                                event_data * 500);

  return 1;
}

static uint32_t term_st12_temp_label_backward(term_widget_t *widget,
                                              uint32_t event_data) {
  term_st12_temp_label_t *label = (term_st12_temp_label_t *)widget;

  config_set_target_temperature(label->config->target_temperature -
                                event_data * 500);

  return 1;
}

static uint32_t term_st12_temp_label_focus(term_widget_t *widget,
                                           uint32_t event_data) {
  (void)widget;
  (void)event_data;
  
  return 1;
}

static const char *term_st12_temp_label_render(term_widget_t *widget) {
  term_st12_temp_label_t *label = (term_st12_temp_label_t *)widget;

  if(!label->overcurrent) { 
    snprintf(
        label->text, sizeof(label->text), "\f%s%03d [%03d] %1u.%1uA",
        label->is_idle ? "i" : " ",
        (short)(label->temperature / 1000),
        (short)(label->config->target_temperature / 1000),
        (unsigned short)(label->current / 1000),
        (unsigned short)((label->current % 1000) / 100)
    );
  } else {
    snprintf(label->text, sizeof(label->text), "\fOvercurrent!");
  }
  return label->text;
}

void term_st12_temp_label_init(term_st12_temp_label_t *widget,
                               const st12_config_t *config) {
  term_widget_init(&widget->base);
  widget->base.render = term_st12_temp_label_render;
  widget->base.on_forward = term_st12_temp_label_forward;
  widget->base.on_backward = term_st12_temp_label_backward;
  widget->base.on_focus = term_st12_temp_label_focus;
  widget->config = config;
  widget->temperature = 0;
  widget->current = 0;
  widget->overcurrent = 0;
}

static const char *term_button_render(term_widget_t *widget) {
  term_button_t *button = (term_button_t *)widget;

  if (!button->inverse_text)
    return button->text;

  int inverse_text_len = MIN(sizeof(g_inverse_text) - 1, strlen(button->text));
  memset(g_inverse_text, button->inverse_char, inverse_text_len);
  g_inverse_text[inverse_text_len] = 0;

  return g_inverse_text;
}

static uint32_t term_button_focus(term_widget_t *widget, uint32_t event_data) {
  term_button_t *button = (term_button_t *)widget;
  if (!event_data)
    button->inverse_text = 0;
  return 1;
}

static uint32_t term_button_tick(term_widget_t *widget, uint32_t event_data) {
  (void)event_data;
  term_button_t *button = (term_button_t *)widget;

  button->inverse_text = !button->inverse_text;

  return 1;
}

static uint32_t term_button_press(term_widget_t *widget, uint32_t event_data) {
  (void)event_data;

  term_button_t *button = (term_button_t *)widget;

  if (button->press_action) {
    button->press_action(button->user_data);
    return 1;
  }

  return 0;
}

void term_button_init(term_button_t *button, const char *text,
                      term_action_callback_t press_callback,
                      uint8_t *user_data) {
  term_widget_init(&button->base);

  button->base.render = term_button_render;
  button->base.on_focus = term_button_focus;
  button->base.on_press = term_button_press;
  button->base.on_tick = term_button_tick;

  button->text = text;
  button->press_action = press_callback;
  button->inverse_text = 0;
  button->inverse_char = 0xfd;
  button->user_data = user_data;
}

static void term_counter_press(uint8_t *data) {
  term_counter_t *counter = (term_counter_t *)data;

  counter->active = !counter->active;
  if (counter->active)
    counter->base.inverse_char = 0xfc;
  else {
    counter->base.inverse_char = 0xfd;
    if (counter->assign_action)
      counter->assign_action(counter->user_data);
  }
}

static uint32_t term_counter_forward(term_widget_t *widget,
                                     uint32_t event_data) {
  term_counter_t *counter = (term_counter_t *)widget;

  if (!counter->active)
    return 0;

  uint32_t size = counter->max_value - counter->min_value + 1;
  counter->value = (counter->value + event_data) % size;

  return 1;
}

static uint32_t term_counter_backward(term_widget_t *widget,
                                      uint32_t event_data) {
  term_counter_t *counter = (term_counter_t *)widget;

  if (!counter->active)
    return 0;

  uint32_t size = counter->max_value - counter->min_value + 1;
  counter->value = (counter->value - event_data + size) % size;

  return 1;
}

static const char *term_counter_render(term_widget_t *widget) {
  term_counter_t *counter = (term_counter_t *)widget;

  int size = snprintf(counter->text, 0, "%ld", counter->value);

  memset(counter->text, '0', counter->disp_width);
  snprintf(counter->text + MAX(0, counter->disp_width - size), size + 1, "%ld",
           counter->value);

  return term_button_render(&counter->base.base);
}

void term_counter_init(term_counter_t *counter,
                       term_action_callback_t assign_action, uint32_t min_value,
                       uint32_t max_value, uint8_t disp_width,
                       uint8_t *user_data) {
  term_button_init(&counter->base, counter->text, term_counter_press,
                   (uint8_t *)counter);

  counter->base.base.render = term_counter_render;
  counter->base.base.on_forward = term_counter_forward;
  counter->base.base.on_backward = term_counter_backward;

  counter->assign_action = assign_action;
  counter->active = 0;
  counter->min_value = min_value;
  counter->max_value = max_value;
  counter->value = min_value;
  counter->disp_width = MIN(disp_width, sizeof(counter->text) - 1);
  counter->user_data = user_data;
}

static uint32_t term_grabber_forward(term_widget_t *widget,
                                     uint32_t event_data) {
  (void)widget;
  (void)event_data;
  return 1;
}

static uint32_t term_grabber_backward(term_widget_t *widget,
                                      uint32_t event_data) {
  (void)widget;
  (void)event_data;
  return 1;
}

void term_grabber_init(term_grabber_t *grabber, const char *text,
                       term_action_callback_t press_callback,
                       uint8_t *user_data) {
  term_button_init(grabber, text, press_callback, user_data);

  grabber->base.on_forward = term_grabber_forward;
  grabber->base.on_backward = term_grabber_backward;
}

void term_frame_init(term_frame_t *frame) {
  memset((uint8_t *)frame, '\0', sizeof(term_frame_t));
}

void term_frame_reset(term_frame_t *frame) {
  if (frame->nchildren == 0)
    return;

  term_widget_t *w = frame->children[frame->focus];
  w->on_event(w, FOCUS, 0);

  frame->nchildren = 0;
}

int term_frame_add_child(term_frame_t *frame, term_widget_t *widget,
                         uint8_t focus) {
  if (frame->nchildren >= TERM_FRAME_MAX_CHILDREN)
    return -1;

  if (focus)
    frame->focus = frame->nchildren;

  frame->children[frame->nchildren++] = widget;

  return frame->nchildren - 1;
}

uint32_t term_frame_dispatch(term_frame_t *frame, term_event_t event,
                             uint32_t event_data) {
  if (frame->nchildren == 0)
    return 0;

  uint8_t focus = frame->focus;
  term_widget_t *w = frame->children[focus];

  uint32_t rc = w->on_event(w, event, event_data);
  if (rc)
    return rc;

  while (1) {
    switch (event) {
    case PRESS:
    case FORWARD:
      frame->focus++;
      if (frame->focus == frame->nchildren)
        frame->focus = 0;
      break;
    case BACKWARD:
      if (frame->focus == 0)
        frame->focus = frame->nchildren;
      frame->focus--;
      break;
    default:
      return 0;
    }

    if (frame->focus == focus)
      return 0;

    w->on_event(w, FOCUS, 0);

    w = frame->children[frame->focus];
    rc = w->on_event(w, FOCUS, 1);
    if (rc)
      break;
  }

  return rc;
}

static char g_frame_buffer[40];

void term_frame_render(term_frame_t *frame) {
  int nchars = 0;
  for (int i = 0; i < frame->nchildren; i++) {
    term_widget_t *w = frame->children[i];
    if (w->render) {
      nchars += snprintf(g_frame_buffer + nchars,
                         sizeof(g_frame_buffer) - nchars,
                         "%s",
                         w->render(w));
    }
  }
  display_print(g_frame_buffer);
}
