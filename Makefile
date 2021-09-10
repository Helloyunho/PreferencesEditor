export TARGET := iphone:clang:latest:12.2
export ARCHS = arm64 arm64e

INSTALL_TARGET_PROCESSES = Preferences
SUBPROJECTS += Tweak
SUBPROJECTS += Preferences

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
