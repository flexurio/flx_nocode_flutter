import 'package:flx_nocode_flutter/features/component/models/component_table.dart';
import 'workflow_action.dart';

/// Exports data to a file.
class ExportAction extends WorkflowAction {
  final String format; // 'xlsx' | 'csv' | 'pdf'
  final List<TColumn> columns;
  final String? dataSource;
  final String? saveResultTo;

  ExportAction({
    required this.format,
    this.columns = const [],
    this.dataSource,
    this.saveResultTo,
  }) : super('export');

  factory ExportAction.fromMap(Map<String, dynamic> map) {
    return ExportAction(
      format: map['format'] ?? 'xlsx',
      columns: (map['columns'] as List?)
              ?.map((e) => TColumn.fromJson(Map<String, dynamic>.from(e)))
              .toList() ??
          const [],
      dataSource: map['data_source'] ?? map['dataSource'],
      saveResultTo: map['save_result_to'] ?? map['saveResultTo'],
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        'type': 'export',
        'format': format,
        'columns': columns
            .map((e) => {
                  'header': e.header,
                  'body': e.body,
                  'width': e.width,
                })
            .toList(),
        if (dataSource != null) 'data_source': dataSource,
        if (saveResultTo != null) 'save_result_to': saveResultTo,
      };
}
