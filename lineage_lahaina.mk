#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from the device configuration.
$(call inherit-product, device/qcom/lahaina/device.mk)

# Inherit from the Lineage configuration.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit AviumUI configurations.
-include device/qcom/lahaina/avium_lahaina.mk

PRODUCT_BRAND := Qualcomm
PRODUCT_DEVICE := lahaina
PRODUCT_MANUFACTURER := Qualcomm
PRODUCT_MODEL := qrd8350
PRODUCT_NAME := lineage_lahaina

PRODUCT_SYSTEM_NAME := lahaina
PRODUCT_SYSTEM_DEVICE := lahaina

PRODUCT_GMS_CLIENTID_BASE := android-qualcomm

PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceName=$(PRODUCT_SYSTEM_DEVICE) \
    DeviceProduct=$(PRODUCT_SYSTEM_NAME)
