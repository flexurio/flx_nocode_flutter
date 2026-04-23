import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/features/component/models/component_chart.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

/// A donut chart component that retrieves its data from an HTTP endpoint or other data source.
class ComponentDonutChart extends ComponentChart {
  ComponentDonutChart({
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
  }) : super(type: 'donut_chart');

  /// Creates an empty [ComponentDonutChart] with default values.
  factory ComponentDonutChart.empty(String id) {
    return ComponentDonutChart(
      id: id,
      http: HttpData.empty(),
      labelKey: 'label',
      valueKey: 'value',
    );
  }

  /// Static component type identifier.
  static String get componentId => 'donut_chart';

  /// Creates a [ComponentDonutChart] instance from a JSON-compatible map.
  factory ComponentDonutChart.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }

    return ComponentDonutChart(
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
