#
# Copyright 2014 The Android Open-Source Project
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

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Get the long list of APNs
PRODUCT_COPY_FILES := device/moto/shamu/apns-full-conf.xml:system/etc/apns-conf.xml

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

PRODUCT_NAME := screwd_shamu
PRODUCT_DEVICE := shamu
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 6
PRODUCT_MANUFACTURER := motorola
#PRODUCT_RESTRICT_VENDOR_FILES := true

$(call inherit-product, device/moto/shamu/device.mk)
$(call inherit-product-if-exists, vendor/moto/shamu/device-vendor.mk)

PRODUCT_NAME := screwd_shamu

PRODUCT_PACKAGES += \
    Launcher3

# Device Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=shamu \
    BUILD_FINGERPRINT=google/shamu/shamu:7.1.1/N6F27M/4299435:user/release-keys \
    PRIVATE_BUILD_DESC="shamu-user 7.1.1 N6F27M 4299435 release-keys"
    
# Kernel inline build
TARGET_KERNEL_SOURCE := kernel/moto/shamu
TARGET_KERNEL_CONFIG := shamu_defconfig
TARGET_GCC_VERSION_ARM := 4.9

# Enable real time lockscreen charging current values
BOARD_GLOBAL_CFLAGS += -DBATTERY_REAL_INFO
