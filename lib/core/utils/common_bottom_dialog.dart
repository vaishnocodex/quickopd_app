// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/app_string.dart';
import 'package:quick_opd/core/themes/app_theme_extension.dart';
import 'package:quick_opd/core/utils/location_manager.dart';
import 'package:quick_opd/widgets/button_widget.dart';

class CommonBottomDialog {
  CommonBottomDialog._();

  static final CommonBottomDialog instance = CommonBottomDialog._();
  factory CommonBottomDialog() {
    return instance;
  }

  Future<void> showLocationPickerDialog(BuildContext context) async {
    showModalBottomSheet(
      backgroundColor: context.scaffoldBackgroundColor,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              10.sHeight,
              CircleAvatar(
                radius: kToolbarHeight,
                backgroundColor: AppColor.primaryColor.withOpacity(0.1),
                child: const Icon(Icons.location_on,
                    size: kToolbarHeight, color: AppColor.primaryColor),
              ),
              10.sHeight,
              Text(
                "Why We Need Your Location",
                style: boldTextStyle(size: 20),
              ),
              20.sHeight,
              Text(
                AppString.locationSubtitleMsg,
                textAlign: TextAlign.center,
                style: primaryTextStyle(),
              ),
              20.sHeight,
              // TextButton(
              //     onPressed: () async {
              //       await LocationManager()
              //           .checkAndRequestLocationPermission(context);
              //       Navigator.of(context).pop();
              //     },
              //     child: const Text("Grant Location Access")),
              AppButtonWidget(
                label: "Grant Location Access",
                callback: () async {
                  await LocationManager()
                      .checkAndRequestLocationPermission(context);
                  Navigator.pop(context);
                },
              ),
              8.sHeight,
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Maybe Later",
                  style: primaryTextStyle(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
