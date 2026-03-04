.PHONY: build-macos-zip clean bld pub pub-d get test coverage open-coverage analyze analyze-all update-readme-coverage

get: ## Get dependencies
	flutter pub get

bld: ## Run build_runner
	flutter pub run build_runner build --delete-conflicting-outputs

test: ## Run tests
	flutter test

coverage: ## Run tests with coverage and generate report
	flutter test --coverage
	@if [ -f coverage/lcov.info ]; then \
		if command -v genhtml >/dev/null 2>&1; then \
			genhtml coverage/lcov.info -o coverage/html; \
			echo "Coverage report generated at coverage/html/index.html"; \
		else \
			echo "genhtml not found. LCOV info is available at coverage/lcov.info"; \
		fi \
	else \
		echo "Coverage file not generated."; exit 1; \
	fi

open-coverage: ## Open the code coverage report in the browser
	@if [ -f coverage/html/index.html ]; then \
		open coverage/html/index.html; \
	else \
		echo "Coverage report not found. Run 'make coverage' first."; \
	fi

update-readme-coverage: ## Update coverage badge in README
	@if [ -f coverage/lcov.info ]; then \
		PERCENTAGE=$$(lcov --summary coverage/lcov.info | grep lines | cut -d ' ' -f 4 | tr -d '%'); \
		COLOR="red"; \
		INT_PERCENTAGE=$$(echo $$PERCENTAGE | cut -d. -f1 | tr -dc '0-9'); \
		if [ -z "$$INT_PERCENTAGE" ]; then INT_PERCENTAGE=0; fi; \
		if [ "$$INT_PERCENTAGE" -ge 80 ]; then COLOR="green"; \
		elif [ "$$INT_PERCENTAGE" -ge 50 ]; then COLOR="yellow"; fi; \
		echo "Updating README.md with coverage: $$PERCENTAGE% ($$COLOR)"; \
		if [[ "$$OSTYPE" == "darwin"* ]]; then \
			sed -i '' "s/coverage-[0-9.]*%25-[a-z]*/coverage-$$PERCENTAGE%25-$$COLOR/g" README.md; \
		else \
			sed -i "s/coverage-[0-9.]*%25-[a-z]*/coverage-$$PERCENTAGE%25-$$COLOR/g" README.md; \
		fi \
	fi

lint-report: ## Run flutter analyze and generate report
	@echo "Running static analysis..."
	@flutter analyze > lint_report.txt 2>&1 || true
	@ISSUES=$$(grep -oE "[0-9]+ issues found" lint_report.txt | head -n1 | cut -d' ' -f1); \
	[ -z "$$ISSUES" ] && ISSUES=0; \
	COLOR="success"; \
	[ "$$ISSUES" -gt 0 ] && COLOR="yellow"; \
	[ "$$ISSUES" -gt 100 ] && COLOR="red"; \
	if [[ "$$OSTYPE" == "darwin"* ]]; then \
		sed -i '' "s/lints-[0-9a-z%]*-[a-z]*/lints-$$ISSUES%20issues-$$COLOR/g" README.md; \
	else \
		sed -i "s/lints-[0-9a-z%]*-[a-z]*/lints-$$ISSUES%20issues-$$COLOR/g" README.md; \
	fi; \
	echo "Analysis complete: $$ISSUES issues found ($$COLOR)"; \
	echo "Report saved to lint_report.txt"

analyze-all: lint-report ## Run all analysis

clean: ## Clean build artifacts
	flutter clean
	rm -f pubspec.lock

pub-d:
	dart pub publish --dry-run

pub:
	dart pub publish

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