import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart'; // provides JsonMap, Rule
import 'package:flx_nocode_flutter/features/entity/models/rule.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class GroupLayout extends HiveObject {
  final String id;
  final String title;
  final List<RowLayout> rows;
  final Rule? visibleIf; // optional visibility rule for the entire group

  GroupLayout({
    required this.id,
    required this.title,
    required List<RowLayout> rows,
    this.visibleIf,
  })  : assert(id.trim().isNotEmpty, 'Group "id" is required'),
        assert(title.trim().isNotEmpty, 'Group "title" is required'),
        assert(rows.isNotEmpty, 'Group "rows" must not be empty'),
        rows = List<RowLayout>.unmodifiable(rows);

  factory GroupLayout.empty() =>
      GroupLayout(id: const Uuid().v4(), title: '', rows: const []);

  factory GroupLayout.fromMap(JsonMap map) {
    final title = (map['title'] ?? '').toString().trim();
    if (title.isEmpty) {
      throw const FormatException('Group "title" is required');
    }

    final rawId = (map['id'] ?? const Uuid().v4()).toString().trim();
    if (rawId.isEmpty) {
      throw const FormatException('Group "id" is required');
    }

    final rs = map['rows'];
    if (rs is! List) {
      throw const FormatException('"rows" must be an array');
    }
    if (rs.isEmpty) {
      throw const FormatException('"rows" must not be empty');
    }

    final rows = rs.map((e) {
      if (e is! Map) {
        throw const FormatException('Each "row" must be an object');
      }
      return RowLayout.fromMap(e.cast<String, dynamic>());
    }).toList(growable: false);

    return GroupLayout(
      id: rawId,
      title: title,
      rows: rows,
      visibleIf: map['visible_if'] == null
          ? null
          : Rule.fromMap(map['visible_if'] as Map<String, dynamic>),
    );
  }

  JsonMap toMap() {
    final m = <String, dynamic>{
      'id': id,
      'title': title,
      'rows': rows.map((e) => e.toMap()).toList(growable: false),
    };
    if (visibleIf != null) {
      m['visible_if'] = visibleIf!.toMap();
    }
    return m;
  }

  GroupLayout copyWith({
    String? id,
    String? title,
    List<RowLayout>? rows,
    Rule? visibleIf,
    bool clearVisibleIf = false,
  }) =>
      GroupLayout(
        id: id ?? this.id,
        title: title ?? this.title,
        rows: rows ?? this.rows,
        visibleIf: clearVisibleIf ? null : (visibleIf ?? this.visibleIf),
      );

  /// Collect all field references used in this group (unique, ordered).
  List<String> usedFields() {
    final seen = <String>{};
    for (final row in rows) {
      for (final f in row.fields) {
        if (seen.add(f)) {}
      }
    }
    return List.unmodifiable(seen);
  }

  /// Evaluate group visibility (default true when no rule).
  bool isVisible(Map<String, dynamic> formState) =>
      visibleIf?.evaluate(formState) ?? true;
}

class RowLayout extends HiveObject {
  final int columns;
  final List<String> fields;
  final Rule? visibleIf; // optional visibility rule for this row

  RowLayout({
    required this.columns,
    required List<String> fields,
    this.visibleIf,
  })  : assert(columns >= 1, '"columns" must be >= 1'),
        fields = List<String>.unmodifiable(fields);

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

    final fields = f.map((e) => e.toString()).toList(growable: false);

    return RowLayout(
      columns: columns,
      fields: fields,
      visibleIf: map['visible_if'] == null
          ? null
          : Rule.fromMap(map['visible_if'] as Map<String, dynamic>),
    );
  }

  JsonMap toMap() {
    final m = <String, dynamic>{
      'columns': columns,
      'fields': fields,
    };
    if (visibleIf != null) {
      m['visible_if'] = visibleIf!.toMap();
    }
    return m;
  }

  RowLayout copyWith({
    int? columns,
    List<String>? fields,
    Rule? visibleIf,
    bool clearVisibleIf = false,
  }) =>
      RowLayout(
        columns: columns ?? this.columns,
        fields: fields ?? this.fields,
        visibleIf: clearVisibleIf ? null : (visibleIf ?? this.visibleIf),
      );

  /// Evaluate row visibility (default true when no rule).
  bool isVisible(Map<String, dynamic> formState) =>
      visibleIf?.evaluate(formState) ?? true;
}
