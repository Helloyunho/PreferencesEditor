BUNDLE_NAME = PreferencesEditorPreferences

$(BUNDLE_NAME)_FILES = $(shell find Sources/PreferencesEditor -name '*.swift') $(shell find Sources/PreferencesEditorC -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')
$(BUNDLE_NAME)_INSTALL_PATH = /Library/PreferenceBundles
$(BUNDLE_NAME)_SWIFTFLAGS = -ISources/PreferencesEditorC/include
$(BUNDLE_NAME)_CFLAGS = -fobjc-arc
$(BUNDLE_NAME)_LIBRARIES = MobileGestalt

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/bundle.mk
