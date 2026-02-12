import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component_button.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';

Color _parseColor(String input, [Color? fallback]) {
  final fb = fallback ?? Colors.blue;
  final s = input.trim();
  try {
    if (s.startsWith('#')) {
      final hex = s.substring(1);
      int value;
      if (hex.length == 6) {
        value = int.parse('FF$hex', radix: 16);
      } else if (hex.length == 8) {
        value = int.parse(hex, radix: 16);
      } else {
        return fb;
      }
      return Color(value);
    }
    // simple named colors fallback
    switch (s.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'orange':
        return Colors.orange;
      case 'purple':
        return Colors.purple;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'grey':
      case 'gray':
        return Colors.grey;
    }
  } catch (_) {}
  return fb;
}

extension ComponentButtonWidgets on ComponentButton {
  Widget toWidget(JsonMap data) {
    final color = _parseColor(this.color);
    return Button.string(
      color: color,
      onPressed: () {},
      action: text.interpolateJavascript(data),
      isInProgress: false,
      permission: null,
    );
  }

  Widget toMockWidget() {
    final color = _parseColor(this.color);
    return Container(
      height: 44,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}
