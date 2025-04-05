import 'package:flutter/material.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';

class TextWithBulletWidget extends StatelessWidget {
  final List<String> items;
  final IconData bulletIcon;
  final Color iconColor;
  final double iconSize;
  final TextStyle? textStyle;

  const TextWithBulletWidget({
    super.key,
    required this.items,
    this.bulletIcon = Icons.check_circle,
    this.iconColor = AppColor.appBackgroundColorDark,
    this.iconSize = 20.0,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                bulletIcon,
                color: iconColor,
                size: iconSize,
              ),
              8.sWidth,
              Expanded(
                child: Text(
                  item,
                  style: textStyle ?? primaryTextStyle(size: 14),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
