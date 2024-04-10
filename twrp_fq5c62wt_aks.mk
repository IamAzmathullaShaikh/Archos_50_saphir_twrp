#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/archos/fq5c62wt_aks

# Configure base.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Configure gsi_keys.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Configure twrp
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from fq5c62wt_aks device
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Release name
PRODUCT_RELEASE_NAME := fq5c62wt_aks

# Assert
TARGET_OTA_ASSERT_DEVICE := fq5c62wt_aks

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := fq5c62wt_aks
PRODUCT_NAME := twrp_fq5c62wt_aks
PRODUCT_BRAND := fq5c62wt_aks
PRODUCT_MODEL := fq5c62wt_aks
PRODUCT_MANUFACTURER := fq5c62wt_aks
