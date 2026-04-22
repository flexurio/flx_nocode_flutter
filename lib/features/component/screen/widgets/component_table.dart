import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart' hide TColumn;
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action_widget_extension.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:get/get.dart';
import 'component_table_controller.dart';

extension ComponentTableWidgets on ComponentTable {
  Widget toWidget(JsonMap data) {
    return _ComponentTableWidget(component: this, data: data);
  }

  Widget toMockWidget() {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: columns.isEmpty
                  ? [
                      const Text('No Columns',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600))
                    ]
                  : columns
                      .map((c) => Expanded(
                            flex: (c.width ?? 100).toInt(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                c.header,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
            ),
          ),
          // Placeholder Rows
          for (var i = 0; i < 2; i++)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
              decoration: BoxDecoration(
                border: i == 0
                    ? Border(bottom: BorderSide(color: Colors.grey.shade100))
                    : null,
              ),
              child: Row(
                children: columns.isEmpty
                    ? [const Text('-', style: TextStyle(fontSize: 12))]
                    : columns
                        .map((c) => Expanded(
                              flex: (c.width ?? 100).toInt(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: c.component != null
                                    ? c.component!.toMockWidget()
                                    : Text(
                                        'Data ${i + 1}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                              ),
                            ))
                        .toList(),
              ),
            ),
        ],
      ),
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


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      final rows = controller.rows;

      // Optimize: prepare the current data once per build
      final currentData = widget.data.map((key, value) {
        if (value is TextEditingController) {
          return MapEntry(key, value.text);
        }
        return MapEntry(key, value);
      });

      var tableColumns = widget.component.columns.map((c) {
        return TableColumn<JsonMap>(
          title: c.header,
          width: c.width,
          builder: (row, index) {
            if (c.component != null) {
              return c.component!.toWidget(
                isSmall: true,
                data: {
                  ...widget.data,
                  "current": row,
                  "row": row,
                },
              );
            }

            final rawValue = controller.resolveValue(row, c.body);
            final text = rawValue?.toString() ?? c.body;

            return Text(
              text.interpolateJavascript({
                "current": currentData,
                "row": row,
              }),
            );
          },
        );
      }).toList();

      if (widget.component.actions.isNotEmpty) {
        final parentDataRaw = widget.data['parentData'];
        final List<Map<String, dynamic>> parentData = parentDataRaw is List
            ? parentDataRaw.cast<Map<String, dynamic>>()
            : [];

        tableColumns.add(
          TableColumn<JsonMap>(
            title: widget.component.actionsColumnTitle,
            width: 150,
            builder: (row, index) {
              return ActionsButton(
                children: widget.component.actions.buildButtonsSingleRow(
                  entity: controller.tableEntity,
                  context: context,
                  data: row,
                  parentData: parentData,
                  onSuccessCallback: () => controller.loadData(),
                ),
              );
            },
          ),
        );
      }

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
