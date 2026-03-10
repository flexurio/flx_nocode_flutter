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
    final trimmed = expr.trim();
    if (trimmed.isEmpty) return EvaluationResult.success('');

    // 1. Simple path access
    if (_isSimplePath(trimmed)) {
      final res = _tryResolvePath(trimmed, variables);
      if (res.success) return res;
    }

    // 2. String concatenation (simple)
    if (_isConcatenation(trimmed)) {
      final val = _resolveConcatenation(trimmed, variables);
      if (val != null) return EvaluationResult.success(val);
    }

    // 3. formatDate helper
    if (trimmed.startsWith('formatDate(')) {
      final val = _resolveFormatDate(trimmed, variables);
      if (val != null) return EvaluationResult.success(val);
    }

    // 4. now helper
    if (trimmed.startsWith('now(')) {
      final val = _resolveNow(trimmed, variables);
      if (val != null) return EvaluationResult.success(val);
    }

    // 5. Date methods and ISO
    if (trimmed.startsWith('new Date(')) {
      if (trimmed.endsWith('.toISOString()')) {
        final val = _resolveDateToIso(trimmed, variables);
        if (val != null) return EvaluationResult.success(val);
      } else if (trimmed.endsWith('.getFullYear()')) {
        final val = _resolveDateGetFullYear(trimmed, variables);
        if (val != null) return EvaluationResult.success(val);
      }
    }

    // 6. Simple subtraction (for date difference in hours etc)
    if (trimmed.contains('-') && trimmed.contains('new Date(')) {
      final val = _resolveDateMath(trimmed, variables);
      if (val != null) return EvaluationResult.success(val);
    }

    // 7. Simple ternary (condition ? trueVal : falseVal)
    if (trimmed.contains('?') && trimmed.contains(':')) {
      final val = _resolveTernary(trimmed, variables);
      if (val != null) return EvaluationResult.success(val);
    }

    return EvaluationResult.failure();
  }

  bool _isSimplePath(String expr) {
    return !expr.contains('+') &&
        !expr.contains('-') &&
        !expr.contains('*') &&
        !expr.contains('/') &&
        !expr.contains('(') &&
        !expr.contains('?') &&
        !expr.contains('"') &&
        !expr.contains("'");
  }

  bool _isConcatenation(String expr) {
    return expr.contains('+') && !expr.contains('(') && !expr.contains('new ');
  }

  EvaluationResult _tryResolvePath(String path, Map<String, dynamic> vars) {
    if (path == 'null') return EvaluationResult.success(null);
    if (path == 'true') return EvaluationResult.success(true);
    if (path == 'false') return EvaluationResult.success(false);
    final numVal = num.tryParse(path);
    if (numVal != null) return EvaluationResult.success(numVal);

    final parts = path.split('.');
    dynamic current = vars;
    for (final part in parts) {
      if (current is Map && current.containsKey(part)) {
        current = current[part];
      } else if (part == 'length' && (current is List || current is String)) {
        current = current.length;
      } else if (current is Map &&
          !current.containsKey(part) &&
          vars.containsKey(part)) {
        // Fallback to root (should ideally be handled by scope builder but just in case)
        current = vars[part];
      } else {
        return EvaluationResult.failure();
      }
    }
    return EvaluationResult.success(current);
  }

  dynamic _resolvePath(String path, Map<String, dynamic> vars) {
    final res = _tryResolvePath(path.trim(), vars);
    return res.success ? res.value : null;
  }

  String? _resolveConcatenation(String expr, Map<String, dynamic> vars) {
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

  DateTime? _parseDateExpr(String expr, Map<String, dynamic> vars) {
    final trimmed = expr.trim();
    if (trimmed.startsWith('new Date(') && trimmed.endsWith(')')) {
      final inner = trimmed.substring(9, trimmed.length - 1).trim();
      if (inner.isEmpty) return DateTime.now();

      // Handle new Date(y, m, d, ...)
      if (inner.contains(',')) {
        final parts = inner.split(',').map((e) => e.trim()).toList();
        if (parts.length >= 2) {
          final y = int.tryParse(parts[0]) ?? 0;
          final m = (int.tryParse(parts[1]) ?? 0) +
              1; // JS 0-indexed to Dart 1-indexed
          final d = parts.length > 2 ? (int.tryParse(parts[2]) ?? 1) : 1;
          final h = parts.length > 3 ? (int.tryParse(parts[3]) ?? 0) : 0;
          final min = parts.length > 4 ? (int.tryParse(parts[4]) ?? 0) : 0;
          final s = parts.length > 5 ? (int.tryParse(parts[5]) ?? 0) : 0;
          return DateTime(y, m, d, h, min, s);
        }
      }

      // Handle new Date("string") or new Date(variable)
      String? resolvedInner;
      if ((inner.startsWith('"') && inner.endsWith('"')) ||
          (inner.startsWith("'") && inner.endsWith("'"))) {
        resolvedInner = inner.substring(1, inner.length - 1);
      } else {
        final val = _resolvePath(inner, vars);
        if (val != null) {
          resolvedInner = val.toString();
        }
      }

      if (resolvedInner != null && resolvedInner.isNotEmpty) {
        return DateTime.tryParse(resolvedInner) ?? _parseCustom(resolvedInner);
      }
    }
    return null;
  }

  String? _resolveFormatDate(String expr, Map<String, dynamic> vars) {
    // format: formatDate(dateExpr, 'format')
    final match = RegExp(
            r"formatDate\s*\((.*),\s*['" + '"' + r"](.*?)['" + '"' + r"]\s*\)")
        .firstMatch(expr);
    if (match == null) return null;

    final dateExpr = match.group(1)!.trim();
    final fmt = match.group(2)!;

    final dt = _parseDateExpr(dateExpr, vars);
    if (dt == null) return "";

    return _formatDate(dt, fmt);
  }

  String? _resolveNow(String expr, Map<String, dynamic> vars) {
    // format: now('format') or now()
    final match =
        RegExp(r"now\s*\(\s*(?:['" + '"' + r"](.*?)['" + '"' + r"]\s*)?\s*\)")
            .firstMatch(expr);
    if (match == null) return null;

    final fmt = match.group(1) ?? "yyyy-MM-dd HH:mm:ss";
    return _formatDate(DateTime.now(), fmt);
  }

  String _formatDate(DateTime dt, String format) {
    final months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    final monthsShort = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];

    String res = format;
    res = res.replaceAll('yyyy', dt.year.toString());
    res = res.replaceAll('YYYY', dt.year.toString());
    res = res.replaceAll('MMMM', months[dt.month - 1]);
    res = res.replaceAll('MMM', monthsShort[dt.month - 1]);
    res = res.replaceAll('MM', dt.month.toString().padLeft(2, '0'));
    res = res.replaceAll('dd', dt.day.toString().padLeft(2, '0'));
    res = res.replaceAll('DD', dt.day.toString().padLeft(2, '0'));
    res = res.replaceAll('HH', dt.hour.toString().padLeft(2, '0'));
    res = res.replaceAll('mm', dt.minute.toString().padLeft(2, '0'));
    res = res.replaceAll('ss', dt.second.toString().padLeft(2, '0'));
    return res;
  }

  String? _resolveDateToIso(String expr, Map<String, dynamic> vars) {
    final dateExpr = expr.substring(0, expr.lastIndexOf('.toISOString()'));
    final dt = _parseDateExpr(dateExpr, vars);
    return dt?.toUtc().toIso8601String();
  }

  int? _resolveDateGetFullYear(String expr, Map<String, dynamic> vars) {
    final dateExpr = expr.substring(0, expr.lastIndexOf('.getFullYear()'));
    final dt = _parseDateExpr(dateExpr, vars);
    return dt?.year;
  }

  dynamic _resolveDateMath(String expr, Map<String, dynamic> vars) {
    // format: (new Date(end) - new Date(start)) / (1000 * 60 * 60)
    final match = RegExp(
            r"^\s*\(\s*(new Date\(.*?\))\s*-\s*(new Date\(.*?\))\s*\)\s*/\s*\(\s*(\d+)\s*\*\s*(\d+)\s*\*\s*(\d+)\s*\)\s*$")
        .firstMatch(expr);
    if (match != null) {
      final dt1 = _parseDateExpr(match.group(1)!, vars);
      final dt2 = _parseDateExpr(match.group(2)!, vars);
      if (dt1 != null && dt2 != null) {
        final diffMs = dt1.difference(dt2).inMilliseconds;
        final factor = int.parse(match.group(3)!) *
            int.parse(match.group(4)!) *
            int.parse(match.group(5)!);
        final result = diffMs / factor;
        if (result == result.toInt()) {
          return result.toInt();
        }
        return result;
      }
    }
    return null;
  }

  dynamic _resolveTernary(String expr, Map<String, dynamic> vars) {
    // format: condition ? trueVal : falseVal
    final parts = expr.split('?');
    if (parts.length != 2) return null;
    final condition = parts[0].trim();
    final remaining = parts[1].split(':');
    if (remaining.length != 2) return null;
    final trueValExpr = remaining[0].trim();
    final falseValExpr = remaining[1].trim();

    final conditionMatch = _resolvePath(condition, vars);
    final bool conditionResult = _asBool(conditionMatch);

    final targetExpr = conditionResult ? trueValExpr : falseValExpr;
    final res = tryEvaluate(targetExpr, vars);
    return res.success ? res.value : _resolvePath(targetExpr, vars);
  }

  bool _asBool(dynamic value) {
    if (value == null) return false;
    if (value is bool) return value;
    if (value is num) return value != 0;
    if (value is String) {
      if (value.isEmpty) return false;
      if (value.toLowerCase() == 'false') return false;
      if (value.toLowerCase() == 'null') return false;
      if (value.toLowerCase() == 'undefined') return false;
      return true;
    }
    return true;
  }

  DateTime? _parseCustom(String value) {
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
