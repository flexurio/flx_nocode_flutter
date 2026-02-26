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
      obscureText: obscure,
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
          return regexErrorMessage ?? 'Invalid format';
        }
        return null;
      },
    );
  }

  Widget toMockWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label.isNotEmpty) ...[
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
        ],
        Container(
          height: maxLines > 1 ? null : 44,
          constraints: maxLines > 1
              ? const BoxConstraints(minHeight: 80)
              : const BoxConstraints(),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          alignment: maxLines > 1 ? Alignment.topLeft : Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Text(
            obscure ? '••••••••' : 'Enter $label...',
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: obscure ? 18 : 13,
              letterSpacing: obscure ? 2 : null,
            ),
          ),
        ),
      ],
    );
  }
}
