import 'package:flutter/material.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/decoration_widget.dart';

class PatientReviewCard<T> extends StatelessWidget {
  final T item;
  final String Function(T) name;
  final String Function(T) date;
  final String Function(T) rating;
  final String Function(T) reviewText;
  final String Function(T) profileImage;

  const PatientReviewCard({
    super.key,
    required this.item,
    required this.name,
    required this.date,
    required this.rating,
    required this.reviewText,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
      decoration: DecorationWidget.boxDecorationWithRoundedCorners(
        borderRadius: BorderRadius.circular(0),
        border: const Border(
          bottom: BorderSide(color: AppColor.borderMColor),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(profileImage(item)),
                ),
                10.sWidth,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name(item), style: boldTextStyle()),
                    Text(date(item), style: secondaryTextStyle()),
                  ],
                ),
              ],
            ),
            8.sHeight,
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < (double.tryParse(rating(item))?.toInt() ?? 0)
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.amber,
                  size: 18,
                );
              }),
            ),
            Text(
              reviewText(item),
              style: primaryTextStyle(size: 14),
            ),
          ],
        ),
      ),
    );
  }
}
