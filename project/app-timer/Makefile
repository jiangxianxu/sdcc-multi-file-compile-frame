########################################################
# 日期：2021-06-26
# 作者：jiangxianxu_pub@163.com
########################################################

#
# APP名称
#
APP_NAME := app-timer

#
# APP除需要链接的库外，用于完成本APP逻辑的包含main函数的源文件
#
MODULE_PATH := $(SOURCE_PATH)/app/timer

#
# APP源文件编译参数
#
MODULE_CFLAGS += $(GLOBAL_CFLAGS)
MODULE_INCLUDE_PATH += $(GLOBAL_INCLUDE_PATH)

#
# APP源文件
#
MODULE_SRC_FILE_LIST := \
	$(MODULE_PATH)/main.c

#
# APP需要链接的其它模块的rel文件列表
#
MODULE_LD_LIB_LIST := \
	$(BUILD_LIB_PATH)/isr.rel

#
# 调用公共APP编译脚本生成本APP可执行文件
#
include $(ROOT_PATH)/project/mk/build_app.mk
