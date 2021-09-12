TWEAK_NAME = PreferencesEditor

$(TWEAK_NAME)_FILES = $(shell find Sources/PreferencesEditor -name '*.swift') $(shell find Sources/PreferencesEditorC -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')
$(TWEAK_NAME)_SWIFTFLAGS = -ISources/PreferencesEditorC/include
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -ISources/PreferencesEditorC/include

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
