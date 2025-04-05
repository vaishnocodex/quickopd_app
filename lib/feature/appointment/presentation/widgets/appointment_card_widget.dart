import 'package:flutter/material.dart';
import 'package:quick_opd/core/extensions/app_date_extension.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/decoration_widget.dart';
import 'package:quick_opd/feature/appointment/presentation/screens/my_appointment_screen.dart';
import 'package:quick_opd/widgets/action_bottom_sheet.dart';
import 'package:quick_opd/widgets/button_widget.dart';
import 'package:quick_opd/widgets/dialog_widget.dart';

class AppointmentCardWidget extends StatelessWidget {
  final Appointment appointment;

  const AppointmentCardWidget({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: DecorationWidget.boxDecorationRoundedWithShadow(12),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.calendar_month,
                size: 18,
                color: AppColor.iconColorSecondary,
              ),
              3.sWidth,
              Text(
                appointment.date.formattedDate(),
                style: boldTextStyle(color: AppColor.primaryColor, size: 15),
              ),
            ],
          ),
          12.sHeight,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(appointment.imageUrl)),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(appointment.doctorName, style: boldTextStyle()),
                    5.sHeight,
                    Text(
                      appointment.specialty,
                      style: secondaryTextStyle(),
                    ),
                    5.sHeight,
                    Text(
                      "₹ 200",
                      style: boldTextStyle(),
                    ),
                    8.sHeight,
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: AppColor.borderMColor,
          ),
          6.sHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppButtonWidget(
                  paddingHorizontal: 0,
                  paddingVertical: 12,
                  btnColor: AppColor.lPinkColor.withOpacity(0.044),
                  btnTextColor: AppColor.pinkColor,
                  textSize: 14,
                  label: "Cancel Appointment",
                  callback: () {
                    showActionBottomSheet(context,
                        title: "Cancel Appointment",
                        submitBtnTitle: "Yes, Cancel",
                        eventWidget: Text(
                          "Are you sure you want to Logout?",
                          style: secondaryTextStyle(),
                        ), onPressed: () {
                      Navigator.pop(context);
                      showSuccessDialog(context);
                    });
                  },
                  btnWidth: 200,
                ),
              ),
              20.sWidth,
              Expanded(
                child: AppButtonWidget(
                    paddingVertical: 12,
                    textSize: 14,
                    label: "Reschedule",
                    callback: () {}),
              )
              // statusButton(appointment.status),
            ],
          ),
        ],
      ),
    );

    // Card(
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //   elevation: 3,
    //   margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    //   child: ListTile(
    //     leading: CircleAvatar(
    //       radius: 30,
    //       backgroundImage: NetworkImage(appointment.imageUrl),
    //     ),
    //     title: Text(
    //       appointment.doctorName,
    //       style: boldTextStyle(),
    //     ),
    //     subtitle: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           appointment.specialty,
    //           style: secondaryTextStyle(size: 12),
    //         ),
    //         Text(
    //           "\$${appointment.price.toStringAsFixed(2)}",
    //           style: boldTextStyle(size: 14),
    //         ),
    //       ],
    //     ),
    //     trailing: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text(
    //           appointment.date,
    //           style: primaryTextStyle(size: 12),
    //         ),
    //         const SizedBox(height: 5),
    //         _statusButton(appointment.status),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget statusButton(String status) {
    Color color;
    switch (status) {
      case "Cancelled":
        color = AppColor.pinkColor;
        break;
      case "Reschedule":
        color = Colors.green;
        break;
      case "Upcoming":
        color = Colors.orange;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color),
      ),
      child: Text(
        status,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
