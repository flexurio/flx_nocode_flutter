import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component_list_view.dart';
import 'package:flx_nocode_flutter/features/component/models/component_size_mode.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_list_view_controller.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

extension ComponentListViewWidgets on ComponentListView {
  Widget toWidget(JsonMap data) {
    return _ComponentListViewWidget(component: this, data: data);
  }

  Widget toMockWidget() {
    return _sized(
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          2,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: index == 0 ? gap : 0),
            child: item?.toMockWidget() ??
                const Text('List item', style: TextStyle(fontSize: 13)),
          ),
        ),
      ),
    );
  }

  Widget _sized(Widget child) {
    double? effectiveWidth = width;
    if (widthMode == ComponentSizeMode.fill) effectiveWidth = double.infinity;
    if (widthMode == ComponentSizeMode.hug) effectiveWidth = null;

    double? effectiveHeight = height;
    if (heightMode == ComponentSizeMode.fill) effectiveHeight = double.infinity;
    if (heightMode == ComponentSizeMode.hug) effectiveHeight = null;

    return SizedBox(
      width: effectiveWidth,
      height: effectiveHeight,
      child: child,
    );
  }
}

class _ComponentListViewWidget extends StatefulWidget {
  const _ComponentListViewWidget({
    required this.component,
    required this.data,
  });

  final ComponentListView component;
  final JsonMap data;

  @override
  State<_ComponentListViewWidget> createState() =>
      _ComponentListViewWidgetState();
}

class _ComponentListViewWidgetState extends State<_ComponentListViewWidget> {
  late final String tag;
  late final ComponentListViewController controller;

  @override
  void initState() {
    super.initState();
    tag = 'list_view_${widget.component.id}_${identityHashCode(this)}';
    controller = Get.put(
      ComponentListViewController(
        component: widget.component,
        contextData: widget.data,
      ),
      tag: tag,
    );
  }

  @override
  void dispose() {
    Get.delete<ComponentListViewController>(tag: tag);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _ComponentListViewWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) {
      controller.updateContextData(widget.data);
      if (_shouldReload(oldWidget.data, widget.data)) {
        controller.loadData();
      }
    }
  }

  bool _shouldReload(JsonMap oldData, JsonMap newData) {
    if (widget.component.dependsOn.isEmpty) return false;

    for (final depId in widget.component.dependsOn) {
      if (_getValue(oldData, depId) != _getValue(newData, depId)) {
        return true;
      }
    }

    return false;
  }

  dynamic _getValue(JsonMap data, String id) {
    final value = data[id];
    if (value is TextEditingController) return value.text;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return widget.component._sized(
          const Center(child: CircularProgressIndicator()),
        );
      }

      final rows = controller.rows;
      final list = _buildList(rows);

      if (controller.error.value != null) {
        return widget.component._sized(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Tooltip(
                message: 'Failed to load data: ${controller.error.value}',
                child: Icon(
                  Icons.error,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              const Gap(8),
              list,
            ],
          ),
        );
      }

      return widget.component._sized(list);
    });
  }

  Widget _buildList(List<JsonMap> rows) {
    if (rows.isEmpty) {
      return Text(widget.component.emptyText);
    }

    final shouldShrinkWrap = widget.component.height == null &&
        widget.component.heightMode != ComponentSizeMode.fill;

    return ListView.separated(
      shrinkWrap: shouldShrinkWrap,
      physics: shouldShrinkWrap ? const NeverScrollableScrollPhysics() : null,
      itemCount: rows.length,
      separatorBuilder: (_, __) => Gap(widget.component.gap),
      itemBuilder: (_, index) {
        final row = rows[index];
        final rowData = {
          ...widget.data,
          ...row,
          'current': row,
          'row': row,
          'data': row,
          'index': index,
          '_on_success_callback': controller.loadData,
        };

        return widget.component.item?.toWidget(data: rowData) ??
            Text(row.toString());
      },
    );
  }
}
