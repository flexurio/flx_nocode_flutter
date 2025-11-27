import 'package:hive/hive.dart';
import 'package:flx_nocode_flutter/features/entity/models/rule.dart';

typedef JsonMap = Map<String, dynamic>;

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
  }) {
    return RowLayout(
      columns: columns ?? this.columns,
      fields: fields ?? this.fields,
      visibleIf: clearVisibleIf ? null : (visibleIf ?? this.visibleIf),
    );
  }
}
