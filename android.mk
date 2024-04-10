LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE), archos)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif