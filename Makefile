#OPENCM3_EXAMPLES_DIR ?= $(HOME)/stm32/libopencm3-examples
OPENCM3_EXAMPLES_DIR = libopencm3-examples
OPENCM3_DIR ?= $(OPENCM3_EXAMPLES_DIR)/libopencm3

V = 1

BINARY = main

OBJS = src/usbasp.o src/isp.o

LDSCRIPT = stm32f1x_bl_8k.ld

LIBNAME = opencm3_stm32f1
DEFS += -DSTM32F1

FP_FLAGS ?= -msoft-float
ARCH_FLAGS = -mthumb -mcpu=cortex-m3 $(FP_FLAGS) -mfix-cortex-m3-ldrd

################################################################################
# OpenOCD specific variables

OOCD ?= openocd
OOCD_INTERFACE ?= cmsis-dap 
OOCD_TARGET ?= stm32f1x

include $(OPENCM3_EXAMPLES_DIR)/examples/rules.mk
