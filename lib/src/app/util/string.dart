import 'package:easy_localization/easy_localization.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';

extension StringReplaceExtension on String {
  String renderWithData(Map<String, dynamic> data) {
    return replaceStringWithValues(data)
        .functionDatetimeFormat
        .functionNumberFormat;
  }

  String replaceStringWithValues(Map<String, dynamic> data,
      {bool urlEncode = false}) {
    var url = this;
    for (var key in data.keys) {
      url = url.replaceAll(
          '{$key}',
          urlEncode
              ? Uri.encodeComponent(data[key].toString())
              : data[key].toString());
      url = url.replaceAll(
        '{user.token}',
        UserRepositoryApp.instance.token ?? '',
      );
    }
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
      } catch (e) {
        // fallback: leave original
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
      } catch (e) {
        result = result.replaceFirst(match.group(0)!, rawValue);
      }
    }

    return result;
  }
}
