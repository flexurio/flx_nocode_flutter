import 'package:flx_nocode_flutter/features/component/models/component.dart'
    show Component;
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/component/models/component_size_mode.dart';

class ComponentText extends Component {
  static String get componentId => 'text';

  final String value;
  final ComponentSizeMode? widthMode;
  final double? width;
  final int? flex;

  ComponentText({
    required super.id,
    super.visibilityCondition,
    super.events,
    this.value = 'Text',
    this.widthMode,
    this.width,
    this.flex,
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
      visibilityCondition: map['visibilityCondition']?.toString(),
      events: map['events'] is Map
          ? Map<String, dynamic>.from(map['events'])
          : const <String, dynamic>{},
      value: map['value']?.toString() ?? 'Text',
      widthMode: ComponentSizeMode.fromString(map['widthMode']?.toString()),
      width: double.tryParse(map['width']?.toString() ?? ''),
      flex: int.tryParse(map['flex']?.toString() ?? ''),
    );
  }

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        'value': value,
        'widthMode': widthMode?.name,
        'width': width,
        'flex': flex,
      };
}
