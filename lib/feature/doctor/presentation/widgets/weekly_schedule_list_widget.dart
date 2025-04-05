import 'package:flutter/material.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';

class WeeklyScheduleListWidget extends StatelessWidget {
  final Map<String, String> schedule;
  final IconData? bulletIcon;
  final Color? iconColor;
  final double iconSize;
  final TextStyle? dayTextStyle;
  final TextStyle? timeTextStyle;
  final String? note;

  const WeeklyScheduleListWidget({
    super.key,
    required this.schedule,
    this.bulletIcon,
    this.iconColor,
    this.iconSize = 8.0,
    this.dayTextStyle,
    this.timeTextStyle,
    this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        20.sHeight,
        ...schedule.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  bulletIcon ?? Icons.circle,
                  color: iconColor ?? AppColor.primaryColor,
                  size: iconSize,
                ),
                8.sWidth,
                Expanded(
                  child: createRichText(
                    list: [
                      TextSpan(
                        text: entry.key,
                        style: dayTextStyle ??
                            boldTextStyle(
                              weight: FontWeight.w500,
                              color: AppColor.primaryColor,
                            ),
                      ),
                      TextSpan(
                        text: " : ${entry.value}",
                        style: timeTextStyle ?? secondaryTextStyle(size: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        20.sHeight,
        Text(
          "Note:",
          style: boldTextStyle(
            color: AppColor.pinkColor,
          ),
        ),
        5.sHeight,
        Text(
          note ?? "Please arrive 10 munites early for in-clinic appointments.",
          style: primaryTextStyle(size: 15),
        ),
      ]),
    );
  }
}
