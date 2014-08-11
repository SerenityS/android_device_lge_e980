#
# Copyright (C) 2011 The Android Open-Source Project
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

# This file includes all definitions that apply to ALL geefhd devices, and
# are also specific to geefhd devices
#
# Everything in this directory will become public

$(call inherit-product, device/lge/gproj-common/gproj.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_PACKAGES += \
	lights.geefhd

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/thermald.conf:system/etc/thermald.conf \
	$(LOCAL_PATH)/thermald-8960.conf:system/etc/thermald-8960.conf \
	$(LOCAL_PATH)/thermald-8960ab.conf:system/etc/thermald-8960ab.conf \
	$(LOCAL_PATH)/thermal-engine-8960.conf:system/etc/thermal-engine-8960.conf	

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/initlogo.rle:root/initlogo.rle888 \
	$(LOCAL_PATH)/init.geefhd.rc:root/init.geefhd.rc \
	$(LOCAL_PATH)/fstab.geefhd:root/fstab.geefhd \
	$(LOCAL_PATH)/ueventd.geefhd.rc:root/ueventd.geefhd.rc

# Alsa audio For Korean varient 
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/alsa/alsa_amixer:system/xbin/alsa_amixer \
	$(LOCAL_PATH)/alsa/alsa_amixer:system/xbin/alsa_aplay \
	$(LOCAL_PATH)/alsa/alsa_amixer:system/xbin/alsa_ctl \
	$(LOCAL_PATH)/alsa/libalsautils.so:system/lib/libalsautils.so \
	$(LOCAL_PATH)/alsa/libasound.so:system/lib/libasound.so \
	$(LOCAL_PATH)/alsa/libaudioalsa.so:system/lib/libaudioalsa.so \
	$(LOCAL_PATH)/alsa/libtinyalsa.so:system/lib/libtinyalsa.so \
	$(LOCAL_PATH)/alsa/libalsautils.so:system/lib/libalsautils.so	\
	$(LOCAL_PATH)/alsa/alsa.conf:system/usr/share/alsa/alsa.conf \
	$(LOCAL_PATH)/alsa/aliases.conf:system/usr/share/alsa/cards/aliases.conf \
	$(LOCAL_PATH)/alsa/center_lfe.conf:system/usr/share/alsa/pcm/center_lfe.conf \
	$(LOCAL_PATH)/alsa/default.conf:system/usr/share/alsa/pcm/default.conf \
	$(LOCAL_PATH)/alsa/dmix.conf:system/usr/share/alsa/pcm/dmix.conf \
	$(LOCAL_PATH)/alsa/dpl.conf:system/usr/share/alsa/pcm/dpl.conf \
	$(LOCAL_PATH)/alsa/dsnoop.conf:system/usr/share/alsa/pcm/dsnoop.conf \
	$(LOCAL_PATH)/alsa/front.conf:system/usr/share/alsa/pcm/front.conf \
	$(LOCAL_PATH)/alsa/iec958.conf:system/usr/share/alsa/pcm/iec958.conf \
	$(LOCAL_PATH)/alsa/modem.conf:system/usr/share/alsa/pcm/modem.conf \
	$(LOCAL_PATH)/alsa/rear.conf:system/usr/share/alsa/pcm/rear.conf \
	$(LOCAL_PATH)/alsa/side.conf:system/usr/share/alsa/pcm/side.conf \
	$(LOCAL_PATH)/alsa/surround40.conf:system/usr/share/alsa/pcm/surround40.conf \
	$(LOCAL_PATH)/alsa/surround41.conf:system/usr/share/alsa/pcm/surround41.conf \
	$(LOCAL_PATH)/alsa/surround50.conf:system/usr/share/alsa/pcm/surround50.conf \
	$(LOCAL_PATH)/alsa/surround51.conf:system/usr/share/alsa/pcm/surround51.conf \
	$(LOCAL_PATH)/alsa/surround71.conf:system/usr/share/alsa/pcm/surround71.conf \
	$(LOCAL_PATH)/alsa/cantata.sh:system/etc/cantata.sh

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

PRODUCT_COPY_FILES += \
       $(LOCAL_PATH)/keypad_8064.kl:system/usr/keylayout/gk-keypad-8064.kl

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/bcmdhd.cal:system/etc/wifi/bcmdhd.cal

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init.qcom.post_boot.sh:system/etc/wifi/init.qcom.post_boot.sh

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=480

PRODUCT_PACKAGES += \
	hwaddrs

PRODUCT_PROPERTY_OVERRIDES += \
	ro.bt.bdaddr_path=/data/misc/bdaddr

# This hw ships locked, work around it with loki
PRODUCT_PACKAGES += \
	loki.sh \
	loki_tool_static_gproj \
	recovery-transform.sh

PRODUCT_COPT_FILES += \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.default_network=9 \
	telephony.lteOnGsmDevice=1

$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)
