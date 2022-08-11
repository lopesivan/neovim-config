.PHONY: android ios lib linux macos test web windows

IML  = $(shell ls *.iml)
NAME =$(IML:.iml=)

devices:
	# flutter config --enable-macos-desktop
	# flutter config --enable-linux-desktop
	# flutter config --enable-windows-desktop
	# flutter config --enable-windows-uwp-desktop
	flutter $@

# upgrade:
# 	flutter channel dev
# 	flutter upgrade
upgrade:
	flutter channel stable
	flutter upgrade
	flutter pub get

run:
	flutter $@
release:
	flutter run --release
debug:
	flutter run --debug
clean:
	flutter clean
linux:
	flutter build linux --release
	ls -l build/linux/x64/release/bundle/$(NAME)
linux-debug:
	flutter build linux --debug
	ls -l build/linux/x64/debug/bundle/$(NAME)
linux-run:
	build/linux/x64/release/bundle/$(NAME)
web:
	flutter build web
chrome:
	flutter run -d chrome
emulator:
	flutter emulator --launch Pixel_XL_API_30
