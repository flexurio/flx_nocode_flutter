import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:get/get.dart';

class ComponentListViewController extends GetxController {
  final ComponentListView component;
  JsonMap contextData;

  ComponentListViewController({
    required this.component,
    required this.contextData,
  });

  final rows = <JsonMap>[].obs;
  final isLoading = true.obs;
  final error = RxnString();

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void updateContextData(JsonMap newData) {
    contextData = newData;
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;
      error.value = null;

      final localData = _resolveLocalData();
      if (localData != null) {
        final parsedRows = _rowsFromLocalData(localData);
        if (parsedRows != null) {
          rows.value = parsedRows;
          return;
        }
      }

      final httpData = component.http;
      if (httpData.url.isEmpty) {
        rows.value = const <JsonMap>[];
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
        rows.value = inner is List ? _parseRows(inner) : [map];
      } else {
        rows.value = const <JsonMap>[];
      }
    } catch (e) {
      debugPrint('[ComponentListViewController] Error: $e');
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  dynamic _resolveLocalData() {
    if (component.referenceId != null && component.referenceId!.isNotEmpty) {
      final localData = contextData[component.referenceId];
      if (localData != null) return localData;
    }

    final initialValue = component.initialValue;
    if (initialValue == null) return null;

    if (initialValue is String) {
      final resolved = initialValue.interpolateJavascript(contextData);
      try {
        return jsonDecode(resolved);
      } catch (_) {
        return resolved;
      }
    }

    return initialValue;
  }

  List<JsonMap>? _rowsFromLocalData(dynamic localData) {
    if (localData is List) return _parseRows(localData);

    if (localData is String && localData.isNotEmpty) {
      try {
        final decoded = jsonDecode(localData);
        if (decoded is List) return _parseRows(decoded);
      } catch (_) {
        return null;
      }
    }

    return null;
  }

  List<JsonMap> _parseRows(List data) {
    return data
        .whereType<Map>()
        .map<JsonMap>((e) => Map<String, dynamic>.from(e))
        .toList();
  }
}
