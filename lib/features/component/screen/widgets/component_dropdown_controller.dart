import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/features/component/models/component_dropdown.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';

class ComponentDropdownController extends GetxController {
  final ComponentDropdown component;
  JsonMap data;

  ComponentDropdownController({
    required this.component,
    required this.data,
  });

  /// Updates the context data from the parent widget.
  void updateData(JsonMap newData) {
    data = newData;
  }

  final options = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;
  final error = RxnString();
  final selectedValue = RxnString();
  final displayedValue = Rxn<Map<String, dynamic>>();

  TextEditingController? get _targetController =>
      data['controller'] as TextEditingController? ??
      _allControllers[component.id];

  Map<String, TextEditingController> get _allControllers =>
      (data['allControllers'] as Map?)?.cast<String, TextEditingController>() ??
      const {};

  @override
  void onInit() {
    super.onInit();
    _setupListeners();
    if (component.httpData != null && component.httpData!.url.isNotEmpty) {
      fetchOptions();
    } else {
      _loadStaticOptions();
    }
  }

  @override
  void onClose() {
    _removeListeners();
    super.onClose();
  }

  void _setupListeners() {
    if (component.dependsOn.isEmpty) return;

    for (final depId in component.dependsOn) {
      final controller = _allControllers[depId];
      if (controller != null) {
        controller.addListener(_onDependencyChanged);
      }
    }
  }

  void _removeListeners() {
    if (component.dependsOn.isEmpty) return;

    for (final depId in component.dependsOn) {
      final controller = _allControllers[depId];
      if (controller != null) {
        controller.removeListener(_onDependencyChanged);
      }
    }
  }

  void _onDependencyChanged() {
    selectedValue.value = null;
    displayedValue.value = null;
    _updateTargetController('');
    if (component.httpData != null && component.httpData!.url.isNotEmpty) {
      fetchOptions();
    }
  }

  void _loadStaticOptions() {
    final staticOptions = component.options.isNotEmpty
        ? component.options
        : ['Option 1', 'Option 2'];
    options.value =
        staticOptions.map((opt) => {'key': opt, 'label': opt}).toList();

    _setInitialValue();
  }

  Future<void> fetchOptions() async {
    if (component.httpData == null) return;

    try {
      isLoading.value = true;
      error.value = null;

      final requestData = _prepareRequestData();
      final result = await component.httpData!.execute(requestData);

      if (result.isSuccess && result.data is Map) {
        final list = (result.data as Map)['data'] as List;
        options.value =
            list.map((item) => _mapItemToOption(item, requestData)).toList();
        _setInitialValue();
      } else {
        error.value = 'Invalid data format';
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  JsonMap _prepareRequestData() {
    final requestData = <String, dynamic>{};

    // 1. Start with values from state (if any) as a base
    final state = data['data'] as Map?;
    if (state != null) {
      requestData.addAll(Map<String, dynamic>.from(state));
    }

    // 2. Overlay current values from _allControllers to ensure freshness
    // This is crucial because dependency listeners might fire before the widget
    // receives the updated state via build updates.
    for (final entry in _allControllers.entries) {
      // Only overwrite if the controller has a value (or empty string)
      // This maps the controller text directly to the key.
      requestData[entry.key] = entry.value.text;
    }

    return requestData;
  }

  Map<String, dynamic> _mapItemToOption(dynamic item, JsonMap requestData) {
    final context = <String, dynamic>{
      'item': item,
      ...requestData,
    };

    String key = item.toString();
    String label = item.toString();

    if (component.optionKey != null && component.optionKey!.isNotEmpty) {
      key = component.optionKey!.interpolateJavascript(context);
    }

    if (component.optionLabel != null && component.optionLabel!.isNotEmpty) {
      label = component.optionLabel!.interpolateJavascript(context);
    }

    return {'key': key, 'label': label, 'item': item};
  }

  void _setInitialValue() {
    String iv = component.initialValue;
    final id = component.id;

    if (iv.isNotEmpty) {
      final before = iv;
      try {
        final dataPayload = data['data'];
        if (dataPayload is Map && dataPayload.containsKey(id)) {
          // If the field already has a value in the state, use it as the initial value
          // This handles the case where the component is rebuilt but should keep its current value
          final stateValue = dataPayload[id]?.toString();
          if (stateValue != null && stateValue.isNotEmpty) {
            iv = stateValue;
          }
        }

        if (iv.contains('{{')) {
          iv = iv.interpolateJavascript(data);
        }
      } catch (e) {
        debugPrint('[Dropdown Init: $id] Interpolation failed: $e');
      }

      debugPrint('[Dropdown Init: $id] Initial value: "$before" -> "$iv"');

      final initialOption = options.firstWhereOrNull((o) => o['key'] == iv);
      if (initialOption != null) {
        selectedValue.value = iv;
        displayedValue.value = initialOption;
        _updateTargetController(selectedValue.value!);
      }
    } else if (selectedValue.value != null) {
      final stillExists = options.any((o) => o['key'] == selectedValue.value);
      if (!stillExists) {
        selectedValue.value = null;
        displayedValue.value = null;
        _updateTargetController('');
      } else {
        displayedValue.value =
            options.firstWhere((o) => o['key'] == selectedValue.value);
      }
    } else if (options.isNotEmpty && component.httpData == null) {
      final firstKey = options.first['key'];
      selectedValue.value = firstKey;
      displayedValue.value = options.first;
      _updateTargetController(firstKey);
    }
  }

  void onSelectionChanged(Map<String, dynamic>? selection) {
    if (selection == null) {
      selectedValue.value = null;
      displayedValue.value = null;
      _updateTargetController('');
    } else {
      final key = selection['key']?.toString() ?? '';
      selectedValue.value = key;
      displayedValue.value = selection;
      _updateTargetController(key);
      _handleActions(selection);
    }
  }

  void _updateTargetController(String value) {
    _safeUpdateController(_targetController, value);
  }

  void _safeUpdateController(TextEditingController? controller, String value) {
    if (controller == null || controller.text == value) return;

    final binding = WidgetsBinding.instance;
    // If we are not in the middle of a frame, we can update immediately.
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

  void _handleActions(Map<String, dynamic> selection) {
    if (component.onChangeActions.isEmpty) return;

    final value = selection['key']?.toString() ?? '';
    final item = selection['item'];
    final requestData = _prepareRequestData();

    final context = <String, dynamic>{
      'item': item,
      'value': value,
      ...requestData,
    };

    for (final action in component.onChangeActions) {
      if (action.type == 'set_value') {
        final targetId = action.targetId;
        final targetController = _allControllers[targetId];
        if (targetController != null) {
          String rawValue = action.value ?? '';
          String newValue = rawValue;

          try {
            newValue = rawValue.interpolateJavascript(context);
          } catch (e) {
            debugPrint('Interpolation failed: $e');
          }
          _safeUpdateController(targetController, newValue);
        }
      }
    }
  }
}
