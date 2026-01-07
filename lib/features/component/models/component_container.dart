import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentContainer extends Component {
  static const String componentId = 'container';

  final double? padding;
  final double? margin;
  final double? width;
  final double? height;
  final String? color;
  final double? borderRadius;
  final String? borderColor;
  final double? borderWidth;

  ComponentContainer({
    required super.id,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.color,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
  }) : super(type: componentId);

  factory ComponentContainer.empty(String id) {
    return ComponentContainer(
      id: id,
      padding: 16.0,
      color: '#FFFFFF',
      borderRadius: 8.0,
      borderColor: '#E0E0E0',
      borderWidth: 1.0,
    );
  }

  factory ComponentContainer.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }

    double? parseDouble(dynamic value) {
      if (value == null) return null;
      if (value is num) return value.toDouble();
      return double.tryParse(value.toString());
    }

    return ComponentContainer(
      id: id,
      padding: parseDouble(map['padding']),
      margin: parseDouble(map['margin']),
      width: parseDouble(map['width']),
      height: parseDouble(map['height']),
      color: map['color']?.toString(),
      borderRadius: parseDouble(map['borderRadius']),
      borderColor: map['borderColor']?.toString(),
      borderWidth: parseDouble(map['borderWidth']),
    );
  }

  @override
  JsonMap toMap() => {
        'id': id,
        'type': type,
        'padding': padding,
        'margin': margin,
        'width': width,
        'height': height,
        'color': color,
        'borderRadius': borderRadius,
        'borderColor': borderColor,
        'borderWidth': borderWidth,
      };
}
