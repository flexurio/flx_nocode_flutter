import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

/// Base class for chart components to implement DRY.
abstract class ComponentChart extends Component {
  ComponentChart({
    required super.id,
    required super.type,
    required this.http,
    required this.labelKey,
    required this.valueKey,
    this.title = '',
    this.width,
    this.height,
    this.referenceId,
    super.visibilityCondition,
    super.events = const {},
  });

  /// HTTP configuration used to fetch chart data.
  final HttpData http;

  /// The key in the data source used for segment/bar labels.
  final String labelKey;

  /// The key in the data source used for segment/bar values.
  final String valueKey;

  /// Optional title for the chart.
  final String title;

  /// Optional width for the chart.
  final double? width;

  /// Optional height for the chart.
  final double? height;

  /// Optional reference ID for local data source.
  final String? referenceId;

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

/// A generic chart component that supports multiple chart types.
class ComponentGenericChart extends ComponentChart {
  ComponentGenericChart({
    required super.id,
    required super.http,
    required super.labelKey,
    required super.valueKey,
    required this.chartType,
    super.title = '',
    super.width,
    super.height,
    super.referenceId,
    super.visibilityCondition,
    super.events = const {},
  }) : super(type: 'chart');

  /// The type of chart to display (e.g., 'bar', 'pie', 'donut').
  final String chartType;

  /// Creates an empty [ComponentGenericChart] with default values.
  factory ComponentGenericChart.empty(String id) {
    return ComponentGenericChart(
      id: id,
      http: HttpData.empty(),
      labelKey: 'label',
      valueKey: 'value',
      chartType: 'bar',
    );
  }

  /// Static component type identifier.
  static String get componentId => 'chart';

  /// Creates a [ComponentGenericChart] instance from a JSON-compatible map.
  factory ComponentGenericChart.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }

    return ComponentGenericChart(
      id: id,
      http: map['http'] == null
          ? HttpData.empty()
          : HttpData.fromJson(map['http'] as Map<String, dynamic>),
      labelKey: (map['dataKey'] ?? map['label_key'] ?? 'label').toString(),
      valueKey: (map['valueKey'] ?? map['value_key'] ?? 'value').toString(),
      chartType: map['chartType']?.toString() ?? 'bar',
      title: (map['label'] ?? map['title'] ?? '').toString(),
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
        'chartType': chartType,
      };
}
