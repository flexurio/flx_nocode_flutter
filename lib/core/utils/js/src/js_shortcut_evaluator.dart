// lib/core/utils/js/src/js_shortcut_evaluator.dart

import 'package:intl/intl.dart';

/// Result of a shortcut evaluation attempt.
class EvaluationResult {
  final dynamic value;
  final bool success;
  EvaluationResult.success(this.value) : success = true;
  EvaluationResult.failure()
      : value = null,
        success = false;
}

/// Evaluates common simple patterns without needing the full JS engine.
class JsShortcutEvaluator {
  EvaluationResult tryEvaluate(String expr, Map<String, dynamic> variables) {
    // 1. Simple path access
    if (_isSimplePath(expr)) {
      final res = _tryResolvePath(expr, variables);
      if (res.success) return res;
    }

    // 2. String concatenation
    if (_isConcatenation(expr)) {
      final val = _resolveConcatenation(expr, variables);
      if (val != null) return EvaluationResult.success(val);
    }

    // 3. Date ISO string
    if (expr.startsWith('new Date(') && expr.endsWith(').toISOString()')) {
      final val = _resolveDateToIso(expr, variables);
      if (val != null) return EvaluationResult.success(val);
    }

    return EvaluationResult.failure();
  }

  bool _isSimplePath(String expr) {
    return !expr.contains('+') &&
        !expr.contains('(') &&
        !expr.contains('"') &&
        !expr.contains("'");
  }

  bool _isConcatenation(String expr) {
    return expr.contains('+') && !expr.contains('(');
  }

  EvaluationResult _tryResolvePath(String path, Map<String, dynamic> vars) {
    if (path == 'null') return EvaluationResult.success(null);
    final parts = path.split('.');
    dynamic current = vars;
    for (final part in parts) {
      if (current is Map && current.containsKey(part)) {
        current = current[part];
      } else if (part == 'length' && (current is List || current is String)) {
        current = current.length;
      } else {
        return EvaluationResult.failure();
      }
    }
    return EvaluationResult.success(current);
  }

  dynamic _resolvePath(String path, Map<String, dynamic> vars) {
    final res = _tryResolvePath(path, vars);
    return res.success ? res.value : null;
  }

  String? _resolveConcatenation(String expr, Map<String, dynamic> vars) {
    // Split by '+' while ignoring those inside quotes if possible,
    // but here we just split and handle parts.
    final parts = expr.split('+');
    String result = '';
    for (final part in parts) {
      final trimmed = part.trim();
      if ((trimmed.startsWith('"') && trimmed.endsWith('"')) ||
          (trimmed.startsWith("'") && trimmed.endsWith("'"))) {
        result += trimmed.substring(1, trimmed.length - 1);
      } else {
        final val = _resolvePath(trimmed, vars);
        if (val == null) return null;
        result += val.toString();
      }
    }
    return result;
  }

  String? _resolveDateToIso(String expr, Map<String, dynamic> vars) {
    final inner = expr
        .substring('new Date('.length, expr.length - ').toISOString()'.length)
        .trim();
    String? resolvedInner;
    if ((inner.startsWith('"') && inner.endsWith('"')) ||
        (inner.startsWith("'") && inner.endsWith("'"))) {
      resolvedInner = inner.substring(1, inner.length - 1);
    } else if (inner.contains('+')) {
      resolvedInner = _resolveConcatenation(inner, vars);
    } else {
      resolvedInner = _resolvePath(inner, vars)?.toString();
    }

    if (resolvedInner != null && resolvedInner.isNotEmpty) {
      try {
        // Try parsing common formats if standard ISO fails
        final dt =
            DateTime.tryParse(resolvedInner) ?? _parseCustom(resolvedInner);
        if (dt != null) {
          return dt.toUtc().toIso8601String();
        }
      } catch (_) {}
    }
    return "";
  }

  DateTime? _parseCustom(String value) {
    // Handle formats like "March 5, 2026T00:00" or similar
    try {
      if (value.contains('T')) {
        final parts = value.split('T');
        final datePart = parts[0].trim();
        final timePart = parts[1].trim();
        final dt = _parseDateOnly(datePart);
        if (dt != null) {
          final timeParts = timePart.split(':');
          final hour = int.tryParse(timeParts[0]) ?? 0;
          final minute =
              timeParts.length > 1 ? (int.tryParse(timeParts[1]) ?? 0) : 0;
          final sec =
              timeParts.length > 2 ? (int.tryParse(timeParts[2]) ?? 0) : 0;
          return DateTime(dt.year, dt.month, dt.day, hour, minute, sec);
        }
      }
      return _parseDateOnly(value);
    } catch (_) {
      return null;
    }
  }

  DateTime? _parseDateOnly(String value) {
    try {
      return DateTime.tryParse(value) ??
          DateFormat.yMMMMd().tryParse(value) ??
          DateFormat.yMMMd().tryParse(value);
    } catch (_) {
      return null;
    }
  }
}
