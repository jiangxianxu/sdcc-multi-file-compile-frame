########################################################
# 日期：2021-06-26
# 作者：jiangxianxu_pub@163.com
########################################################

#
# 模块名
#
MODULE_NAME := delay

#
# 模块源码目录
#
MODULE_PATH := $(SOURCE_PATH)/delay

#
# 编译参数
#
MODULE_CFLAGS := \
	$(GLOBAL_CFLAGS)

#
# 模块源文件
#
MODULE_SRC_FILE_LIST := \
	$(MODULE_PATH)/delay_sec.c \
	$(MODULE_PATH)/delay_msec.c

#
# 模块头文件目录列表
#
MODULE_INCLUDE_FLAGS := \
	-I$(GLOBAL_INCLUDE_PATH)

#
# 调用公共模块编译脚本完成模块rel文件编译
#
include $(ROOT_PATH)/project/mk/build_lib.mk
