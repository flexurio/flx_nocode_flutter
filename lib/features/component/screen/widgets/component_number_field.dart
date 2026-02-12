import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component_number_field.dart';

extension ComponentNumberFieldWidgets on ComponentNumberField {
  Widget toWidget(Map<String, dynamic> data) {
    final controller = data['controller'] as TextEditingController? ??
        (data['allControllers'] != null
            ? (data['allControllers'] as Map<String, TextEditingController>)[id]
            : null);
    return FTextFormField(
      controller: controller,
      labelText: label,
      enabled: enabled,
      hintText: initialValue.isEmpty ? null : initialValue,
      isNumeric: true,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
      ],
    );
  }

  Widget toMockWidget() {
    return FTextFormField(
      labelText: label,
      enabled: enabled,
      hintText: initialValue.isEmpty ? null : initialValue,
      isNumeric: true,
    );
  }
}
