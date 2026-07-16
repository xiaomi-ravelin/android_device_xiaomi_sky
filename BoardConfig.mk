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

# Include the proprietary files BoardConfig.
include vendor/xiaomi/sky/BoardConfigVendor.mk
