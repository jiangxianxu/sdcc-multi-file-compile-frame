########################################################
# 日期：2021-06-26
# 作者：jiangxianxu_pub@163.com
########################################################

MODULE_NAME = isr

MODULE_CFLAGS += $(GLOBAL_CFLAGS)
MODULE_INCLUDE_PATH += $(GLOBAL_INCLUDE_PATH)

MODULE_PATH := $(SOURCE_PATH)/isr

MODULE_SRC_FILE = $(MODULE_PATH)/isr.c

.PHONY : all clean

all: $(MODULE_NAME).rel
	cp $(MODULE_NAME).* $(BUILD_LIB_PATH)

$(MODULE_NAME).rel: $(MODULE_SRC_FILE)
	$(CC) $(MODULE_CFLAGS) $(MODULE_INCLUDE_PATH) -c $(MODULE_SRC_FILE)

clean:
	rm -rf $(MODULE_NAME).*
	rm -rf $(BUILD_LIB_PATH)/$(MODULE_NAME).*

