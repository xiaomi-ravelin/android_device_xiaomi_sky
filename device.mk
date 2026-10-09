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

# Camera
PRODUCT_PACKAGES += \
    framework_compatibility_matrix.camx_hidl.xml \
    libprotobuf-cpp-full-3.9.1-vendorcompat \
    libprotobuf-cpp-lite-3.9.1-vendorcompat \
    libqti_vndfwk_detect.vendor \
    libstdc++_vendor \
    manifest_camx_hidl.xml \
    vendor.qti.hardware.camera.postproc@1.0.vendor

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint-service.xiaomi \
    android.hardware.biometrics.fingerprint@2.1.vendor \
    com.fingerprints.extension@1.0.vendor

# Gralloc
PRODUCT_HIDL_ENABLED := true

PRODUCT_PACKAGES += \
    hwservicemanager \
    vendor.qti.hardware.display.allocator@3.0.vendor \
    vendor.qti.hardware.display.allocator@4.0-service.rc \
    vendor.qti.hardware.display.allocator@4.0.vendor

# Init
PRODUCT_PACKAGES += \
    init.sky.rc

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc-service.nxp \
    com.android.nfc_extras \
    Tag

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResSky \
    SettingsProviderResSkyPocoM6Pro5G \
    SettingsProviderResSkyRedmi125G \
    SettingsProviderResSkyRedmi12R \
    SettingsProviderResSkyRedmiNote12R

# Power
$(call soong_config_set,qtipower,tap_to_wake_node,/sys/class/touch/touch_dev/gesture_double_tap_enabled)

# Properties
PRODUCT_COPY_FILES += $(foreach f,$(wildcard $(LOCAL_PATH)/configs/props/boardid/*.prop), \
    $(f):$(TARGET_COPY_OUT_ODM)/etc/boardid/$(notdir $(f)))

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
