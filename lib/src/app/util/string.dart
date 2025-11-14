import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';

final JavascriptRuntime _jsRuntime = getJavascriptRuntime();

extension StringReplaceExtension on String {
  String interpolateJavascript(Map<String, dynamic> variables) {
    variables.forEach((key, value) {
      final jsonValue = jsonEncode(value);
      _jsRuntime.evaluate("const $key = $jsonValue;");
    });

    final regex = RegExp(r'\{\{(.*?)\}\}', dotAll: true);

    return replaceAllMapped(regex, (match) {
      final rawExpr = match.group(1);
      if (rawExpr == null) return '';

      final expr = rawExpr.trim();
      if (expr.isEmpty) return '';

      try {
        final result = _jsRuntime.evaluate(expr);
        final value = result.stringResult;

        if (value == 'undefined') {
          return match.group(0) ?? '';
        }

        return value;
      } catch (e) {
        return match.group(0) ?? '';
      }
    });
  }

  String renderWithData(Map<String, dynamic> data) {
    return replaceStringWithValues(data)
        .functionDatetimeFormat
        .functionNumberFormat;
  }

  String replaceStringWithValues(Map<String, dynamic> data,
      {bool urlEncode = false}) {
    var url = this;

    // {user.token}
    url = url.replaceAll(
      '{user.token}',
      UserRepositoryApp.instance.token ?? '',
    );

    // {key}
    for (final key in data.keys) {
      final value = data[key];
      final str = value?.toString() ?? '';
      url = url.replaceAll(
        '{$key}',
        urlEncode ? Uri.encodeComponent(str) : str,
      );
    }
    return url;
  }

  String replaceStringWithValuesMultiple(List<Map<String, dynamic>> data,
      {bool urlEncode = false}) {
    var url = this;

    // {user.token}
    url = url.replaceAll(
      '{user.token}',
      UserRepositoryApp.instance.token ?? '',
    );

    // {selected.<field>} -> gabungan nilai dari setiap item data untuk field tsb, dipisah koma
    final selectedFieldRegex = RegExp(r'\{selected\.([a-zA-Z0-9_]+)\}');
    url = url.replaceAllMapped(selectedFieldRegex, (match) {
      final field = match.group(1)!;
      final parts = <String>[];

      for (final row in data) {
        final value = row[field];
        if (value == null) continue;
        parts.add(value.toString());
      }

      final joined = parts.join(',');
      return urlEncode ? Uri.encodeComponent(joined) : joined;
    });

    return url;
  }

  /// Example:
  /// ```dart
  /// "Today is \$datetimeFormat(2025-10-21 08:48:33,, yyyy-MM-dd)".renderDatetime
  /// // Output: "Today is 2025-10-21"
  /// ```
  String get functionDatetimeFormat {
    final regex = RegExp(r'\$datetimeFormat\((.*?)\)');
    var result = this;

    for (final match in regex.allMatches(this)) {
      final inside = match.group(1);
      if (inside == null) continue;

      // Format: $datetime(date, [inputFormat], [outputFormat])
      final parts = inside.split(',').map((e) => e.trim()).toList();
      if (parts.isEmpty) continue;

      final input = parts.isNotEmpty ? parts[0] : '';
      final inputFormat = parts.length > 1 && parts[1].isNotEmpty
          ? parts[1]
          : 'yyyy-MM-dd HH:mm:ss';
      final outputFormat =
          parts.length > 2 && parts[2].isNotEmpty ? parts[2] : 'yyyy-MM-dd';

      try {
        final dt = DateFormat(inputFormat).parse(input, true);
        final formatted = DateFormat(outputFormat).format(dt);
        result = result.replaceFirst(match.group(0)!, formatted);
      } catch (_) {
        // fallback: biarkan input apa adanya
        result = result.replaceFirst(match.group(0)!, input);
      }
    }

    return result;
  }

  /// Example:
  /// ```dart
  /// "Price: \$numberFormat(1234567.89,2)".functionNumberFormat
  /// // Output (en_US): "Price: 1,234,567.89"
  /// // Output (id_ID): "Price: 1.234.567,89"
  /// ```
  String get functionNumberFormat {
    final regex = RegExp(r'\$numberFormat\((.*?)\)');
    var result = this;

    for (final match in regex.allMatches(this)) {
      final inside = match.group(1);
      if (inside == null) continue;

      final parts = inside.split(',').map((e) => e.trim()).toList();
      if (parts.isEmpty) continue;

      final rawValue = parts[0];
      final decimals = parts.length > 1 ? int.tryParse(parts[1]) ?? 0 : 0;

      try {
        final number = double.parse(rawValue);
        final locale = Intl.getCurrentLocale();
        final formatter = NumberFormat.decimalPattern(locale)
          ..minimumFractionDigits = decimals
          ..maximumFractionDigits = decimals;

        final formatted = formatter.format(number);
        result = result.replaceFirst(match.group(0)!, formatted);
      } catch (_) {
        result = result.replaceFirst(match.group(0)!, rawValue);
      }
    }

    return result;
  }
}
