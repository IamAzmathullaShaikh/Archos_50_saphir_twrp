LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE), fq5c62wt_aks)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif