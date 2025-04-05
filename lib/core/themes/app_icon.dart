import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_opd/core/themes/app_color.dart';

class AppIcon {
  AppIcon._();

  static Icon emailIcon({double? size, Color? color}) {
    return Icon(CupertinoIcons.mail,
        size: size ?? 24, color: color ?? AppColor.textSecondaryColor);
  }

  static Icon passIcon({double? size, Color? color}) {
    return Icon(Icons.lock,
        size: size ?? 24, color: color ?? AppColor.textSecondaryColor);
  }

  static Icon mobileIcon({double? size, Color? color}) {
    return Icon(CupertinoIcons.phone,
        size: size ?? 24, color: color ?? AppColor.textSecondaryColor);
  }

    static Icon patientsIcon({double? size, Color? color}) {
    return Icon(CupertinoIcons.person_2_alt,
        size: size ?? 24, color: color ?? AppColor.primaryColor);
  }
}
