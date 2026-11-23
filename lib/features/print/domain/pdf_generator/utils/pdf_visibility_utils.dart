import 'package:flx_nocode_flutter/features/entity/models/rule.dart';

/// Evaluates `visible_if` rules in `layout_print` using the standard
/// `flx_nocode_flutter` [Rule] engine (`all` / `any` / `not`).
///
/// Supports both flat keys (e.g. `"official_no"`) and nested dot-paths
/// (e.g. `"data.official_no"`, `"item.verification_url"`, `"sources.actions"`).
class PdfVisibilityUtils {
  /// Returns `true` if the component should be rendered for the given [context].
  ///
  /// - `null` -> `true` (always visible)
  /// - `bool` -> returned directly
  /// - `Map` -> parsed as a [Rule] and evaluated against [context]
  static bool isVisible(dynamic visibleIf, Map<String, dynamic> context) {
    if (visibleIf == null) return true;
    if (visibleIf is bool) return visibleIf;
    if (visibleIf is! Map) return true;

    try {
      final rule = Rule.fromMap(Map<String, dynamic>.from(visibleIf));
      final flattened = _flattenContext(context);
      return rule.evaluate(flattened);
    } catch (e) {
      // Fail open on malformed rules so PDF generation does not crash.
      print('PDF visible_if evaluation warning: $e');
      return true;
    }
  }

  /// Flattens nested maps into dot-separated keys while preserving top-level
  /// keys and nested map/list values so operators like `is_empty` work on both
  /// leaf fields (`item.verification_url`) and collections (`sources.actions`).
  static Map<String, dynamic> _flattenContext(Map<String, dynamic> context) {
    final result = <String, dynamic>{};

    void walk(Map<dynamic, dynamic> map, String prefix) {
      for (final entry in map.entries) {
        final key = entry.key.toString();
        final fullKey = prefix.isEmpty ? key : '$prefix.$key';
        final value = entry.value;

        result[fullKey] = value;

        // Also expose `data.<key>` at top-level if not already set, so
        // `{ "field": "official_no", "op": "is_empty" }` works regardless of
        // whether caller passed `{ "official_no": ... }` or `{ "data": { "official_no": ... } }`.
        if (prefix == 'data' && !result.containsKey(key)) {
          result[key] = value;
        }

        if (value is Map) {
          walk(value, fullKey);
        }
      }
    }

    walk(context, '');
    return result;
  }
}
