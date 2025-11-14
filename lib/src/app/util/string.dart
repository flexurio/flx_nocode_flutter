import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flx_nocode_flutter/core/utils/js/js_eval.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';

extension StringReplaceExtension on String {
  /// Replaces all `{{ ... }}` with evaluated JavaScript expressions.
  ///
  /// - Variables in [variables] are injected as `const` inside a local scope.
  /// - `now(format)` is available for date formatting:
  ///   - now()                    → Date.toString()
  ///   - now("YYYY-MM-DD")
  ///   - now("DD MMM YYYY")
  ///   - now("DD MMMM YYYY HH:mm")
  String interpolateJavascript(Map<String, dynamic> variables) {
    final regex = RegExp(r'\{\{(.*?)\}\}', dotAll: true);

    return replaceAllMapped(regex, (match) {
      final rawExpr = match.group(1);
      if (rawExpr == null) return '';

      final expr = rawExpr.trim();
      if (expr.isEmpty) return '';

      final script = _buildJsScript(expr, variables);

      try {
        final value = evalJs(script);

        if (value.isEmpty || value == 'undefined' || value == 'null') {
          // fall back to original {{ ... }} on weird result
          return match.group(0) ?? '';
        }

        return value;
      } catch (_) {
        // On error, keep the original placeholder
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

/// Builds a self-contained JS snippet:
/// (function() {
///   // helpers
///   // injected vars
///   return <expr>;
/// })()
String _buildJsScript(
  String expr,
  Map<String, dynamic> variables,
) {
  final buffer = StringBuffer();

  buffer.writeln('(function(){');

  // Helpers
  buffer.writeln('function pad(n){return n<10?"0"+n:n;}');

  buffer.writeln('const MONTH_NAMES=['
      '"January","February","March","April","May","June",'
      '"July","August","September","October","November","December"];');

  buffer.writeln('const MONTH_NAMES_SHORT=['
      '"Jan","Feb","Mar","Apr","May","Jun",'
      '"Jul","Aug","Sep","Oct","Nov","Dec"];');

  buffer.writeln('function formatDate(date,fmt){'
      'if(!fmt) return date.toString();'
      'return fmt'
      '.replace("YYYY",date.getFullYear())'
      '.replace("MMMM",MONTH_NAMES[date.getMonth()])'
      '.replace("MMM",MONTH_NAMES_SHORT[date.getMonth()])'
      '.replace("MM",pad(date.getMonth()+1))'
      '.replace("DD",pad(date.getDate()))'
      '.replace("HH",pad(date.getHours()))'
      '.replace("mm",pad(date.getMinutes()))'
      '.replace("ss",pad(date.getSeconds()));'
      '}');

  buffer.writeln('function now(fmt){'
      'var d=new Date();'
      'return formatDate(d,fmt);'
      '}');

  // Inject variables as const (local to this IIFE)
  variables.forEach((key, value) {
    final jsonValue = jsonEncode(value);
    // Assumes `key` is a valid JS identifier.
    buffer.writeln('const $key = $jsonValue;');
  });

  buffer.writeln('return ($expr);');
  buffer.writeln('})()');

  return buffer.toString();
}
