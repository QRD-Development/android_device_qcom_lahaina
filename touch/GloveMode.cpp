/*
 * Copyright (C) 2021-2024 The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

#include "GloveMode.h"

#include <android-base/file.h>
#include <android-base/logging.h>

using ::android::base::ReadFileToString;
using ::android::base::WriteStringToFile;

namespace {

constexpr const char* kGloveModePath =
        "/sys/devices/platform/soc/990000.i2c/i2c-0/0-0038/fts_glove_mode";

}  // namespace

namespace aidl {
namespace vendor {
namespace lineage {
namespace touch {

ndk::ScopedAStatus GloveMode::getEnabled(bool* _aidl_return) {
    std::string value;

    if (!ReadFileToString(kGloveModePath, &value) || value.empty()) {
        LOG(ERROR) << "Failed to read current GloveMode state";
        return ndk::ScopedAStatus::fromExceptionCode(EX_UNSUPPORTED_OPERATION);
    }

    *_aidl_return = value[0] != '0';
    return ndk::ScopedAStatus::ok();
}

ndk::ScopedAStatus GloveMode::setEnabled(bool enabled) {
    if (!WriteStringToFile(enabled ? "1" : "0", kGloveModePath, true)) {
        LOG(ERROR) << "Failed to write GloveMode state";
        return ndk::ScopedAStatus::fromExceptionCode(EX_UNSUPPORTED_OPERATION);
    }

    return ndk::ScopedAStatus::ok();
}

}  // namespace touch
}  // namespace lineage
}  // namespace vendor
}  // namespace aidl
