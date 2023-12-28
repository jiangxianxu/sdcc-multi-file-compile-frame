########################################################
# 日期：2021-06-26
# 作者：jiangxianxu_pub@163.com
########################################################

BUILD_PATH := $(ROOT_PATH)/build
BUILD_LIB_PATH := $(BUILD_PATH)/lib

CODE_BASE_PATH := $(ROOT_PATH)/codebase
SOURCE_PATH := $(CODE_BASE_PATH)/source
INCLUDE_PATH := $(CODE_BASE_PATH)/include

GLOBAL_CFLAGS :=
GLOBAL_INCLUDE_PATH := $(INCLUDE_PATH)

export CC := sdcc
export OBJCOPY := sdobjcopy
export PAKKIHX := packihx

export BUILD_PATH
export BUILD_LIB_PATH
export CODE_BASE_PATH
export SOURCE_PATH
export GLOBAL_CFLAGS
export GLOBAL_INCLUDE_PATH

ifeq ($(V),1)
Q =
else
Q = @
MAKE_DIR_INFO = --no-print-directory
endif

export Q
export MAKE_DIR_INFO
