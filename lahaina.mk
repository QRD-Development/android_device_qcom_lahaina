#
# Copyright (C) 2023 Project Mia
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/qcom/lahaina

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery \
    android.hardware.boot@1.2-service \
    checkpoint_gc \
    otapreopt_script \
    update_engine \
    update_engine_client \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

# API
BOARD_SHIPPING_API_LEVEL := 30
BOARD_API_LEVEL := 30
PRODUCT_SHIPPING_API_LEVEL := 30

# Architecture
TARGET_BOARD_PLATFORM := lahaina
TARGET_BOOTLOADER_BOARD_NAME := lahaina

# AVB
BOARD_AVB_ENABLE := true

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# FM
BOARD_HAVE_QCOM_FM := false

# Generic Kernel Headers
TARGET_HAS_GENERIC_KERNEL_HEADERS := true

# Init
PRODUCT_COPY_FILES += $(DEVICE_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom

PRODUCT_PACKAGES += \
    charger_fw_fstab.qti \
    fstab.qcom \
    init.target.rc \
    ueventd-odm.rc

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Partitions
PRODUCT_BUILD_ODM_IMAGE := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# QTI Components
TARGET_COMMON_QTI_COMPONENTS := \
    all \
    charging \
    dsprpcd \
    keymaster \
    qseecomd

# SDK
BOARD_SYSTEMSDK_VERSIONS := 30

# Storage
PRODUCT_CHARACTERISTICS := nosdcard
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Vendor
$(call inherit-product, vendor/qcom/lahaina/lahaina-vendor.mk)
