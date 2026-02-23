/*
 * Copyright (C) 2021 The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

#define LOG_TAG "vendor.lineage.touch-service.lahaina"

#include <android-base/logging.h>
#include <android/binder_manager.h>
#include <android/binder_process.h>

#include "GloveMode.h"

using aidl::vendor::lineage::touch::GloveMode;

int main() {
    ABinderProcess_setThreadPoolMaxThreadCount(0);

    std::shared_ptr<GloveMode> gloveMode = ndk::SharedRefBase::make<GloveMode>();
    const std::string instance = std::string(GloveMode::descriptor) + "/default";
    const binder_status_t status =
            AServiceManager_addService(gloveMode->asBinder().get(), instance.c_str());
    CHECK_EQ(status, STATUS_OK) << "Failed to add service " << instance << " " << status;

    ABinderProcess_joinThreadPool();
    return EXIT_FAILURE;  // should not reach
}
