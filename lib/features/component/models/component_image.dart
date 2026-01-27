import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentImage extends Component {
  final String url;
  final double? width;
  final double? height;
  final String fit;

  ComponentImage({
    required super.id,
    this.url = 'https://via.placeholder.com/150',
    this.width,
    this.height,
    this.fit = 'cover',
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
    );
  }

  @override
  JsonMap toMap() => {
        'id': id,
        'type': type,
        'url': url,
        if (width != null) 'width': width,
        if (height != null) 'height': height,
        'fit': fit,
      };
}
