import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentDatePicker extends Component {
  final String label;
  final String initialValue;
  final bool required;

  ComponentDatePicker({
    required super.id,
    required this.label,
    required this.initialValue,
    this.required = false,
  }) : super(type: componentId);

  static const String componentId = 'date_picker';

  factory ComponentDatePicker.empty(String id) {
    return ComponentDatePicker(
      id: id,
      label: 'Date Picker',
      initialValue: '',
      required: false,
    );
  }

  factory ComponentDatePicker.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component \"id\" is required');
    }
    final label = map['label']?.toString().trim() ?? 'Date Picker';
    final initialValue = map['initialValue']?.toString().trim() ?? '';
    final required = map['required'] == true;
    return ComponentDatePicker(
      id: id,
      label: label,
      initialValue: initialValue,
      required: required,
    );
  }

  @override
  JsonMap toMap() => {
        'id': id,
        'type': type,
        'label': label,
        'initialValue': initialValue,
        'required': required,
      };
}
