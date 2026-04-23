import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentIconButton extends Component {
  final String icon;
  final String color; // hex string or semantic name
  final String variant; // filled, outlined, ghost
  final String size; // small, medium, large
  final ActionD? onClick;

  ComponentIconButton({
    required super.id,
    this.icon = 'add',
    required this.color,
    this.variant = 'filled',
    this.size = 'medium',
    this.onClick,
    super.visibilityCondition,
    super.events,
  }) : super(type: 'icon_button');

  static String get componentId => 'icon_button';

  factory ComponentIconButton.empty(String id) {
    return ComponentIconButton(
      id: id,
      icon: 'add',
      color: '#2196F3',
      variant: 'filled',
      size: 'medium',
    );
  }

  factory ComponentIconButton.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }
    final icon = map['icon']?.toString().trim() ?? 'add';
    final color = map['color']?.toString().trim() ?? '#2196F3';
    final variant = map['variant']?.toString().trim() ?? 'filled';
    final size = map['size']?.toString().trim() ?? 'medium';
    final visibilityCondition = map['visibilityCondition']?.toString();
    final events = map['events'] as Map<String, dynamic>? ?? {};

    final actionMap = map['onClick'];
    final onClick =
        actionMap != null ? ActionD.fromJson(Map.from(actionMap)) : null;

    return ComponentIconButton(
      id: id,
      icon: icon,
      color: color,
      variant: variant,
      size: size,
      onClick: onClick,
      visibilityCondition: visibilityCondition,
      events: events,
    );
  }

  @override
  JsonMap toMap() => {
        'id': id,
        'type': type,
        'icon': icon,
        'color': color,
        'variant': variant,
        'size': size,
        if (onClick != null) 'onClick': onClick!.toJson(),
        if (visibilityCondition != null)
          'visibilityCondition': visibilityCondition,
        'events': events,
      };
}
