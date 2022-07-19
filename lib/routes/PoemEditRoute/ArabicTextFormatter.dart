import 'package:flutter/services.dart';

// This formatter adds a space at the end if it isn't there already
// this is to avoid a bug where, with arabic text(possibly all rtl text),
// it's impossible to move the caret to the very end. the furthest it'll go
// is one character before the end. hence the space
class ArabicTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (!newValue.text.endsWith(' ')) {
      newValue = newValue.copyWith(text: "${newValue.text} ");
    }
    return newValue;
  }
}
