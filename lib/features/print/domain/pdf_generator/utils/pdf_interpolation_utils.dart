class PdfInterpolationUtils {
  static dynamic interpolate(dynamic template, Map<String, dynamic> data) {
    if (template is String) {
      return template.replaceAllMapped(RegExp(r'\{\{(.*?)\}\}'), (match) {
        final fullMatch = match.group(1)?.trim() ?? '';
        
        // Handle nested access like data.name
        final parts = fullMatch.split('.');
        dynamic current = data;
        
        for (final part in parts) {
          if (current is Map && current.containsKey(part)) {
            current = current[part];
          } else {
            return ''; // Key not found
          }
        }
        
        return current?.toString() ?? '';
      });
    } else if (template is Map) {
      final result = <String, dynamic>{};
      for (final entry in template.entries) {
        result[entry.key.toString()] = interpolate(entry.value, data);
      }
      return result;
    } else if (template is List) {
      return template.map((item) => interpolate(item, data)).toList();
    }
    return template;
  }

  static dynamic interpolateJson(dynamic json, Map<String, dynamic> data) {
    if (json is String) {
      // Handle simple interpolation like "{{variable}}" by returning the raw object
      final match = RegExp(r'^\{\{\s*([a-zA-Z0-9_\.]+)\s*\}\}$').firstMatch(json);
      if (match != null) {
        final fullMatch = match.group(1);
        if (fullMatch != null) {
          final parts = fullMatch.split('.');
          dynamic current = data;
          for (final part in parts) {
            if (current is Map && current.containsKey(part)) {
              current = current[part];
            } else {
              return json; // Return original if not found
            }
          }
          if (current is List || current is Map) return current;
        }
      }
      return interpolate(json, data);
    } else if (json is Map) {
      return json.map((key, value) => MapEntry(key.toString(), interpolateJson(value, data)));
    } else if (json is List) {
      return json.map((item) => interpolateJson(item, data)).toList();
    }
    return json;
  }
}
