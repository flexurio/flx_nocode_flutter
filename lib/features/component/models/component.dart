import 'package:flx_nocode_flutter/features/component/models/c_column.dart';
import 'package:flx_nocode_flutter/features/component/models/c_row.dart';
import 'package:flx_nocode_flutter/features/component/models/component_field_display.dart';
import 'package:flx_nocode_flutter/features/component/models/component_table.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text_field.dart';
import 'package:flx_nocode_flutter/features/component/models/component_button.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class Component {
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
      case ComponentType.table:
        return ComponentTable.fromMap(map);
      case ComponentType.text:
        return ComponentText.fromMap(map);
      case ComponentType.textField:
        return ComponentTextField.fromMap(map);
      case ComponentType.button:
        return ComponentButton.fromMap(map);
      case ComponentType.column:
        return ComponentColumn.fromMap(map);
      case ComponentType.row:
        return ComponentRow.fromMap(map);
      case ComponentType.fieldDisplay:
        return ComponentFieldDisplay.fromMap(map);
      default:
        throw FormatException('Unknown component type "$type"');
    }
  }

  /// Creates an empty component instance based on the type.
  factory Component.empty(String type) {
    switch (type) {
      case ComponentType.table:
        return ComponentTable.empty();
      case ComponentType.text:
        return ComponentText.empty();
      case ComponentType.textField:
        return ComponentTextField.empty();
      case ComponentType.button:
        return ComponentButton.empty();
      case ComponentType.column:
        return ComponentColumn.empty();
      case ComponentType.row:
        return ComponentRow.empty();
      case ComponentType.fieldDisplay:
        return ComponentFieldDisplay.empty();
      default:
        throw FormatException('Unknown component type "$type"');
    }
  }

  JsonMap toMap() => {'id': id, 'type': type};
}

class ComponentType {
  static const String table = 'table';
  static const String text = 'text';
  static const String textField = 'text_field';
  static const String button = 'button';
  static const String column = 'column';
  static const String row = 'row';
  static const String fieldDisplay = 'field_display';
}
