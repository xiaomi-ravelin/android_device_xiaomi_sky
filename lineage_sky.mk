#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from sky device.
$(call inherit-product, device/xiaomi/sky/device.mk)

# Inherit from the LineageOS configuration.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_BRAND := Redmi
PRODUCT_DEVICE := sky
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := 23076RN4BI
PRODUCT_NAME := lineage_sky

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="sky_in-user 15 AQ3A.240912.001 OS2.0.204.0.VMWINXM release-keys" \
    BuildFingerprint=Redmi/sky_in/sky:15/AQ3A.240912.001/OS2.0.204.0.VMWINXM:user/release-keys \
    DeviceProduct=sky \
    SystemName=sky_in
