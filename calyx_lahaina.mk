#
# Copyright (C) 2024 The Calyx Institute
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit some common stuff
$(call inherit-product, vendor/calyx/config/common_phone.mk)

# Inherit from the device configuration.
$(call inherit-product, device/qcom/lahaina/device.mk)

PRODUCT_BRAND := qti
PRODUCT_DEVICE := lahaina
PRODUCT_MANUFACTURER := QUALCOMM
PRODUCT_MODEL := Lahaina for arm64
PRODUCT_NAME := calyx_lahaina

PRODUCT_SYSTEM_NAME := lahaina
PRODUCT_SYSTEM_DEVICE := lahaina

PRODUCT_GMS_CLIENTID_BASE := android-qualcomm

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=$(PRODUCT_SYSTEM_DEVICE) \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME)
