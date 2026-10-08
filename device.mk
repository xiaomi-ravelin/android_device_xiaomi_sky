#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy_engine_stream_volumes.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_policy_engine_stream_volumes.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_ravelin_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_ravelin/mixer_paths_ravelin_qrd.xml \
    $(LOCAL_PATH)/configs/audio/resourcemanager_ravelin_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_ravelin/resourcemanager_ravelin_qrd.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2460
TARGET_SCREEN_WIDTH := 1080

# Gralloc
PRODUCT_PACKAGES += \
    vendor.qti.hardware.display.allocator@4.0.vendor

# Init
PRODUCT_PACKAGES += \
    init.sky.rc

# Sensors
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_ravelin/android.hardware.sensor.gyroscope.xml

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit from the common OEM chipset makefile.
$(call inherit-product, device/xiaomi/sm4450-common/common.mk)

# Inherit from the proprietary files makefile.
$(call inherit-product, vendor/xiaomi/sky/sky-vendor.mk)
