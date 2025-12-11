import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

/// A non-editable field component used to display a read-only value.
///
/// This component is typically used in detail screens or summary sections
/// where a piece of information must be shown but not modified by the user.
///
/// ### Component Type
/// - `field_display`
///
/// ### Properties
/// - **id**: Unique identifier for this component.
/// - **label**: The text label shown to the user (e.g., "Customer Name").
/// - **value**: The value displayed under the label (e.g., "PT Maju Jaya").
///
/// ### Example JSON
/// ```json
/// {
///   "id": "customer_name",
///   "type": "field_display",
///   "label": "Customer Name",
///   "value": "PT Maju Jaya"
/// }
/// ```
///
/// ### Usage
/// This component **only displays data**, it does not provide input.
/// Used in layout builders where components are mapped from JSON.
class ComponentFieldDisplay extends Component {
  /// The label shown to the user.
  final String label;

  /// The non-editable value displayed under the label.
  final String value;

  ComponentFieldDisplay({
    required super.id,
    required this.label,
    required this.value,
  }) : super(type: 'field_display');

  /// Component ID constant for referencing the type.
  static String get componentId => 'field_display';

  /// Creates a ComponentFieldDisplay instance from a JSON-compatible map.
  ///
  /// Throws [FormatException] when:
  /// - `id` is missing or empty
  /// - `label` is missing or empty
  /// - `value` is missing or empty
  factory ComponentFieldDisplay.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }

    final label = map['label']?.toString().trim() ?? '';
    final value = map['value']?.toString().trim() ?? '';

    return ComponentFieldDisplay(
      id: id,
      label: label,
      value: value,
    );
  }

  factory ComponentFieldDisplay.empty(String id) {
    return ComponentFieldDisplay(
      id: id,
      label: 'Label',
      value: 'Value',
    );
  }

  /// Converts this component into a JSON-compatible map.
  ///
  /// Example output:
  /// ```json
  /// {
  ///   "id": "customer_name",
  ///   "type": "field_display",
  ///   "label": "Customer Name",
  ///   "value": "PT Maju Jaya"
  /// }
  /// ```
  @override
  JsonMap toMap() => {
        'id': id,
        'type': type,
        'label': label,
        'value': value,
      };
}
