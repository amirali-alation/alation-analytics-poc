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
VERSION := 1.1
IMG_TAG := alation-postgres-test:$(VERSION)
CONTAINER_NAME := postgres
HOST_VOL := /var/lib/alation-analytics/postgres/data

module:
	@echo Building Alation $(CONTAINER_NAME)
	@docker build --rm --tag $(IMG_TAG) .
	@chmod +x docker-entrypoint.sh
	@mkdir -p /var/lib/postgresql/data
	@docker run -d --name $(CONTAINER_NAME) --net alation-analytics -v $(HOST_VOL):/var/lib/postgresql/data $(IMG_TAG)


stop:
	@echo Stopping $(CONTAINER_NAME)
	@docker rm -f $(CONTAINER_NAME)


clean:
	@echo Removing $(CONTAINER_NAME) Images
	@docker rmi -f $(IMG_TAG)
