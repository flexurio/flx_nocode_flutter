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

bldmfp:
	sed -i "s/version: 1.0.1+1/version: $(TAG)-$(TIME)/g" pubspec.yaml && flutter build web --release --web-renderer html --target=lib/main_mf_production.dart && sed -i "s/src=\"main.dart.js\"/src=\"main.dart.js?v=$(TAG)\"/g" build/web/index.html

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

ts:
	flutter test test/code/line_count_test.dart