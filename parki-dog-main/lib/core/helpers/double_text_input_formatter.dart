import 'package:flutter/services.dart';

class DoubleTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // Allow empty input
    if (newText.isEmpty) {
      return newValue;
    }

    // Allow only digits and a single decimal point
    if (RegExp(r'^\d*\.?\d*$').hasMatch(newText)) {
      // Check for leading decimal point and add a zero if needed
      if (newText.startsWith('.') && newText.length == 1) {
        newText = '0.';
      }

      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }

    // If the input is invalid, revert to the old value
    return oldValue;
  }
}
