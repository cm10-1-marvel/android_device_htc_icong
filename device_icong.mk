#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

$(call inherit-product, build/target/product/full_base_telephony.mk)
$(call inherit-product, build/target/product/languages_full.mk)

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

$(call inherit-product, device/htc/msm7x27-common/msm7x27.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/icong/overlay

### Touchscreen
PRODUCT_COPY_FILES += \
    device/htc/icong/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/icong/idc/cy8c-touchscreen.idc:system/usr/idc/cy8c-touchscreen.idc

### Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

### Mount vold
PRODUCT_COPY_FILES += \
    device/htc/icong/vold.fstab:system/etc/vold.fstab


### Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/icong/key/icong-keypad.kl:system/usr/keylayout/icong-keypad.kl \
    device/htc/icong/key/icong-keypad.kcm.bin:system/usr/keychars/icong-keypad.kcm.bin \
    device/htc/icong/key/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/icong/key/cy8c-touchscreen.kl:system/usr/keylayout/cy8c-touchscreen.kl

## Temp fix for Akmd
PRODUCT_COPY_FILES += \
    device/htc/icong/bin/linker:system/bin/linker

### Ramdisk
PRODUCT_COPY_FILES += \
    device/htc/icong/init.icong.rc:root/init.icong.rc \
    device/htc/icong/ueventd.icong.rc:root/ueventd.icong.rc

# For emmc phone storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.phone_storage=0

### Add additional packages
PRODUCT_PACKAGES += \
    Email2 \
    Exchange2 \
    Torch

# Add device specific modules ## Build for now from msm7x27-common
#PRODUCT_PACKAGES += \
#    gps.icong \
#    librpc

## Get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/icong/icong-vendor.mk)


