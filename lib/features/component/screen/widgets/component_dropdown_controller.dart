import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/features/component/models/component_dropdown.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'component_selection_controller.dart';

class ComponentDropdownController extends ComponentSelectionController<ComponentDropdown> {
  ComponentDropdownController({
    required super.component,
    required super.data,
  });

  final selectedValue = RxnString();
  final displayedValue = Rxn<Map<String, dynamic>>();

  @override
  void resetSelection() {
    selectedValue.value = null;
    displayedValue.value = null;
  }

  @override
  void setInitialValue() {
    String iv = component.initialValue;
    final id = component.id;

    if (iv.isNotEmpty) {
      final before = iv;
      try {
        final dataPayload = data['data'];
        if (dataPayload is Map && dataPayload.containsKey(id)) {
          final stateValue = dataPayload[id]?.toString();
          if (stateValue != null && stateValue.isNotEmpty) {
            iv = stateValue;
          }
        }
        iv = iv.interpolateJavascript(data);
      } catch (e) {
        debugPrint('[Dropdown Init: $id] Interpolation failed: $e');
      }

      debugPrint('[Dropdown Init: $id] Initial value: "$before" -> "$iv"');

      final initialOption = options.firstWhereOrNull((o) => o['key'] == iv);
      if (initialOption != null) {
        selectedValue.value = iv;
        displayedValue.value = initialOption;
        updateTargetController(selectedValue.value!);
      }
    } else if (selectedValue.value != null) {
      final stillExists = options.any((o) => o['key'] == selectedValue.value);
      if (!stillExists) {
        resetSelection();
        updateTargetController('');
      } else {
        displayedValue.value =
            options.firstWhere((o) => o['key'] == selectedValue.value);
      }
    }
  }

  void onSelectionChanged(Map<String, dynamic>? selection) {
    if (selection == null) {
      resetSelection();
      updateTargetController('');
    } else {
      final key = selection['key']?.toString() ?? '';
      selectedValue.value = key;
      displayedValue.value = selection;
      updateTargetController(key);
    }
    handleActions(selection);
  }
}
