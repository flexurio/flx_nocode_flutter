import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:get/get.dart';
import 'component_bar_chart_controller.dart';

extension ComponentBarChartWidgets on ComponentBarChart {
  Widget toWidget({required JsonMap data}) {
    return _ComponentBarChartWidget(component: this, data: data);
  }

  Widget toMockWidget() {
    return Container(
      width: width ?? 300,
      height: height ?? 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.bar_chart, size: 48, color: Colors.orange),
            SizedBox(height: 8),
            Text('Bar Chart Mock', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class _ComponentBarChartWidget extends StatefulWidget {
  const _ComponentBarChartWidget({
    required this.component,
    required this.data,
  });

  final ComponentBarChart component;
  final JsonMap data;

  @override
  State<_ComponentBarChartWidget> createState() => _ComponentBarChartWidgetState();
}

class _ComponentBarChartWidgetState extends State<_ComponentBarChartWidget> {
  late String tag;
  late ComponentBarChartController controller;

  @override
  void initState() {
    super.initState();
    tag = 'bar_chart_${widget.component.id}_${identityHashCode(this)}';
    controller = Get.put(
      ComponentBarChartController(
        component: widget.component,
        contextData: widget.data,
      ),
      tag: tag,
    );
  }

  @override
  void dispose() {
    Get.delete<ComponentBarChartController>(tag: tag);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _ComponentBarChartWidget oldWidget) {
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
        return SizedBox(
          width: widget.component.width ?? 300,
          height: widget.component.height ?? 300,
          child: const Center(child: CircularProgressIndicator()),
        );
      }

      if (controller.error.value != null) {
        return Container(
          width: widget.component.width ?? 300,
          height: widget.component.height ?? 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, color: Colors.red),
                const SizedBox(height: 8),
                Text(
                  'Error loading chart: ${controller.error.value}',
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () => controller.loadData(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        );
      }

      return SizedBox(
        width: widget.component.width,
        height: widget.component.height,
        child: FlxBarChart(
          title: widget.component.title,
          dataSource: controller.chartData,
        ),
      );
    });
  }
}
