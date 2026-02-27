.PHONY: build-macos-zip clean bld pub pub-d

pub-d:
	dart pub publish --dry-run

pub:
	dart pub publish

bld:
	flutter pub run build_runner build --delete-conflicting-outputs

clean:
	flutter clean
	rm -f pubspec.lock

build-macos-zip: ## Build and package macOS app as zip for asset/bin/frontend
	@echo "Building macOS application..."
	flutter build macos --release
	@rm -rf build/macos/Build/Products/Release/macos
	@rm -f build/macos/Build/Products/Release/macos.zip
	@mkdir -p build/macos/Build/Products/Release/macos
	@cp -R build/macos/Build/Products/Release/flx_nocode_flutter.app build/macos/Build/Products/Release/macos/
	@echo "Zipping macos.zip..."
	@cd build/macos/Build/Products/Release && zip -r9y macos.zip macos
	@echo "Updating asset/bin/frontend/macos.zip..."
	@mkdir -p ../../asset/bin/frontend
	@cp build/macos/Build/Products/Release/macos.zip ../../asset/bin/frontend/macos.zip
	@rm -rf build/macos/Build/Products/Release/macos
	@echo "Done! macos.zip has been updated in asset/bin/frontend/macos.zip"