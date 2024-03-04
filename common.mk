#
# Copyright (C) 2018 The LineageOS Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# AAPT
PRODUCT_AAPT_CONFIG := xlarge
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/a2dp_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_output_policy.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_output_policy.conf \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_tuning_mixer_tavil.txt:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_tuning_mixer_tavil.txt \
    $(LOCAL_PATH)/audio/bluetooth_hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/bluetooth_hearing_aid_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/graphite_ipc_platform_info.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/graphite_ipc_platform_info.xml \
    $(LOCAL_PATH)/audio/listen_platform_info.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/listen_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/mixer_paths_tavil.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_wcd9340.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sound_trigger_mixer_paths_wcd9340.xml \
    $(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sound_trigger_platform_info.xml

PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.service \
    android.hardware.bluetooth.audio-impl \
    android.hardware.soundtrigger@2.1-impl \
    audio.bluetooth.default \
    audio.primary.sdm845 \
    audio.r_submix.default \
    audio.usb.default \
    libbatterylistener \
    libcomprcapture \
    libexthwplugin \
    libhdmiedid \
    libhfp \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libsndmonitor \
    libspkrprot \
    libssrec \
    libvolumelistener

# APEX
PRODUCT_COMPRESSED_APEX := false

# Apex
PRODUCT_DEXPREOPT_SPEED_APPS += \
    Settings \
    SystemUIGoogle

# Boot animation
TARGET_BOOTANIMATION_HALF_RES := true

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0.vendor \
    liba2dpoffload \
    vendor.qti.hardware.bluetooth_audio@2.1.vendor

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl:32 \
    android.hardware.camera.provider@2.4-service \
    libdng_sdk.vendor \
    libgui_shim \
    libpiex_shim \
    vendor.qti.hardware.camera.device@1.0.vendor

# Fonts
TARGET_INCLUDE_CUSTOM_FONTS := true

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/gpio_keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio_keys.kl \
    $(LOCAL_PATH)/configs/keylayout/sec_touchscreen.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sec_touchscreen.kl

# Lights
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/lights/vendor.samsung.hardware.light@3.0-service:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/bin/hw/vendor.samsung.hardware.light@3.0-service \
    $(LOCAL_PATH)/lights/vendor.samsung.hardware.light@3.0-service.rc:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/etc/init/vendor.samsung.hardware.light@3.0-service.rc

# Low power Whitelist
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# Native libraries whitelist
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_PRODUCT)/etc/public.libraries.txt

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci \
    Tag

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_PRODUCT)/etc/libnfc-nci.conf

# OEM Unlock reporting
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.oem_unlock_supported=1

# Omx
PRODUCT_PACKAGES += \
    libOmxCore \
    libmm-omxcore \
    libOmxVdec \
    libOmxVenc

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-aosp

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/platform-samsung.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/platform-samsung.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.sensor.heartrate.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.heartrate.xml \
    frameworks/native/data/etc/android.hardware.vr.high_performance.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.vr.high_performance.xml \
    frameworks/native/data/etc/android.software.controls.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.controls.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.samsung-libperfmgr \
    android.hardware.power@1.2.vendor

PRODUCT_PACKAGES += \
    power.qcom

# Rootdir
PRODUCT_PACKAGES += \
    init.class_main.sh \
    init.qcom.class_core.sh \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.sh

PRODUCT_PACKAGES += \
    fstab.qcom \
    init.carrier.rc \
    init.msm.usb.configfs.rc \
    init.qcom.factory.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.samsung.bsp.rc \
    init.samsung.display.rc \
    init.samsung.rc \
    init.starqlte.rc \
    init.starqltedcm.rc \
    init.target.rc \
    init.rc \
    ueventd.qcom.rc

# Recovery
PRODUCT_PACKAGES += \
    init.recovery.sdm845.rc

# SP-NDK
PRODUCT_PACKAGES += \
    libvulkan

# S-Pen
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/samsung-sec_e-pen.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/sec_e-pen.idc

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/google/interfaces \
    hardware/google/pixel \
    hardware/samsung \
    $(LOCAL_PATH)/aidl/power-libperfmgr

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 29

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    hostapd \
    libwifi-hal-qcom \
    libwpa_client \
    WifiOverlay \
    wifi-mac-generator \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_SYSTEM)/etc/wifi/WCNSS_qcom_cfg.ini

$(call inherit-product, vendor/samsung/sdm845-common/sdm845-common-vendor.mk)
