import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentTextField extends Component {
  final String label;
  final int maxLength;
  final int maxLines;
  final String initialValue;
  final String hintText;
  final bool enabled;
  final bool required;
  final String? regex;
  final String? regexErrorMessage;
  final String? helperText;
  final String? widthMode;
  final double? width;
  final int? flex;

  ComponentTextField({
    required super.id,
    required this.label,
    required this.maxLength,
    required this.maxLines,
    required this.initialValue,
    this.hintText = '',
    required this.enabled,
    this.required = false,
    this.regex,
    this.regexErrorMessage,
    this.helperText,
    this.widthMode,
    this.width,
    this.flex,
    super.visibilityCondition,
    super.events,
  }) : super(type: 'text_field');

  static String get componentId => 'text_field';

  factory ComponentTextField.empty(String id) {
    return ComponentTextField(
      id: id,
      label: 'Label',
      maxLength: 50,
      maxLines: 1,
      initialValue: '',
      hintText: '',
      enabled: true,
      required: false,
      regex: null,
      regexErrorMessage: null,
      helperText: null,
      widthMode: 'fill',
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
    final hintText = map['hintText']?.toString() ?? '';
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
    final regex = map['regex']?.toString();
    final regexErrorMessage = map['regexErrorMessage']?.toString();
    final helperText = map['helperText']?.toString();
    final visibilityCondition = map['visibilityCondition']?.toString();
    final events = map['events'] as Map<String, dynamic>? ?? {};

    return ComponentTextField(
      id: id,
      label: label,
      maxLength: maxLength,
      maxLines: maxLines,
      initialValue: initialValue,
      hintText: hintText,
      enabled: enabled,
      required: required,
      regex: regex,
      regexErrorMessage: regexErrorMessage,
      helperText: helperText,
      widthMode: map['widthMode']?.toString(),
      width: double.tryParse(map['width']?.toString() ?? ''),
      flex: int.tryParse(map['flex']?.toString() ?? ''),
      visibilityCondition: visibilityCondition,
      events: events,
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
        'hintText': hintText,
        'enabled': enabled,
        'required': required,
        if (regex != null) 'regex': regex,
        if (regexErrorMessage != null) 'regexErrorMessage': regexErrorMessage,
        if (helperText != null) 'helperText': helperText,
        'widthMode': widthMode,
        'width': width,
        'flex': flex,
        if (visibilityCondition != null)
          'visibilityCondition': visibilityCondition,
        'events': events,
      };
}
