// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/decoration_widget.dart';
import 'package:quick_opd/core/utils/remote_image.dart';
import 'package:quick_opd/feature/doctor/presentation/screens/about_doctor.dart';
import 'package:quick_opd/feature/doctor/presentation/screens/doctor_rating_and_reviews.dart';
import 'package:quick_opd/feature/doctor/presentation/screens/releated_doctors_screen.dart';
import 'package:quick_opd/feature/doctor/presentation/widgets/about_card_widget.dart';
import 'package:quick_opd/feature/doctor/presentation/widgets/doctor_card_widget.dart';
import 'package:quick_opd/feature/doctor/presentation/widgets/releated_doctor_card_widget.dart';
import 'package:quick_opd/feature/doctor/presentation/widgets/weekly_schedule_list_widget.dart';
import 'package:quick_opd/feature/home/presentation/screens/doctor_screen/top_doctor_near_by_screen.dart';
import 'package:quick_opd/feature/home/presentation/widgets/popular_doctor_card_widget.dart';
import 'package:quick_opd/routes/app_route_path.dart';
import 'package:quick_opd/widgets/button_widget.dart';

class DoctorDetailsPage extends StatefulWidget {
  const DoctorDetailsPage({super.key});

  @override
  _DoctorDetailsPageState createState() => _DoctorDetailsPageState();
}

class _DoctorDetailsPageState extends State<DoctorDetailsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset > 300 && !_isScrolled) {
      setState(() {
        _isScrolled = true;
      });
    } else if (_scrollController.offset <= 300 && _isScrolled) {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          controller: _scrollController, // Attach controller here
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            print("innerBoxIsScrolled==> $_isScrolled");
            return [
              SliverAppBar(
                leading: IconButton.filled(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white)),
                  color: AppColor.whiteColor,
                  icon: Icon(Icons.arrow_back,
                      color: _isScrolled
                          ? AppColor.blackColor
                          : AppColor.blackColor),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                backgroundColor: AppColor.whiteColor,
                pinned: true,
                elevation: 0.5,
                scrolledUnderElevation: 0,
                expandedHeight: 330,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding:
                      const EdgeInsets.only(bottom: 60, left: 30, right: 50),
                  collapseMode: CollapseMode.parallax,
                  title: Visibility(
                    visible: _isScrolled,
                    child: Padding(
                      padding: EdgeInsets.only(left: _isScrolled ? 30 : 0),
                      child: Text(
                        'Dr. Pawane Kumar',
                        style: boldTextStyle(
                          color: AppColor.blackColor,
                          size: 18,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  background: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 24, horizontal: 0),
                          padding: const EdgeInsets.all(14),
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
                              const SizedBox(
                                height: kToolbarHeight,
                              ),
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: remoteImageWidget(
                                      // "https://img.freepik.com/premium-photo/positive-young-doctor-dressed-white-medical-uniform-standing-studio-with-crossed-arms_7502-7920.jpg",
                                      // "https://img.freepik.com/premium-photo/adorable-cosmetologist-with-clear-skin-wearing-black-medical-uniform-posing-indoors-isolated-grey-studio-background_7502-6856.jpg",
                                      "https://img.freepik.com/premium-photo/female-doctor-professional-health-care-hospital-stock-photo_215372-2042.jpg",
                                      152,
                                      width: 140,
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Dr. Emily Carter",
                                          style: boldTextStyle(size: 18),
                                        ),
                                        8.sHeight,
                                        Text(
                                          "Neurologist",
                                          style: boldTextStyle(
                                            color: AppColor.primaryColor,
                                            size: 13,
                                          ),
                                        ),
                                        2.sHeight,
                                        Text(
                                          "MBBS, MD (Cardiology)",
                                          style: secondaryTextStyle(
                                            size: 13,
                                          ),
                                        ),
                                        8.sHeight,
                                        Text(
                                          "12+ Years of Experience",
                                          style: boldTextStyle(),
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.star_rate_rounded,
                                              color: Colors.amber,
                                            ),
                                            3.sWidth,
                                            Text(
                                              "5.0",
                                              style: boldTextStyle(),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              8.sHeight,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Associated with",
                                        style: secondaryTextStyle(size: 12),
                                      ),
                                      Text(
                                        "Delhi Hospital",
                                        style: boldTextStyle(
                                          size: 14,
                                          color: AppColor.primaryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        16.sHeight,
                      ],
                    ),
                  ),
                ),
                bottom: TabBar(
                  labelColor: AppColor.primaryColor,
                  unselectedLabelColor: AppColor.iconColorPrimaryDark,
                  indicatorColor: AppColor.primaryColor,
                  isScrollable: false,
                  tabs: [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'About'.toUpperCase(),
                          style: primaryTextStyle(
                            size: 13,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Schedule'.toUpperCase(),
                          style: primaryTextStyle(
                            size: 13,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Reviews'.toUpperCase(),
                          style: primaryTextStyle(
                            size: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ];
          },
          body: SizedBox.expand(
            child: TabBarView(
              children: [
                const AboutDoctor(),
                const WeeklyScheduleListWidget(
                  schedule: {
                    'Monday': '10:00 AM - 1:00 PM',
                    'Tuesday': '10:00 AM - 5:00 PM',
                    'Wednesday': '9:00 AM - 3:00 PM',
                    'Thursday': '11:00 AM - 4:00 PM',
                    'Friday': '10:00 AM - 2:00 PM',
                    'Saturday': '10:00 AM - 2:00 PM',
                  },
                ),
                DoctorRatingAndReviews(
                  averageRating: 4.8,
                  totalReviews: 258,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: DecorationWidget.boxDecorationWithShadow(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Consultant Fees",
                  style: primaryTextStyle(),
                ),
                Text(
                  "₹200",
                  style: boldTextStyle(size: 20, color: AppColor.primaryColor),
                ),
              ],
            ),
            AppButtonWidget(
              label: 'Schedule a pickup'.toUpperCase(),
              callback: () {
                context.pushNamed(AppRoute.bookAnAppointmentScreen.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
