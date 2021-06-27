########################################################
# 日期：2021-06-26
# 作者：jiangxianxu_pub@163.com
########################################################

APP_NAME = timer

MODULE_CFLAGS += $(GLOBAL_CFLAGS)
MODULE_INCLUDE_PATH += $(GLOBAL_INCLUDE_PATH)

MODULE_PATH := $(BUILD_LIB_PATH)

#
#模块列表，将所有组成模块的rel文件放在这里共同编译成可执行文件
#
MODULE_SRC_FILE := \
	$(MODULE_PATH)/main.rel \
	$(MODULE_PATH)/isr.rel

.PHONY : all clean

all: $(APP_NAME).bin
	cp $(APP_NAME).bin $(BUILD_PATH)

$(APP_NAME).bin: $(APP_NAME).hex
	$(OBJCOPY) -I ihex -O binary $(APP_NAME).hex $(APP_NAME).bin

$(APP_NAME).hex: main.ihx
	packihx main.ihx > $(APP_NAME).hex

main.ihx: $(MODULE_SRC_FILE)
	$(CC) $(MODULE_SRC_FILE)

clean:
	rm -rf main.*
	rm -rf $(APP_NAME).*
	rm -rf $(BUILD_PATH)/$(APP_NAME).*
