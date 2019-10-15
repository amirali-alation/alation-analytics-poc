################################################################################
# Copyright 2019 Alation Inc.
# All Rights Reserved.
# @author: Amirali Shahinpour
# @email:  amirali.shahinpour@alation.com
################################################################################
SHELL = /bin/bash

.PHONY = module clean

#TOPDIR := $(shell git rev-parse --show-toplevel)
#include $(TOPDIR)/build/defs/common.mk
#RPMSDIR := $(TOPDIR)/iso-build-dir/rpms
#VERSION := $(call get_pkg_version)
#BIN-VERSION := $(call get_pkg_version,-bin)


module:
	@echo Building the rmq
	@docker build --rm --tag alation-rmq:test.1 .
	@docker run -d --hostname rabbitmq --net alation-analytics  --name rmq -p 15672:15672 -p 5672:5672 alation-rmq:test.1 


