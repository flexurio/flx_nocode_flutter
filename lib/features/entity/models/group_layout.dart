import 'package:flx_nocode_flutter/features/entity/models/layout_form.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

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
