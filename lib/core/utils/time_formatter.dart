import 'package:flutter/services.dart';

class TimeFormatter extends TextInputFormatter {
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
