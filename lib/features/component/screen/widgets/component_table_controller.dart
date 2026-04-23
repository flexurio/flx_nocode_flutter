import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/shared/services/http_request_executor.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';

class ComponentTableController extends GetxController {
  final ComponentTable component;
  JsonMap contextData;

  ComponentTableController({
    required this.component,
    required this.contextData,
  });

  /// Updates the context data from the parent widget.
  void updateContextData(JsonMap newData) {
    contextData = newData;
  }

  final rows = <JsonMap>[].obs;
  final isLoading = true.obs;
  final error = RxnString();

  /// Pre-built dummy entity for row actions
  late final EntityCustom tableEntity = component.dummyEntity.copyWith(
    bypassAllPermissions: contextData['bypassPermission'] == true,
  );

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  /// Robustly resolves a value from a row using dot notation or direct key.
  dynamic resolveValue(JsonMap row, String path) {
    if (path.isEmpty) return null;
    if (row.containsKey(path)) return row[path];

    final parts = path.split('.');
    dynamic current = row;
    for (final part in parts) {
      if (current is Map && current.containsKey(part)) {
        current = current[part];
      } else {
        return null;
      }
    }
    return current;
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;
      error.value = null;

      // 1. Check local data if referenceId is provided
      if (component.referenceId != null && component.referenceId!.isNotEmpty) {
        final localData = contextData[component.referenceId];
        if (localData is List) {
          rows.value = _parseRows(localData);
          isLoading.value = false;
          return;
        }
      }

      final httpData = component.http;
      if (httpData.url.isEmpty) {
        rows.value = [];
        isLoading.value = false;
        return;
      }

      final executor = Get.isRegistered<HttpRequestExecutor>()
          ? Get.find<HttpRequestExecutor>()
          : null;
      
      final result = await httpData.execute(contextData, executor: executor);

      if (!result.isSuccess) {
        error.value = result.message ?? 'Request failed';
        return;
      }

      final data = result.data;
      if (data is List) {
        rows.value = _parseRows(data);
      } else if (data is Map) {
        final map = Map<String, dynamic>.from(data);
        final inner = map['data'];
        rows.value = (inner is List) ? _parseRows(inner) : [map];
      } else {
        rows.value = const <JsonMap>[];
      }
    } catch (e) {
      debugPrint('[ComponentTableController] Error: $e');
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  List<JsonMap> _parseRows(List data) {
    return data
        .whereType<Map>()
        .map<JsonMap>((e) => Map<String, dynamic>.from(e))
        .toList();
  }
}
