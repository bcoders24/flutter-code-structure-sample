import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final sanitizedText = newValue.text.replaceAll(RegExp(r'\D'), '');
    final formattedText = _formatPhoneNumber(sanitizedText);

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _formatPhoneNumber(String text) {
    if (text.length < 6) {
      return text;
    } else if (text.length < 11) {
      return '${text.substring(0, 5)}-${text.substring(5)}';
    } else {
    return '${text.substring(0, 5)}-${text.substring(5, 10)}';
    }
  }
}

