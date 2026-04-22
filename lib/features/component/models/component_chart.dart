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
