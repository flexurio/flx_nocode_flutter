import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart' hide TColumn;
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:flx_nocode_flutter/features/component/models/component_table.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/util/string.dart';

extension ComponentTableWidgets on ComponentTable {
  Widget toWidget(JsonMap data) {
    return _ComponentTableHttpWidget(component: this, data: data);
  }
}

class _ComponentTableHttpWidget extends StatefulWidget {
  const _ComponentTableHttpWidget({
    required this.component,
    required this.data,
  });

  final ComponentTable component;
  final JsonMap data;

  @override
  State<_ComponentTableHttpWidget> createState() =>
      _ComponentTableHttpWidgetState();
}

class _ComponentTableHttpWidgetState extends State<_ComponentTableHttpWidget> {
  late Future<List<JsonMap>> _future;

  @override
  void initState() {
    super.initState();
    _future = _loadData(widget.data);
  }

  Future<List<JsonMap>> _loadData(JsonMap item) async {
    final httpData = widget.component.http;
    final result = await httpData.execute(item);

    if (!result.isSuccess) {
      throw Exception(result.message ?? 'Request failed');
    }

    final data = result.data;

    if (data is List) {
      return data
          .where((e) => e is Map)
          .map<JsonMap>((e) => Map<String, dynamic>.from(e as Map))
          .toList();
    }

    if (data is Map) {
      final map = Map<String, dynamic>.from(data);
      final inner = map['data'];
      if (inner is List) {
        return inner
            .where((e) => e is Map)
            .map<JsonMap>((e) => Map<String, dynamic>.from(e as Map))
            .toList();
      }
    }

    return const <JsonMap>[];
  }

  String _buildCellText(JsonMap row, TColumn column) {
    final key = column.body;

    // simple mode: body = nama field di row
    if (row.containsKey(key)) {
      final v = row[key];
      return v?.toString() ?? '';
    }

    // fallback: tampilkan apa adanya
    return key;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<JsonMap>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('Failed to load data: ${snapshot.error}'),
          );
        }

        final rows = snapshot.data ?? const <JsonMap>[];

        return YuhuTable<JsonMap>(
          data: rows,
          columns: widget.component.columns.map((c) {
            return TableColumn<JsonMap>(
              title: c.header,
              builder: (row, index) {
                final text = _buildCellText(row, c);
                return Text(
                  text.interpolateJavascript(
                    {
                      "current": widget.data,
                      "row": row,
                    },
                  ),
                );
              },
            );
          }).toList(),
        );
      },
    );
  }
}
