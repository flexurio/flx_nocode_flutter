import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

/// A table component that retrieves its data from an HTTP endpoint.
///
/// This component defines **what a table should look like** and **how it should load data**:
/// - The HTTP request configuration ([http])
/// - The list of table columns ([columns])
/// - How to extract cell values from each row ([TColumn.body])
///
/// Rendering and HTTP execution are handled by the UI layer or controller
/// that interprets this component.
///
/// ## Component Type
/// - `"table"`
///
/// ## Example JSON
/// ```json
/// {
///   "id": "customer_table",
///   "type": "table",
///   "http": {
///     "method": "GET",
///     "url": "https://api.example.com/customers",
///     "headers": {
///       "Authorization": "Bearer {token}"
///     },
///     "body": {},
///     "use_form_data": false
///   },
///   "columns": [
///     { "header": "Name", "body": "name" },
///     { "header": "Email", "body": "email" }
///   ]
/// }
/// ```
///
/// ## Behavior Summary
/// - The table will execute [http] to fetch a list of rows.
/// - Each [TColumn] maps a JSON property from the row into a displayed cell.
/// - Rendering is dynamic and depends entirely on this configuration.
class ComponentTable extends Component {
  ComponentTable({
    required this.columns,
    required super.id,
    required this.http,
    required this.width,
    this.referenceId,
    super.visibilityCondition,
    super.events = const {},
  }) : super(type: 'table');

  /// Creates an empty [ComponentTable] with default values.
  ///
  /// Useful for initializing a new table component before configuration.
  factory ComponentTable.empty(String id) {
    return ComponentTable(
      id: id,
      columns: [],
      http: HttpData.empty(),
      width: 1000,
    );
  }

  /// Static component type identifier.
  ///
  /// Helps factories or registry mappings to identify this component.
  static String get componentId => 'table';

  /// HTTP configuration used to fetch table data.
  ///
  /// See [HttpData] for execution rules, supported methods, templating, etc.
  final HttpData http;

  final double? width;

  /// List of table columns.
  ///
  /// Each [TColumn] defines a header label and a body expression
  /// describing how to extract a value from a row.
  final List<TColumn> columns;

  final String? referenceId;

  /// Creates a [ComponentTable] instance from a JSON-compatible map.
  ///
  /// ### Expected Structure
  /// - `id`: **String**, required
  /// - `http`: **Map<String, dynamic>**, required
  /// - `columns`: **List<Map>**, optional (defaults to empty list)
  ///
  /// ### Throws
  /// - [FormatException] if `id` is missing or empty.
  factory ComponentTable.fromMap(Map<String, dynamic> map) {
    print('[ComponentTable] fromMap');
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }

    final List columnsMap = map['columns'] as List? ?? [];

    final columns = columnsMap.map((e) => TColumn.fromJson(e)).toList();

    return ComponentTable(
      id: id,
      columns: columns,
      http: map['http'] == null
          ? HttpData.empty()
          : HttpData.fromJson(
              map['http'] as Map<String, dynamic>,
            ),
      width: (map['width'] as num?)?.toDouble(),
      referenceId: map['reference_id']?.toString(),
      visibilityCondition: map['visibilityCondition']?.toString(),
      events: map['events'] as Map<String, dynamic>? ?? const {},
    );
  }

  /// Converts this component into a JSON-compatible map.
  ///
  /// Currently only returns minimal metadata (`id` and `type`).
  /// If full serialization is needed, this method can be expanded.
  ///
  /// ### Example Output
  /// ```json
  /// {
  ///   "id": "customer_table",
  ///   "type": "table"
  /// }
  /// ```
  @override
  JsonMap toMap() => {
        ...super.toMap(),
        'http': http.toJson(),
        'width': width,
        'reference_id': referenceId,
        'columns': columns
            .map((e) => {
                  'header': e.header,
                  'body': e.body,
                  'width': e.width,
                })
            .toList(),
      };
}

/// Defines a single column in a [ComponentTable].
///
/// A column has:
/// - A visible label in the table header ([header])
/// - A key or expression describing how to extract a cell value ([body])
///
/// ## Examples
///
/// Simple JSON key:
/// ```json
/// { "header": "Name", "body": "name" }
/// ```
///
/// Nested path or template (depending on renderer):
/// ```json
/// { "header": "Customer", "body": "customer.name" }
/// ```
///
/// Template example (if supported):
/// ```json
/// { "header": "Full Name", "body": "${first} ${last}" }
/// ```
class TColumn {
  /// Text displayed in the table header.
  final String header;

  /// Key or expression used to extract value for each table cell.
  final String body;

  final double? width;

  TColumn({required this.header, required this.body, this.width});

  /// Creates a [TColumn] from a JSON-compatible map.
  ///
  /// Missing fields default to an empty string (`""`).
  factory TColumn.fromJson(Map<String, dynamic> json) {
    return TColumn(
      header: json['header']?.toString().trim() ?? '',
      body: json['body']?.toString().trim() ?? '',
      width: json['width']?.toDouble(),
    );
  }
}
