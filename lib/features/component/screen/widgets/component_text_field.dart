import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text_field.dart';

extension ComponentTextFieldWidgets on ComponentTextField {
  Widget toWidget(Map<String, dynamic> data) {
    final controller = data['controller'] as TextEditingController?;
    // Simple text field rendering with label and constraints
    return FTextFormField(
      controller: controller,
      maxLength: maxLength,
      maxLines: maxLines,
      labelText: label,
      enabled: enabled,
      validator: this.required
          ? (value) {
              final actualValue = controller?.text ?? value;
              if (actualValue == null || actualValue.trim().isEmpty) {
                return '$label is required';
              }
              return null;
            }
          : null,
    );
  }
}
