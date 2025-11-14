import 'package:flutter/src/widgets/framework.dart';
import 'package:flx_nocode_flutter/features/component/models/component_field_display.dart';
import 'package:flx_nocode_flutter/features/component/models/component_table.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

abstract class Component {
  final String id;
  final String type;

  Component({
    required this.id,
    required this.type,
  });

  factory Component.fromMap(Map<String, dynamic> map) {
    if (map['id'] == null || map['id'].toString().trim().isEmpty) {
      throw const FormatException('Component "id" is required');
    }
    if (map['type'] == null || map['type'].toString().trim().isEmpty) {
      throw const FormatException('Component "type" is required');
    }

    final type = map['type'].toString().trim().toLowerCase();

    switch (type) {
      case 'table':
        return ComponentTable.fromMap(map);
      case 'text':
        return ComponentText.fromMap(map);
      case 'column':
        return ComponentColumn.fromMap(map);
      case 'row':
        return ComponentRow.fromMap(map);
      case 'field_display':
        return ComponentFieldDisplay.fromMap(map);
      default:
        throw FormatException('Unknown component type "$type"');
    }
  }

  JsonMap toMap();
}

// ─────────────────────────────────────────────
// Component: COLUMN
// ─────────────────────────────────────────────

class ComponentColumn extends Component {
  final List<Component> children;

  ComponentColumn({
    required super.id,
    this.children = const [],
  }) : super(type: 'column');

  factory ComponentColumn.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }

    final rawChildren = map['children'];
    List<Component> parsed = const [];

    if (rawChildren is List) {
      parsed = rawChildren.map<Component>((e) {
        if (e is! Map) {
          throw const FormatException('Each child must be an object');
        }
        return Component.fromMap(e.cast<String, dynamic>());
      }).toList(growable: false);
    }

    return ComponentColumn(
      id: id,
      children: parsed,
    );
  }

  @override
  JsonMap toMap() => {
        'id': id,
        'type': type,
        'children': children.map((e) => e.toMap()).toList(growable: false),
      };
}

// ─────────────────────────────────────────────
// Component: ROW
// ─────────────────────────────────────────────

class ComponentRow extends Component {
  final List<Component> children;

  ComponentRow({
    required super.id,
    this.children = const [],
  }) : super(type: 'row');

  factory ComponentRow.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }

    final rawChildren = map['children'];
    List<Component> parsed = const [];

    if (rawChildren is List) {
      parsed = rawChildren.map<Component>((e) {
        if (e is! Map) {
          throw const FormatException('Each child must be an object');
        }
        return Component.fromMap(e.cast<String, dynamic>());
      }).toList(growable: false);
    }

    return ComponentRow(
      id: id,
      children: parsed,
    );
  }

  @override
  JsonMap toMap() => {
        'id': id,
        'type': type,
        'children': children.map((e) => e.toMap()).toList(growable: false),
      };
}
