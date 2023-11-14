#
# Copyright (C) 2023 Project Mia
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from the device configuration.
$(call inherit-product, device/qcom/lahaina/lahaina.mk)

# Inherit from the Mia configuration.
$(call inherit-product, vendor/mia/target/product/mobile.mk)

# Boot animation resolution.
TARGET_BOOT_ANIMATION_RES := 1080

PRODUCT_MANUFACTURER := QUALCOMM
PRODUCT_BRAND := qti
PRODUCT_NAME := mia_lahaina
PRODUCT_DEVICE := lahaina
PRODUCT_MODEL := lahaina for arm64

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="lahaina for arm64"
