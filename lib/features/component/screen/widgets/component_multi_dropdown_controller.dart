import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/features/component/models/component_multi_dropdown.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'component_selection_controller.dart';

class ComponentMultiDropdownController extends ComponentSelectionController<ComponentMultiDropdown> {
  ComponentMultiDropdownController({
    required super.component,
    required super.data,
  });

  final selectedValues = <String>[].obs;
  final displayedValues = <Map<String, dynamic>>[].obs;

  @override
  void resetSelection() {
    selectedValues.clear();
    displayedValues.clear();
  }

  @override
  void setInitialValue() {
    List<String> ivs = List.from(component.initialValues);
    final id = component.id;

    try {
      final dataPayload = data['data'];
      if (dataPayload is Map && dataPayload.containsKey(id)) {
        final stateValue = dataPayload[id];
        if (stateValue is List) {
          ivs = stateValue.map((e) => e.toString()).toList();
        } else if (stateValue != null && stateValue.toString().isNotEmpty) {
          try {
            // Try to parse as JSON if it's a JSON string
            final decoded = jsonDecode(stateValue.toString());
            if (decoded is List) {
              ivs = decoded.map((e) {
                if (e is Map) return e['id']?.toString() ?? e['key']?.toString() ?? '';
                return e.toString();
              }).toList();
            } else {
              ivs = stateValue.toString().split(',').map((e) => e.trim()).toList();
            }
          } catch (_) {
            ivs = stateValue.toString().split(',').map((e) => e.trim()).toList();
          }
        }
      }
      
      // Interpolate each initial value if they are templates
      ivs = ivs.map((iv) => iv.interpolateJavascript(data)).toList();
    } catch (e) {
      debugPrint('[MultiDropdown Init: $id] Interpolation/Parsing failed: $e');
    }

    final matchedOptions = options.where((o) => ivs.contains(o['key'])).toList();
    if (matchedOptions.isNotEmpty) {
      selectedValues.value = matchedOptions.map((o) => o['key'].toString()).toList();
      displayedValues.value = matchedOptions;
      _updateTargetWithJson();
    } else if (selectedValues.isNotEmpty) {
      final stillExists = options.where((o) => selectedValues.contains(o['key'])).toList();
      if (stillExists.length != selectedValues.length) {
        selectedValues.value = stillExists.map((o) => o['key'].toString()).toList();
        displayedValues.value = stillExists;
        _updateTargetWithJson();
      } else {
        displayedValues.value = stillExists;
      }
    }
  }

  void onSelectionsChanged(List<Map<String, dynamic>> selections) {
    selectedValues.value = selections.map((s) => s['key']?.toString() ?? '').toList();
    displayedValues.value = selections;
    _updateTargetWithJson();
    
    // For actions, we might want to handle them differently for multi-select.
    // For now, we'll just pass the last selected item or the whole list if supported.
    if (selections.isNotEmpty) {
      handleActions(selections.last);
    } else {
      // Handle empty selection if needed
    }
  }

  void _updateTargetWithJson() {
    final jsonValue = jsonEncode(displayedValues.map((v) => {
      'id': v['key'],
      'name': v['label'],
    }).toList());
    updateTargetController(jsonValue);
  }
}
