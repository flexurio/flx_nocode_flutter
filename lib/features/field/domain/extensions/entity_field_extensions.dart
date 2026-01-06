import 'package:flx_nocode_flutter/features/field/models/field.dart';
import 'package:flx_nocode_flutter/features/field/models/type.dart';

extension EntityFieldDomainX on EntityField {
  bool get isText => type == 'text';
  bool get isDateTime => type.contains('datetime');
  bool get isBool => type == 'bool';
  bool get isPermission => type == 'permission';
  bool get isNumber => type.contains('number');

  EntityFieldType get typeEnum {
    if (isNumber) return EntityFieldType.number;
    if (isBool) return EntityFieldType.bool;
    if (isDateTime) return EntityFieldType.dateTime;
    return EntityFieldType.text;
  }

  int get decimal {
    if (!isNumber) return 0;
    final regExp = RegExp(r'number\((\d+)\)');
    final match = regExp.firstMatch(type);
    if (match != null) {
      final number = match.group(1)!;
      return int.tryParse(number) ?? 0;
    }
    return 0;
  }

  (String entity, String key, String value) get backendSource {
    if (optionsSource == null) {
      throw Exception('Source is null');
    }

    // NOTE: more precise, tolerate hyphen or arrow-like separator within braces
    final pattern =
        r'(?<type>\w+)\.(?<entity>\w+)\(\{(?<key>\w+)\}-\{(?<value>\w+)\}\)';
    final regExp = RegExp(pattern);
    final match = regExp.firstMatch(optionsSource!);

    var entity = '';
    var key = '';
    var value = '';

    if (match != null) {
      entity = match.namedGroup('entity')!;
      key = match.namedGroup('key')!;
      value = match.namedGroup('value')!;
    }

    return (entity, key, value);
  }

  String get dateTimeFormat {
    final regex = RegExp(r'datetime\((.*?)\)');
    final match = regex.firstMatch(type);
    if (match != null) {
      final fmt = match.group(1);
      if (fmt != null && fmt.isNotEmpty) return fmt;
    }
    return 'yyyy-MM-dd HH:mm:ss';
  }
}
