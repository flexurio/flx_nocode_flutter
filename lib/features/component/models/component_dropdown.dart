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
  final String? optionValue;
  final List<ComponentAction> onChangeActions;

  ComponentDropdown({
    required super.id,
    required this.label,
    required this.options,
    required this.initialValue,
    this.httpData,
    this.optionKey,
    this.optionValue,
    this.onChangeActions = const [],
  }) : super(type: componentId);

  static const String componentId = 'dropdown';

  factory ComponentDropdown.empty(String id) {
    return ComponentDropdown(
      id: id,
      label: 'Dropdown',
      options: const ['Option 1', 'Option 2'],
      initialValue: '',
      httpData: HttpData.empty(),
    );
  }

  factory ComponentDropdown.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component \"id\" is required');
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

    return ComponentDropdown(
      id: id,
      label: label,
      options: options,
      initialValue: initialValue,
      httpData: httpData,
      optionKey: map['optionKey']?.toString(),
      optionValue: map['optionValue']?.toString(),
      onChangeActions: onChangeActions,
    );
  }

  @override
  JsonMap toMap() => {
        'id': id,
        'type': type,
        'label': label,
        'options': options,
        'initialValue': initialValue,
        'httpData': httpData?.toJson(),
        'optionKey': optionKey,
        'optionValue': optionValue,
        'onChangeActions': onChangeActions.map((e) => e.toMap()).toList(),
      };
}
