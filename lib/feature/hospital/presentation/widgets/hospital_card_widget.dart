import 'package:flutter/material.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/decoration_widget.dart';
import 'package:quick_opd/core/utils/remote_image.dart';

class HospitalCardWidget<T> extends StatelessWidget {
  final T item;
  final String Function(T) imageURL;
  final String Function(T) name;
  final String Function(T) address;
  final String Function(T) rating;
  final String Function(T) location;
  final String Function(T) status;
  final String Function(T) distance;

  const HospitalCardWidget(
      {super.key,
      required this.item,
      required this.imageURL,
      required this.name,
      required this.address,
      required this.rating,
      required this.location,
      required this.status,
      required this.distance});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 10),
      decoration: DecorationWidget.boxDecorationRoundedWithShadow(
        12,
        blurRadius: 6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: remoteImageWidget(
                  imageURL(item),
                  148,
                  width: double.infinity,
                ),
              ),

              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 6, bottom: 6),
                  decoration: DecorationWidget.boxDecorationWithRoundedCorners(
                    backgroundColor:
                        status(item) == 'Open' ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status(item),
                    style: boldTextStyle(
                      size: 12,
                      color: AppColor.whiteColor,
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration:
                      DecorationWidget.boxDecorationRoundedWithShadow(20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 20,
                        color: AppColor.primaryColor,
                      ),
                      Text(
                        '${distance(item)} Km ',
                        style: boldTextStyle(
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ),
            ],
          ),
          10.sHeight,
          Text(name(item), style: boldTextStyle(size: 18)),
          5.sHeight,
          Text(address(item), style: secondaryTextStyle()),
          8.sHeight,
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 20,
              ),
              4.sWidth,
              Text(
                rating(item).toString(),
                style: boldTextStyle(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
