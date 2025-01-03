import 'package:flutter/services.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class ThousandsWithDecimalFormatter extends TextInputFormatter {
  final ThousandsFormatter _thousandsFormatter = ThousandsFormatter();
  
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, TextEditingValue newValue,) {
    
    if (newValue.text.startsWith('.')) {
      return oldValue;
    }

    if (newValue.text.split('.').length > 2) {
      return oldValue;
    }

    if (newValue.text.contains('.')) {
      final parts = newValue.text.split('.');
      final formattedIntPart = _thousandsFormatter.formatEditUpdate(oldValue.copyWith(text: parts[0]), newValue.copyWith(text: parts[0]));

      return newValue.copyWith(
        text: '${formattedIntPart.text}.${parts[1]}',
        selection: TextSelection.collapsed(offset: formattedIntPart.text.length + 1 + parts[1].length),
      );
    } else {
      return _thousandsFormatter.formatEditUpdate(oldValue, newValue);
    }
  }
}
