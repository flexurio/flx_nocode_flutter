import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

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

  /// Vertical gap between children (in logical pixels).
  /// Default: 12.0
  final double gap;

  ComponentColumn({
    required super.id,
    super.visibilityCondition,
    super.events,
    this.children = const [],
    this.xAlign = 'left',
    this.yAlign = 'top',
    this.gap = 12.0,
  }) : super(type: 'column');

  /// Creates an empty [ComponentColumn] with default values.
  factory ComponentColumn.empty(String id) {
    return ComponentColumn(
      id: id,
      children: const [],
      xAlign: 'left',
      yAlign: 'top',
      gap: 12.0,
    );
  }

  /// Creates a [ComponentColumn] instance from a JSON-like map.
  factory ComponentColumn.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }

    final visibilityCondition = map['visibilityCondition']?.toString();
    final events = map['events'] is Map
        ? Map<String, dynamic>.from(map['events'])
        : const <String, dynamic>{};

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
      visibilityCondition: visibilityCondition,
      events: events,
      children: parsedChildren,
      xAlign: (map['x_align']?.toString().trim() ?? 'left'),
      yAlign: (map['y_align']?.toString().trim() ?? 'top'),
      gap: (map['gap'] is num) ? (map['gap'] as num).toDouble() : 12.0,
    );
  }

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        'x_align': xAlign,
        'y_align': yAlign,
        'gap': gap,
        'children': children.map((e) => e.toMap()).toList(growable: false),
      };
}
