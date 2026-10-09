#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Partitions
BOARD_SUPER_PARTITION_SIZE := 6979321856

# Include the common OEM chipset BoardConfig.
include device/xiaomi/sm4450-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/sky

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sky

# Display
TARGET_SCREEN_DENSITY := 440

# Kernel
TARGET_KERNEL_ADDITIONAL_FLAGS += CONFIG_SKY_DTB=y

BOARD_VENDOR_KERNEL_MODULES_LOAD += \
    fpc1020_platform_tee.ko \
    fts_8720.ko \
    gf_spi.ko \
    ir-spi.ko \
    nvt_36672c.ko \
    nxp-nci.ko \
    xiaomi_touch.ko

BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD += \
    fts_8720.ko \
    nvt_36672c.ko \
    xiaomi_touch.ko

BOOT_KERNEL_MODULES += \
    fts_8720.ko \
    nvt_36672c.ko \
    xiaomi_touch.ko

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/configs/props/odm.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/configs/props/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/configs/props/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/props/vendor.prop

# Include the proprietary files BoardConfig.
include vendor/xiaomi/sky/BoardConfigVendor.mk
