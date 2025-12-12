import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentCheckbox extends Component {
  final String label;
  final bool value;

  ComponentCheckbox({
    required super.id,
    required this.label,
    required this.value,
  }) : super(type: componentId);

  static const String componentId = 'checkbox';

  factory ComponentCheckbox.empty(String id) {
    return ComponentCheckbox(
      id: id,
      label: 'Checkbox',
      value: false,
    );
  }

  factory ComponentCheckbox.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component \"id\" is required');
    }
    final label = map['label']?.toString().trim() ?? 'Checkbox';
    final rawValue = map['value'];
    final value = () {
      if (rawValue == null) return false;
      if (rawValue is bool) return rawValue;
      final str = rawValue.toString().trim().toLowerCase();
      if (str == 'true' || str == '1') return true;
      return false;
    }();
    return ComponentCheckbox(
      id: id,
      label: label,
      value: value,
    );
  }

  @override
  JsonMap toMap() => {
        'id': id,
        'type': type,
        'label': label,
        'value': value,
      };
}
