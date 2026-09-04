import 'package:easy_localization/easy_localization.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
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
    this.width,
    this.widthMode,
    this.flex,
    this.actions = const [],
    this.referenceId,
    this.dependsOn = const [],
    this.initial_value,
    this.reloadWithRefresh = false,
    this.showRefresh = true,
    this.refreshGapTop,
    this.refreshGapBottom,
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
      widthMode: ComponentSizeMode.fill,
      flex: null,
      actions: [],
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
  final ComponentSizeMode? widthMode;
  final int? flex;

  /// List of table columns.
  ///
  /// Each [TColumn] defines a header label and a body expression
  /// describing how to extract a value from a row.
  final List<TColumn> columns;

  /// List of actions available for each row.
  final List<ActionD> actions;
  final String? referenceId;
  final List<String> dependsOn;
  final dynamic initial_value;

  /// When `true`, [tableReloadListeners] (triggered by [dependsOn] changes)
  /// will call `loadData(isRefresh: true)`, discarding local state and
  /// re-fetching purely from the HTTP endpoint.
  ///
  /// When `false` (default), [tableReloadListeners] calls `loadData()` which
  /// reads from local [referenceId] first (standard [dependsOn] behavior).
  ///
  /// **JSON key**: `"reload_with_refresh"`
  ///
  /// Set to `true` for tables where locally-added rows must be cleared on reload
  /// (e.g. `realization_table` in `lbb_realization`).
  final bool reloadWithRefresh;

  /// Whether to display the table's header refresh button.
  ///
  /// Defaults to `true`. When set to `false` (via `"show_refresh": false` in JSON),
  /// the table's refresh button is hidden.
  final bool showRefresh;

  /// Top gap (margin) for the refresh button.
  ///
  /// Defaults to `12.0` in the UI if not specified.
  /// **JSON keys**: `"refresh_gap_top"` or `"refreshGapTop"`.
  final double? refreshGapTop;

  /// Bottom gap (margin) for the refresh button.
  ///
  /// Defaults to `12.0` in the UI if not specified.
  /// **JSON keys**: `"refresh_gap_bottom"` or `"refreshGapBottom"`.
  final double? refreshGapBottom;

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
    final List actionsMap = map['actions'] as List? ?? [];

    final columns = columnsMap.map((e) => TColumn.fromJson(e)).toList();
    final actions = actionsMap
        .map((e) => ActionD.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();

    final showRefresh = map['show_refresh'] ??
        map['showRefresh'] ??
        map['show_refresh_button'] ??
        map['showRefreshButton'] ??
        true;

    return ComponentTable(
      id: id,
      columns: columns,
      actions: actions,
      http: map['http'] == null
          ? HttpData.empty()
          : HttpData.fromJson(
              map['http'] as Map<String, dynamic>,
            ),
      width: (map['width'] as num?)?.toDouble(),
      widthMode: ComponentSizeMode.fromString(map['widthMode']?.toString()),
      flex: int.tryParse(map['flex']?.toString() ?? ''),
      referenceId: map['reference_id']?.toString(),
      dependsOn: map['dependsOn'] is List
          ? (map['dependsOn'] as List).map((e) => e.toString()).toList()
          : const [],
      initial_value: map['initial_value'] ?? map['initialValue'] ?? map['data'],
      reloadWithRefresh: map['reload_with_refresh'] == true,
      showRefresh: showRefresh == true,
      refreshGapTop: (map['refresh_gap_top'] ?? map['refreshGapTop']) != null
          ? double.tryParse((map['refresh_gap_top'] ?? map['refreshGapTop']).toString())
          : null,
      refreshGapBottom: (map['refresh_gap_bottom'] ?? map['refreshGapBottom']) != null
          ? double.tryParse((map['refresh_gap_bottom'] ?? map['refreshGapBottom']).toString())
          : null,
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
        'widthMode': widthMode?.name,
        'flex': flex,
        'reference_id': referenceId,
        'columns': columns
            .map((e) => {
                  'header': e.header,
                  'body': e.body,
                  'width': e.width,
                  if (e.component != null) 'component': e.component!.toMap(),
                })
            .toList(),
        'actions': actions.map((e) => e.toJson()).toList(),
        'dependsOn': dependsOn,
        'initial_value': initial_value,
        'reload_with_refresh': reloadWithRefresh,
        'show_refresh': showRefresh,
        if (refreshGapTop != null) 'refresh_gap_top': refreshGapTop,
        if (refreshGapBottom != null) 'refresh_gap_bottom': refreshGapBottom,
      };

  /// Returns a dummy [EntityCustom] that represents this table.
  /// Useful for reusing action logic that requires an entity context.
  EntityCustom get dummyEntity => EntityCustom.empty().copyWith(
        id: id,
        bypassAllPermissions: false,
      );

  /// Returns the localized title for the actions column.
  String get actionsColumnTitle => 'actions'.tr();
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
  final Component? component;

  TColumn(
      {required this.header, required this.body, this.width, this.component});

  /// Creates a [TColumn] from a JSON-compatible map.
  ///
  /// Missing fields default to an empty string (`""`).
  factory TColumn.fromJson(Map<String, dynamic> json) {
    return TColumn(
      header: json['header']?.toString().trim() ?? '',
      body: json['body']?.toString().trim() ?? '',
      width: json['width']?.toDouble(),
      component: json['component'] != null
          ? Component.fromMap(json['component'] as Map<String, dynamic>)
          : null,
    );
  }
}
