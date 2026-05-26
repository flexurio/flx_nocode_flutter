import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/component/models/component_action.dart';
import 'package:flx_nocode_flutter/features/component/models/component_selection_base.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/component/models/component_size_mode.dart';

class ComponentDropdown extends ComponentSelectionBase {
  final String initialValue;

  ComponentDropdown({
    required super.id,
    super.visibilityCondition,
    super.events,
    required super.label,
    required super.options,
    this.initialValue = '',
    super.httpData,
    super.optionKey,
    super.optionLabel,
    super.onChangeActions,
    super.required,
    super.enabled = true,
    super.dependsOn,
    super.widthMode,
    super.width,
    super.flex,
  }) : super(type: componentId);

  static const String componentId = 'dropdown';

  factory ComponentDropdown.empty(String id) {
    return ComponentDropdown(
      id: id,
      label: 'Dropdown',
      options: const ['Option 1', 'Option 2'],
      initialValue: '',
      httpData: HttpData.empty(),
      required: false,
      dependsOn: const [],
      widthMode: ComponentSizeMode.fill,
    );
  }

  factory ComponentDropdown.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }
    final label = map['label']?.toString().trim() ?? 'Dropdown';
    final initialValue = map['initialValue']?.toString().trim() ?? '';
    final rawOptions = map['options'];
    final options = <dynamic>[];
    if (rawOptions is List) {
      for (final o in rawOptions) {
        if (o == null) continue;
        if (o is Map) {
          options.add(Map<String, dynamic>.from(o));
        } else {
          final value = o.toString().trim();
          options.add(value);
        }
      }
    }
    if (options.isEmpty) {
      options.addAll(['Option 1', 'Option 2']);
    }

    final httpDataMap = map['httpData'];
    final httpData = httpDataMap != null
        ? HttpData.fromJson(Map<String, dynamic>.from(httpDataMap))
        : null;

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

    final required = map['required'] == true;

    final rawDependsOn = map['dependsOn'];
    final dependsOn = <String>[];
    if (rawDependsOn is List) {
      for (final item in rawDependsOn) {
        if (item != null) {
          dependsOn.add(item.toString());
        }
      }
    }

    final enabledRaw = map['enabled'];
    final enabled = () {
      if (enabledRaw == null) return true;
      if (enabledRaw is bool) return enabledRaw;
      final str = enabledRaw.toString().toLowerCase().trim();
      if (str == 'false' || str == '0') return false;
      return true;
    }();

    return ComponentDropdown(
      id: id,
      visibilityCondition: map['visibilityCondition']?.toString(),
      events: map['events'] is Map
          ? Map<String, dynamic>.from(map['events'])
          : const <String, dynamic>{},
      label: label,
      options: options,
      initialValue: initialValue,
      httpData: httpData,
      optionKey: map['optionKey']?.toString(),
      optionLabel: map['optionLabel']?.toString(),
      onChangeActions: onChangeActions,
      required: required,
      enabled: enabled,
      dependsOn: dependsOn,
      widthMode: ComponentSizeMode.fromString(map['widthMode']?.toString()),
      width: map['width'] != null
          ? double.tryParse(map['width'].toString())
          : null,
      flex: map['flex'] != null ? int.tryParse(map['flex'].toString()) : null,
    );
  }

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        'initialValue': initialValue,
      };
}
