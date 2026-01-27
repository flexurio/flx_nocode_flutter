import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text_field.dart';

extension ComponentTextFieldWidgets on ComponentTextField {
  Widget toWidget(Map<String, dynamic> data) {
    final controller = data['controller'] as TextEditingController? ??
        (data['allControllers'] != null
            ? (data['allControllers'] as Map<String, TextEditingController>)[id]
            : null);
    // Simple text field rendering with label and constraints
    return FTextFormField(
      controller: controller,
      maxLength: maxLength,
      maxLines: maxLines,
      labelText: label,
      helperText: helperText,
      enabled: enabled,
      validator: (value) {
        final actualValue = controller?.text ?? value;
        if (this.required) {
          if (actualValue == null || actualValue.trim().isEmpty) {
            return '$label is required';
          }
        }
        if (regex != null &&
            actualValue != null &&
            actualValue.isNotEmpty &&
            !RegExp(regex!).hasMatch(actualValue)) {
          return 'Invalid format';
        }
        return null;
      },
    );
  }
}
