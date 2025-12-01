import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:uuid/uuid.dart';

class ComponentTextField extends Component {
  final String label;
  final int maxLength;
  final int maxLines;

  ComponentTextField({
    required super.id,
    required this.label,
    required this.maxLength,
    required this.maxLines,
  }) : super(type: 'text_field');

  static String get componentId => 'text_field';

  factory ComponentTextField.empty() {
    return ComponentTextField(
      id: const Uuid().v4(),
      label: 'Label',
      maxLength: 50,
      maxLines: 1,
    );
  }

  factory ComponentTextField.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }
    final label = map['label']?.toString().trim() ?? 'Label';
    final maxLength = int.tryParse(map['maxLength']?.toString() ?? '') ?? 50;
    final maxLines = int.tryParse(map['maxLines']?.toString() ?? '') ?? 1;
    return ComponentTextField(
      id: id,
      label: label,
      maxLength: maxLength,
      maxLines: maxLines,
    );
  }

  @override
  JsonMap toMap() => {
        'id': id,
        'type': type,
        'label': label,
        'maxLength': maxLength,
        'maxLines': maxLines,
      };
}

