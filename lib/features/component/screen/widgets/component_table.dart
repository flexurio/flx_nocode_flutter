import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart' hide TColumn;
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:get/get.dart';
import 'component_table_controller.dart';

extension ComponentTableWidgets on ComponentTable {
  Widget toWidget(JsonMap data) {
    return _ComponentTableWidget(component: this, data: data);
  }

  Widget toMockWidget() {
    var tableColumns = columns.map((c) {
      return TableColumn<JsonMap>(
        title: c.header,
        width: c.width,
        builder: (row, index) {
          return Text(row[c.body]?.toString() ?? '-');
        },
      );
    }).toList();

    if (tableColumns.isEmpty) {
      tableColumns = [
        TableColumn<JsonMap>(
          title: 'No Columns',
          width: 200,
          builder: (_, __) => const Text('-'),
        ),
      ];
    }

    return YuhuTable<JsonMap>(
      width: width,
      data: [
        for (var i = 0; i < 3; i++)
          {
            for (var col in columns) col.body: 'Data ${i + 1}',
          },
      ],
      columns: tableColumns,
    );
  }
}

class _ComponentTableWidget extends StatefulWidget {
  const _ComponentTableWidget({
    required this.component,
    required this.data,
  });

  final ComponentTable component;
  final JsonMap data;

  @override
  State<_ComponentTableWidget> createState() => _ComponentTableWidgetState();
}

class _ComponentTableWidgetState extends State<_ComponentTableWidget> {
  late String tag;
  late ComponentTableController controller;

  @override
  void initState() {
    super.initState();
    tag = 'table_${widget.component.id}_${identityHashCode(this)}';
    controller = Get.put(
      ComponentTableController(
        component: widget.component,
        contextData: widget.data,
      ),
      tag: tag,
    );
  }

  @override
  void dispose() {
    Get.delete<ComponentTableController>(tag: tag);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _ComponentTableWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) {
      controller.updateContextData(widget.data);
      controller.loadData();
    }
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
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      final rows = controller.rows;

      var tableColumns = widget.component.columns.map((c) {
        return TableColumn<JsonMap>(
          title: c.header,
          width: c.width,
          builder: (row, index) {
            final text = _buildCellText(row, c);
            return Text(
              text.interpolateJavascript({
                "current": widget.data.map((key, value) {
                  if (value is TextEditingController) {
                    return MapEntry(key, value.text);
                  }
                  return MapEntry(key, value);
                }),
                "row": row,
              }),
            );
          },
        );
      }).toList();

      if (tableColumns.isEmpty) {
        tableColumns = [
          TableColumn<JsonMap>(
            title: 'No Columns',
            width: 200,
            builder: (_, __) => const Text('-'),
          ),
        ];
      }

      final table = YuhuTable<JsonMap>(
        width: widget.component.width,
        data: rows,
        columns: tableColumns,
      );

      if (controller.error.value != null) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Tooltip(
                message: 'Failed to load data: ${controller.error.value}',
                child: Icon(
                  Icons.error,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
            table,
          ],
        );
      }

      return table;
    });
  }
}
