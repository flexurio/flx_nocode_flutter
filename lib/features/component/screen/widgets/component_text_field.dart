import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text_field.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/filter.dart';

final _cellControllers = <String, TextEditingController>{};

extension ComponentTextFieldWidgets on ComponentTextField {
  Widget toWidget(Map<String, dynamic> data, {bool isSmall = false}) {
    TextEditingController? controller;
    if (isSmall) {
      final tableId = data['tableId']?.toString() ?? 'table';
      final rowIndex = data['rowIndex']?.toString() ?? 'row';
      final targetField = data['columnBody']?.toString() ?? id;
      final cacheKey = '${tableId}_${rowIndex}_${targetField}';

      final row = data['row'] is Map ? data['row'] as Map : null;
      final currentText = row != null ? (row[targetField]?.toString() ?? '') : '';

      controller = _cellControllers[cacheKey];
      if (controller == null) {
        controller = TextEditingController(text: currentText);
        _cellControllers[cacheKey] = controller;
      } else {
        if (controller.text != currentText) {
          controller.value = controller.value.copyWith(
            text: currentText,
            selection: TextSelection.collapsed(offset: currentText.length),
          );
        }
      }
    } else {
      controller = data['controller'] as TextEditingController? ??
          (data['allControllers'] != null
              ? (data['allControllers'] as Map<String, TextEditingController>)[id]
              : null);
    }

    if (isSmall) {
      return FTextFieldSmall(
        controller: controller!,
        hintText: label,
        onChanged: (val) {
          final onRowChanged = data['onRowChanged'];
          if (onRowChanged is Function) {
            final targetField = data['columnBody']?.toString() ?? id;
            final row = Map<String, dynamic>.from(data['row'] as Map? ?? {});
            if (row[targetField] != val) {
              row[targetField] = val;
              onRowChanged(row);
            }
          }
        },
      );
    }

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
            color: enabled ? Colors.white : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: enabled ? Colors.grey.shade300 : Colors.grey.shade200,
            ),
          ),
          child: Text(
            initialValue.isNotEmpty
                ? (obscure ? '••••••••' : initialValue)
                : (obscure ? '••••••••' : 'Enter $label...'),
            style: TextStyle(
              color: initialValue.isNotEmpty
                  ? (enabled ? Colors.black87 : Colors.grey.shade500)
                  : Colors.grey.shade400,
              fontSize: obscure ? 18 : 13,
              letterSpacing: obscure ? 2 : null,
            ),
          ),
        ),
      ],
    );
  }
}
