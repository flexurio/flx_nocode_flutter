import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

/// Presentation mode for [ComponentFieldArray].
enum FieldArrayPresentation {
  table,
  card;

  static FieldArrayPresentation fromString(String? raw) {
    switch (raw?.trim().toLowerCase()) {
      case 'card':
      case 'cards':
        return FieldArrayPresentation.card;
      case 'table':
      default:
        return FieldArrayPresentation.table;
    }
  }
}

/// Collection-level validation constraints for [ComponentFieldArray].
class FieldArrayConstraints {
  final int? minRows;
  final int? maxRows;
  final List<String> uniqueBy;

  const FieldArrayConstraints({
    this.minRows,
    this.maxRows,
    this.uniqueBy = const [],
  });

  factory FieldArrayConstraints.fromMap(
    Map<String, dynamic>? nested,
    Map<String, dynamic> rootMap,
  ) {
    int? parsePositiveInt(dynamic raw) {
      if (raw == null) return null;
      if (raw is int) return raw;
      if (raw is num) return raw.toInt();
      return int.tryParse(raw.toString());
    }

    List<String> parseStringList(dynamic raw) {
      if (raw is List) {
        return raw
            .map((e) => e?.toString().trim() ?? '')
            .where((e) => e.isNotEmpty)
            .toList(growable: false);
      }
      if (raw is String && raw.trim().isNotEmpty) {
        return [raw.trim()];
      }
      return const [];
    }

    final minRows = parsePositiveInt(
      nested?['min_rows'] ??
          nested?['minRows'] ??
          rootMap['min_rows'] ??
          rootMap['minRows'],
    );
    final maxRows = parsePositiveInt(
      nested?['max_rows'] ??
          nested?['maxRows'] ??
          rootMap['max_rows'] ??
          rootMap['maxRows'],
    );
    final uniqueBy = parseStringList(
      nested?['unique_by'] ??
          nested?['uniqueBy'] ??
          rootMap['unique_by'] ??
          rootMap['uniqueBy'],
    );

    return FieldArrayConstraints(
      minRows: minRows,
      maxRows: maxRows,
      uniqueBy: uniqueBy,
    );
  }

  Map<String, dynamic> toMap() => {
        if (minRows != null) 'min_rows': minRows,
        if (maxRows != null) 'max_rows': maxRows,
        if (uniqueBy.isNotEmpty) 'unique_by': uniqueBy,
      };
}

/// Row-level interaction capabilities and labels for [ComponentFieldArray].
class FieldArrayRowActions {
  final bool allowAdd;
  final bool allowDelete;
  final String addLabel;
  final String emptyMessage;

  const FieldArrayRowActions({
    this.allowAdd = true,
    this.allowDelete = true,
    this.addLabel = 'Add row',
    this.emptyMessage = 'No rows added yet.',
  });

  factory FieldArrayRowActions.fromMap(
    Map<String, dynamic>? nested,
    Map<String, dynamic> rootMap,
  ) {
    bool parseBool(dynamic raw, bool fallback) {
      if (raw is bool) return raw;
      if (raw is String) {
        final lower = raw.trim().toLowerCase();
        if (lower == 'true') return true;
        if (lower == 'false') return false;
      }
      return fallback;
    }

    String parseString(dynamic raw, String fallback) {
      final str = raw?.toString().trim() ?? '';
      return str.isNotEmpty ? str : fallback;
    }

    return FieldArrayRowActions(
      allowAdd: parseBool(
        nested?['allow_add'] ??
            nested?['allowAdd'] ??
            rootMap['allow_add'] ??
            rootMap['allowAdd'] ??
            rootMap['allow_add_row'],
        true,
      ),
      allowDelete: parseBool(
        nested?['allow_delete'] ??
            nested?['allowDelete'] ??
            rootMap['allow_delete'] ??
            rootMap['allowDelete'] ??
            rootMap['allow_delete_row'],
        true,
      ),
      addLabel: parseString(
        nested?['add_label'] ??
            nested?['addLabel'] ??
            rootMap['add_row_label'] ??
            rootMap['addRowLabel'] ??
            rootMap['add_label'],
        'Add row',
      ),
      emptyMessage: parseString(
        nested?['empty_message'] ??
            nested?['emptyMessage'] ??
            rootMap['empty_message'] ??
            rootMap['emptyMessage'],
        'No rows added yet.',
      ),
    );
  }

  Map<String, dynamic> toMap() => {
        'allow_add': allowAdd,
        'allow_delete': allowDelete,
        'add_label': addLabel,
        'empty_message': emptyMessage,
      };
}

/// Defines a single column / field inside [ComponentFieldArray].
class FieldArrayColumn {
  final String header;
  final String body;
  final double? width;
  final Component? component;

  const FieldArrayColumn({
    required this.header,
    required this.body,
    this.width,
    this.component,
  });

  factory FieldArrayColumn.fromMap(Map<String, dynamic> json, int index) {
    final header = (json['header'] ?? json['label'] ?? '').toString().trim();
    final body = (json['body'] ?? json['field'] ?? json['key'] ?? '')
        .toString()
        .trim();

    Component? parsedComponent;
    final rawComponent = json['component'];
    if (rawComponent is Map) {
      final compMap = Map<String, dynamic>.from(rawComponent);
      // Auto-default component id and label from column metadata to avoid
      // redundant boilerplate in JSON configs.
      if (compMap['id'] == null || compMap['id'].toString().trim().isEmpty) {
        compMap['id'] = body.isNotEmpty ? body : 'col_$index';
      }
      if ((compMap['label'] == null ||
              compMap['label'].toString().trim().isEmpty) &&
          header.isNotEmpty) {
        compMap['label'] = header;
      }
      parsedComponent = Component.fromMap(compMap);
    }

    return FieldArrayColumn(
      header: header,
      body: body,
      width: (json['width'] as num?)?.toDouble(),
      component: parsedComponent,
    );
  }

  Map<String, dynamic> toMap() => {
        'header': header,
        'body': body,
        if (width != null) 'width': width,
        if (component != null) 'component': component!.toMap(),
      };
}

/// First-class repeatable form array component (`type: "field_array"`).
///
/// Designed for master-detail child rows inside forms and `multi_forms` wizards:
/// - Exposes its value as a native `List<Map<String, dynamic>>` in `form.<id>`
/// - Integrates natively with Flutter [FormState] validation (collection-level
///   constraints such as `min_rows`, `max_rows`, `unique_by`, plus per-cell
///   input validators)
/// - Supports both `"table"` and `"card"` presentations
/// - Automatically respects read-only / `view` form modes
class ComponentFieldArray extends Component {
  ComponentFieldArray({
    required super.id,
    required this.columns,
    this.label = '',
    this.presentation = FieldArrayPresentation.table,
    this.constraints = const FieldArrayConstraints(),
    this.rowActions = const FieldArrayRowActions(),
    this.defaultRow,
    this.initialValue,
    this.referenceId,
    this.readOnly = false,
    this.enabled = true,
    this.width,
    this.widthMode,
    this.flex,
    this.rowHeight,
    super.visibilityCondition,
    super.events = const {},
  }) : super(type: componentId);

  static String get componentId => 'field_array';

  final String label;
  final List<FieldArrayColumn> columns;
  final FieldArrayPresentation presentation;
  final FieldArrayConstraints constraints;
  final FieldArrayRowActions rowActions;
  final Map<String, dynamic>? defaultRow;
  final dynamic initialValue;
  final String? referenceId;
  final bool readOnly;
  final bool enabled;
  final double? width;
  final ComponentSizeMode? widthMode;
  final int? flex;
  final double? rowHeight;

  factory ComponentFieldArray.empty(String id) {
    return ComponentFieldArray(
      id: id,
      columns: const [],
      presentation: FieldArrayPresentation.table,
    );
  }

  factory ComponentFieldArray.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }

    final rawColumns = (map['columns'] ?? map['fields']) as List? ?? const [];
    final columns = <FieldArrayColumn>[];
    for (var i = 0; i < rawColumns.length; i++) {
      final entry = rawColumns[i];
      if (entry is Map) {
        columns.add(
          FieldArrayColumn.fromMap(Map<String, dynamic>.from(entry), i),
        );
      }
    }

    final rawConstraints = map['constraints'] is Map
        ? Map<String, dynamic>.from(map['constraints'] as Map)
        : null;
    final rawRowActions = (map['row_actions'] ?? map['rowActions']) is Map
        ? Map<String, dynamic>.from(
            (map['row_actions'] ?? map['rowActions']) as Map,
          )
        : null;
    final rawDefaultRow = (map['default_row'] ?? map['defaultRow']) is Map
        ? Map<String, dynamic>.from(
            (map['default_row'] ?? map['defaultRow']) as Map,
          )
        : null;

    return ComponentFieldArray(
      id: id,
      label: map['label']?.toString().trim() ?? '',
      columns: columns,
      presentation: FieldArrayPresentation.fromString(
        map['presentation']?.toString(),
      ),
      constraints: FieldArrayConstraints.fromMap(rawConstraints, map),
      rowActions: FieldArrayRowActions.fromMap(rawRowActions, map),
      defaultRow: rawDefaultRow,
      initialValue:
          map['initial_value'] ?? map['initialValue'] ?? map['data'],
      referenceId: map['reference_id']?.toString(),
      readOnly: map['read_only'] == true || map['readOnly'] == true,
      enabled: map['enabled'] != false,
      width: (map['width'] as num?)?.toDouble(),
      widthMode: ComponentSizeMode.fromString(map['widthMode']?.toString()),
      flex: int.tryParse(map['flex']?.toString() ?? ''),
      rowHeight: ((map['row_height'] ?? map['rowHeight']) as num?)?.toDouble(),
      visibilityCondition: map['visibilityCondition']?.toString(),
      events: map['events'] is Map
          ? Map<String, dynamic>.from(map['events'] as Map)
          : const {},
    );
  }

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        if (label.isNotEmpty) 'label': label,
        'presentation': presentation.name,
        'columns': columns.map((c) => c.toMap()).toList(growable: false),
        'constraints': constraints.toMap(),
        'row_actions': rowActions.toMap(),
        if (defaultRow != null) 'default_row': defaultRow,
        if (initialValue != null) 'initial_value': initialValue,
        if (referenceId != null) 'reference_id': referenceId,
        'read_only': readOnly,
        'enabled': enabled,
        if (width != null) 'width': width,
        if (widthMode != null) 'widthMode': widthMode!.name,
        if (flex != null) 'flex': flex,
        if (rowHeight != null) 'row_height': rowHeight,
      };
}
