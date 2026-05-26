import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/component/models/component_action.dart';
import 'package:flx_nocode_flutter/features/component/models/component_selection_base.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/component/models/component_size_mode.dart';

class ComponentMultiDropdown extends ComponentSelectionBase {
  final List<String> initialValues;

  ComponentMultiDropdown({
    required super.id,
    super.visibilityCondition,
    super.events,
    required super.label,
    required super.options,
    this.initialValues = const [],
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

  static const String componentId = 'dropdown_multi_value';

  factory ComponentMultiDropdown.empty(String id) {
    return ComponentMultiDropdown(
      id: id,
      label: 'Multi Dropdown',
      options: const ['Option 1', 'Option 2'],
      initialValues: const [],
      httpData: HttpData.empty(),
      required: false,
      dependsOn: const [],
      widthMode: ComponentSizeMode.fill,
    );
  }

  factory ComponentMultiDropdown.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }
    final label = map['label']?.toString().trim() ?? 'Multi Dropdown';

    final rawInitialValues = map['initialValues'] ?? map['initialValue'];
    final initialValues = <String>[];
    if (rawInitialValues is List) {
      initialValues.addAll(rawInitialValues.map((e) => e.toString().trim()));
    } else if (rawInitialValues != null &&
        rawInitialValues.toString().isNotEmpty) {
      // Handle comma separated string if any
      initialValues.addAll(
        rawInitialValues
            .toString()
            .split(',')
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty),
      );
    }

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
    final enabledRaw = map['enabled'];
    final enabled = () {
      if (enabledRaw == null) return true;
      if (enabledRaw is bool) return enabledRaw;
      final str = enabledRaw.toString().toLowerCase().trim();
      if (str == 'false' || str == '0') return false;
      return true;
    }();

    final rawDependsOn = map['dependsOn'];
    final dependsOn = <String>[];
    if (rawDependsOn is List) {
      for (final item in rawDependsOn) {
        if (item != null) {
          dependsOn.add(item.toString());
        }
      }
    }

    return ComponentMultiDropdown(
      id: id,
      visibilityCondition: map['visibilityCondition']?.toString(),
      events: map['events'] is Map
          ? Map<String, dynamic>.from(map['events'])
          : const <String, dynamic>{},
      label: label,
      options: options,
      initialValues: initialValues,
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
        'initialValues': initialValues,
      };
}
