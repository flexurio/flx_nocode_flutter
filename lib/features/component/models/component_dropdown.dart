import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/component/models/component_action.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentDropdown extends Component {
  final String label;
  final List<String> options;
  final String initialValue;
  final HttpData? httpData;
  final String? optionKey;
  final String? optionLabel;
  final List<ComponentAction> onChangeActions;
  final bool required;
  final List<String> dependsOn;
  final String? widthMode; // 'fill', 'hug', 'fixed'
  final double? width;
  final int? flex;

  ComponentDropdown({
    required super.id,
    super.visibilityCondition,
    super.events,
    required this.label,
    required this.options,
    required this.initialValue,
    this.httpData,
    this.optionKey,
    this.optionLabel,
    this.onChangeActions = const [],
    this.required = false,
    this.dependsOn = const [],
    this.widthMode,
    this.width,
    this.flex,
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
      widthMode: 'fill',
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
    final options = <String>[];
    if (rawOptions is List) {
      for (final o in rawOptions) {
        if (o == null) continue;
        final value = o.toString().trim();
        if (value.isNotEmpty) options.add(value);
      }
    }
    if (options.isEmpty) {
      options.addAll(['Option 1', 'Option 2']);
    }

    final httpDataMap = map['httpData'];
    final httpData = httpDataMap != null
        ? HttpData.fromJson(Map<String, dynamic>.from(httpDataMap))
        : null;

    final rawActions = map['onChangeActions'];
    final onChangeActions = <ComponentAction>[];
    if (rawActions is List) {
      for (final item in rawActions) {
        if (item is Map<String, dynamic>) {
          onChangeActions.add(ComponentAction.fromMap(item));
        }
      }
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
      dependsOn: dependsOn,
      widthMode: map['widthMode']?.toString(),
      width: map['width'] != null
          ? double.tryParse(map['width'].toString())
          : null,
      flex: map['flex'] != null ? int.tryParse(map['flex'].toString()) : null,
    );
  }

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        'label': label,
        'options': options,
        'initialValue': initialValue,
        'httpData': httpData?.toJson(),
        'optionKey': optionKey,
        'optionLabel': optionLabel,
        'onChangeActions': onChangeActions.map((e) => e.toMap()).toList(),
        'required': required,
        'dependsOn': dependsOn,
        'widthMode': widthMode,
        'width': width,
        'flex': flex,
      };
}
