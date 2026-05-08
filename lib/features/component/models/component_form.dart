import 'package:flx_nocode_flutter/features/component/models/component.dart';

class ComponentForm extends Component {
  static const String componentId = 'form';

  final List<Component> children;

  ComponentForm({
    required super.id,
    super.visibilityCondition,
    super.events,
    this.children = const [],
  }) : super(type: componentId);

  factory ComponentForm.fromMap(Map<String, dynamic> map) {
    return ComponentForm(
      id: map['id'],
      visibilityCondition: map['visibility_condition'] ?? map['visibilityCondition'],
      events: map['events'] ?? {},
      children: (map['children'] as List? ?? [])
          .map((e) => Component.fromMap(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'children': children.map((e) => e.toMap()).toList(),
    };
  }

  factory ComponentForm.empty(String id) {
    return ComponentForm(id: id);
  }
}
