import 'package:flx_nocode_flutter/features/component/models/c_column.dart';
import 'package:flx_nocode_flutter/features/component/models/c_row.dart';
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
