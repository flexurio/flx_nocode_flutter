import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component_date_picker.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

extension ComponentDatePickerWidgets on ComponentDatePicker {
  Widget toWidget(JsonMap data) {
    final initialDate = DateTime.tryParse(initialValue);
    final controller = TextEditingController(
      text: initialDate != null ? initialDate.yMMMMd : initialValue,
    );
    return FieldDatePicker(
      controller: controller,
      labelText: label,
      initialSelectedDate: initialDate,
    );
  }
}
