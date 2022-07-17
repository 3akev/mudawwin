import 'package:flutter/material.dart';

TextEditingValue getTextValue(String text) {
  return TextEditingValue(
    text: text,
    selection: TextSelection.fromPosition(
      TextPosition(offset: text.length),
    ),
  );
}