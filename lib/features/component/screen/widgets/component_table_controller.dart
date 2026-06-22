import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/shared/services/http_request_executor.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';

import 'package:flx_nocode_flutter/features/layout_form/screen/controllers/create_page_controller.dart';

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

  /// Pre-built entity context for row actions.
  ///
  /// Component tables render actions with a table-specific dummy entity id, but
  /// those actions still need the parent entity's layout forms and permission
  /// bypass setting to open configured forms from nested detail pages.
  late final EntityCustom tableEntity = _buildTableEntity();

  EntityCustom _buildTableEntity() {
    final parentEntity = contextData['entity'];
    if (parentEntity is EntityCustom) {
      return component.dummyEntity.copyWith(
        layoutForm: parentEntity.layoutForm,
        layoutPrint: parentEntity.layoutPrint,
        bypassAllPermissions: contextData['bypassPermission'] == true ||
            parentEntity.bypassAllPermissions,
      );
    }

    return component.dummyEntity.copyWith(
      bypassAllPermissions: contextData['bypassPermission'] == true,
    );
  }

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

      // 1. Resolve local data from referenceId or initialValue
      dynamic localData;
      if (component.referenceId != null && component.referenceId!.isNotEmpty) {
        localData = contextData[component.referenceId];
      }

      // If no referenceId or it yielded null, try initial_value
      if (localData == null && component.initial_value != null) {
        final rawInitial = component.initial_value;
        if (rawInitial is String) {
          final resolved = rawInitial.interpolateJavascript(contextData);
          try {
            localData = jsonDecode(resolved);
          } catch (_) {
            localData = resolved;
          }
        } else {
          localData = rawInitial;
        }
      }

      if (localData != null) {
        if (localData is String && localData.isNotEmpty) {
          try {
            final decoded = jsonDecode(localData);
            if (decoded is List) {
              rows.value = _parseRows(decoded);
              isLoading.value = false;
              notifyChanged();
              return;
            }
          } catch (_) {
            // Not a JSON string, continue
          }
        }

        if (localData is List) {
          rows.value = _parseRows(localData);
          isLoading.value = false;
          notifyChanged();
          return;
        }
      }

      final httpData = component.http;
      if (httpData.url.isEmpty) {
        rows.value = [];
        isLoading.value = false;
        notifyChanged();
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
      notifyChanged();
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

  /// Serializes the current rows to JSON and updates the parent form controller.
  void notifyChanged() {
    try {
      final targetId = component.referenceId ?? component.id;
      final allControllers =
          contextData['allControllers'] as Map<String, dynamic>?;
      final parentControllers =
          allControllers?.cast<String, TextEditingController>();

      if (parentControllers != null &&
          parentControllers.containsKey(targetId)) {
        final jsonStr = jsonEncode(rows);
        final controller = parentControllers[targetId];
        if (controller != null && controller.text != jsonStr) {
          controller.text = jsonStr;
        }
      }

      final layoutFormId = (contextData['rootLayoutFormId'] ?? contextData['layoutFormId']) as String?;
      if (layoutFormId != null) {
        final tagPage = 'create_page_$layoutFormId';
        if (Get.isRegistered<CreatePageController>(tag: tagPage)) {
          final pageController = Get.find<CreatePageController>(tag: tagPage);
          final currentInitialVal = pageController.initialData[targetId];
          final currentRowsJson = jsonEncode(rows);
          final currentInitialValJson = jsonEncode(currentInitialVal);
          if (currentInitialValJson != currentRowsJson) {
            pageController.initialData[targetId] = jsonDecode(currentRowsJson);
          }
        }
      }
    } catch (e) {
      debugPrint('[ComponentTableController] notifyChanged error: $e');
    }
  }

  /// Updates a specific row and notifies the parent.
  void onRowChanged(int index, JsonMap newData) {
    if (index >= 0 && index < rows.length) {
      rows[index] = newData;
      notifyChanged();
    }
  }
}
