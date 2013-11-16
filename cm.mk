# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/icong/device_icong.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := icong
PRODUCT_NAME := cm_icong
PRODUCT_BRAND := htc_europe
PRODUCT_MODEL := Salsa
PRODUCT_MANUFACTURER := HTC

PRODUCT_VERSION_DEVICE_RELEASE := 
PRODUCT_VERSION_DEVICE_SPECIFIC := $(PRODUCT_VERSION_DEVICE_RELEASE)

# CM_RELEASE := true
CM_BUILDTYPE := Kevinjoa
CM_EXTRAVERSION := $(PRODUCT_VERSION_DEVICE_RELEASE)


BUILD_ID := CM10.1-$(shell date -u +%Y%m%d)

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_icong BUILD_ID=$(BUILD_ID) BUILD_DISPLAY_ID=$(BUILD_ID) BUILD_FINGERPRINT=cyanogenmod/htc_icong/icong:4.2.2/$(BUILD_ID)/v0.2:user/release-keys 
PRODUCT_RELEASE_NAME := Kevinjoa-(Based-CRYPTOMILK/OWL)
