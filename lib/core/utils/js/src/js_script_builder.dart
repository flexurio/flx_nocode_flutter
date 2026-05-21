import 'dart:convert';
import 'js_helper_provider.dart';
import 'helpers/js_date_helpers.dart';
import 'helpers/js_math_helpers.dart';
import 'helpers/js_collection_helpers.dart';

/// Builds the JS script containing helper functions and injected variables.
class JsScriptBuilder {
  /// List of providers that inject helper functions into the JS context.
  final List<JsHelperProvider> _providers = [
    JsDateHelpers(),
    JsMathHelpers(),
    JsCollectionHelpers(),
  ];

  /// Builds the full JS script by wrapping [expr] in an IIFE.
  String build(String expr, Map<String, dynamic> variables) {
    final buffer = StringBuffer();
    buffer.writeln('(function(){');

    _appendHelpers(buffer);
    _appendVariables(buffer, variables);

    buffer.writeln('return $expr;');
    buffer.write('})()');
    return buffer.toString();
  }

  /// Iterates through all registered providers to inject helper functions.
  void _appendHelpers(StringBuffer buffer) {
    for (final provider in _providers) {
      provider.append(buffer);
      buffer.writeln(); // Spacing between categories
    }
  }

  /// Injects external variables as constants into the JS context.
  void _appendVariables(StringBuffer buffer, Map<String, dynamic> variables) {
    variables.forEach((key, value) {
      final safeKey = key.replaceAll(RegExp(r'[^a-zA-Z0-9_$]'), '_');
      if (safeKey.isEmpty) return;

      try {
        final sanitized = _sanitize(value);
        final jsonValue = jsonEncode(sanitized);
        buffer.writeln('  const $safeKey = $jsonValue;');
      } catch (_) {}
    });
  }

  /// Recursively cleans data to ensure it is JSON-serializable.
  dynamic _sanitize(dynamic value) {
    if (value == null || value is num || value is bool || value is String) {
      return value;
    }
    if (value is Map) {
      return value.map((k, v) => MapEntry(k.toString(), _sanitize(v)));
    }
    if (value is List) {
      return value.map(_sanitize).toList();
    }
    return null; // Skip non-JSON-encodable types
  }
}
