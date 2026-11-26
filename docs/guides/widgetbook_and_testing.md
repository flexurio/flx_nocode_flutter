# Widgetbook & Testing Guide

## Running Widgetbook

From the `flx_nocode_flutter` repository root:

```bash
flutter run -t lib/widgetbook.dart -d macos
```

`lib/widgetbook.dart` includes:
- `ViewportAddon(Viewports.all)` — test responsive behavior across desktop, tablet, and mobile viewports.
- `MaterialThemeAddon` — Light and Dark themes.
- `TextScaleAddon` — text scaling (`0.8x` to `2.0x`).

---

## Organizing `@UseCase` Categories

Always specify an explicit `path: '[Category]'` (or `'[Category]/Subfolder'`) on every `@UseCase` annotation so the Widgetbook sidebar stays clean and domain-oriented:

| Category | Path Convention | Contents |
| --- | --- | --- |
| **Access & Rules** | `'[Access & Rules]'` | Capabilities, RBAC/ABAC, JWT context rules |
| **Components** | `'[Components]/Charts'`, `'Data'`, `'Inputs'`, `'Views'` | Reusable engine components |
| **Data & Fields** | `'[Data & Fields]'`, `'[Data & Fields]/Pages'` | Data tables, `value_labels`, `display_source`, entity pages |
| **Forms** | `'[Forms]'` | `LayoutForm` single & multi-step wizards |
| **Popups** | `'[Popups]/Forms'`, `'[Popups]/Dialogs'` | Popup forms, confirmation, e-signature, JSON table, print & symbol dialogs |
| **Print** | `'[Print]'` | `JsonPdfGenerator` PDF previews |

Example:

```dart
@UseCase(
  name: 'Single-Form Popup (From JSON)',
  type: CardForm,
  path: '[Popups]/Forms',
)
Widget singleFormPopupUseCase(BuildContext context) { ... }
```

After adding or updating any `*.widgetbook.dart` file, regenerate `lib/widgetbook.directories.g.dart`:

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## Running Tests & Static Analysis

```bash
# Run all tests
make test

# Run a targeted feature test
flutter test test/features/<feature>/

# Static analysis
flutter analyze
```
