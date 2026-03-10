// lib/core/utils/js/src/js_date_helper.dart

import 'package:intl/intl.dart';

/// Helper class to handle JavaScript-like date operations in a Dart environment.
/// This is used by the shortcut evaluator to avoid falling back to the full JS engine
/// for common date formatting and manipulation tasks.
class JsDateHelper {
  /// Formats a [DateTime] object according to a simplified JS-like format string.
  /// Supported tokens:
  /// - yyyy / YYYY: Full year
  /// - MMMM: Full month name
  /// - MMM: Short month name
  /// - MM: Zero-padded month number
  /// - dd / DD: Zero-padded day of month
  /// - HH: Zero-padded hours (24h)
  /// - mm: Zero-padded minutes
  /// - ss: Zero-padded seconds
  static String formatDate(DateTime dt, String format) {
    const months = [
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
    const monthsShort = [
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

  /// Parses a JavaScript expression representing a Date into a Dart [DateTime].
  /// Supports:
  /// - new Date()
  /// - new Date("iso_string")
  /// - new Date(variable_name)
  /// - new Date(y, m, d, ...)
  static DateTime? parseDateExpr(
    String expr,
    Map<String, dynamic> vars,
    dynamic Function(String path, Map<String, dynamic> vars) pathResolver,
  ) {
    final trimmed = expr.trim();
    if (trimmed.startsWith('new Date(') && trimmed.endsWith(')')) {
      final inner = trimmed.substring(9, trimmed.length - 1).trim();
      if (inner.isEmpty) return DateTime.now();

      // Handle new Date(y, m, d, ...)
      // Note: JS months are 0-indexed (0=Jan, 11=Dec)
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

      // Handle new Date("string") or new Date(variable) or new Date(concatenation)
      final val = pathResolver(inner, vars);
      final String? resolvedInner = val?.toString();

      if (resolvedInner != null && resolvedInner.isNotEmpty) {
        return DateTime.tryParse(resolvedInner) ?? _parseCustom(resolvedInner);
      }
    }
    return null;
  }

  /// Handles custom date parsing for common formats that DateTime.tryParse might miss.
  static DateTime? _parseCustom(String value) {
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

  /// Parses only the date portion using common formats.
  static DateTime? _parseDateOnly(String value) {
    try {
      return DateTime.tryParse(value) ??
          DateFormat.yMMMMd().tryParse(value) ??
          DateFormat.yMMMd().tryParse(value);
    } catch (_) {
      return null;
    }
  }

  /// Resolves the `formatDate(date, fmt)` shortcut.
  static String? resolveFormatDate(
    String expr,
    Map<String, dynamic> vars,
    dynamic Function(String path, Map<String, dynamic> vars) pathResolver,
  ) {
    // Regex matches: formatDate( anything , 'any format' )
    final match = RegExp(
            r"formatDate\s*\((.*),\s*['" + '"' + r"](.*?)['" + '"' + r"]\s*\)")
        .firstMatch(expr);
    if (match == null) return null;

    final dateExpr = match.group(1)!.trim();
    final fmt = match.group(2)!;

    final dt = parseDateExpr(dateExpr, vars, pathResolver);
    if (dt == null) return "";

    return formatDate(dt, fmt);
  }

  /// Resolves the `now(fmt)` shortcut.
  static String? resolveNow(String expr) {
    // Regex matches: now('fmt') or now()
    final match =
        RegExp(r"now\s*\(\s*(?:['" + '"' + r"](.*?)['" + '"' + r"]\s*)?\s*\)")
            .firstMatch(expr);
    if (match == null) return null;

    final fmt = match.group(1) ?? "yyyy-MM-dd HH:mm:ss";
    return formatDate(DateTime.now(), fmt);
  }

  /// Resolves `new Date(...).toISOString()`.
  static String? resolveDateToIso(
    String expr,
    Map<String, dynamic> vars,
    dynamic Function(String path, Map<String, dynamic> vars) pathResolver,
  ) {
    // Strips .toISOString() part to get the Date expression.
    final dateExpr = expr.substring(0, expr.lastIndexOf('.toISOString()'));
    final dt = parseDateExpr(dateExpr, vars, pathResolver);
    return dt?.toUtc().toIso8601String();
  }

  /// Resolves `new Date(...).getFullYear()`.
  static int? resolveDateGetFullYear(
    String expr,
    Map<String, dynamic> vars,
    dynamic Function(String path, Map<String, dynamic> vars) pathResolver,
  ) {
    // Strips .getFullYear() part to get the Date expression.
    final dateExpr = expr.substring(0, expr.lastIndexOf('.getFullYear()'));
    final dt = parseDateExpr(dateExpr, vars, pathResolver);
    return dt?.year;
  }

  /// Resolves `(new Date(end) - new Date(start)) / divisor` shortcuts.
  static dynamic resolveDateMath(
    String expr,
    Map<String, dynamic> vars,
    dynamic Function(String path, Map<String, dynamic> vars) pathResolver,
  ) {
    // Regex for duration calculations in hours etc.
    final match = RegExp(
            r"^\s*\(\s*(new Date\(.*?\))\s*-\s*(new Date\(.*?\))\s*\)\s*/\s*\(\s*(\d+)\s*\*\s*(\d+)\s*\*\s*(\d+)\s*\)\s*$")
        .firstMatch(expr);
    if (match != null) {
      final dt1 = parseDateExpr(match.group(1)!, vars, pathResolver);
      final dt2 = parseDateExpr(match.group(2)!, vars, pathResolver);
      if (dt1 != null && dt2 != null) {
        final diffMs = dt1.difference(dt2).inMilliseconds;
        final factor = int.parse(match.group(3)!) *
            int.parse(match.group(4)!) *
            int.parse(match.group(5)!);
        final result = diffMs / factor;
        // Return int if it's a whole number to match JS stringification
        if (result == result.toInt()) {
          return result.toInt();
        }
        return result;
      }
    }
    return null;
  }
}
