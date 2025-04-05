import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/app_string.dart';
import 'package:quick_opd/widgets/action_bottom_sheet.dart';
import 'package:quick_opd/widgets/button_widget.dart';

class AppDialog extends StatelessWidget {
  final VoidCallback? callback;
  final String title;
  final String btnTitle;
  final String subTitle;
  final IconData? icon;
  final Color? btnTextColor;
  final Color? btnColor;
  const AppDialog(
      {super.key,
      this.callback,
      required this.title,
      required this.subTitle,
      required this.btnTitle,
      this.btnTextColor,
      this.btnColor,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: icon != null
          ? CircleAvatar(
              radius: kToolbarHeight,
              backgroundColor: AppColor.primaryColor.withOpacity(0.1),
              child: const Icon(
                Icons.location_on,
                size: kToolbarHeight,
                color: AppColor.primaryColor,
              ),
            )
          : const SizedBox.shrink(),
      title: Text(
        textAlign: TextAlign.center,
        title,
        style: boldTextStyle(
          size: 20,
        ),
      ),
      content: Text(
        subTitle,
        textAlign: TextAlign.center,
        style: primaryTextStyle(),
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop(false);
          },
          child: Text(
            AppString.cancel,
            style: boldTextStyle(
              size: 14,
            ),
          ),
        ),
        AppButtonWidget(
          callback: callback,
          label: btnTitle,
          btnColor: btnColor ?? AppColor.primaryColor,
          btnTextColor: btnTextColor ?? AppColor.whiteColor,
          textSize: 14,
        ),
      ],
    );
  }
}

Future showSuccessDialog(BuildContext context, {VoidCallback? callback}) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        contentPadding: const EdgeInsets.all(20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFDFF6ED),
              ),
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF24A77E), // Light green background
                ),
                padding: const EdgeInsets.all(16),
                child: const Icon(
                  Icons.check,
                  color: AppColor.whiteColor, // Dark green check color
                  size: 48,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Cancel Appointment\nSuccess!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            20.sHeight,
            SizedBox(
              width: double.infinity,
              child: AppButtonWidget(
                btnColor: AppColor.pinkColor,
                label: "Back",
                weight: FontWeight.w500,
                callback: callback ??
                    () {
                      Navigator.pop(context);
                    },
              ),
            ),
          ],
        ),
      );
    },
  );
}

// class AppDialog extends StatelessWidget {
//   final String title;
//   const AppDialog({
//     super.key,
//     required this.title,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       content: Text(title),
//       actions: [
//         ElevatedButton(
//           onPressed: () {
//             context.pop(false);
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.grey,
//           ),
//           child: Text("tombol_tidak".trim()),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             context.pop(true);
//           },
//           child: Text("tombol_ya".trim()),
//         ),
//       ],
//     );
//   }
// }
