import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentRadio extends Component {
  final String label;
  final List<String> options;
  final String initialValue;

  ComponentRadio({
    required super.id,
    required this.label,
    required this.options,
    required this.initialValue,
  }) : super(type: componentId);

  static const String componentId = 'radio';

  factory ComponentRadio.empty(String id) {
    return ComponentRadio(
      id: id,
      label: 'Radio',
      options: const ['Option 1', 'Option 2'],
      initialValue: '',
    );
  }

  factory ComponentRadio.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component \"id\" is required');
    }
    final label = map['label']?.toString().trim() ?? 'Radio';
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
    return ComponentRadio(
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
