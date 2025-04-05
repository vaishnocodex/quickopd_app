import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/app_theme_extension.dart';
import 'package:quick_opd/feature/appointment/presentation/widgets/appointment_card_widget.dart';
import 'package:quick_opd/widgets/button_widget.dart';

class ActionBottomSheet extends StatelessWidget {
  final String? title;
  final Widget? eventWidget;
  final String? submitBtnTitle;
  final void Function()? onPressed;
  const ActionBottomSheet(
      {super.key,
      this.title,
      this.eventWidget,
      this.submitBtnTitle,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: context.scaffoldBackgroundColor, // Dark theme color
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            width: 40.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          SizedBox(height: 20.h),
          // Title
          Text(title ?? "", style: boldTextStyle(size: 22)),
          SizedBox(height: 8.h),
          eventWidget ?? const SizedBox.shrink(),
          32.sHeight,
          // Buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Cancel button
              Expanded(
                child: AppButtonWidget(
                  label: "Cancel",
                  callback: () => Navigator.pop(context),
                  btnColor: AppColor.pinkColor.withOpacity(0.055),
                  btnTextColor: AppColor.pinkColor,
                ),
              ),
              SizedBox(width: 10.w),

              Expanded(
                child: AppButtonWidget(
                  label: submitBtnTitle ?? "",
                  callback: onPressed,
                  btnColor: AppColor.primaryColor,
                ),
              )
              // Confirm button
            ],
          ),
        ],
      ),
    );
  }
}

void showActionBottomSheet(BuildContext context,
    {String? title,
    Widget? eventWidget,
    String? submitBtnTitle,
    void Function()? onPressed}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return ActionBottomSheet(
        title: title,
        submitBtnTitle: submitBtnTitle,
        eventWidget: eventWidget,
        onPressed: onPressed,
      );
    },
  );
}
