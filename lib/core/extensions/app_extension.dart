
import 'package:flutter/material.dart';

extension OrientationExtensions on BuildContext {
  bool get isLandscape {
    final size = MediaQuery.of(this).size;
    return size.width > size.height;
  }



}