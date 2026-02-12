import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentNumberField extends Component {
  final String label;
  final String initialValue;
  final bool enabled;

  ComponentNumberField({
    required super.id,
    required this.label,
    required this.initialValue,
    required this.enabled,
    super.visibilityCondition,
    super.events = const {},
  }) : super(type: componentId);

  static const String componentId = 'number_field';

  factory ComponentNumberField.empty(String id) {
    return ComponentNumberField(
      id: id,
      label: 'Number Field',
      initialValue: '',
      enabled: true,
    );
  }

  factory ComponentNumberField.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }
    final label = map['label']?.toString().trim() ?? 'Number Field';
    final initialValue = map['initialValue']?.toString() ?? '';
    final enabledRaw = map['enabled'];
    final enabled = () {
      if (enabledRaw == null) return true;
      if (enabledRaw is bool) return enabledRaw;
      final str = enabledRaw.toString().toLowerCase().trim();
      if (str == 'false' || str == '0') return false;
      return true;
    }();

    return ComponentNumberField(
      id: id,
      label: label,
      initialValue: initialValue,
      enabled: enabled,
      visibilityCondition: map['visibilityCondition']?.toString(),
      events: map['events'] as Map<String, dynamic>? ?? const {},
    );
  }

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        'label': label,
        'initialValue': initialValue,
        'enabled': enabled,
      };
}
