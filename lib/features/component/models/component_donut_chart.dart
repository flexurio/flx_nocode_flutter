import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

/// A donut chart component that retrieves its data from an HTTP endpoint or other data source.
class ComponentDonutChart extends Component {
  ComponentDonutChart({
    required super.id,
    required this.http,
    required this.labelKey,
    required this.valueKey,
    this.title = '',
    this.width,
    this.height,
    this.referenceId,
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

  /// HTTP configuration used to fetch chart data.
  final HttpData http;

  /// The key in the data source used for segment labels.
  final String labelKey;

  /// The key in the data source used for segment values.
  final String valueKey;

  /// Optional title for the chart.
  final String title;

  /// Optional width for the chart.
  final double? width;

  /// Optional height for the chart.
  final double? height;

  /// Optional reference ID for local data source.
  final String? referenceId;

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

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        'http': http.toJson(),
        'label_key': labelKey,
        'value_key': valueKey,
        'title': title,
        'width': width,
        'height': height,
        'reference_id': referenceId,
      };
}
