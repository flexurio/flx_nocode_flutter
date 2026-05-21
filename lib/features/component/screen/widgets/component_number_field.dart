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
          height: 44,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: enabled ? Colors.white : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: enabled ? Colors.grey.shade300 : Colors.grey.shade200,
            ),
          ),
          child: Text(
            initialValue.isNotEmpty ? initialValue : '0',
            style: TextStyle(
              color: initialValue.isNotEmpty
                  ? (enabled ? Colors.black87 : Colors.grey.shade500)
                  : Colors.grey.shade400,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
