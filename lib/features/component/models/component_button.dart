import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentButton extends Component {
  final String text;
  final String color; // hex string or semantic name

  ComponentButton({
    required super.id,
    required this.text,
    required this.color,
  }) : super(type: 'button');

  static String get componentId => 'button';

  factory ComponentButton.empty(String id) {
    return ComponentButton(
      id: id,
      text: 'Button',
      color: '#2196F3',
    );
  }

  factory ComponentButton.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }
    final text = map['text']?.toString().trim() ?? 'Button';
    final color = map['color']?.toString().trim() ?? '#2196F3';
    return ComponentButton(id: id, text: text, color: color);
  }

  @override
  JsonMap toMap() => {
        'id': id,
        'type': type,
        'text': text,
        'color': color,
      };
}
