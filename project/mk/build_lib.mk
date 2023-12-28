########################################################
# 日期：2021-06-26
# 作者：jiangxianxu_pub@163.com
########################################################

MODULE_OUT_PATH := $(BUILD_LIB_PATH)
MODULE_NODIR_SRC_FILE_LIST := $(notdir $(MODULE_SRC_FILE_LIST))
MODULE_OBJS := $(patsubst %.c,%.rel,$(MODULE_NODIR_SRC_FILE_LIST))
MODULE_OUT_OBJS := $(addprefix $(MODULE_OUT_PATH)/,$(MODULE_OBJS))

MODULE_CLEAN_OBJS := $(patsubst %.c,%.*,$(MODULE_NODIR_SRC_FILE_LIST))
MODULE_CLEAN_OUT_OBJS := $(addprefix $(MODULE_OUT_PATH)/,$(MODULE_CLEAN_OBJS))

vpath %.c $(addsuffix :,$(dir $(MODULE_SRC_FILE_LIST)))

.PHONY : all config clean

all: config $(MODULE_OUT_OBJS)

$(MODULE_OUT_OBJS) : $(MODULE_OUT_PATH)/%.rel : %.c
	$(Q) echo "  CC	$(patsubst %.c,%.rel,$(notdir $<))"
	$(Q) $(CC) $(MODULE_CFLAGS) $(MODULE_INCLUDE_FLAGS) -o $@ -c $<

config:
	$(Q) mkdir -p $(MODULE_OUT_PATH)

clean:
	$(Q) rm -rf $(MODULE_CLEAN_OUT_OBJS)

