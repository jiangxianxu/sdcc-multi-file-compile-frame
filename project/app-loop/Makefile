########################################################
# 日期：2021-06-26
# 作者：jiangxianxu_pub@163.com
########################################################

#
# APP名称
#
APP_NAME := app-loop

#
# APP源文件目录
#
MODULE_PATH := $(SOURCE_PATH)/app/loop

#
# APP源文件编译参数
#
MODULE_CFLAGS := $(GLOBAL_CFLAGS)

#
# APP源文件
#
MODULE_SRC_FILE_LIST := \
	$(MODULE_PATH)/main.c \
	$(MODULE_PATH)/main_delay.c

#
# APP头文件目录列表
#
MODULE_INCLUDE_FLAGS := \
	-I$(GLOBAL_INCLUDE_PATH)

#
# APP需要链接的其它模块的库文件列表，此类库文件可能经常发生变化
#
MODULE_LD_LIB_LIST := \
	-l$(BUILD_LIB_PATH)/delay.lib

#
# APP需要链接的公共库文件列表，此类库文件一般不会发生变化，引用示例：
# MODULE_LD_PUB_LIB_LIST := -L $(PUB_LIB_PATH) -lxxx.lib -lyyy.lib -lzzz.lib
#
MODULE_LD_PUB_LIB_LIST :=

#
# 调用公共APP编译脚本生成本APP可执行文件
#
include $(ROOT_PATH)/project/mk/build_app.mk
