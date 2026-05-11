import 'package:flx_nocode_flutter/features/component/models/component_input_base.dart';
import 'package:flx_nocode_flutter/features/component/models/component_size_mode.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentFilePicker extends ComponentInputBase {
  final String? initialValue;
  final bool enabled;
  final List<String>? allowedExtensions;

  ComponentFilePicker({
    required super.id,
    required super.label,
    this.initialValue,
    super.required,
    this.enabled = true,
    this.allowedExtensions,
    super.widthMode,
    super.width,
    super.flex,
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
      widthMode: ComponentSizeMode.fromString(map['widthMode']?.toString()),
      width: double.tryParse(map['width']?.toString() ?? ''),
      flex: int.tryParse(map['flex']?.toString() ?? ''),
      visibilityCondition: map['visibilityCondition']?.toString(),
      events: map['events'] as Map<String, dynamic>? ?? {},
    );
  }

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        if (initialValue != null) 'initialValue': initialValue,
        'enabled': enabled,
        if (allowedExtensions != null) 'allowedExtensions': allowedExtensions,
      };
}
