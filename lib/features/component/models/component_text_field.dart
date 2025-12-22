import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentTextField extends Component {
  final String label;
  final int maxLength;
  final int maxLines;
  final String initialValue;
  final bool enabled;
  final bool required;

  ComponentTextField({
    required super.id,
    required this.label,
    required this.maxLength,
    required this.maxLines,
    required this.initialValue,
    required this.enabled,
    this.required = false,
  }) : super(type: 'text_field');

  static String get componentId => 'text_field';

  factory ComponentTextField.empty(String id) {
    return ComponentTextField(
      id: id,
      label: 'Label',
      maxLength: 50,
      maxLines: 1,
      initialValue: '',
      enabled: true,
      required: false,
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
    final initialValue = map['initialValue']?.toString() ?? '';
    final enabledRaw = map['enabled'];
    final enabled = () {
      if (enabledRaw == null) return true;
      if (enabledRaw is bool) return enabledRaw;
      final str = enabledRaw.toString().toLowerCase().trim();
      if (str == 'false' || str == '0') return false;
      if (str == 'true' || str == '1') return true;
      return true;
    }();
    final required = map['required'] == true;

    return ComponentTextField(
      id: id,
      label: label,
      maxLength: maxLength,
      maxLines: maxLines,
      initialValue: initialValue,
      enabled: enabled,
      required: required,
    );
  }

  @override
  JsonMap toMap() => {
        'id': id,
        'type': type,
        'label': label,
        'maxLength': maxLength,
        'maxLines': maxLines,
        'initialValue': initialValue,
        'enabled': enabled,
        'required': required,
      };
}
