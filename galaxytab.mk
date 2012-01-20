# Copyright (C) 2010 The Android Open Source Project
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

DEVICE_PACKAGE_OVERLAYS := \
    $(LOCAL_PATH)/overlay

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES := \
	device/samsung/galaxytab/prebuilt/etc/asound.conf:system/etc/asound.conf \
	device/samsung/galaxytab/prebuilt/lib/egl/egl.cfg:system/lib/egl/egl.cfg

# Init files
PRODUCT_COPY_FILES += \
	device/samsung/galaxytab/init.rc:root/init.rc \
        device/samsung/galaxytab/init.smdkc110.rc:root/init.smdkc110.rc \
	device/samsung/galaxytab/init.s5pc110.rc:root/init.s5pc110.rc \
	device/samsung/galaxytab/init.s5pc110.usb.rc:root/init.s5pc110.usb.rc \
	device/samsung/galaxytab/ueventd.s5pc110.rc:root/ueventd.s5pc110.rc \
	device/samsung/galaxytab/lpm.rc:root/lpm.rc


# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
	device/samsung/galaxytab/prebuilt/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
	device/samsung/galaxytab/prebuilt/usr/keylayout/p1_keyboard.kl:system/usr/keylayout/p1_keyboard.kl \
	device/samsung/galaxytab/prebuilt/usr/keylayout/AT42QT602240_Touchscreen.kl:system/usr/keylayout/AT42QT602240_Touchscreen.kl

# Filesystem management tools
PRODUCT_PACKAGES := \
	make_ext4fs \
	setup_fs

# Utilities
PRODUCT_COPY_FILES += \
    device/samsung/galaxytab/prebuilt/mke2fs:utilities/mke2fs \
    device/samsung/galaxytab/prebuilt/redbend_ua:utilities/redbend_ua 
# redbend_ua is a propreitary file, but we'll let it in here for now.

# Lights
PRODUCT_PACKAGES += \
	lights.s5pc110

# Audio
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.primary.s5pc110 \
	audio_policy.s5pc110

# Camera 
PRODUCT_PACKAGES += \
        camera.s5pc110 \
	libs3cjpeg

# These are the OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
	device/samsung/galaxytab/sec_mm/sec_omx/sec_omx_core/secomxregistry:system/etc/secomxregistry \
	device/samsung/galaxytab/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

# These are the OpenMAX IL modules
PRODUCT_PACKAGES += \
  libSEC_OMX_Core.s5pc110 \
  libOMX.SEC.AVC.Decoder.s5pc110 \
  libOMX.SEC.M4V.Decoder.s5pc110 \
  libOMX.SEC.M4V.Encoder.s5pc110 \
  libOMX.SEC.AVC.Encoder.s5pc110

# Libs
PRODUCT_PACKAGES += \
  hwcomposer.s5pc110 \
  libstagefrighthw

# apns config file
PRODUCT_COPY_FILES += \
	development/data/etc/apns-conf.xml:system/etc/apns-conf.xml

# Touchscreen
PRODUCT_COPY_FILES += \
        device/samsung/galaxytab/prebuilt/usr/idc/AT42QT602240_Touchscreen.idc:system/usr/idc/AT42QT602240_Touchscreen.idc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
        frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# vold
PRODUCT_COPY_FILES += \
        device/samsung/galaxytab/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# Tablet!
PRODUCT_CHARACTERISTICS := tablet

# stuff
PRODUCT_PROPERTY_OVERRIDES += \
       ro.telephony.call_ring.multiple=true \
       ro.telephony.call_ring.delay=1000 \
       ro.telephony.call_ring.absent=true \
       ro.telephony.ril_class=samsung \
       mobiledata.interfaces=pdp0,eth0,gprs,ppp0 \
       phone.ril.classname=com.android.internal.telephony.SamsungRIL \
       ro.telephony.ril.v3=1 \
       ro.ril.enable.managed.roaming=1 \
       ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
       ro.ril.emc.mode=2 \
       ro.sf.hwrotation=90 

# camera
PRODUCT_PROPERTY_OVERRIDES += \
       ro.media.capture.maxres=8m \
       ro.media.capture.fast.fps=4 \
       ro.media.capture.slow.fps=120 \
       ro.media.panorama.defres=3264x1840 \
       ro.media.panorama.frameres=1280x720 \
       ro.camcorder.videoModes=true \
       ro.media.enc.jpeg.quality=95

# network tweaks
PRODUCT_PROPERTY_OVERRIDES += \
       ro.ril.hep=1 \
       ro.ril.enable.dtm=1 \
       ro.ril.hsdpa.category=10 \
       ro.ril.enable.a53=1 \
       ro.ril.enable.3g.prefix=1 

# UI tweeaks
PRODUCT_PROPERTY_OVERRIDES += \
       windowsmgr.max_events_per_sec=95 \
       ro.min_pointer_dur=10

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
       wifi.supplicant_scan_interval=45 \
       net.ipv4.tcp_ecn=0 \
       net.ipv4.route.flush=1 \
       net.ipv4.tcp_rfc1337=1 \
       net.ipv4.ip_no_pmtu_disc=0 \
       net.ipv4.tcp_sack=1 \
       net.ipv4.tcp_fack=1 \
       net.ipv4.tcp_window_scaling=1 \
       net.ipv4.tcp_timestamps=1 \
       net.ipv4.tcp_rmem=4096_39000_187000 \
       net.ipv4.tcp_wmem=4096_39000_187000 \
       net.ipv4.tcp_mem=187000_187000_187000 \
       net.ipv4.tcp_no_metrics_save=1 \
       net.ipv4.tcp_moderate_rcvbuf=1

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
        ro.com.google.locationfeatures=1 \
        ro.com.google.networklocation=1 \
        ro.com.google.gmsversion=2.2_r5

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false \
    dalvik.vm.execution-mode=int:jit

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp,adb

# kernel modules for ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/samsung/galaxytab/modules/ramdisk,root/lib/modules)

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/samsung/galaxytab/modules/ramdisk,recovery/root/lib/modules)

# other kernel modules not in ramdisk
PRODUCT_COPY_FILES += $(foreach module,\
    $(filter-out $(RAMDISK_MODULES),$(wildcard device/samsung/galaxytab/modules/*.ko)),\
    $(module):system/lib/modules/$(notdir $(module)))

# rfs converter
PRODUCT_COPY_FILES += \
    device/samsung/galaxytab/prebuilt/sbin/fat.format:root/sbin/fat.format

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/samsung/galaxytab/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs

# copy the filesystem converter
PRODUCT_COPY_FILES += \
	device/samsung/galaxytab/updater.sh:updater.sh

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product-if-exists, vendor/samsung/galaxytab/galaxytab-vendor.mk)

# It's a Tablet!
$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)
