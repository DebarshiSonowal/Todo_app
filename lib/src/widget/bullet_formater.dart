import 'package:flutter/services.dart';

class BulletFormatter2 extends TextInputFormatter {
  int _index = 1;
  bool _isFirstFocus = true;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (_isFirstFocus && newValue.text.isNotEmpty) {
      _isFirstFocus = false;
      final bulletPoint = '$_index. ';
      final updatedText = bulletPoint + newValue.text;
      _index++;
      return TextEditingValue(
        text: updatedText,
        selection: TextSelection.collapsed(offset: updatedText.length),
      );
    }

    if (newValue.text.endsWith('\n')) {
      final bulletPoint = '$_index. ';
      final updatedText = newValue.text + bulletPoint;
      _index++;
      return TextEditingValue(
        text: updatedText,
        selection: TextSelection.collapsed(offset: updatedText.length),
      );
    }

    return newValue;
  }
}

class BulletFormatter extends TextInputFormatter {
  int _index = 1;
  bool _isFirstFocus = true;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (_isFirstFocus && newValue.text.isNotEmpty) {
      _isFirstFocus = false;
      final bulletPoint = '$_index. ';
      final updatedText = bulletPoint + newValue.text;
      _index++;
      return TextEditingValue(
        text: updatedText,
        selection: TextSelection.collapsed(offset: updatedText.length),
      );
    }

    final newLines = newValue.text.split('\n');
    final formattedLines = newLines.map((line) {
      final trimmedLine = line.trimLeft();
      if (trimmedLine.isNotEmpty && trimmedLine.startsWith('$_index.')) {
        // Line already starts with the current bullet point index, no need to add another one
        return line;
      }
      final bulletPoint = '$_index. ';
      return bulletPoint + line;
    }).join('\n');

    return TextEditingValue(
      text: formattedLines,
      selection: newValue.selection.copyWith(
        baseOffset: newValue.selection.baseOffset + 3, // Adjust for added bullet points
        extentOffset: newValue.selection.extentOffset + 3,
      ),
    );
  }
}












