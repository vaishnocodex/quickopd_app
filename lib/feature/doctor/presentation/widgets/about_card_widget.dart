import 'package:flutter/material.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/app_theme_extension.dart';
import 'package:quick_opd/core/themes/decoration_widget.dart';

class AboutCardWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData iconData;
  final Color iconColor;
  const AboutCardWidget(
      {super.key,
      required this.title,
      required this.value,
      required this.iconData,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: context.screenWidth,
        margin: const EdgeInsets.fromLTRB(8, 0, 8, 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: DecorationWidget.boxDecorationWithRoundedCorners(
          backgroundColor: AppColor.eLGreyColor,
          border: Border.all(color: AppColor.viewLineColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: primaryTextStyle(
                  size: 13,
                ),
              ),
              5.sHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    iconData,
                    color: iconColor,
                  ),
                  3.sWidth,
                  Text(
                    value,
                    style: boldTextStyle(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
