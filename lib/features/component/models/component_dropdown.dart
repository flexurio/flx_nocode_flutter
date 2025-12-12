import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentDropdown extends Component {
  final String label;
  final List<String> options;
  final String initialValue;

  ComponentDropdown({
    required super.id,
    required this.label,
    required this.options,
    required this.initialValue,
  }) : super(type: componentId);

  static const String componentId = 'dropdown';

  factory ComponentDropdown.empty(String id) {
    return ComponentDropdown(
      id: id,
      label: 'Dropdown',
      options: const ['Option 1', 'Option 2'],
      initialValue: '',
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
    return ComponentDropdown(
      id: id,
      label: label,
      options: options,
      initialValue: initialValue,
    );
  }

  @override
  JsonMap toMap() => {
        'id': id,
        'type': type,
        'label': label,
        'options': options,
        'initialValue': initialValue,
      };
}
