########################################################
# 日期：2021-06-26
# 作者：jiangxianxu_pub@163.com
########################################################

export ROOT_PATH ?= $(shell pwd)/..

include $(ROOT_PATH)/project/mk/var.mk

BUILD_APP_LIST := app-timer app-loop

BUILD_MD_EXCULD_DIRS := build mk
BUILD_ALL_EXCULD_DIRS := $(BUILD_MD_EXCULD_DIRS) $(BUILD_APP_LIST)

ALL_DIRS := $(shell find . -maxdepth 1 -type d)
ALL_DIRS := $(basename $(patsubst ./%,%,$(ALL_DIRS)))

BUILD_ALL_DIRS := $(filter-out $(BUILD_ALL_EXCULD_DIRS),$(ALL_DIRS))
CLEAN_ALL_DIRS := $(BUILD_ALL_DIRS)

BUILD_MD_DIRS := $(filter-out $(BUILD_MD_EXCULD_DIRS),$(ALL_DIRS))
CLEAN_MD_DIRS := $(addsuffix _clean, $(BUILD_MD_DIRS))

.PHONY : config all module_build clean module_clean $(BUILD_MD_DIRS) $(CLEAN_MD_DIRS)

#
# all compile/clean
#
all: config module_build
	$(Q) for dir in $(BUILD_APP_LIST); \
	do \
		echo "== Build-object $$dir"; \
		$(MAKE) -C $$dir $(MAKE_DIR_INFO) || exit $$?; \
	done

module_build:
	$(Q) for dir in $(BUILD_ALL_DIRS); \
	do \
		echo "== Build-object $$dir"; \
		$(MAKE) -C $$dir $(MAKE_DIR_INFO) || exit $$?; \
	done

clean: module_clean
	$(Q) for dir in $(BUILD_APP_LIST); \
	do \
		$(MAKE) -C $$dir clean $(MAKE_DIR_INFO) || exit $$?; \
	done
	$(Q) rm -rf $(BUILD_PATH)

module_clean:
	$(Q) for dir in $(BUILD_ALL_DIRS); \
	do \
		$(MAKE) -C $$dir clean $(MAKE_DIR_INFO) || exit $$?; \
	done

#
# module compile/clean
#
$(BUILD_MD_DIRS): config
	$(Q) $(MAKE) -C $@ $(MAKE_DIR_INFO)

$(CLEAN_MD_DIRS):
	$(Q) $(MAKE) -C $(patsubst %_clean,%,$@) clean $(MAKE_DIR_INFO)

config:
	$(Q) mkdir -p $(BUILD_LIB_PATH)

