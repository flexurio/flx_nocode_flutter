import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_core_flutter/src/app/view/widget/chart.dart';
import 'package:flx_nocode_flutter/features/component/models/component_chart.dart';

abstract class ComponentChartController extends GetxController {
  final ComponentChart component;
  JsonMap contextData;

  ComponentChartController({
    required this.component,
    required this.contextData,
  });

  /// Updates the context data from the parent widget.
  void updateContextData(JsonMap newData) {
    contextData = newData;
  }

  final chartData = <ChartData>[].obs;
  final isLoading = true.obs;
  final error = RxnString();

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;
      error.value = null;

      List<JsonMap> rawRows = [];

      // 1. Check local data if referenceId is provided
      if (component.referenceId != null && component.referenceId!.isNotEmpty) {
        final localData = contextData[component.referenceId];
        if (localData is List) {
          rawRows = localData
              .where((e) => e is Map)
              .map<JsonMap>((e) => Map<String, dynamic>.from(e as Map))
              .toList();
        }
      }

      // 2. If no local data, check HTTP
      if (rawRows.isEmpty) {
        final httpData = component.http;
        if (httpData.url.isNotEmpty) {
          final result = await httpData.execute(contextData);

          if (!result.isSuccess) {
            error.value = result.message ?? 'Request failed';
            return;
          }

          final data = result.data;

          if (data is List) {
            rawRows = data
                .where((e) => e is Map)
                .map<JsonMap>((e) => Map<String, dynamic>.from(e as Map))
                .toList();
          } else if (data is Map) {
            final map = Map<String, dynamic>.from(data);
            final inner = map['data'];
            if (inner is List) {
              rawRows = inner
                  .where((e) => e is Map)
                  .map<JsonMap>((e) => Map<String, dynamic>.from(e as Map))
                  .toList();
            } else {
              rawRows = [map];
            }
          }
        }
      }

      const List<Color> palette = [
        Colors.blue,
        Colors.red,
        Colors.green,
        Colors.yellow,
        Colors.purple,
        Colors.orange,
        Colors.teal,
        Colors.pink,
        Colors.cyan,
        Colors.indigo,
      ];

      chartData.value = rawRows.asMap().entries.map((entry) {
        final index = entry.key;
        final row = entry.value;
        final label = row[component.labelKey]?.toString() ?? 'Unknown';
        final valueStr = row[component.valueKey]?.toString() ?? '0';
        final value = double.tryParse(valueStr) ?? 0.0;
        
        return ChartData(
          label: label,
          value: value,
          color: palette[index % palette.length],
        );
      }).toList();

    } catch (e) {
      debugPrint('--- ${component.type.toUpperCase()} HTTP Error ---');
      debugPrint(e.toString());
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
