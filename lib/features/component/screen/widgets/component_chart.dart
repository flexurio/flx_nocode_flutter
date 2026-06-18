import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:get/get.dart';
import 'component_chart_controller.dart';

extension ComponentGenericChartWidgets on ComponentGenericChart {
  Widget toWidget({required JsonMap data}) {
    return _ComponentGenericChartWidget(component: this, data: data);
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
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.bar_chart, size: 48, color: Colors.blue),
            const SizedBox(height: 8),
            Text('Generic Chart Mock ($chartType)',
                style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class ComponentGenericChartController extends ComponentChartController {
  ComponentGenericChartController({
    required super.component,
    required super.contextData,
  });
}

class _ComponentGenericChartWidget extends StatefulWidget {
  const _ComponentGenericChartWidget({
    required this.component,
    required this.data,
  });

  final ComponentGenericChart component;
  final JsonMap data;

  @override
  State<_ComponentGenericChartWidget> createState() =>
      _ComponentGenericChartWidgetState();
}

class _ComponentGenericChartWidgetState extends State<_ComponentGenericChartWidget> {
  late String tag;
  late ComponentGenericChartController controller;

  @override
  void initState() {
    super.initState();
    tag = 'generic_chart_${widget.component.id}_${identityHashCode(this)}';
    controller = Get.put(
      ComponentGenericChartController(
        component: widget.component,
        contextData: widget.data,
      ),
      tag: tag,
    );
  }

  @override
  void dispose() {
    Get.delete<ComponentGenericChartController>(tag: tag);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _ComponentGenericChartWidget oldWidget) {
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

      Widget chartWidget;
      switch (widget.component.chartType.toLowerCase()) {
        case 'pie':
          chartWidget = FlxPieChart(
            title: widget.component.title,
            dataSource: controller.chartData,
          );
          break;
        case 'donut':
          chartWidget = FlxDonutChart(
            title: widget.component.title,
            dataSource: controller.chartData,
          );
          break;
        case 'bar':
        default:
          chartWidget = FlxBarChart(
            title: widget.component.title,
            dataSource: controller.chartData,
            isHorizontal: widget.component.isHorizontal,
          );
          break;
      }

      return SizedBox(
        width: widget.component.width,
        height: widget.component.height,
        child: chartWidget,
      );
    });
  }
}
