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

  /// Horizontal gap between children.
  final double horizontalGap;

  final String? widthMode; // 'fill', 'hug'
  final String? heightMode; // 'fill', 'hug'

  ComponentRow({
    required super.id,
    super.visibilityCondition,
    super.events,
    this.children = const [],
    this.xAlign = 'left',
    this.yAlign = 'top',
    this.horizontalGap = 12.0,
    this.widthMode,
    this.heightMode,
  }) : super(type: 'row');

  /// Creates an empty [ComponentRow] with default values.
  factory ComponentRow.empty(String id) {
    return ComponentRow(
      id: id,
      children: const [],
      xAlign: 'left',
      yAlign: 'top',
      horizontalGap: 12.0,
      widthMode: 'fill',
      heightMode: 'hug',
    );
  }

  factory ComponentRow.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }

    final visibilityCondition = map['visibilityCondition']?.toString();
    final events = map['events'] is Map
        ? Map<String, dynamic>.from(map['events'])
        : const <String, dynamic>{};

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
      visibilityCondition: visibilityCondition,
      events: events,
      children: parsedChildren,
      xAlign: map['x_align']?.toString().trim() ?? 'left',
      yAlign: map['y_align']?.toString().trim() ?? 'top',
      horizontalGap:
          double.tryParse(map['horizontal_gap']?.toString() ?? '') ?? 12.0,
      widthMode: map['widthMode']?.toString(),
      heightMode: map['heightMode']?.toString(),
    );
  }

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        'x_align': xAlign,
        'y_align': yAlign,
        'horizontal_gap': horizontalGap,
        'widthMode': widthMode,
        'heightMode': heightMode,
        'children': children.map((e) => e.toMap()).toList(growable: false),
      };
}
