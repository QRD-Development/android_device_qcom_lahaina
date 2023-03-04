#
# Copyright (C) 2023 StatiXOS
# SPDX-License-Identifier: Apache-2.0
#

# Custom tuning for Lahaina SoC

# Setup runtime schedTune
echo "schedutil" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "schedutil" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo "schedutil" > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
echo 1 > /dev/stune/foreground/schedtune.prefer_idle
echo 0 > /dev/stune/foreground/schedtune.prefer_high_cap
echo 0 > /dev/stune/foreground/schedtune.boost
echo 0 > /dev/stune/schedtune.prefer_idle
echo 0 > /dev/stune/schedtune.prefer_high_cap
echo 0 > /dev/stune/schedtune.boost
echo 1 > /dev/stune/top-app/schedtune.prefer_idle
echo 0 > /dev/stune/top-app/schedtune.prefer_high_cap
echo 10 > /dev/stune/top-app/schedtune.boost 10
