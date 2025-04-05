import 'package:flutter/material.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/decoration_widget.dart';

class CategoryItemWidget<T> extends StatelessWidget {
  final T item;
  final String Function(T) titleExtractor;
  final String Function(T) imageExtractor;
  final VoidCallback? onTap;

  const CategoryItemWidget({
    super.key,
    required this.item,
    required this.titleExtractor,
    required this.imageExtractor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        child: Column(
          children: [
            Container(
              height: 74,
              width: 74,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(8),
              decoration: DecorationWidget.boxDecorationRoundedWithShadow(40),
              child: Image.asset(
                imageExtractor(item),
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            5.sHeight,
            Text(
              titleExtractor(item),
              overflow: TextOverflow.fade,
              style: primaryTextStyle(size: 15),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
