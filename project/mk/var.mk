########################################################
# 日期：2021-06-26
# 作者：jiangxianxu_pub@163.com
########################################################

export BUILD_PATH := $(ROOT_PATH)/build
export BUILD_LIB_PATH := $(BUILD_PATH)/lib
export CODE_BASE_PATH := $(ROOT_PATH)/codebase
export SOURCE_PATH := $(CODE_BASE_PATH)/source
export INCLUDE_PATH := $(CODE_BASE_PATH)/include

export CC := sdcc
export AR := sdar
export OBJCOPY := sdobjcopy
export PAKKIHX := packihx

export GLOBAL_INCLUDE_PATH := $(INCLUDE_PATH)

export GLOBAL_CFLAGS := -mmcs51 --model-small

ifeq ($(V),1)
export Q :=
export MAKE_DIR_INFO :=
else
export Q := @
export MAKE_DIR_INFO := --no-print-directory
endif
