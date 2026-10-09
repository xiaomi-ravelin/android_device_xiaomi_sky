#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'device/xiaomi/sky',
    'device/xiaomi/sm4450-common',
    'hardware/xiaomi',
    'hardware/qcom-caf/sm8450-6.6',
    'vendor/xiaomi/sm4450-common',
]

blob_fixups: blob_fixups_user_type = {
    'vendor/bin/hw/vendor.qti.hardware.display.allocator@4.0-service': blob_fixup()
        .replace_needed('libgralloccore.so', 'libgralloccore_hidl.so')
        .replace_needed('libgrallocutils.so', 'libgrallocutils_hidl.so'),
    (
        'vendor/lib64/hw/fingerprint.fpc.default.so',
        'vendor/lib64/hw/fingerprint.goodix.default.so',
    ): blob_fixup()
        .fix_soname(),
    'vendor/lib64/hw/camera.qcom.so': blob_fixup()
        .replace_needed('libsnsapi.so', 'libsnsapi_camx.so'),
    'vendor/etc/sensors/hals.conf': blob_fixup()
        .regex_replace(r'sensors\.ssc\.so', 'sensors.ssc_sky.so'),
    'vendor/lib64/sensors.touch.so': blob_fixup()
        .replace_needed('libsnsapi.so', 'libsnsapi_camx.so')
        .replace_needed('libssc.so', 'libssc_sky.so'),
    'vendor/lib64/libcamximageformatutils.so': blob_fixup()
        .replace_needed('vendor.qti.hardware.display.config-V2-ndk_platform.so', 'vendor.qti.hardware.display.config-V5-ndk.so'),
    'vendor/lib64/libgralloccore_hidl.so': blob_fixup()
        .fix_soname()
        .replace_needed('libgrallocutils.so', 'libgrallocutils_hidl.so'),
    'vendor/lib64/libgrallocutils_hidl.so': blob_fixup()
        .fix_soname(),
    'vendor/lib64/libhme.so': blob_fixup()
        .replace_needed('libstdc++.so', 'libstdc++_vendor.so'),
    'vendor/lib64/libsnsapi_camx.so': blob_fixup()
        .fix_soname(),
    (
        'vendor/lib64/libsnsdiaglog_sky.so',
        'vendor/lib64/libssc_sky.so',
        'vendor/lib64/sensors.ssc_sky.so',
    ): blob_fixup()
        .fix_soname()
        .replace_needed('libsnsapi.so', 'libsnsapi_camx.so')
        .replace_needed('libssc.so', 'libssc_sky.so')
        .replace_needed('libsnsdiaglog.so', 'libsnsdiaglog_sky.so'),
    'vendor/lib64/camera/': blob_fixup()
        .clear_symbol_version('remote_register_buf'),
}

module = ExtractUtilsModule(
    'sky',
    'xiaomi',
    blob_fixups=blob_fixups,
    namespace_imports=namespace_imports,
    add_firmware_proprietary_file=True,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(module, 'sm4450-common', module.vendor)
    utils.run()
