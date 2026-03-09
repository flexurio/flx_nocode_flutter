import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component_time_field.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:flx_nocode_flutter/core/utils/time_formatter.dart';

extension ComponentTimeFieldWidgets on ComponentTimeField {
  Widget toWidget(JsonMap data) {
    // Collect variables for interpolation
    final allControllers =
        data['allControllers'] as Map<String, TextEditingController>? ?? {};
    final variables =
        allControllers.map((key, value) => MapEntry(key, value.text));

    // Handle initial value interpolation
    final String interpolatedInitial =
        initialValue.interpolateJavascript(variables);

    final controller = data['controller'] as TextEditingController? ??
        (data['allControllers'] != null
            ? (data['allControllers'] as Map<String, TextEditingController>)[id]
            : null) ??
        TextEditingController(text: interpolatedInitial);

    return FTextFormField(
      controller: controller,
      labelText: label,
      hintText: '00:00',
      enabled: enabled,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9:]')),
        TimeFormatter(),
      ],
      validator: this.required
          ? (value) {
              final val = controller.text;
              if (val.isEmpty) {
                return '$label is required';
              }
              if (val.length < 5) {
                return 'Invalid time format (HH:mm)';
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
              const Expanded(
                child: Text(
                  'HH:mm',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ),
              Icon(Icons.access_time, color: Colors.grey.shade600, size: 18),
            ],
          ),
        ),
      ],
    );
  }
}
