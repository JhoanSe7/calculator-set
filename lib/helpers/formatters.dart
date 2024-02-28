import 'package:flutter/services.dart';

List<TextInputFormatter> onlyAlphaNumeric({int maxLength = 64, bool withSeparator = false}) {
  return [
    FilteringTextInputFormatter.allow(withSeparator ? RegExp(r'[0-9a-zA-Z, ]') : RegExp(r'[0-9a-zA-Z ]')),
    LengthLimitingTextInputFormatter(maxLength),
  ];
}

List<TextInputFormatter> onlyNumeric({int maxLength = 64}) {
  return [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(maxLength),
  ];
}
