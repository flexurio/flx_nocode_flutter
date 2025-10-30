import 'package:easy_localization/easy_localization.dart';

extension StringReplaceExtension on String {
  String replaceStringWithValues(Map<String, dynamic> data,
      {bool urlEncode = false}) {
    var url = this;
    for (var key in data.keys) {
      url = url.replaceAll(
          '{$key}',
          urlEncode
              ? Uri.encodeComponent(data[key].toString())
              : data[key].toString());
    }
    return url;
  }

  /// Example:
  /// ```dart
  /// "Today is \$datetime(2025-10-21 08:48:33,, yyyy-MM-dd)".renderDatetime
  /// // Output: "Today is 2025-10-21"
  /// ```
  String get renderDatetime {
    final regex = RegExp(r'\$datetime\((.*?)\)');
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
}
