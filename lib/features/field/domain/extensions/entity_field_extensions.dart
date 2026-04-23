import 'package:flx_nocode_flutter/features/field/models/field.dart';
import 'package:flx_nocode_flutter/features/field/models/type.dart';

extension EntityFieldDomainX on EntityField {
  bool get isText => typeEnum == EntityFieldType.text;
  bool get isDateTime => typeEnum == EntityFieldType.dateTime;
  bool get isBool => typeEnum == EntityFieldType.bool;
  bool get isPermission => type == 'permission';
  bool get isNumber => typeEnum == EntityFieldType.number;

  /// Returns the enum representation of the field type.
  EntityFieldType get typeEnum {
    if (type.contains('number')) return EntityFieldType.number;
    if (type == 'bool') return EntityFieldType.bool;
    if (type.contains('datetime')) return EntityFieldType.dateTime;
    return EntityFieldType.text;
  }

  /// Extracts the number of decimal places for numeric fields.
  /// Example: `number(2)` returns 2.
  int get decimal {
    if (!isNumber) return 0;
    final match = RegExp(r'number\((\d+)\)').firstMatch(type);
    return (match != null) ? (int.tryParse(match.group(1)!) ?? 0) : 0;
  }

  /// Extracts the backend source components from the options string.
  /// Returns a tuple of (entity, key, value).
  (String entity, String key, String value) get backendSource {
    final source = optionsSource;
    if (source == null) throw Exception('optionsSource is null');

    const pattern =
        r'(?<type>\w+)\.(?<entity>\w+)\(\{(?<key>\w+)\}-\{(?<value>\w+)\}\)';
    final match = RegExp(pattern).firstMatch(source);

    if (match != null) {
      return (
        match.namedGroup('entity')!,
        match.namedGroup('key')!,
        match.namedGroup('value')!,
      );
    }

    return ('', '', '');
  }

  /// Returns the configured datetime format; defaults to 'yyyy-MM-dd HH:mm:ss'.
  String get dateTimeFormat {
    final match = RegExp(r'datetime\((.*?)\)').firstMatch(type);
    final fmt = match?.group(1);
    return (fmt != null && fmt.isNotEmpty) ? fmt : 'yyyy-MM-dd HH:mm:ss';
  }
}
