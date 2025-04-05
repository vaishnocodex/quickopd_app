import 'package:flutter/material.dart';
import 'package:quick_opd/core/themes/app_font.dart';

class HeadingWithBtnWidget extends StatelessWidget {
  final String title;
  final String buttonText;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onButtonPressed;
  const HeadingWithBtnWidget(
      {super.key,
      required this.title,
      required this.buttonText,
      this.onButtonPressed,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.fromLTRB(12, 14, 8, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              title,
              style: boldTextStyle(size: 18),
            ),
          ),
          TextButton(
            onPressed: onButtonPressed,
            child: Text(
              buttonText,
              style: secondaryTextStyle(),
            ),
          )
        ],
      ),
    );
  }
}
