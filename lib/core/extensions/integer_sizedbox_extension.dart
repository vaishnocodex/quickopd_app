import 'package:flutter/material.dart';

extension IntegerSizedBoxExtension on int {
  SizedBox get sHeight => SizedBox(height: toDouble());
  SizedBox get sWidth => SizedBox(width: toDouble());
}
