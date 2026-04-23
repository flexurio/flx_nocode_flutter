import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentSwitch extends Component {
  final String label;
  final bool initialValue;
  final bool enabled;

  ComponentSwitch({
    required super.id,
    this.label = 'Switch',
    this.initialValue = false,
    this.enabled = true,
    super.visibilityCondition,
    super.events = const {},
  }) : super(type: 'switch');

  static String get componentId => 'switch';

  factory ComponentSwitch.empty(String id) {
    return ComponentSwitch(
      id: id,
      label: 'Switch',
      initialValue: false,
      enabled: true,
    );
  }

  factory ComponentSwitch.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }
    return ComponentSwitch(
      id: id,
      label: map['label']?.toString() ?? 'Switch',
      initialValue: map['initialValue'] == true,
      enabled: map['enabled'] != false,
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
