import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentFilePicker extends Component {
  final String label;
  final String? initialValue;
  final bool required;
  final bool enabled;
  final List<String>? allowedExtensions;

  ComponentFilePicker({
    required super.id,
    required this.label,
    this.initialValue,
    this.required = false,
    this.enabled = true,
    this.allowedExtensions,
    super.visibilityCondition,
    super.events,
  }) : super(type: 'file_picker');

  static String get componentId => 'file_picker';

  factory ComponentFilePicker.empty(String id) {
    return ComponentFilePicker(
      id: id,
      label: 'Upload File',
      required: false,
      enabled: true,
    );
  }

  factory ComponentFilePicker.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }
    final label = map['label']?.toString().trim() ?? 'Upload File';
    final initialValue = map['initialValue']?.toString();
    final required = map['required'] == true;
    final enabledRaw = map['enabled'];
    final enabled = () {
      if (enabledRaw == null) return true;
      if (enabledRaw is bool) return enabledRaw;
      final str = enabledRaw.toString().toLowerCase().trim();
      return str != 'false' && str != '0';
    }();

    final rawExtensions = map['allowedExtensions'];
    List<String>? allowedExtensions;
    if (rawExtensions is List) {
      allowedExtensions = rawExtensions.map((e) => e.toString()).toList();
    }

    return ComponentFilePicker(
      id: id,
      label: label,
      initialValue: initialValue,
      required: required,
      enabled: enabled,
      allowedExtensions: allowedExtensions,
      visibilityCondition: map['visibilityCondition']?.toString(),
      events: map['events'] as Map<String, dynamic>? ?? {},
    );
  }

  @override
  JsonMap toMap() => {
        'id': id,
        'type': type,
        'label': label,
        if (initialValue != null) 'initialValue': initialValue,
        'required': required,
        'enabled': enabled,
        if (allowedExtensions != null) 'allowedExtensions': allowedExtensions,
        if (visibilityCondition != null)
          'visibilityCondition': visibilityCondition,
        'events': events,
      };
}
