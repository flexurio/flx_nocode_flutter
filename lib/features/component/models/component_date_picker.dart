import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentDatePicker extends Component {
  final String label;
  final String initialValue;

  ComponentDatePicker({
    required super.id,
    required this.label,
    required this.initialValue,
  }) : super(type: componentId);

  static const String componentId = 'date_picker';

  factory ComponentDatePicker.empty(String id) {
    return ComponentDatePicker(
      id: id,
      label: 'Date Picker',
      initialValue: '',
    );
  }

  factory ComponentDatePicker.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component \"id\" is required');
    }
    final label = map['label']?.toString().trim() ?? 'Date Picker';
    final initialValue = map['initialValue']?.toString().trim() ?? '';
    return ComponentDatePicker(
      id: id,
      label: label,
      initialValue: initialValue,
    );
  }

  @override
  JsonMap toMap() => {
        'id': id,
        'type': type,
        'label': label,
        'initialValue': initialValue,
      };
}
