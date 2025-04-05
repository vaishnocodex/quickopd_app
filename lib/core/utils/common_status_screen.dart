import 'package:flutter/material.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/widgets/button_widget.dart';

class CommonStatusScreen extends StatelessWidget {
  final IconData icon;
  final String? heading;
  final String? subheading;
  final String btnTitle;
  final VoidCallback? callback;

  const CommonStatusScreen({
    super.key,
    required this.icon,
    this.heading,
    this.subheading,
    required this.btnTitle,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: AppColor.primaryColor.withOpacity(0.1),
                child: Icon(icon, size: 60, color: AppColor.primaryColor),
              ),
              const SizedBox(height: 20),
              Text(
                heading ?? "",
                style: boldTextStyle(size: 22),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                subheading ?? "",
                style: secondaryTextStyle(size: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              AppButtonWidget(label: btnTitle, callback: callback)
            ],
          ),
        ),
      ),
    );
  }
}
