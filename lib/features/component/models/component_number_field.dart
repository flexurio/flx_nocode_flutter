import 'package:flx_nocode_flutter/features/component/models/component_input_base.dart';
import 'package:flx_nocode_flutter/features/component/models/component_size_mode.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentNumberField extends ComponentInputBase {
  final String initialValue;

  ComponentNumberField({
    required super.id,
    required super.label,
    required this.initialValue,
    super.enabled = true,
    super.required,
    super.widthMode,
    super.width,
    super.flex,
    super.visibilityCondition,
    super.events,
  }) : super(type: componentId);

  static const String componentId = 'number_field';

  factory ComponentNumberField.empty(String id) {
    return ComponentNumberField(
      id: id,
      label: 'Number Field',
      initialValue: '',
      enabled: true,
      widthMode: ComponentSizeMode.fill,
    );
  }

  factory ComponentNumberField.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }
    final label = map['label']?.toString().trim() ?? 'Number Field';
    final initialValue = map['initialValue']?.toString() ?? '';
    final enabledRaw = map['enabled'];
    final enabled = () {
      if (enabledRaw == null) return true;
      if (enabledRaw is bool) return enabledRaw;
      final str = enabledRaw.toString().toLowerCase().trim();
      if (str == 'false' || str == '0') return false;
      return true;
    }();

    return ComponentNumberField(
      id: id,
      label: label,
      initialValue: initialValue,
      enabled: enabled,
      required: map['required'] == true,
      widthMode: ComponentSizeMode.fromString(map['widthMode']?.toString()),
      width: double.tryParse(map['width']?.toString() ?? ''),
      flex: int.tryParse(map['flex']?.toString() ?? ''),
      visibilityCondition: map['visibilityCondition']?.toString(),
      events: map['events'] as Map<String, dynamic>? ?? const {},
    );
  }

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        'initialValue': initialValue,
      };
}
