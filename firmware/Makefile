
export PATH := $(HOME)/local/gcc-arm-none-eabi-10-2020-q4-major/bin:$(PATH)

PROJECT = st12
BUILD_DIR = ./build

OPENCM3_DIR=../../stm32/libopencm3
OPENCM3_INC = $(OPENCM3_DIR)/include

CFILES = \
 st12_adc.c \
 st12_dma.c \
 st12_gpio.c \
 st12_ptimer.c \
 st12_linapprox.c \
 st12_temp.c \
 st12_nvic.c \
 st12_i2c.c \
 st12_config.c \
 st12_display.c \
 st12_rotary.c \
 st12_current.c \
 st12_shake.c \
 main.c

OPT = -g -O0

DEVICE = stm32f030F4

include $(OPENCM3_DIR)/mk/genlink-config.mk
include $(OPENCM3_DIR)/mk/genlink-rules.mk
include $(OPENCM3_DIR)/tests/rules.mk
