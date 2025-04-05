import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/app_theme_extension.dart';
import 'package:quick_opd/core/themes/decoration_widget.dart';
import 'package:quick_opd/core/utils/common_status_screen.dart';
import 'package:quick_opd/routes/app_route_path.dart';
import 'package:quick_opd/widgets/action_bottom_sheet.dart';
import 'package:quick_opd/widgets/button_widget.dart';
import 'package:quick_opd/widgets/dialog_widget.dart';

class BookedAppointmentDetails extends StatelessWidget {
  const BookedAppointmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text('Appointment Details', style: boldTextStyle(size: 20)),
        leading: IconButton(
          icon: const Icon(Icons.west),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: context.scaffoldBackgroundColor,
          child: AppButtonWidget(
              btnColor: AppColor.pinkColor,
              btnTextColor: AppColor.whiteColor,
              label: "Cancel Appointment",
              callback: () {
                showActionBottomSheet(context,
                    title: "Cancel Appointment",
                    submitBtnTitle: "Yes, Cancel",
                    eventWidget: Text(
                      "Are you sure you want to cancel appointment?",
                      style: secondaryTextStyle(),
                    ), onPressed: () {
                  Navigator.pop(context);
                  showSuccessDialog(context);
                });
              })

          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => CommonStatusScreen(
          //             icon: Icons.verified,
          //             heading: "Your booking successfully",
          //             subheading:
          //                 "You have successfully booking your Appointment",
          //             btnTitle: 'Go to home',
          //             callback: () => context.pushNamed(AppRoute.mainScreen.name),
          //           ),
          //         ));
          //   },
          //   style: ElevatedButton.styleFrom(
          //       minimumSize: Size(context.screenWidth * 0.9, 50)),
          //   child: Text(
          //     'Confirm Booking',
          //     style: boldTextStyle(color: AppColor.whiteColor),
          //   ),
          // ),

          ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: DecorationWidget.boxDecorationDefault(),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 48,
                      backgroundImage: AssetImage('assets/images/doctor.png'),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr. Ronald Richards' * 2,
                            maxLines: 2,
                            style: boldTextStyle(
                              size: 18,
                            ),
                          ),
                          6.sHeight,
                          Text(
                            'Orthopedic',
                            maxLines: 2,
                            style: secondaryTextStyle(
                              color: AppColor.textSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    16.sWidth,
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Text('5.0')
                      ],
                    )
                  ],
                ),
                24.sHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: context.screenWidth / 2.3,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 16),
                      decoration:
                          DecorationWidget.boxDecorationWithRoundedCorners(
                              backgroundColor: AppColor.lightGreyColor,
                              borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor:
                                AppColor.primaryColor.withOpacity(0.1),
                            child: const Icon(
                              Icons.people,
                              size: 30,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          12.sWidth,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('5000+'),
                              5.sHeight,
                              const Text("Patients")
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: context.screenWidth / 2.4,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 16),
                      decoration:
                          DecorationWidget.boxDecorationWithRoundedCorners(
                              backgroundColor: AppColor.lightGreyColor,
                              borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor:
                                AppColor.primaryColor.withOpacity(0.1),
                            child: const Icon(
                              Icons.person_outline,
                              size: 30,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          12.sWidth,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('+15 Years'),
                              5.sHeight,
                              const Text("Experiences")
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          20.sHeight,
          Container(
            width: double.infinity,
            decoration: DecorationWidget.boxDecorationDefault(),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Scheduled Appointment',
                  style: boldTextStyle(size: 16),
                ),
                8.sHeight,
                Text(
                  'Today, December 22 2022',
                  style: primaryTextStyle(size: 14),
                ),
                4.sHeight,
                Text(
                  '16:00-16:30 PM (30 minutes)',
                  style: primaryTextStyle(size: 14),
                ),
              ],
            ),
          ),
          20.sHeight,
          Container(
            width: double.infinity,
            decoration: DecorationWidget.boxDecorationDefault(),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Patient Information',
                  style: boldTextStyle(size: 16),
                ),
                8.sHeight,
                Text(
                  'Full Name: Ronald Richards',
                  style: primaryTextStyle(size: 14),
                ),
                4.sHeight,
                Text(
                  'Gender: Male',
                  style: primaryTextStyle(size: 14),
                ),
                4.sHeight,
                Text(
                  'Age: 27',
                  style: primaryTextStyle(size: 14),
                ),
              ],
            ),
          ),
          20.sHeight,
          Container(
            width: double.infinity,
            decoration: DecorationWidget.boxDecorationDefault(),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Purchase Details',
                  style: boldTextStyle(size: 16),
                ),
                8.sHeight,
                Text(
                  'Amount: 300Rs',
                  style: primaryTextStyle(size: 14),
                ),
                4.sHeight,
                Text(
                  'Payment: Online',
                  style: primaryTextStyle(size: 14),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
