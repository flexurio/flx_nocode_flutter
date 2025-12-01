import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text_field.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

extension ComponentTextFieldWidgets on ComponentTextField {
  Widget toWidget(JsonMap data) {
    // Simple text field rendering with label and constraints
    return FTextFormField(
      maxLength: maxLength,
      maxLines: maxLines,
      labelText: label,
    );
  }
}
