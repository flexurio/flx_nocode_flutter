import 'package:flx_nocode_flutter/features/component/models/component_action.dart';
import 'package:flx_nocode_flutter/features/component/models/component_input_base.dart';
import 'package:flx_nocode_flutter/features/component/models/component_size_mode.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentNumberField extends ComponentInputBase {
  final String initialValue;
  final List<ComponentAction> onChangeActions;

  ComponentNumberField({
    required super.id,
    required super.label,
    required this.initialValue,
    this.onChangeActions = const [],
    super.enabled = true,
    super.required,
    super.widthMode,
    super.width,
    super.flex,
    super.visibilityCondition,
    super.events,
    super.dependsOn,
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

    final rawActions = map['onChangeActions'] ?? map['on_change'];
    final onChangeActions = <ComponentAction>[];
    if (rawActions is List) {
      for (final item in rawActions) {
        if (item is Map<String, dynamic>) {
          onChangeActions.add(ComponentAction.fromMap(item));
        }
      }
    } else if (rawActions is Map) {
      onChangeActions.add(
        ComponentAction.fromMap(Map<String, dynamic>.from(rawActions)),
      );
    }

    final rawDependsOn = map['dependsOn'];
    final dependsOn = <String>[];
    if (rawDependsOn is List) {
      for (final item in rawDependsOn) {
        if (item != null) {
          dependsOn.add(item.toString());
        }
      }
    }

    return ComponentNumberField(
      id: id,
      label: label,
      initialValue: initialValue,
      onChangeActions: onChangeActions,
      enabled: enabled,
      required: map['required'] == true,
      widthMode: ComponentSizeMode.fromString(map['widthMode']?.toString()),
      width: double.tryParse(map['width']?.toString() ?? ''),
      flex: int.tryParse(map['flex']?.toString() ?? ''),
      visibilityCondition: map['visibilityCondition']?.toString(),
      events: map['events'] as Map<String, dynamic>? ?? const {},
      dependsOn: dependsOn,
    );
  }

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        'initialValue': initialValue,
        'onChangeActions': onChangeActions.map((a) => a.toMap()).toList(),
      };
}
