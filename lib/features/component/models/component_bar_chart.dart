import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/features/component/models/component_chart.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

/// A bar chart component that retrieves its data from an HTTP endpoint or other data source.
class ComponentBarChart extends ComponentChart {
  ComponentBarChart({
    required super.id,
    required super.http,
    required super.labelKey,
    required super.valueKey,
    super.title = '',
    super.width,
    super.height,
    super.referenceId,
    super.visibilityCondition,
    super.events = const {},
  }) : super(type: 'bar_chart');

  /// Creates an empty [ComponentBarChart] with default values.
  factory ComponentBarChart.empty(String id) {
    return ComponentBarChart(
      id: id,
      http: HttpData.empty(),
      labelKey: 'label',
      valueKey: 'value',
    );
  }

  /// Static component type identifier.
  static String get componentId => 'bar_chart';

  /// Creates a [ComponentBarChart] instance from a JSON-compatible map.
  factory ComponentBarChart.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }

    return ComponentBarChart(
      id: id,
      http: map['http'] == null
          ? HttpData.empty()
          : HttpData.fromJson(map['http'] as Map<String, dynamic>),
      labelKey: map['label_key']?.toString() ?? 'label',
      valueKey: map['value_key']?.toString() ?? 'value',
      title: map['title']?.toString() ?? '',
      width: (map['width'] as num?)?.toDouble(),
      height: (map['height'] as num?)?.toDouble(),
      referenceId: map['reference_id']?.toString(),
      visibilityCondition: map['visibilityCondition']?.toString(),
      events: map['events'] as Map<String, dynamic>? ?? const {},
    );
  }
}
