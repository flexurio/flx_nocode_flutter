import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

/// A horizontal container component that renders its children inside a row.
///
/// This model does not depend on Flutter widgets. It only stores configuration.
///
/// JSON keywords:
/// - `x_align` → horizontal alignment (main axis)
/// - `y_align` → vertical alignment (cross axis)
///
/// Example:
/// ```json
/// {
///   "id": "row_filters",
///   "type": "row",
///   "x_align": "between",
///   "y_align": "center",
///   "children": [ ... ]
/// }
/// ```
class ComponentRow extends Component {
  /// Component ID constant for referencing the type.
  static String get componentId => 'row';

  final List<Component> children;

  /// Horizontal alignment (main axis), using human-friendly keywords.
  ///
  /// Supported:
  /// - left
  /// - center
  /// - right
  /// - between
  /// - around
  /// - evenly
  final String xAlign;

  /// Vertical alignment (cross axis), using human-friendly keywords.
  ///
  /// Supported:
  /// - top
  /// - center
  /// - bottom
  /// - stretch
  final String yAlign;

  ComponentRow({
    required super.id,
    this.children = const [],
    this.xAlign = 'left',
    this.yAlign = 'top',
  }) : super(type: 'row');

  factory ComponentRow.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }

    // Parse children
    final rawChildren = map['children'];
    List<Component> parsedChildren = const [];

    if (rawChildren is List) {
      parsedChildren = rawChildren.map<Component>((child) {
        if (child is! Map) {
          throw const FormatException('Each child must be an object');
        }
        return Component.fromMap(child.cast<String, dynamic>());
      }).toList(growable: false);
    }

    return ComponentRow(
      id: id,
      children: parsedChildren,
      xAlign: map['x_align']?.toString().trim() ?? 'left',
      yAlign: map['y_align']?.toString().trim() ?? 'top',
    );
  }

  @override
  JsonMap toMap() => {
        'id': id,
        'type': type,
        'x_align': xAlign,
        'y_align': yAlign,
        'children': children.map((e) => e.toMap()).toList(growable: false),
      };
}
