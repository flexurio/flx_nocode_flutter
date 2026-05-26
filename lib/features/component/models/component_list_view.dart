import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentListView extends Component {
  static const String componentId = 'list_view';

  final HttpData http;
  final Component? item;
  final double gap;
  final double? width;
  final double? height;
  final ComponentSizeMode? widthMode;
  final ComponentSizeMode? heightMode;
  final String? referenceId;
  final List<String> dependsOn;
  final dynamic initialValue;
  final String emptyText;

  ComponentListView({
    required super.id,
    required this.http,
    this.item,
    this.gap = 12.0,
    this.width,
    this.height,
    this.widthMode,
    this.heightMode,
    this.referenceId,
    this.dependsOn = const [],
    this.initialValue,
    this.emptyText = 'No data',
    super.visibilityCondition,
    super.events = const {},
  }) : super(type: componentId);

  factory ComponentListView.empty(String id) {
    return ComponentListView(
      id: id,
      http: HttpData.empty(),
      widthMode: ComponentSizeMode.fill,
      heightMode: ComponentSizeMode.hug,
    );
  }

  factory ComponentListView.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }

    Component? item;
    if (map['item'] != null) {
      item = Component.fromMap(Map<String, dynamic>.from(map['item'] as Map));
    }

    return ComponentListView(
      id: id,
      http: map['http'] == null
          ? HttpData.empty()
          : HttpData.fromJson(map['http'] as Map<String, dynamic>),
      item: item,
      gap: double.tryParse(map['gap']?.toString() ?? '') ?? 12.0,
      width: double.tryParse(map['width']?.toString() ?? ''),
      height: double.tryParse(map['height']?.toString() ?? ''),
      widthMode: ComponentSizeMode.fromString(map['widthMode']?.toString()),
      heightMode: ComponentSizeMode.fromString(map['heightMode']?.toString()),
      referenceId: map['reference_id']?.toString(),
      dependsOn: map['dependsOn'] is List
          ? (map['dependsOn'] as List).map((e) => e.toString()).toList()
          : const [],
      initialValue: map['initial_value'] ?? map['initialValue'] ?? map['data'],
      emptyText: map['emptyText']?.toString() ?? 'No data',
      visibilityCondition: map['visibilityCondition']?.toString(),
      events: map['events'] is Map
          ? Map<String, dynamic>.from(map['events'])
          : const <String, dynamic>{},
    );
  }

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        'http': http.toJson(),
        if (item != null) 'item': item!.toMap(),
        'gap': gap,
        'width': width,
        'height': height,
        'widthMode': widthMode?.name,
        'heightMode': heightMode?.name,
        'reference_id': referenceId,
        'dependsOn': dependsOn,
        'initial_value': initialValue,
        'emptyText': emptyText,
      };
}
