import 'package:flutter/material.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/app_icon.dart';
import 'package:quick_opd/core/themes/decoration_widget.dart';
import 'package:quick_opd/feature/doctor/presentation/widgets/weekly_schedule_list_widget.dart';
import 'package:quick_opd/widgets/button_widget.dart';

class DoctorCardWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String specialization;
  final String experience;
  final String availability;

  const DoctorCardWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.specialization,
    required this.experience,
    required this.availability,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      padding: const EdgeInsets.fromLTRB(12, 14, 12, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                  8.sHeight,
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: DecorationWidget.boxDecorationDefault(
                        color: AppColor.primaryColor),
                    child: Text(
                      "17 years exp",
                      style: boldTextStyle(
                        color: AppColor.whiteColor,
                        size: 13,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    8.sHeight,
                    Text(
                      specialization,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const Text(
                      "MBBS",
                      style: TextStyle(color: Colors.grey),
                    ),
                    5.sHeight,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹ 200",
                          style: boldTextStyle(),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.location_on_rounded,
                          size: 18,
                          color: AppColor.primaryColor,
                        ),
                        Text(
                          "12.0 Km",
                          style: primaryTextStyle(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(availability, style: boldTextStyle(size: 14)),
              10.sWidth,
              AppButtonWidget(
                  paddingVertical: 10,
                  paddingHorizontal: 20,
                  btnColor: AppColor.primaryColor.withOpacity(1),
                  label: "Book Now",
                  btnTextColor: AppColor.whiteColor,
                  textSize: 14,
                  callback: () {})
            ],
          ),
        ],
      ),
    );
  }
}
