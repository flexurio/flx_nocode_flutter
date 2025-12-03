import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:uuid/uuid.dart';

/// A vertical container component that renders its children inside a column.
///
/// This model is UI-framework-agnostic. It only stores layout configuration.
///
/// JSON keywords:
/// - `x_align` → horizontal alignment (cross axis)
/// - `y_align` → vertical alignment (main axis)
///
/// Example:
/// ```json
/// {
///   "id": "col_info",
///   "type": "column",
///   "x_align": "left",
///   "y_align": "between",
///   "children": [ ... ]
/// }
/// ```
class ComponentColumn extends Component {
  /// Component ID constant for referencing the type.
  static String get componentId => 'column';

  /// Child components inside this column.
  final List<Component> children;

  /// Horizontal alignment (cross axis).
  ///
  /// Supported keywords:
  /// - left
  /// - center
  /// - right
  /// - stretch
  final String xAlign;

  /// Vertical alignment (main axis).
  ///
  /// Supported keywords:
  /// - top
  /// - center
  /// - bottom
  /// - between
  /// - around
  /// - evenly
  final String yAlign;

  ComponentColumn({
    required super.id,
    this.children = const [],
    this.xAlign = 'left',
    this.yAlign = 'top',
  }) : super(type: 'column');

  /// Creates an empty [ComponentColumn] with default values.
  factory ComponentColumn.empty() {
    return ComponentColumn(
      id: Uuid().v4(),
      children: const [],
      xAlign: 'left',
      yAlign: 'top',
    );
  }

  /// Creates a [ComponentColumn] instance from a JSON-like map.
  factory ComponentColumn.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }

    // Parse children list.
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

    return ComponentColumn(
      id: id,
      children: parsedChildren,
      xAlign: (map['x_align']?.toString().trim() ?? 'left'),
      yAlign: (map['y_align']?.toString().trim() ?? 'top'),
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
