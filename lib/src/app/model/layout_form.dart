import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

typedef JsonMap = Map<String, dynamic>;

enum FormType {
  view,
  create,
  update;

  factory FormType.fromString(String? s) {
    if (s == null) return FormType.create;
    try {
      return FormType.values.byName(s);
    } catch (_) {
      throw ArgumentError('Invalid FormType: $s');
    }
  }
}

class LayoutForm extends HiveObject {
  final String name;
  final List<GroupLayout> groups;

  FormType get formType => FormType.fromString(name);

  LayoutForm({
    required this.name,
    required this.groups,
  })  : assert(name != ''),
        assert(groups != const []);

  factory LayoutForm.fromMap(JsonMap map) {
    final name = (map['name'] ?? '').toString().trim();
    if (name.isEmpty) {
      throw const FormatException('Action "name" is required');
    }
    final gs = map['groups'];
    if (gs is! List) {
      throw const FormatException('"groups" must be an array');
    }
    return LayoutForm(
      name: name,
      groups: gs.map((e) => GroupLayout.fromMap(e as JsonMap)).toList(),
    );
  }

  JsonMap toMap() => {
        'name': name,
        'groups': groups.map((e) => e.toMap()).toList(),
      };

  LayoutForm copyWith({String? name, List<GroupLayout>? groups}) =>
      LayoutForm(name: name ?? this.name, groups: groups ?? this.groups);

  (List<String> usedFields, List<String> availableFields) getFieldByStatus(
      List<EntityField> fields) {
    final usedFields = <String>[];
    final availableFields = <String>[];
    for (final group in groups) {
      usedFields.addAll(group.usedFields());
    }
    for (final field in fields) {
      if (!usedFields.contains(field.reference)) {
        availableFields.add(field.reference);
      }
    }
    return (usedFields, availableFields);
  }
}

class GroupLayout extends HiveObject {
  final String id;
  final String title;
  final List<RowLayout> rows;

  GroupLayout({
    required this.title,
    required this.rows,
    required this.id,
  });

  factory GroupLayout.empty() =>
      GroupLayout(title: '', rows: [], id: const Uuid().v4());

  factory GroupLayout.fromMap(JsonMap map) {
    final title = (map['title'] ?? '').toString().trim();
    if (title.isEmpty) {
      throw const FormatException('Group "title" is required');
    }
    final rs = map['rows'];
    if (rs is! List) {
      throw const FormatException('"rows" must be an array');
    }
    return GroupLayout(
      id: map['id'] ?? const Uuid().v4(),
      title: title,
      rows: rs.map((e) => RowLayout.fromMap(e as JsonMap)).toList(),
    );
  }

  JsonMap toMap() => {
        'id': id,
        'title': title,
        'rows': rows.map((e) => e.toMap()).toList(),
      };

  GroupLayout copyWith({String? title, List<RowLayout>? rows, String? id}) =>
      GroupLayout(
        title: title ?? this.title,
        rows: rows ?? this.rows,
        id: id ?? this.id,
      );

  List<String> usedFields() {
    final usedFields = <String>[];
    for (final row in rows) {
      usedFields.addAll(row.fields);
    }
    return usedFields;
  }
}

class RowLayout extends HiveObject {
  final int columns;
  final List<String> fields;

  RowLayout({
    required this.columns,
    required this.fields,
  })  : assert(columns >= 1),
        assert(fields != const []);

  factory RowLayout.fromMap(JsonMap map) {
    final colsAny = map['columns'];
    if (colsAny == null) {
      throw const FormatException('Row "columns" is required');
    }
    final columns = colsAny is num ? colsAny.toInt() : int.tryParse('$colsAny');
    if (columns == null || columns < 1) {
      throw const FormatException('"columns" must be an integer >= 1');
    }

    final f = map['fields'];
    if (f is! List) {
      throw const FormatException('"fields" must be an array of strings');
    }
    final fields = f.map((e) => e.toString()).toList();

    return RowLayout(columns: columns, fields: fields);
  }

  JsonMap toMap() => {
        'columns': columns,
        'fields': fields,
      };

  RowLayout copyWith({int? columns, List<String>? fields}) => RowLayout(
      columns: columns ?? this.columns, fields: fields ?? this.fields);
}

extension LayoutFormListExtension on List<LayoutForm> {
  LayoutForm? getByType(FormType type) {
    final index = indexWhere((e) => e.name == type.name);
    if (index > -1) {
      return this[index];
    }
    return null;
  }

  int getTypeIndex(FormType type) {
    final index = indexWhere((e) => e.name == type.name);
    return index == -1 ? 0 : index;
  }
}
