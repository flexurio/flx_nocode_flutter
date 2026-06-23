import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentImage extends Component {
  final String url;
  final double? width;
  final double? height;
  final String fit;
  final ComponentSizeMode? widthMode;
  final ComponentSizeMode? heightMode;
  final int? flex;

  ComponentImage({
    required super.id,
    this.url = 'https://via.placeholder.com/150',
    this.width,
    this.height,
    this.fit = 'cover',
    this.widthMode,
    this.heightMode,
    this.flex,
    super.visibilityCondition,
    super.events = const {},
  }) : super(type: 'image');

  static String get componentId => 'image';

  factory ComponentImage.empty(String id) {
    return ComponentImage(
      id: id,
      url: 'https://via.placeholder.com/150',
    );
  }

  factory ComponentImage.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }
    return ComponentImage(
      id: id,
      url: map['url']?.toString() ?? 'https://via.placeholder.com/150',
      width: double.tryParse(map['width']?.toString() ?? ''),
      height: double.tryParse(map['height']?.toString() ?? ''),
      fit: map['fit']?.toString() ?? 'cover',
      widthMode: ComponentSizeMode.fromString(map['widthMode']?.toString()),
      heightMode: ComponentSizeMode.fromString(map['heightMode']?.toString()),
      flex: int.tryParse(map['flex']?.toString() ?? ''),
      visibilityCondition: map['visibilityCondition']?.toString(),
      events: map['events'] as Map<String, dynamic>? ?? const {},
    );
  }

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        'url': url,
        if (width != null) 'width': width,
        if (height != null) 'height': height,
        'fit': fit,
        'widthMode': widthMode?.name,
        'heightMode': heightMode?.name,
        'flex': flex,
      };
}
