import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component_date_picker.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';

extension ComponentDatePickerWidgets on ComponentDatePicker {
  Widget toWidget(JsonMap data) {
    // Collect variables for interpolation
    final allControllers =
        data['allControllers'] as Map<String, TextEditingController>? ?? {};
    final variables =
        allControllers.map((key, value) => MapEntry(key, value.text));

    // Handle initial date
    final String interpolatedInitial =
        initialValue.interpolateJavascript(variables);
    final initialDate = DateTime.tryParse(interpolatedInitial);

    // Handle min date
    DateTime? min;
    if (minDate != null && minDate!.isNotEmpty) {
      final String interpolatedMin = minDate!.interpolateJavascript(variables);
      min = DateTime.tryParse(interpolatedMin);
    }

    // Handle max date
    DateTime? max;
    if (maxDate != null && maxDate!.isNotEmpty) {
      final String interpolatedMax = maxDate!.interpolateJavascript(variables);
      max = DateTime.tryParse(interpolatedMax);
    }

    final controller = data['controller'] as TextEditingController? ??
        (data['allControllers'] != null
            ? (data['allControllers'] as Map<String, TextEditingController>)[id]
            : null) ??
        TextEditingController(
          text: initialDate != null ? initialDate.yMMMMd : initialValue,
        );

    return FieldDatePicker(
      controller: controller,
      labelText: label,
      initialSelectedDate: initialDate,
      minDate: min,
      maxDate: max,
      dateFormat: dateFormat,
      validator: this.required
          ? (value) {
              if (value == null) {
                return '$label is required';
              }
              return null;
            }
          : null,
    );
  }

  Widget toMockWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  (dateFormat ?? 'yyyy-MM-dd').toUpperCase(),
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                ),
              ),
              Icon(Icons.calendar_today, color: Colors.grey.shade600, size: 18),
            ],
          ),
        ),
      ],
    );
  }
}
