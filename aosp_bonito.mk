#
# Copyright 2019 BBQDroid
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

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, device/google/bonito/device-bonito.mk)
$(call inherit-product-if-exists, vendor/google_devices/bonito/proprietary/device-vendor.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Ring_Synth_04.ogg \
    ro.com.android.dataroaming=true \

PRODUCT_PACKAGES += \
    PhotoTable \
    WallpaperPicker \
    WAPPushManager \

# Boot animation
TARGET_BOOT_ANIMATION_RES := 1080

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

-include device/google/bonito/bonito/device-lineage.mk

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := bonito
PRODUCT_NAME := aosp_bonito
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 3a XL
TARGET_MANUFACTURER := Google
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=bonito \
    PRIVATE_BUILD_DESC="bonito-user 10 QP1A.191105.003 5899767 release-keys"

BUILD_FINGERPRINT := google/bonito/bonito:10/QP1A.191105.003/5899767:user/release-keys

PRODUCT_COPY_FILES += \
    device/sample/etc/apns-full-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml \
    $(LOCAL_PATH)/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml

$(call inherit-product-if-exists, vendor/google/bonito/bonito-vendor.mk)
