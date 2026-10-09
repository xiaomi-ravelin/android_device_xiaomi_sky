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
    'vendor/lib64/libgralloccore_hidl.so': blob_fixup()
        .fix_soname()
        .replace_needed('libgrallocutils.so', 'libgrallocutils_hidl.so'),
    'vendor/lib64/libgrallocutils_hidl.so': blob_fixup()
        .fix_soname(),
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
