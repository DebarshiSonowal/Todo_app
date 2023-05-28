import 'package:flutter/material.dart';

class CustomTextEditingController extends TextEditingController {
  void updateText(String newText) {
    value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
      composing: TextRange.empty,
    );
  }
}