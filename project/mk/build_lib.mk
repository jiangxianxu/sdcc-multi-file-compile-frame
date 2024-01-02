########################################################
# 日期：2021-06-26
# 作者：jiangxianxu_pub@163.com
########################################################

MODULE_LIB_NAME := $(MODULE_NAME).lib
MODULE_OUT_PATH := $(BUILD_PATH)/module-$(MODULE_NAME)
MODULE_NODIR_SRC_FILE_LIST := $(notdir $(MODULE_SRC_FILE_LIST))
MODULE_OBJS := $(patsubst %.c,%.rel,$(MODULE_NODIR_SRC_FILE_LIST))
MODULE_OUT_OBJS := $(addprefix $(MODULE_OUT_PATH)/,$(MODULE_OBJS))

MODULE_DEPEND_FILE := $(addsuffix .depend,$(patsubst %.rel,%,$(MODULE_OBJS)))
MODULE_DEPEND_FILE_LIST := $(addprefix $(MODULE_OUT_PATH)/,$(MODULE_DEPEND_FILE))

vpath %.c $(addsuffix :,$(dir $(MODULE_SRC_FILE_LIST)))

.PHONY : all clean

all: depend $(BUILD_LIB_PATH)/$(MODULE_LIB_NAME)

$(BUILD_LIB_PATH)/$(MODULE_LIB_NAME): $(MODULE_OUT_OBJS)
	$(Q) echo "  GEN	$(MODULE_LIB_NAME)"
	$(Q) $(AR) rcs $(BUILD_LIB_PATH)/$(MODULE_LIB_NAME) $(MODULE_OUT_OBJS)

$(MODULE_OUT_OBJS) : $(MODULE_OUT_PATH)/%.rel : %.c
	$(Q) echo "  CC	$(patsubst %.c,%.rel,$(notdir $<))"
	$(Q) $(CC) $(MODULE_CFLAGS) $(MODULE_INCLUDE_FLAGS) -o $@ -c $<

depend: $(MODULE_DEPEND_FILE_LIST)

$(MODULE_DEPEND_FILE_LIST) : $(MODULE_OUT_PATH)/%.depend : %.c
	$(Q) echo "  DEP	$(patsubst %.c,%.rel,$(notdir $<))"
	$(Q) mkdir -p $(MODULE_OUT_PATH)
	$(Q) $(CC) $(MODULE_CFLAGS) $(MODULE_INCLUDE_FLAGS) -MM $< | sed -e 1's,^,$(MODULE_OUT_PATH)/,' > $@

-include $(MODULE_DEPEND_FILE_LIST)

clean:
	$(Q) rm -rf $(MODULE_OUT_PATH)
	$(Q) rm -rf $(BUILD_LIB_PATH)/$(MODULE_LIB_NAME)

