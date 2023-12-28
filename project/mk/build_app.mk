########################################################
# 日期：2021-06-26
# 作者：jiangxianxu_pub@163.com
########################################################

MODULE_OUT_PATH := $(BUILD_PATH)/$(APP_NAME)
MODULE_NODIR_SRC_FILE_LIST := $(notdir $(MODULE_SRC_FILE_LIST))
MODULE_OBJS := $(patsubst %.c,%.rel,$(MODULE_NODIR_SRC_FILE_LIST))
MODULE_OUT_OBJS := $(addprefix $(MODULE_OUT_PATH)/,$(MODULE_OBJS))

vpath %.c $(addsuffix :,$(dir $(MODULE_SRC_FILE_LIST)))

.PHONY : all config clean

all: config $(BUILD_PATH)/$(APP_NAME).bin

$(BUILD_PATH)/$(APP_NAME).bin: $(MODULE_OUT_PATH)/$(APP_NAME).hex
	$(Q) echo "  GEN	$(APP_NAME).bin"
	$(Q) $(OBJCOPY) -I ihex -O binary $(MODULE_OUT_PATH)/$(APP_NAME).hex $(BUILD_PATH)/$(APP_NAME).bin

$(MODULE_OUT_PATH)/$(APP_NAME).hex: $(MODULE_OUT_PATH)/main.ihx
	$(Q) echo "  GEN	$(APP_NAME).hex"
	$(Q) $(PAKKIHX) $(MODULE_OUT_PATH)/main.ihx > $(MODULE_OUT_PATH)/$(APP_NAME).hex

$(MODULE_OUT_PATH)/main.ihx: $(MODULE_OUT_OBJS)
	$(Q) echo "  GEN	main.ihx for $(APP_NAME)"
	$(Q) $(CC) $(MODULE_OUT_OBJS) $(MODULE_LD_LIB_LIST) -o $(MODULE_OUT_PATH)/main.ihx

$(MODULE_OUT_OBJS) : $(MODULE_OUT_PATH)/%.rel : %.c
	$(Q) echo "  CC	$(patsubst %.c,%.rel,$(notdir $<))"
	$(Q) $(CC) $(MODULE_CFLAGS) $(MODULE_INCLUDE_FLAGS) -o $@ -c $<

config:
	$(Q) mkdir -p $(MODULE_OUT_PATH)

clean:
	$(Q) rm -rf $(MODULE_OUT_PATH)
