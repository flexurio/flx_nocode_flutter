import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentTable extends Component {
  ComponentTable({
    required this.columns,
    required super.id,
    required this.http,
  }) : super(type: 'table');

  final HttpData http;
  final List<TColumn> columns;

  factory ComponentTable.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }

    final List<Map<String, dynamic>> columnsMap =
        map['columns'] as List<Map<String, dynamic>>? ?? [];
    final columns = columnsMap.map((e) => TColumn.fromJson(e)).toList();

    return ComponentTable(
      id: id,
      columns: columns,
      http: HttpData.fromJson(map['http'] as Map<String, dynamic>),
    );
  }

  @override
  JsonMap toMap() => {
        'id': id,
        'type': type,
      };
}

class TColumn {
  final String header;
  final String body;

  TColumn({
    required this.header,
    required this.body,
  });

  factory TColumn.fromJson(Map<String, dynamic> json) {
    return TColumn(
      header: json['header']?.toString().trim() ?? '',
      body: json['body']?.toString().trim() ?? '',
    );
  }
}
