import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/app_theme_extension.dart';

class AppButtonWidget extends StatelessWidget {
  final double? paddingHorizontal;
  final double? paddingVertical;
  final double? btnWidth;
  final int? textSize;
  final String label;
  final Color? btnColor;
  final FontWeight? weight;
  final Color? btnTextColor;
  final VoidCallback? callback;
  const AppButtonWidget({
    super.key,
    this.paddingHorizontal,
    this.textSize,
    this.paddingVertical,
    this.btnColor,
    this.btnTextColor,
    required this.label,
    required this.callback,
    this.btnWidth,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return SizedBox(
      width: btnWidth,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          shadowColor:
              btnTextColor?.withOpacity(0.033) ?? AppColor.lightGreyColor,
          // side: BorderSide(color: btnTextColor ?? context.elevatedButtonColor),
          backgroundColor: btnColor ?? context.elevatedButtonColor,
          padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal ?? 30.w,
            vertical: paddingVertical ?? (isLandscape ? 16 : 13),
          ),
        ),
        child: Text(
          label,
          style: boldTextStyle(
              color: btnTextColor ?? AppColor.whiteColor,
              size: textSize ?? 16,
              weight: weight ?? FontWeight.w600),
        ),
      ),
    );
  }
}

class OutlineAppBtn extends StatelessWidget {
  final double? paddingHorizontal;
  final double? paddingVertical;
  final double? btnWidth;
  final int? textSize;
  final String label;
  final Color? btnColor;
  final FontWeight? weight;
  final Color? btnTextColor;
  final VoidCallback? callback;
  const OutlineAppBtn({
    super.key,
    this.paddingHorizontal,
    this.textSize,
    this.paddingVertical,
    this.btnColor,
    this.btnTextColor,
    required this.label,
    required this.callback,
    this.btnWidth,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return SizedBox(
      width: btnWidth,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: btnTextColor ?? context.elevatedButtonColor),
          backgroundColor: btnColor ?? context.elevatedButtonColor,
          padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal ?? 30.w,
            vertical: paddingVertical ?? (isLandscape ? 16 : 12),
          ),
        ),
        child: Text(
          label,
          style: boldTextStyle(
              color: btnTextColor ?? AppColor.whiteColor,
              size: textSize ?? 16,
              weight: weight ?? FontWeight.w600),
        ),
      ),
    );
  }
}

class SecondaryButtonWidget extends StatelessWidget {
  final double? paddingHorizontal;
  final double? paddingVertical;
  final IconData? iconData;
  final String label;
  final VoidCallback? callback;
  const SecondaryButtonWidget({
    super.key,
    this.paddingHorizontal,
    this.paddingVertical,
    required this.label,
    required this.callback,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        iconData,
        color: AppColor.whiteColor,
      ),
      label: Text(
        label,
        style: boldTextStyle(color: AppColor.whiteColor),
      ),
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal ?? 30.w,
          vertical: paddingVertical ?? 8.h,
        ),
      ),
    );
  }
}
