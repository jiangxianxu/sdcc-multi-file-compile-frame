########################################################
# 日期：2021-06-26
# 作者：jiangxianxu_pub@163.com
########################################################

export ROOT_PATH := $(shell pwd)
export MAKE := make

#
# all compile/clean
#
all:
	@ $(MAKE) -C project --no-print-directory

clean:
	@ $(MAKE) -C project clean --no-print-directory

