#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

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

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# Audio
AUDIO_HAL_DIR := hardware/qcom-caf/sm8350/audio

PRODUCT_COPY_FILES += \
    $(AUDIO_HAL_DIR)/configs/common/bluetooth_qti_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_qti_audio_policy_configuration.xml \
    $(AUDIO_HAL_DIR)/configs/common/bluetooth_qti_hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_qti_hearing_aid_audio_policy_configuration.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf \
    $(AUDIO_HAL_DIR)/configs/lahaina/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    $(AUDIO_HAL_DIR)/configs/lahaina/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/audio_platform_info_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_qrd.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/audio_platform_info_hdk.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_hdk.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/sound_trigger_mixer_paths_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_qrd.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/sound_trigger_mixer_paths_cdp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_cdp.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/sound_trigger_mixer_paths_hdk.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_hdk.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/sound_trigger_mixer_paths_hhg.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_hhg.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/mixer_paths_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/mixer_paths_cdp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_cdp.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/mixer_paths_hdk.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_hdk.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/mixer_paths_hhg.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_hhg.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    $(AUDIO_HAL_DIR)/configs/common/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml \
    $(AUDIO_HAL_DIR)/configs/common/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_policy_configuration.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_io_policy.conf \
    $(AUDIO_HAL_DIR)/configs/lahaina/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_effects.conf \
    $(AUDIO_HAL_DIR)/configs/lahaina/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_effects.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/sound_trigger_platform_info.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_platform_info.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/audio_platform_info_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_platform_info_qrd.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/audio_platform_info_hdk.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_platform_info_hdk.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_platform_info_intcodec.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/sound_trigger_mixer_paths.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/sound_trigger_mixer_paths_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/sound_trigger_mixer_paths_qrd.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/sound_trigger_mixer_paths_cdp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/sound_trigger_mixer_paths_cdp.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/sound_trigger_mixer_paths_hdk.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/sound_trigger_mixer_paths_hdk.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/sound_trigger_mixer_paths_hhg.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/sound_trigger_mixer_paths_hhg.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/mixer_paths.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/mixer_paths_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/mixer_paths_qrd.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/mixer_paths_cdp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/mixer_paths_cdp.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/mixer_paths_hdk.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/mixer_paths_hdk.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/mixer_paths_hhg.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/mixer_paths_hhg.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_tuning_mixer.txt \
    $(AUDIO_HAL_DIR)/configs/common/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_policy_configuration.xml \
    $(AUDIO_HAL_DIR)/configs/lahaina/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina_qssi/audio_policy_configuration.xml

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.service \
    android.hardware.bluetooth.audio-impl \
    android.hardware.soundtrigger@2.3-impl \
    audio.bluetooth.default \
    audio.primary.lahaina \
    audio.r_submix.default \
    audio.usb.default \
    audioadsprpcd \
    liba2dpoffload \
    libbatterylistener \
    libcomprcapture \
    libexthwplugin \
    libhdmiedid \
    libhfp \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libsndmonitor \
    libspkrprot \
    libssrec \
    libstdc++_vendor \
    libvolumelistener \
    sound_trigger.primary.lahaina

# Boot Control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery \
    android.hardware.boot@1.2-service

# DebugFS
PRODUCT_SET_DEBUGFS_RESTRICTIONS := true

# Fastboot
PRODUCT_PACKAGES += \
    fastbootd

# Init
PRODUCT_COPY_FILES += $(LOCAL_PATH)/init/fstab.default:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.default

PRODUCT_PACKAGES += \
    charger_fw_fstab.qti \
    fstab.default \
    init.class_main.sh \
    init.qcom.early_boot.sh \
    init.qcom.rc \
    init.qcom.sh \
    init.recovery.qcom.rc \
    init.target.rc \
    ueventd-odm.rc \
    ueventd.qcom.rc

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.qti

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS += *

PRODUCT_PACKAGES += \
    CarrierConfigResCommon \
    FrameworksResCommon \
    FrameworksResTarget \
    LahainaFrameworks \
    LahainaSettings \
    LahainaSystemUI \
    SystemUIResCommon \
    TelephonyResCommon \
    WifiResCommon \
    WifiResTarget \
    WifiResCommonMainline

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Shipping API
BOARD_API_LEVEL := 30
BOARD_SHIPPING_API_LEVEL := $(BOARD_API_LEVEL)
PRODUCT_SHIPPING_API_LEVEL := $(BOARD_API_LEVEL)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# Storage
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Vibrator
PRODUCT_COPY_FILES += \
    vendor/qcom/opensource/vibrator/excluded-input-devices.xml:$(TARGET_COPY_OUT_VENDOR)/etc/excluded-input-devices.xml

PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service

# Inherit the proprietary files
$(call inherit-product, vendor/qcom/lahaina/lahaina-vendor.mk)
