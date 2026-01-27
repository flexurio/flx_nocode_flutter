import 'package:flx_nocode_flutter/features/component/models/c_column.dart';
import 'package:flx_nocode_flutter/features/component/models/c_row.dart';
import 'package:flx_nocode_flutter/features/component/models/component_date_picker.dart';
import 'package:flx_nocode_flutter/features/component/models/component_checkbox.dart';
import 'package:flx_nocode_flutter/features/component/models/component_dropdown.dart';
import 'package:flx_nocode_flutter/features/component/models/component_field_display.dart';
import 'package:flx_nocode_flutter/features/component/models/component_radio.dart';
import 'package:flx_nocode_flutter/features/component/models/component_table.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text_field.dart';
import 'package:flx_nocode_flutter/features/component/models/component_button.dart';
import 'package:flx_nocode_flutter/features/component/models/component_container.dart';
import 'package:flx_nocode_flutter/features/component/models/component_number_field.dart';
import 'package:flx_nocode_flutter/features/component/models/component_switch.dart';
import 'package:flx_nocode_flutter/features/component/models/component_image.dart';
import 'package:flx_nocode_flutter/features/component/models/component_divider.dart';
import 'package:flx_nocode_flutter/features/field/domain/extensions/entity_field_extensions.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class Component {
  final String id;
  final String type;
  final String? visibilityCondition;
  final Map<String, dynamic> events;

  static final Map<String, int> _typeCounters = {};

  Component({
    required this.id,
    required this.type,
    this.visibilityCondition,
    this.events = const {},
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
      case ComponentType.datePicker:
        return ComponentDatePicker.fromMap(map);
      case ComponentType.checkbox:
        return ComponentCheckbox.fromMap(map);
      case ComponentType.dropdown:
        return ComponentDropdown.fromMap(map);
      case ComponentType.radio:
        return ComponentRadio.fromMap(map);
      case ComponentType.button:
        return ComponentButton.fromMap(map);
      case ComponentType.column:
        return ComponentColumn.fromMap(map);
      case ComponentType.row:
        return ComponentRow.fromMap(map);
      case ComponentType.fieldDisplay:
        return ComponentFieldDisplay.fromMap(map);
      case ComponentType.numberField:
        return ComponentNumberField.fromMap(map);
      case ComponentType.container:
        return ComponentContainer.fromMap(map);
      case ComponentType.switchType:
        return ComponentSwitch.fromMap(map);
      case ComponentType.image:
        return ComponentImage.fromMap(map);
      case ComponentType.divider:
        return ComponentDivider.fromMap(map);
      default:
        throw FormatException('Unknown component type "$type"');
    }
  }

  JsonMap toMap() => {
        'id': id,
        'type': type,
        if (visibilityCondition != null)
          'visibilityCondition': visibilityCondition,
        'events': events,
      };

  /// Creates an empty component instance based on the type.
  factory Component.empty(String type) {
    switch (type) {
      case ComponentType.table:
        return ComponentTable.empty(Component._generateId(type));
      case ComponentType.text:
        return ComponentText.empty(Component._generateId(type));
      case ComponentType.textField:
        return ComponentTextField.empty(Component._generateId(type));
      case ComponentType.datePicker:
        return ComponentDatePicker.empty(Component._generateId(type));
      case ComponentType.checkbox:
        return ComponentCheckbox.empty(Component._generateId(type));
      case ComponentType.dropdown:
        return ComponentDropdown.empty(Component._generateId(type));
      case ComponentType.radio:
        return ComponentRadio.empty(Component._generateId(type));
      case ComponentType.button:
        return ComponentButton.empty(Component._generateId(type));
      case ComponentType.column:
        return ComponentColumn.empty(Component._generateId(type));
      case ComponentType.row:
        return ComponentRow.empty(Component._generateId(type));
      case ComponentType.fieldDisplay:
        return ComponentFieldDisplay.empty(Component._generateId(type));
      case ComponentType.numberField:
        return ComponentNumberField.empty(Component._generateId(type));
      case ComponentType.container:
        return ComponentContainer.empty(Component._generateId(type));
      case ComponentType.switchType:
        return ComponentSwitch.empty(Component._generateId(type));
      case ComponentType.image:
        return ComponentImage.empty(Component._generateId(type));
      case ComponentType.divider:
        return ComponentDivider.empty(Component._generateId(type));
      default:
        throw FormatException('Unknown component type "$type"');
    }
  }

  static String _generateId(String type) {
    final key = type.toLowerCase();
    final next = (_typeCounters[key] ?? 0) + 1;
    _typeCounters[key] = next;
    return '${key}_$next';
  }

  /// Create a simple component template from an [EntityField].
  /// By default it produces an editable text field; set [readOnly] to true to
  /// get a display-only component.
  static Component fromEntityField(EntityField field, {bool readOnly = false}) {
    final baseId = field.reference.trim().isNotEmpty
        ? field.reference.trim()
        : _generateId(field.type);
    final label = field.label.trim().isNotEmpty
        ? field.label.trim()
        : field.reference.trim();

    if (field.isText) {
      if (field.type == 'select' || field.optionsSource != null) {
        return ComponentDropdown(
          id: baseId,
          label: label.isNotEmpty ? label : 'Dropdown',
          options: const [],
          initialValue: '{{current.${field.reference}}}',
          required: field.required,
        );
      }

      return ComponentTextField(
        id: baseId,
        label: label.isNotEmpty ? label : 'Field',
        maxLength: field.maxLength ?? 50,
        maxLines: 1,
        initialValue: '{{current.${field.reference}}}',
        enabled: !(field.autoGenerated ?? false),
        required: field.required,
      );
    }
    if (field.isDateTime) {
      return ComponentDatePicker(
        id: baseId,
        label: label.isNotEmpty ? label : 'Date',
        initialValue: '{{current.${field.reference}}}',
        required: field.required,
      );
    }
    if (field.isBool) {
      return ComponentCheckbox(
        id: baseId,
        label: label.isNotEmpty ? label : 'Checkbox',
        value: false,
      );
    }
    if (field.isNumber) {
      return ComponentNumberField(
        id: baseId,
        label: label.isNotEmpty ? label : 'Number',
        initialValue: '{{current.${field.reference}}}',
        enabled: !(field.autoGenerated ?? false),
      );
    }
    return ComponentFieldDisplay(
      id: baseId,
      label: label,
      value: '{{${field.reference}}}',
    );
  }

  /// Get a human-readable label for this component based on its data.
  String get displayLabel {
    final comp = this;
    if (comp is ComponentTextField) return comp.label;
    if (comp is ComponentNumberField) return comp.label;
    if (comp is ComponentDatePicker) return comp.label;
    if (comp is ComponentCheckbox) return comp.label;
    if (comp is ComponentDropdown) return comp.label;
    if (comp is ComponentRadio) return comp.label;
    if (comp is ComponentFieldDisplay) return comp.label;
    if (comp is ComponentButton) return comp.text;
    if (comp is ComponentText) return comp.value;

    return id;
  }
}

class ComponentType {
  static const String table = 'table';
  static const String text = 'text';
  static const String textField = 'text_field';
  static const String datePicker = 'date_picker';
  static const String checkbox = 'checkbox';
  static const String dropdown = 'dropdown';
  static const String radio = 'radio';
  static const String button = 'button';
  static const String column = 'column';
  static const String row = 'row';
  static const String fieldDisplay = 'field_display';
  static const String numberField = 'number_field';
  static const String container = 'container';
  static const String switchType = 'switch';
  static const String image = 'image';
  static const String divider = 'divider';

  static const List<ComponentTypeEntry> values = [
    ComponentTypeEntry(id: table, label: 'Table'),
    ComponentTypeEntry(id: text, label: 'Text'),
    ComponentTypeEntry(id: textField, label: 'Text Field'),
    ComponentTypeEntry(id: datePicker, label: 'Date Picker'),
    ComponentTypeEntry(id: checkbox, label: 'Checkbox'),
    ComponentTypeEntry(id: dropdown, label: 'Dropdown'),
    ComponentTypeEntry(id: radio, label: 'Radio'),
    ComponentTypeEntry(id: button, label: 'Button'),
    ComponentTypeEntry(id: column, label: 'Column'),
    ComponentTypeEntry(id: row, label: 'Row'),
    ComponentTypeEntry(id: fieldDisplay, label: 'Field Display'),
    ComponentTypeEntry(id: numberField, label: 'Number Field'),
    ComponentTypeEntry(id: container, label: 'Container'),
    ComponentTypeEntry(id: switchType, label: 'Switch'),
    ComponentTypeEntry(id: image, label: 'Image'),
    ComponentTypeEntry(id: divider, label: 'Divider'),
  ];

  static String labelOf(String type) => values
      .firstWhere(
        (entry) => entry.id == type,
        orElse: () => ComponentTypeEntry(id: type, label: type),
      )
      .label;
}

class ComponentTypeEntry {
  final String id;
  final String label;

  const ComponentTypeEntry({required this.id, required this.label});
}
