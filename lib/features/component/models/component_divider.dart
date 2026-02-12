import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentDivider extends Component {
  final double thickness;
  final double indent;
  final double endIndent;

  ComponentDivider({
    required super.id,
    this.thickness = 1.0,
    this.indent = 0.0,
    this.endIndent = 0.0,
    super.visibilityCondition,
    super.events = const {},
  }) : super(type: 'divider');

  static String get componentId => 'divider';

  factory ComponentDivider.empty(String id) {
    return ComponentDivider(
      id: id,
      thickness: 1.0,
      indent: 0.0,
      endIndent: 0.0,
    );
  }

  factory ComponentDivider.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }
    return ComponentDivider(
      id: id,
      thickness: double.tryParse(map['thickness']?.toString() ?? '') ?? 1.0,
      indent: double.tryParse(map['indent']?.toString() ?? '') ?? 0.0,
      endIndent: double.tryParse(map['endIndent']?.toString() ?? '') ?? 0.0,
      visibilityCondition: map['visibilityCondition']?.toString(),
      events: map['events'] as Map<String, dynamic>? ?? const {},
    );
  }

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        'thickness': thickness,
        'indent': indent,
        'endIndent': endIndent,
      };
}
