import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentContainer extends Component {
  static const String componentId = 'container';

  final double? padding;
  final double? paddingLeft;
  final double? paddingTop;
  final double? paddingRight;
  final double? paddingBottom;

  final double? margin;
  final double? marginLeft;
  final double? marginTop;
  final double? marginRight;
  final double? marginBottom;

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
    this.paddingLeft,
    this.paddingTop,
    this.paddingRight,
    this.paddingBottom,
    this.margin,
    this.marginLeft,
    this.marginTop,
    this.marginRight,
    this.marginBottom,
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
      borderColor: null,
      borderWidth: null,
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
      paddingLeft: parseDouble(map['paddingLeft']),
      paddingTop: parseDouble(map['paddingTop']),
      paddingRight: parseDouble(map['paddingRight']),
      paddingBottom: parseDouble(map['paddingBottom']),
      margin: parseDouble(map['margin']),
      marginLeft: parseDouble(map['marginLeft']),
      marginTop: parseDouble(map['marginTop']),
      marginRight: parseDouble(map['marginRight']),
      marginBottom: parseDouble(map['marginBottom']),
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
        'paddingLeft': paddingLeft,
        'paddingTop': paddingTop,
        'paddingRight': paddingRight,
        'paddingBottom': paddingBottom,
        'margin': margin,
        'marginLeft': marginLeft,
        'marginTop': marginTop,
        'marginRight': marginRight,
        'marginBottom': marginBottom,
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
