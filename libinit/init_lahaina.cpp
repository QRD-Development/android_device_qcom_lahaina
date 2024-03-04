/*
   Copyright (c) 2015, The Linux Foundation. All rights reserved.
   Copyright (C) 2016 The CyanogenMod Project.
   Copyright (C) 2019-2024 The LineageOS Project.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <fstream>
#include <unistd.h>
#include <vector>

#include <android-base/properties.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>
#include <sys/sysinfo.h>

#include "property_service.h"
#include "vendor_init.h"

using android::base::GetProperty;

void property_override(char const prop[], char const value[], bool add = true) {
    prop_info *pi;

    pi = (prop_info *)__system_property_find(prop);
    if (pi) {
        __system_property_update(pi, value, strlen(value));
    } else if (add) {
        __system_property_add(prop, strlen(prop), value, strlen(value));
    }
}

void load_dalvik_properties() {
    struct sysinfo sys;

    sysinfo(&sys);
    if (sys.totalram < 6144ull * 1024 * 1024) {
        // from - phone-xhdpi-6144-dalvik-heap.mk
        property_override("dalvik.vm.heapstartsize", "16m");
        property_override("dalvik.vm.heapgrowthlimit", "256m");
        property_override("dalvik.vm.heapsize", "512m");
        property_override("dalvik.vm.heapmaxfree", "32m");
    } else {
        // 8GB & 12GB RAM
        property_override("dalvik.vm.heapstartsize", "32m");
        property_override("dalvik.vm.heapgrowthlimit", "512m");
        property_override("dalvik.vm.heapsize", "768m");
        property_override("dalvik.vm.heapmaxfree", "64m");
    }

    property_override("dalvik.vm.heaptargetutilization", "0.5");
    property_override("dalvik.vm.heapminfree", "8m");
}

void load_fp_properties() {
    // build fingerprint
    property_override("ro.build.fingerprint", "qti/lahaina/lahaina:11/RKQ1.221111.001/lnxbuild12070507:userdebug/test-keys");
    property_override("ro.bootimage.build.fingerprint", "qti/lahaina/lahaina:11/RKQ1.221111.001/lnxbuild12070507:userdebug/test-keys");
    property_override("ro.odm.build.fingerprint", "qti/lahaina/lahaina:11/RKQ1.221111.001/lnxbuild12070507:userdebug/test-keys");
    property_override("ro.product.build.fingerprint", "qti/lahaina/lahaina:11/RKQ1.221111.001/lnxbuild12070507:userdebug/test-keys");
    property_override("ro.system.build.fingerprint", "qti/lahaina/lahaina:11/RKQ1.221111.001/lnxbuild12070507:userdebug/test-keys");
    property_override("ro.system_ext.build.fingerprint", "qti/lahaina/lahaina:11/RKQ1.221111.001/lnxbuild12070507:userdebug/test-keys");
    property_override("ro.vendor_dlkm.build.fingerprint", "qti/lahaina/lahaina:11/RKQ1.221111.001/lnxbuild12070507:userdebug/test-keys");
    property_override("ro.vendor.build.fingerprint", "qti/lahaina/lahaina:11/RKQ1.221111.001/lnxbuild12070507:userdebug/test-keys");
    // build desc
    property_override("ro.build.description", "lahaina-userdebug 11 RKQ1.221111.001 lnxbuild12070507 test-keys");
}

void vendor_load_properties() {
    load_fp_properties();
    load_dalvik_properties();
}
