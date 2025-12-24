import 'package:flx_nocode_flutter/features/component/models/component.dart'
    show Component;
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentText extends Component {
  static String get componentId => 'text';

  final String value;

  ComponentText({
    required super.id,
    this.value = 'Text',
  }) : super(type: 'text');

  /// Creates an empty [ComponentText] with a generated ID.
  factory ComponentText.empty(String id) {
    return ComponentText(id: id, value: 'Text');
  }

  factory ComponentText.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }
    return ComponentText(
      id: id,
      value: map['value']?.toString() ?? 'Text',
    );
  }

  @override
  JsonMap toMap() => {
        'id': id,
        'type': type,
        'value': value,
      };
}
