########################################################
# 日期：2021-06-26
# 作者：jiangxianxu_pub@163.com
########################################################

CURR_PATH := $(shell pwd)
BUILD_PATH := $(CURR_PATH)/build
BUILD_LIB_PATH := $(BUILD_PATH)/lib

CODE_BASE_PATH := $(CURR_PATH)/../codebase
SOURCE_PATH := $(CODE_BASE_PATH)/source
INCLUDE_PATH := $(CODE_BASE_PATH)/include

GLOBAL_CFLAGS :=
GLOBAL_INCLUDE_PATH := -I$(INCLUDE_PATH)

MAKE := make
CC := sdcc
OBJCOPY := sdobjcopy

export BUILD_PATH
export BUILD_LIB_PATH
export CODE_BASE_PATH
export SOURCE_PATH
export GLOBAL_CFLAGS
export GLOBAL_INCLUDE_PATH

export MAKE
export CC
export OBJCOPY

