import 'package:flx_nocode_flutter/features/component/models/component_input_base.dart';
import 'package:flx_nocode_flutter/features/component/models/component_size_mode.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentCheckbox extends ComponentInputBase {
  final bool value;

  ComponentCheckbox({
    required super.id,
    required super.label,
    required this.value,
    super.required,
    super.enabled = true,
    super.widthMode,
    super.width,
    super.flex,
    super.visibilityCondition,
    super.events,
  }) : super(type: componentId);

  static const String componentId = 'checkbox';

  factory ComponentCheckbox.empty(String id) {
    return ComponentCheckbox(
      id: id,
      label: 'Checkbox',
      value: false,
      widthMode: ComponentSizeMode.hug,
    );
  }

  factory ComponentCheckbox.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }
    final label = map['label']?.toString().trim() ?? 'Checkbox';
    final rawValue = map['value'];
    final value = () {
      if (rawValue == null) return false;
      if (rawValue is bool) return rawValue;
      final str = rawValue.toString().trim().toLowerCase();
      if (str == 'true' || str == '1') return true;
      return false;
    }();
    final enabledRaw = map['enabled'];
    final enabled = () {
      if (enabledRaw == null) return true;
      if (enabledRaw is bool) return enabledRaw;
      final str = enabledRaw.toString().toLowerCase().trim();
      if (str == 'false' || str == '0') return false;
      return true;
    }();

    return ComponentCheckbox(
      id: id,
      label: label,
      value: value,
      required: map['required'] == true,
      enabled: enabled,
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
        'value': value,
      };
}
