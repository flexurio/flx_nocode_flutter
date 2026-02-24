pub-d:
	dart pub publish --dry-run

pub:
	dart pub publish

bld:
	flutter pub run build_runner build --delete-conflicting-outputs

clean:
	flutter clean
	rm -f pubspec.lock