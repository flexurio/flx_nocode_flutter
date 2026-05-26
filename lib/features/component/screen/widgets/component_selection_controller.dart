import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/features/component/models/component_selection_base.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:flx_nocode_flutter/features/component/models/component_action.dart';

abstract class ComponentSelectionController<T extends ComponentSelectionBase>
    extends GetxController {
  final T component;
  JsonMap data;

  ComponentSelectionController({
    required this.component,
    required this.data,
  });

  void updateData(JsonMap newData) {
    final oldData = data;
    data = newData;

    if (component.dependsOn.isNotEmpty) {
      bool changed = false;
      final oldRow = oldData['data'] as Map?;
      final newRow = newData['data'] as Map?;

      for (final depId in component.dependsOn) {
        if (newRow != null && oldRow != null) {
          if (newRow[depId] != oldRow[depId]) {
            changed = true;
            break;
          }
        }
      }

      if (changed) {
        onDependencyChanged();
      }
    }
  }

  final options = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;
  final error = RxnString();

  TextEditingController? get targetController =>
      data['controller'] as TextEditingController? ??
      allControllers[component.id];

  Map<String, TextEditingController> get allControllers =>
      (data['allControllers'] as Map?)?.cast<String, TextEditingController>() ??
      const {};

  @override
  void onInit() {
    super.onInit();
    setupListeners();
    if (component.httpData != null && component.httpData!.url.isNotEmpty) {
      fetchOptions();
    } else {
      loadStaticOptions();
    }
  }

  @override
  void onClose() {
    removeListeners();
    super.onClose();
  }

  void setupListeners() {
    if (component.dependsOn.isEmpty) return;

    for (final depId in component.dependsOn) {
      final controller = allControllers[depId];
      if (controller != null) {
        controller.addListener(onDependencyChanged);
      }
    }
  }

  void removeListeners() {
    if (component.dependsOn.isEmpty) return;

    for (final depId in component.dependsOn) {
      final controller = allControllers[depId];
      if (controller != null) {
        controller.removeListener(onDependencyChanged);
      }
    }
  }

  void onDependencyChanged() {
    debugPrint(
        '[Nocode Selection] onDependencyChanged called for ${component.id}. Parent controllers state: ${allControllers.map((key, value) => MapEntry(key, value.text))}');
    resetSelection();
    updateTargetController('');
    if (component.httpData != null && component.httpData!.url.isNotEmpty) {
      fetchOptions();
    }
  }

  void resetSelection();

  void loadStaticOptions() {
    final staticOptions = component.options.isNotEmpty
        ? component.options
        : ['Option 1', 'Option 2'];
    options.value = staticOptions.map(_mapStaticOption).toList();

    setInitialValue();
  }

  Future<void> fetchOptions() async {
    if (component.httpData == null) return;

    try {
      isLoading.value = true;
      error.value = null;

      final requestData = prepareRequestData();
      final result = await component.httpData!.execute(requestData);

      if (result.isSuccess && result.data is Map) {
        final list = (result.data as Map)['data'] as List;
        final staticOptions = component.options
            .where((option) =>
                option is Map || (option is String && option.contains('|')))
            .map(_mapStaticOption);
        options.value = [
          ...staticOptions,
          ...list.map((item) => mapItemToOption(item, requestData)),
        ];
        setInitialValue();
      } else {
        error.value = 'Invalid data format';
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Map<String, dynamic> _mapStaticOption(dynamic option) {
    if (option is Map) {
      final item = Map<String, dynamic>.from(option);
      final key = (item['key'] ?? item['value'] ?? item['id'] ?? '').toString();
      final label = (item['label'] ?? item['text'] ?? key).toString();
      return {'key': key, 'label': label, 'item': item};
    }

    final optionText = option.toString();
    // Backward-compatible parser for the legacy key|label shorthand.
    final separatorIndex = optionText.indexOf('|');
    if (separatorIndex == -1) {
      return {'key': optionText, 'label': optionText, 'item': optionText};
    }

    final key = optionText.substring(0, separatorIndex);
    final label = optionText.substring(separatorIndex + 1);
    final item = {'id': key, 'label': label};
    return {'key': key, 'label': label, 'item': item};
  }

  JsonMap prepareRequestData() {
    final requestData = <String, dynamic>{};
    requestData.addAll(data);
    final state = data['data'] as Map?;
    if (state != null) {
      requestData.addAll(Map<String, dynamic>.from(state));
      requestData['data'] = state;
    }

    final controllerValues = <String, dynamic>{};
    for (final entry in allControllers.entries) {
      controllerValues[entry.key] = entry.value.text;
    }

    requestData.addAll(controllerValues);

    final formMap = requestData['form'];
    if (formMap is Map) {
      requestData['form'] = {
        ...formMap,
        ...controllerValues,
      };
    } else {
      requestData['form'] = controllerValues;
    }

    final currentMap = requestData['current'];
    if (currentMap is Map) {
      requestData['current'] = {
        ...currentMap,
        ...controllerValues,
      };
    } else {
      requestData['current'] = controllerValues;
    }

    final dataMap = requestData['data'];
    if (dataMap is Map) {
      requestData['data'] = {
        ...dataMap,
        ...controllerValues,
      };
    } else {
      requestData['data'] = controllerValues;
    }

    debugPrint(
        '[Nocode Selection] prepareRequestData for ${component.id}. form.account_bank_nip = ${requestData['form']?['account_bank_nip']}. Interpolated URL: ${component.httpData?.url.interpolateJavascript(requestData)}');
    return requestData;
  }

  Map<String, dynamic> mapItemToOption(dynamic item, JsonMap requestData) {
    final context = <String, dynamic>{
      'item': item,
      ...requestData,
    };

    String key = item.toString();
    String label = item.toString();

    if (component.optionKey != null && component.optionKey!.isNotEmpty) {
      key = resolveValue(item, component.optionKey!, context).toString();
    }

    if (component.optionLabel != null && component.optionLabel!.isNotEmpty) {
      label = resolveValue(item, component.optionLabel!, context).toString();
    }

    return {'key': key, 'label': label, 'item': item};
  }

  dynamic resolveValue(dynamic item, String path, JsonMap context) {
    if (path.isEmpty) return '';
    if (item is Map) {
      if (item.containsKey(path)) return item[path] ?? '';
      final parts = path.split('.');
      dynamic current = item;
      bool found = true;
      for (final part in parts) {
        if (current is Map && current.containsKey(part)) {
          current = current[part];
        } else {
          found = false;
          break;
        }
      }
      if (found) return current ?? '';
    }
    return path.interpolateJavascript(context);
  }

  void setInitialValue();

  void updateTargetController(String value) {
    safeUpdateController(targetController, value);
  }

  void safeUpdateController(TextEditingController? controller, String value) {
    if (controller == null || controller.text == value) return;
    final binding = WidgetsBinding.instance;
    if (binding.schedulerPhase == SchedulerPhase.idle) {
      controller.text = value;
    } else {
      binding.addPostFrameCallback((_) {
        if (controller.text != value) {
          controller.text = value;
        }
      });
    }
  }

  void handleActions(Map<String, dynamic>? selection) {
    // If we're inside a table, we should automatically update the row data
    // even if there are no explicit actions.
    final onRowChanged = data['onRowChanged'];
    if (onRowChanged is Function) {
      final hasUpdateRowAction =
          component.onChangeActions.any((a) => a.type == 'update_row');
      if (!hasUpdateRowAction) {
        final targetField = data['columnBody']?.toString() ?? component.id;
        final value = selection?['key']?.toString() ?? '';
        final row = Map<String, dynamic>.from(data['row'] as Map? ?? {});

        // Only notify if value actually changed to avoid infinite loops or redundant rebuilds
        if (row[targetField] != value) {
          row[targetField] = value;
          onRowChanged(row);
        }
      }
    }

    if (component.onChangeActions.isEmpty || selection == null) return;
    final context = buildActionContext(selection);
    for (final action in component.onChangeActions) {
      switch (action.type) {
        case 'set_value':
          handleSetValueAction(action, context);
          break;
        case 'update_row':
          handleUpdateRowAction(action, context, selection);
          break;
      }
    }
  }

  Map<String, dynamic> buildActionContext(Map<String, dynamic> selection) {
    final value = selection['key']?.toString() ?? '';
    final item = selection['item'];
    final requestData = prepareRequestData();
    return <String, dynamic>{
      ...selection,
      'item': item,
      'value': value,
      ...requestData,
    };
  }

  void handleSetValueAction(
      ComponentAction action, Map<String, dynamic> context) {
    final targetId = action.targetId;
    final targetCtrl = allControllers[targetId];
    if (targetCtrl != null) {
      final rawValue = action.value ?? '';
      final newValue = rawValue.interpolateJavascript(context);
      safeUpdateController(targetCtrl, newValue);
    }
  }

  void handleUpdateRowAction(ComponentAction action,
      Map<String, dynamic> context, Map<String, dynamic> selection) {
    final onRowChanged = data['onRowChanged'];
    if (onRowChanged is! Function) return;
    final row = Map<String, dynamic>.from(data['row'] as Map? ?? {});
    if (action.mappings != null && action.mappings!.isNotEmpty) {
      for (final entry in action.mappings!.entries) {
        final targetField = entry.key;
        final rawValue = entry.value;
        row[targetField] = rawValue.interpolateJavascript(context);
      }
    } else {
      final value = selection['key']?.toString() ?? '';
      final key = action.reference ?? component.id;
      row[key] = value;
    }
    onRowChanged(row);
  }
}
