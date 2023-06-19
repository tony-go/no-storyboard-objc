IDENTITY ?= -

all: \
	dist/MyObjectiveCProject.app/Contents/Info.plist \
	dist/MyObjectiveCProject.app/Contents/MacOS/MyObjectiveCProject \
	entitlements.plist
	/usr/bin/codesign \
		--force \
		--sign $(IDENTITY) \
		--entitlements $(word 3,$^) \
		--timestamp=none \
		--generate-entitlement-der \
		dist/MyObjectiveCProject.app
	/usr/bin/touch -c dist/MyObjectiveCProject.app

dist:
	mkdir $@
dist/MyObjectiveCProject.app: | dist
	mkdir $@
dist/MyObjectiveCProject.app/Contents: | dist/MyObjectiveCProject.app
	mkdir $@
dist/MyObjectiveCProject.app/Contents/MacOS: | dist/MyObjectiveCProject.app/Contents
	mkdir $@
dist/MyObjectiveCProject.app/Contents/Info.plist: Info.plist | dist/MyObjectiveCProject.app/Contents
	install -m 0644 $< $@

XCODE_PATH ?= $(shell xcode-select -p)
MACOS_VERSION = 13.3
CLANG ?= $(XCODE_PATH)/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang
TARGET ?= arm64-apple-macos$(MACOS_VERSION)
MACOS_SDK ?= $(XCODE_PATH)/Platforms/MacOSX.platform/Developer/SDKs/MacOSX$(MACOS_VERSION).sdk

dist/%.o: %.m %.h | dist
	$(CLANG) \
		-x objective-c -O0 -Wall \
		-target $(TARGET) -isysroot $(MACOS_SDK) \
		-fdiagnostics-show-note-include-stack \
		-fmacro-backtrace-limit=0 \
		-fpascal-strings \
		-fstrict-aliasing \
		-DOBJC_OLD_DISPATCH_PROTOTYPES=1 \
		-std=gnu17 \
		-c $< \
		-o $@

dist/%.o: %.m | dist
	$(CLANG) \
		-x objective-c -O0 -Wall \
		-target $(TARGET) -isysroot $(MACOS_SDK) \
		-fdiagnostics-show-note-include-stack \
		-fmacro-backtrace-limit=0 \
		-fpascal-strings \
		-fstrict-aliasing \
		-DOBJC_OLD_DISPATCH_PROTOTYPES=1 \
		-std=gnu17 \
		-c $< \
		-o $@

dist/MyObjectiveCProject.app/Contents/MacOS/MyObjectiveCProject: dist/main.o dist/ViewA.o dist/ViewB.o dist/WindowController.o \
	| dist/MyObjectiveCProject.app/Contents/MacOS
	$(CLANG) \
		-target $(TARGET) -isysroot $(MACOS_SDK) \
		-Xlinker -reproducible \
		-Xlinker -no_deduplicate \
		-Xlinker -dependency_info \
		-Xlinker -no_adhoc_codesign \
		-Wl,-search_paths_first \
		-Wl,-headerpad_max_install_names \
		-fobjc-link-runtime \
		-framework Cocoa \
		$^ -o $@
