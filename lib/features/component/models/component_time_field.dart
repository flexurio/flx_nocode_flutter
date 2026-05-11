import 'package:flx_nocode_flutter/features/component/models/component_input_base.dart';
import 'package:flx_nocode_flutter/features/component/models/component_size_mode.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentTimeField extends ComponentInputBase {
  final String initialValue;
  final bool enabled;

  ComponentTimeField({
    required super.id,
    required super.label,
    required this.initialValue,
    super.required,
    this.enabled = true,
    super.widthMode,
    super.width,
    super.flex,
    super.visibilityCondition,
    super.events,
  }) : super(type: componentId);

  static const String componentId = 'time_field';

  factory ComponentTimeField.empty(String id) {
    return ComponentTimeField(
      id: id,
      label: 'Time Field',
      initialValue: '',
      required: false,
      enabled: true,
      widthMode: ComponentSizeMode.fill,
    );
  }

  factory ComponentTimeField.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }
    final label = map['label']?.toString().trim() ?? 'Time Field';
    final initialValue = map['initialValue']?.toString().trim() ?? '';
    final required = map['required'] == true;
    final enabled = map['enabled'] != false;

    return ComponentTimeField(
      id: id,
      label: label,
      initialValue: initialValue,
      required: required,
      enabled: enabled,
      widthMode: ComponentSizeMode.fromString(map['widthMode']?.toString()),
      width: map['width'] != null
          ? double.tryParse(map['width'].toString())
          : null,
      flex: map['flex'] != null ? int.tryParse(map['flex'].toString()) : null,
      visibilityCondition: map['visibilityCondition']?.toString(),
      events: map['events'] as Map<String, dynamic>? ?? const {},
    );
  }

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        'initialValue': initialValue,
        'enabled': enabled,
      };
}
