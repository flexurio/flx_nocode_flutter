import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';

class ComponentButton extends Component {
  final String text;
  final String color; // hex string or semantic name
  final String variant; // primary, secondary, outline, ghost, destructive
  final String size; // small, medium, large
  final ActionD? onClick;
  final String? widthMode;
  final double? width;
  final int? flex;

  ComponentButton({
    required super.id,
    required this.text,
    required this.color,
    this.variant = 'primary',
    this.size = 'medium',
    this.onClick,
    this.widthMode,
    this.width,
    this.flex,
    super.visibilityCondition,
    super.events,
  }) : super(type: 'button');

  static String get componentId => 'button';

  factory ComponentButton.empty(String id) {
    return ComponentButton(
      id: id,
      text: 'Button',
      color: '#2196F3',
      variant: 'primary',
      size: 'medium',
      widthMode: 'hug',
    );
  }

  factory ComponentButton.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }
    final text = map['text']?.toString().trim() ?? 'Button';
    final color = map['color']?.toString().trim() ?? '#2196F3';
    final variant = map['variant']?.toString().trim() ?? 'primary';
    final size = map['size']?.toString().trim() ?? 'medium';
    final visibilityCondition = map['visibilityCondition']?.toString();
    final events = map['events'] as Map<String, dynamic>? ?? {};

    final actionMap = map['onClick'];
    final onClick =
        actionMap != null ? ActionD.fromJson(Map.from(actionMap)) : null;

    return ComponentButton(
      id: id,
      text: text,
      color: color,
      variant: variant,
      size: size,
      onClick: onClick,
      widthMode: map['widthMode']?.toString(),
      width: double.tryParse(map['width']?.toString() ?? ''),
      flex: int.tryParse(map['flex']?.toString() ?? ''),
      visibilityCondition: visibilityCondition,
      events: events,
    );
  }

  @override
  JsonMap toMap() => {
        'id': id,
        'type': type,
        'text': text,
        'color': color,
        'variant': variant,
        'size': size,
        if (onClick != null) 'onClick': onClick!.toJson(),
        'widthMode': widthMode,
        'width': width,
        'flex': flex,
        if (visibilityCondition != null)
          'visibilityCondition': visibilityCondition,
        'events': events,
      };
}
