class PdfInterpolationUtils {
  static dynamic interpolate(dynamic template, Map<String, dynamic> data) {
    if (template is String) {
      return template.replaceAllMapped(RegExp(r'\{\{(.*?)\}\}'), (match) {
        final fullMatch = match.group(1)?.trim() ?? '';
        final resolved = _lookupPath(fullMatch, data);
        if (!resolved.found) {
          return match.group(0)!; // Key not found, preserve the placeholder
        }
        return resolved.value?.toString() ?? '';
      });
    } else if (template is Map) {
      final result = <String, dynamic>{};
      for (final entry in template.entries) {
        final key = entry.key.toString();
        if (key == 'visible_if') {
          // Preserve Rule objects untouched for PdfVisibilityUtils.
          result[key] = entry.value;
        } else {
          result[key] = interpolate(entry.value, data);
        }
      }
      return result;
    } else if (template is List) {
      return template.map((item) => interpolate(item, data)).toList();
    }
    return template;
  }

  /// Interpolates [json] against [data], preserving List/Map types when a
  /// string is an exact `{{path}}` binding (e.g. `"{{sources.actions}}"`).
  ///
  /// When [preserveTemplates] is `true` (default), template blocks that will
  /// be interpolated per-item (`table.body` when `table.data` is present,
  /// `grid.item_template`, and `visible_if` rules) are kept intact so global
  /// keys do not clobber row/item placeholders.
  static dynamic interpolateJson(
    dynamic json,
    Map<String, dynamic> data, {
    bool preserveTemplates = true,
  }) {
    if (json is String) {
      // Handle simple interpolation like "{{variable}}" by returning the raw object
      final match =
          RegExp(r'^\{\{\s*([a-zA-Z0-9_\.]+)\s*\}\}$').firstMatch(json);
      if (match != null) {
        final fullMatch = match.group(1);
        if (fullMatch != null) {
          final resolved = _lookupPath(fullMatch, data);
          if (!resolved.found) {
            return json; // Return original if not found
          }
          if (resolved.value is List || resolved.value is Map) {
            return resolved.value;
          }
        }
      }
      return interpolate(json, data);
    } else if (json is Map) {
      final type = json['type']?.toString();
      final isDynamicTable = type == 'table' && json['data'] != null;
      final isGrid = type == 'grid';

      final result = <String, dynamic>{};
      for (final entry in json.entries) {
        final key = entry.key.toString();
        if (preserveTemplates &&
            (key == 'visible_if' ||
                (isDynamicTable && key == 'body') ||
                (isGrid && key == 'item_template'))) {
          result[key] = entry.value;
        } else {
          result[key] = interpolateJson(
            entry.value,
            data,
            preserveTemplates: preserveTemplates,
          );
        }
      }
      return result;
    } else if (json is List) {
      return json
          .map((item) => interpolateJson(
                item,
                data,
                preserveTemplates: preserveTemplates,
              ))
          .toList();
    }
    return json;
  }

  /// Interpolates runtime page variables (`{{_page.number}}`, `{{_page.total}}`,
  /// as well as aliases `{{page}}` and `{{pages}}`) inside header/footer trees.
  static dynamic interpolatePageContext(
    dynamic json, {
    required int pageNumber,
    required int pagesCount,
  }) {
    final pageData = <String, dynamic>{
      '_page': {
        'number': pageNumber,
        'total': pagesCount,
      },
      'page': pageNumber,
      'pages': pagesCount,
    };
    return interpolate(json, pageData);
  }

  static _LookupResult _lookupPath(String path, Map<String, dynamic> data) {
    final parts = path.split('.');
    dynamic current = data;

    for (final part in parts) {
      if (current is Map && current.containsKey(part)) {
        current = current[part];
      } else {
        return const _LookupResult(found: false);
      }
    }

    return _LookupResult(found: true, value: current);
  }
}

class _LookupResult {
  final bool found;
  final dynamic value;

  const _LookupResult({required this.found, this.value});
}
