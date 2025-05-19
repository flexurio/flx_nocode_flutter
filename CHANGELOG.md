# Changelog flx_nocode_flutter

## [1.0.1] - 2025-05-19
### Fixed
- Fixed form creation issue for `auto_generate` field.

## [1.0.0] - 2025-05-19
### Added
- Dropdown widget with hardcoded values support
### Changed (Breaking)
- **Renamed:** Dropdown's `source` parameter renamed to `options_source`
- **Format Updated:** For dropdowns using backend sources, changed value-label format from `backend.entity_name({value}-{label})` to `backend.entity_name({value}:{label})`

## [0.0.5] - 2025-05-15
### Fixed
- Resolved a navigation issue where the app failed to redirect to the detail view when expected

## [0.0.4] - 2025-05-14
### Fixed
- Fixed an issue where fetching data by ID did not return the correct result

## [0.0.3] - 2025-05-08
### Fixed
- Corrected JSON file loading logic to ensure proper data parsing
- Applied number formatting to data displayed on the view page
- Increased font size for `ListTile` trailing data to enhance readability

## [0.0.2] - 2025-05-02
### Documentation
- Updated `README.md` with usage instructions and project details

## [0.0.1] - 2025-05-02
### Added
- Initial release of the `flx_nocode_flutter` package