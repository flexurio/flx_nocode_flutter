import 'package:flx_nocode_flutter/features/component/models/component_input_base.dart';
import 'package:flx_nocode_flutter/features/component/models/component_size_mode.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentSwitch extends ComponentInputBase {
  final bool initialValue;
  final bool enabled;

  ComponentSwitch({
    required super.id,
    super.label = 'Switch',
    this.initialValue = false,
    this.enabled = true,
    super.required,
    super.widthMode,
    super.width,
    super.flex,
    super.visibilityCondition,
    super.events,
  }) : super(type: 'switch');

  static String get componentId => 'switch';

  factory ComponentSwitch.empty(String id) {
    return ComponentSwitch(
      id: id,
      label: 'Switch',
      initialValue: false,
      enabled: true,
    );
  }

  factory ComponentSwitch.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }
    return ComponentSwitch(
      id: id,
      label: map['label']?.toString() ?? 'Switch',
      initialValue: map['initialValue'] == true,
      enabled: map['enabled'] != false,
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
        'enabled': enabled,
      };
}
