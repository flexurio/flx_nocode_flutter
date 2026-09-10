import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
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
    final layoutFormId = contextData['layoutFormId'];
    if (layoutFormId != null) {
      final pageCtrl = Get.isRegistered<CreatePageController>(tag: 'create_page_$layoutFormId')
          ? Get.find<CreatePageController>(tag: 'create_page_$layoutFormId')
          : null;
      if (pageCtrl != null) {
        pageCtrl.tableReloadListeners[component.id] = () =>
            loadData(isRefresh: component.reloadWithRefresh);
      }
    }
    loadData();
  }

  @override
  void onClose() {
    final layoutFormId = contextData['layoutFormId'];
    if (layoutFormId != null) {
      final pageCtrl = Get.isRegistered<CreatePageController>(tag: 'create_page_$layoutFormId')
          ? Get.find<CreatePageController>(tag: 'create_page_$layoutFormId')
          : null;
      pageCtrl?.tableReloadListeners.remove(component.id);
    }
    super.onClose();
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

  /// Builds a context map merged with live text values from all managed controllers.
  JsonMap _buildEffectiveContext() {
    final effectiveContext = Map<String, dynamic>.from(contextData);
    final layoutFormId = (contextData['rootLayoutFormId'] ?? contextData['layoutFormId']) as String?;
    if (layoutFormId != null) {
      final tag = 'create_page_$layoutFormId';
      if (Get.isRegistered<CreatePageController>(tag: tag)) {
        final pageCtrl = Get.find<CreatePageController>(tag: tag);
        effectiveContext.addAll(pageCtrl.initialData);
      } else if (Get.isRegistered<CreatePageController>()) {
        final pageCtrl = Get.find<CreatePageController>();
        effectiveContext.addAll(pageCtrl.initialData);
      }
    } else if (Get.isRegistered<CreatePageController>()) {
      final pageCtrl = Get.find<CreatePageController>();
      effectiveContext.addAll(pageCtrl.initialData);
    }

    final allControllers = (contextData['allControllers'] as Map?)
        ?.cast<String, TextEditingController>();
    if (allControllers != null) {
      final controllerValues = <String, dynamic>{};
      for (final entry in allControllers.entries) {
        controllerValues[entry.key] = entry.value.text;
      }
      effectiveContext.addAll(controllerValues);
      final formMap = effectiveContext['form'];
      if (formMap is Map) {
        effectiveContext['form'] = {
          ...Map<String, dynamic>.from(formMap),
          ...controllerValues,
        };
      } else {
        effectiveContext['form'] = controllerValues;
      }
    }
    return effectiveContext;
  }

  Future<void> loadData({bool isRefresh = false}) async {
    try {
      isLoading.value = true;
      error.value = null;

      final effectiveContext = _buildEffectiveContext();

      // 1. Resolve local data from referenceId or initialValue when not refreshing
      dynamic localData;
      if (!isRefresh) {
        if (component.referenceId != null && component.referenceId!.isNotEmpty) {
          localData = effectiveContext[component.referenceId];
        }

        // If no referenceId or it yielded null, try initial_value
        if (localData == null && component.initial_value != null) {
          final rawInitial = component.initial_value;
          if (rawInitial is String) {
            final resolved = rawInitial.interpolateJavascript(effectiveContext);
            try {
              localData = jsonDecode(resolved);
            } catch (_) {
              localData = resolved;
            }
          } else {
            localData = rawInitial;
          }
        }
      }

      if (!isRefresh && localData != null) {
        if (localData is String && localData.isNotEmpty) {
          try {
            final decoded = jsonDecode(localData);
            if (decoded is List) {
              rows.value = _parseRows(decoded);
              isLoading.value = false;
              if (component.referenceId != null && component.referenceId!.isNotEmpty) {
                contextData[component.referenceId!] = decoded;
              }
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
          if (component.referenceId != null && component.referenceId!.isNotEmpty) {
            contextData[component.referenceId!] = localData;
          }
          notifyChanged();
          return;
        }
      }

      final httpData = component.http;
      if (httpData.url.isEmpty) {
        rows.value = [];
        isLoading.value = false;
        if (isRefresh && component.reloadWithRefresh) {
          _resetPageInputsOnRefresh();
        }
        notifyChanged();
        return;
      }

      final executor = Get.isRegistered<HttpRequestExecutor>()
          ? Get.find<HttpRequestExecutor>()
          : null;

      final result = await httpData.execute(effectiveContext, executor: executor);

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

      // When pure refresh is clicked, reset editable inputs only if requested by reloadWithRefresh
      if (isRefresh && component.reloadWithRefresh) {
        _resetPageInputsOnRefresh();
      }

      notifyChanged();
    } catch (e) {
      debugPrint('[ComponentTableController] Error: $e');
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  /// Resets user-editable form inputs to their initial states on table refresh.
  void _resetPageInputsOnRefresh() {
    try {
      final layoutFormId = (contextData['rootLayoutFormId'] ?? contextData['layoutFormId']) as String?;
      if (layoutFormId == null) return;
      final tag = 'create_page_$layoutFormId';
      if (!Get.isRegistered<CreatePageController>(tag: tag)) return;

      final pageCtrl = Get.find<CreatePageController>(tag: tag);
      final targetRefId = component.referenceId ?? component.id;

      for (final comp in pageCtrl.layoutForm.allComponents) {
        // Skip disabled/read-only components
        if (comp is ComponentInputBase && !comp.enabled) continue;
        // Skip hidden context components (e.g. visibilityCondition: "false")
        if (comp.visibilityCondition == 'false' || comp.visibilityCondition == false) {
          // If it's the 'is_adding' flag, reset it to 'false' to close any open add form
          if (comp.id == 'is_adding') {
            pageCtrl.controllers['is_adding']?.text = 'false';
            pageCtrl.initialData['is_adding'] = 'false';
          }
          continue;
        }
        // Skip the table itself and its target variable
        if (comp.id == component.id || comp.id == targetRefId) continue;
        // Skip components that this table depends on
        if (component.dependsOn.contains(comp.id)) continue;
        // Skip components whose values originated from the page record (initialDataInput)
        if (pageCtrl.initialDataInput?.containsKey(comp.id) == true) continue;

        final ctrl = pageCtrl.controllers[comp.id];
        if (ctrl != null) {
          String initial = '';
          if (comp is ComponentTextField) {
            initial = comp.initialValue ?? '';
          } else if (comp is ComponentNumberField) {
            initial = comp.initialValue ?? '';
          }
          if (initial.contains('{{')) {
            try {
              initial = initial.interpolateJavascript(contextData);
            } catch (_) {}
          }
          ctrl.text = initial;
          pageCtrl.initialData[comp.id] = initial;
        }
      }
      pageCtrl.initialData.refresh();
    } catch (e) {
      debugPrint('[ComponentTableController] _resetPageInputsOnRefresh error: $e');
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
      CreatePageController? pageController;
      if (layoutFormId != null) {
        final tagPage = 'create_page_$layoutFormId';
        if (Get.isRegistered<CreatePageController>(tag: tagPage)) {
          pageController = Get.find<CreatePageController>(tag: tagPage);
        }
      }
      if (pageController == null && Get.isRegistered<CreatePageController>()) {
        pageController = Get.find<CreatePageController>();
      }

      if (pageController != null) {
        final currentInitialVal = pageController.initialData[targetId];
        final currentRowsJson = jsonEncode(rows);
        final currentInitialValJson = jsonEncode(currentInitialVal);
        if (currentInitialValJson != currentRowsJson) {
          pageController.initialData[targetId] = jsonDecode(currentRowsJson);
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
