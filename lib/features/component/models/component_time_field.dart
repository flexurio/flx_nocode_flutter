import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentTimeField extends Component {
  final String label;
  final String initialValue;
  final bool required;
  final bool enabled;
  final String? widthMode; // 'fill', 'hug', 'fixed'
  final double? width;
  final int? flex;

  ComponentTimeField({
    required super.id,
    required this.label,
    required this.initialValue,
    this.required = false,
    this.enabled = true,
    this.widthMode,
    this.width,
    this.flex,
    super.visibilityCondition,
    super.events = const {},
  }) : super(type: componentId);

  static const String componentId = 'time_field';

  factory ComponentTimeField.empty(String id) {
    return ComponentTimeField(
      id: id,
      label: 'Time Field',
      initialValue: '',
      required: false,
      enabled: true,
      widthMode: 'fill',
    );
  }

  factory ComponentTimeField.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }
    final label = map['label']?.toString().trim() ?? 'Time Field';
    final initialValue = map['initialValue']?.toString().trim() ?? '';
    final required = map['required'] == true;
    final enabled = map['enabled'] != false;

    return ComponentTimeField(
      id: id,
      label: label,
      initialValue: initialValue,
      required: required,
      enabled: enabled,
      widthMode: map['widthMode']?.toString(),
      width: map['width'] != null
          ? double.tryParse(map['width'].toString())
          : null,
      flex: map['flex'] != null ? int.tryParse(map['flex'].toString()) : null,
      visibilityCondition: map['visibilityCondition']?.toString(),
      events: map['events'] as Map<String, dynamic>? ?? const {},
    );
  }

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        'label': label,
        'initialValue': initialValue,
        'required': required,
        'enabled': enabled,
        'widthMode': widthMode,
        'width': width,
        'flex': flex,
      };
}
