########################################################
# 日期：2021-06-26
# 作者：jiangxianxu_pub@163.com
########################################################

include $(shell pwd)/rule.mk

BUILD_MD_EXCULD_DIRS := build
BUILD_ALL_EXCULD_DIRS := build app

ALL_DIRS := $(shell find . -maxdepth 1 -type d)
ALL_DIRS := $(basename $(patsubst ./%,%,$(ALL_DIRS)))

BUILD_ALL_DIRS := $(filter-out $(BUILD_ALL_EXCULD_DIRS),$(ALL_DIRS))
CLEAN_ALL_DIRS := $(BUILD_ALL_DIRS)

BUILD_MD_DIRS := $(filter-out $(BUILD_MD_EXCULD_DIRS),$(ALL_DIRS))
CLEAN_MD_DIRS := $(addsuffix _clean, $(BUILD_MD_DIRS))

.PHONY : config all clean $(BUILD_MD_DIRS) $(CLEAN_MD_DIRS)

#
# all compile/clean
#
all: config
	for dir in $(BUILD_ALL_DIRS); \
	do \
		$(MAKE) -C $$dir || exit $$?; \
	done
	$(MAKE) -C app

clean:
	for dir in $(BUILD_ALL_DIRS); \
	do \
		$(MAKE) -C $$dir clean || exit $$?; \
	done
	$(MAKE) -C app clean

#
# module compile/clean
#
$(BUILD_MD_DIRS): config
	$(MAKE) -C $@

$(CLEAN_MD_DIRS):
	$(MAKE) -C $(patsubst %_clean,%,$@) clean

config:
	mkdir -p $(BUILD_LIB_PATH)

