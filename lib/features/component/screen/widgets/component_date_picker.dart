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
        TextEditingController(
          text: initialDate != null ? initialDate.yMMMMd : initialValue,
        );

    return FieldDatePicker(
      controller: controller,
      labelText: label,
      initialSelectedDate: initialDate,
      minDate: min,
      maxDate: max,
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
}
