import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentFieldDisplay extends Component {
  final String label;
  final String value;

  ComponentFieldDisplay({
    required super.id,
    required this.label,
    required this.value,
  }) : super(type: 'field_display');

  factory ComponentFieldDisplay.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }

    final label = map['label']?.toString().trim();
    if (label == null || label.isEmpty) {
      throw const FormatException('ComponentFieldDisplay "label" is required');
    }

    final value = map['value']?.toString().trim();
    if (value == null || value.isEmpty) {
      throw const FormatException('ComponentFieldDisplay "value" is required');
    }

    return ComponentFieldDisplay(
      id: id,
      label: label,
      value: value,
    );
  }

  @override
  JsonMap toMap() => {
        'id': id,
        'type': type, // field_display
        'label': label,
        'value': value,
      };
}
