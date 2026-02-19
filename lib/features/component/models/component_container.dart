import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentContainer extends Component {
  static const String componentId = 'container';

  final double? padding;
  final double? margin;
  final double? width;
  final double? height;
  final String? widthMode; // 'fill', 'hug', 'fixed'
  final String? heightMode; // 'fill', 'hug', 'fixed'
  final String? color;
  final double? borderRadius;
  final String? borderColor;
  final double? borderWidth;
  final Component? child;

  ComponentContainer({
    required super.id,
    super.visibilityCondition,
    super.events,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.widthMode,
    this.heightMode,
    this.color,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.child,
  }) : super(type: componentId);

  factory ComponentContainer.empty(String id) {
    return ComponentContainer(
      id: id,
      padding: 16.0,
      color: '#FFFFFF',
      borderRadius: 8.0,
      borderColor: '#E0E0E0',
      borderWidth: 1.0,
      widthMode: 'hug',
      heightMode: 'hug',
    );
  }

  factory ComponentContainer.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }

    final visibilityCondition = map['visibilityCondition']?.toString();
    final events = map['events'] is Map
        ? Map<String, dynamic>.from(map['events'])
        : const <String, dynamic>{};

    double? parseDouble(dynamic value) {
      if (value == null) return null;
      if (value is num) return value.toDouble();
      return double.tryParse(value.toString());
    }

    Component? childComponent;
    if (map['child'] != null) {
      childComponent =
          Component.fromMap(Map<String, dynamic>.from(map['child']));
    }

    return ComponentContainer(
      id: id,
      visibilityCondition: visibilityCondition,
      events: events,
      padding: parseDouble(map['padding']),
      margin: parseDouble(map['margin']),
      width: parseDouble(map['width']),
      height: parseDouble(map['height']),
      widthMode: map['widthMode']?.toString(),
      heightMode: map['heightMode']?.toString(),
      color: map['color']?.toString(),
      borderRadius: parseDouble(map['borderRadius']),
      borderColor: map['borderColor']?.toString(),
      borderWidth: parseDouble(map['borderWidth']),
      child: childComponent,
    );
  }

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        'padding': padding,
        'margin': margin,
        'width': width,
        'height': height,
        'widthMode': widthMode,
        'heightMode': heightMode,
        'color': color,
        'borderRadius': borderRadius,
        'borderColor': borderColor,
        'borderWidth': borderWidth,
        if (child != null) 'child': child!.toMap(),
      };
}
