#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

module = ExtractUtilsModule(
    'sky',
    'xiaomi',
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(module, 'sm4450-common', module.vendor)
    utils.run()
