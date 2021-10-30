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

#pragma once

#define TERM_FRAME_MAX_CHILDREN 16
#define TERM_COUNTER_MAX_WIDTH 8

typedef enum _term_event { PRESS, FORWARD, BACKWARD, FOCUS, TICK } term_event_t;

struct _term_widget;
typedef uint32_t (*term_event_manager_t)(struct _term_widget *widget,
                                         term_event_t event,
                                         uint32_t event_data);

typedef uint32_t (*term_event_callback_t)(struct _term_widget *widget,
                                          uint32_t event_data);

typedef const char *(*term_render_callback_t)(struct _term_widget *widget);

typedef void (*term_action_callback_t)(uint8_t *data);

typedef struct _term_widget {
  term_event_manager_t on_event;
  term_event_callback_t on_press;
  term_event_callback_t on_forward;
  term_event_callback_t on_backward;
  term_event_callback_t on_focus;
  term_event_callback_t on_tick;
  term_render_callback_t render;
} term_widget_t;

typedef struct _term_label {
  term_widget_t base;
  const char *text;
} term_label_t;

typedef struct _term_button {
  term_widget_t base;
  const char *text;
  term_action_callback_t press_action;
  uint8_t *user_data;
  uint8_t inverse_text;
  uint8_t inverse_char;
} term_button_t;

typedef term_button_t term_grabber_t;

typedef struct _term_counter {
  term_button_t base;
  term_action_callback_t assign_action;
  uint8_t active;
  uint32_t min_value;
  uint32_t max_value;
  uint32_t value;
  uint8_t disp_width;
  char text[TERM_COUNTER_MAX_WIDTH + 1];
  uint8_t *user_data;
} term_counter_t;

typedef struct _term_frame {
  term_widget_t *children[TERM_FRAME_MAX_CHILDREN];
  uint8_t nchildren;
  uint8_t focus;
} term_frame_t;

extern void term_label_init(term_label_t *widget, const char *text);
extern void term_frame_init(term_frame_t *frame);
extern void term_button_init(term_button_t *button, const char *text,
                             term_action_callback_t press_callback,
                             uint8_t *user_data);
extern int term_frame_add_child(term_frame_t *frame, term_widget_t *widget,
                                uint8_t focus);
extern uint32_t term_frame_dispatch(term_frame_t *frame, term_event_t event,
                                    uint32_t event_data);
extern void term_frame_render(term_frame_t *frame);
extern void term_frame_reset(term_frame_t *frame);
extern void term_counter_init(term_counter_t *counter,
                              term_action_callback_t assign_action,
                              uint32_t min_value, uint32_t max_value,
                              uint8_t disp_width, uint8_t *user_data);
extern void term_grabber_init(term_grabber_t *grabber, const char *text,
                              term_action_callback_t press_callback,
                              uint8_t *user_data);
