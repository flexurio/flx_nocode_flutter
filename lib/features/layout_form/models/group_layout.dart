import 'package:flx_nocode_flutter/features/entity/models/group_layout.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import 'package:flx_nocode_flutter/features/entity/models/rule.dart';

typedef JsonMap = Map<String, dynamic>;

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
  }) {
    return GroupLayout(
      id: id ?? this.id,
      title: title ?? this.title,
      rows: rows ?? this.rows,
      visibleIf: clearVisibleIf ? null : (visibleIf ?? this.visibleIf),
    );
  }
}
