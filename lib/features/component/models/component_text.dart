import 'package:flx_nocode_flutter/features/component/models/component.dart'
    show Component;
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentText extends Component {
  static String get componentId => 'text';

  ComponentText({
    required super.id,
  }) : super(type: 'text');

  /// Creates an empty [ComponentText] with a generated ID.
  factory ComponentText.empty(String id) {
    return ComponentText(id: id);
  }

  factory ComponentText.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }
    return ComponentText(id: id);
  }

  @override
  JsonMap toMap() => {
        'id': id,
        'type': type,
      };
}
