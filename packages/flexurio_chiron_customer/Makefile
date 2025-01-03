TIME := $(shell date +"%Y.%m.%d.%H.%M-GMT7")

find:
	find lib/ -type f -name "*.dart" ! -name "*.g.dart" ! -name "*.freezed.dart" | sed "s|^|export '|; s|$|';|"

cp:
	sh copy_asset.sh

cr:
	flutter create --platforms=windows,macos,linux .

wtc:
	flutter pub run build_runner watch --delete-conflicting-outputs

bldh:
	rm lib/src/app/model/*.g.dart && rm lib/src/app/model/*.freezed.dart && flutter pub run build_runner build --delete-conflicting-outputs

bld:
	flutter pub run build_runner build --delete-conflicting-outputs

dsk:
	cp lib/src/app/util/picker_file_desktop lib/src/app/util/picker_file.dart

wb:
	cp lib/src/app/util/picker_file_web lib/src/app/util/picker_file.dart

bldwb:
	cp lib/src/app/util/picker_file_web lib/src/app/util/picker_file.dart && flutter build web --release --web-renderer canvaskit --target=lib/main_chiron_demo.dart

bldapd:
	sed -i "s/version: 1.0.1+1/version: $(TAG)-$(TIME)/g" pubspec.yaml && source ~/.bash_profile && cp lib/src/app/util/picker_file_web lib/src/app/util/picker_file.dart && flutter build web --release --web-renderer canvaskit --target=lib/main_anton_paar_development.dart && sed -i "s/src=\"main.dart.js\"/src=\"main.dart.js?v=$(TAG)\"/g" build/web/index.html

bldcrd:
	sed -i "s/version: 1.0.1+1/version: $(TAG)-$(TIME)/g" pubspec.yaml && source ~/.bash_profile && cp lib/src/app/util/picker_file_web lib/src/app/util/picker_file.dart && flutter build web --release --web-renderer canvaskit --target=lib/main_chiron_demo.dart && sed -i "s/src=\"main.dart.js\"/src=\"main.dart.js?v=$(TAG)\"/g" build/web/index.html

bldmfd:
	sed -i "s/version: 1.0.1+1/version: $(TAG)-$(TIME)/g" pubspec.yaml && source ~/.bash_profile && cp lib/src/app/util/picker_file_web lib/src/app/util/picker_file.dart && flutter build web --release --web-renderer canvaskit --target=lib/main_mf_development.dart && sed -i "s/src=\"main.dart.js\"/src=\"main.dart.js?v=$(TAG)\"/g" build/web/index.html

bldmfp:
	sed -i "s/version: 1.0.1+1/version: $(TAG)-$(TIME)/g" pubspec.yaml && cp lib/src/app/util/picker_file_web lib/src/app/util/picker_file.dart && flutter build web --release --web-renderer canvaskit --target=lib/main_mf_production.dart && sed -i "s/src=\"main.dart.js\"/src=\"main.dart.js?v=$(TAG)\"/g" build/web/index.html

bldtld:
	sed -i "s/version: 1.0.1+1/version: $(TAG)-$(TIME)/g" pubspec.yaml && source ~/.bash_profile && cp lib/src/app/util/picker_file_web lib/src/app/util/picker_file.dart && flutter build web --release --web-renderer canvaskit --target=lib/main_tl_development.dart && sed -i "s/src=\"main.dart.js\"/src=\"main.dart.js?v=$(TAG)\"/g" build/web/index.html

bldtlp:
	sed -i "s/version: 1.0.1+1/version: $(TAG)-$(TIME)/g" pubspec.yaml && cp lib/src/app/util/picker_file_web lib/src/app/util/picker_file.dart && flutter build web --release --web-renderer canvaskit --target=lib/main_tl_production.dart && sed -i "s/src=\"main.dart.js\"/src=\"main.dart.js?v=$(TAG)\"/g" build/web/index.html

bldfin:
	cd packages/flexurio_chiron_finance && flutter pub run build_runner build --delete-conflicting-outputs && cd ../..

bldacc:
	cd packages/flexurio_chiron_accounting && flutter pub run build_runner build --delete-conflicting-outputs && cd ../..


cspell:
	cspell "lib/**" --config cspell.json 
	cspell "test/**" --config cspell.json 

unsed_file:
	flutter pub run dart_code_metrics:metrics check-unused-files lib

fetch:
	git reset --hard
	git fetch $(CI_REPOSITORY_URL) +refs/heads/*:refs/remotes/origin/*
	git checkout $(CI_COMMIT_TAG)
	git submodule foreach --recursive git reset --hard
	git config --global url."https://$(ACCESS_TOKEN)@gitlab.com".insteadOf "https://gitlab.com"
	git submodule update --remote
