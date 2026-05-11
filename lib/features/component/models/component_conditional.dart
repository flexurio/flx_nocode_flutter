import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentConditional extends Component {
  final String condition;
  final Component then;
  final Component? otherwise;

  ComponentConditional({
    required super.id,
    required this.condition,
    required this.then,
    this.otherwise,
    super.visibilityCondition,
    super.events = const {},
  }) : super(type: 'conditional');

  static String get componentId => 'conditional';

  factory ComponentConditional.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }

    if (map['condition'] == null) {
      throw const FormatException(
          'Component "condition" is required for conditional component');
    }

    if (map['then'] == null) {
      throw const FormatException(
          'Component "then" is required for conditional component');
    }

    return ComponentConditional(
      id: id,
      condition: map['condition'].toString(),
      then: Component.fromMap(map['then'] as Map<String, dynamic>),
      otherwise: map['else'] != null
          ? Component.fromMap(map['else'] as Map<String, dynamic>)
          : null,
      visibilityCondition: map['visibilityCondition']?.toString(),
      events: map['events'] as Map<String, dynamic>? ?? const {},
    );
  }

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        'condition': condition,
        'then': then.toMap(),
        if (otherwise != null) 'else': otherwise!.toMap(),
      };

  factory ComponentConditional.empty(String id) {
    return ComponentConditional(
      id: id,
      condition: 'true',
      then: Component.empty('text'),
    );
  }
}
