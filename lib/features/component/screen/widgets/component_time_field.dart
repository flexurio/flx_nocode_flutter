import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component_time_field.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';

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
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9:]')),
        _TimeFormatter(),
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

class _TimeFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    if (text.length > 5) return oldValue;

    // Handle backspace on colon
    if (oldValue.text.endsWith(':') &&
        text.length == 2 &&
        oldValue.text.length == 3) {
      text = text.substring(0, 1);
    }

    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      final char = text[i];
      if (char == ':') continue;

      final currentLen = buffer.length;
      if (currentLen == 0) {
        if (int.parse(char) > 2) continue;
      } else if (currentLen == 1) {
        final firstHourDigit = int.parse(buffer.toString());
        if (firstHourDigit == 2 && int.parse(char) > 3) continue;
      } else if (currentLen == 3) {
        if (int.parse(char) > 5) continue;
      }

      buffer.write(char);
      if (buffer.length == 2) {
        buffer.write(':');
      }
    }

    final newText = buffer.toString();
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
