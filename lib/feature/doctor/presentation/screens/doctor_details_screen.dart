import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/decoration_widget.dart';
import 'package:quick_opd/core/utils/common_url_launcher.dart';
import 'package:quick_opd/core/utils/remote_image.dart';
import 'package:quick_opd/feature/doctor/presentation/widgets/about_card_widget.dart';
import 'package:quick_opd/routes/app_route_path.dart';
import 'package:quick_opd/widgets/button_widget.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({super.key});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
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
        length: 4,
        child: NestedScrollView(
          controller: _scrollController, // Attach controller here
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            print("innerBoxIsScrolled==> $_isScrolled");

            return [
              SliverAppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: _isScrolled
                          ? AppColor.blackColor
                          : AppColor.whiteColor),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                backgroundColor: AppColor.whiteColor,
                pinned: true,
                elevation: 0.5,
                expandedHeight: 420,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding:
                      const EdgeInsets.only(bottom: 66, left: 30, right: 50),
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
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          remoteImageWidget(
                            "https://foujiadda.in/admin/uploads/echs/image_1654602964.JPG",
                            300,
                          ),
                          Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            color: AppColor.appBackgroundColorDark
                                .withOpacity(0.3),
                          ),
                          Positioned(
                            bottom: 8,
                            left: 16,
                            right: 16,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Dr. Pawan Kumar',
                                          style: boldTextStyle(
                                              size: 20,
                                              color: AppColor.whiteColor)),
                                      4.sHeight,
                                      Text(
                                          '145 Valencia St, San Francisco, CA 94103',
                                          style: secondaryTextStyle(
                                              color: AppColor.whiteColor)),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text('0.2 Km Away',
                                        style: secondaryTextStyle(
                                            color: AppColor.whiteColor)),
                                    8.sHeight,
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 6,
                                          bottom: 6),
                                      decoration: DecorationWidget
                                          .boxDecorationWithRoundedCorners(
                                              backgroundColor: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                      child: Text('Open'.toUpperCase(),
                                          style: primaryTextStyle(
                                              size: 14,
                                              color: AppColor.whiteColor)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      16.sHeight,
                      const Row(
                        children: [
                          AboutCardWidget(
                            title: "Patients",
                            value: "5000+",
                            iconData: Icons.person_2,
                            iconColor: AppColor.primaryColor,
                          ),

                          AboutCardWidget(
                            title: "Experience",
                            value: "5-Years",
                            iconData: Icons.badge,
                            iconColor: AppColor.primaryColor,
                          ),

                          AboutCardWidget(
                            title: "Ratings",
                            value: "5.0",
                            iconData: Icons.star_rate_rounded,
                            iconColor: Colors.amber,
                          ),

                          // Expanded(
                          //   child: Column(
                          //     children: [
                          //       const Icon(Icons.phone,
                          //           size: 30, color: AppColor.primaryColor),
                          //       8.sHeight,
                          //       Text('Call', style: primaryTextStyle()),
                          //     ],
                          //   ),
                          // ),
                          // Expanded(
                          //   child: GestureDetector(
                          //     onTap: () {
                          //       CommonUrlLauncher().openGoogleMaps(
                          //           sourceLat: 37.7749,
                          //           sourceLng: -122.4194,
                          //           destinationLat: 34.0522,
                          //           destinationLng: -118.2437);
                          //     },
                          //     child: Column(
                          //       children: [
                          //         const Icon(Icons.location_searching,
                          //             size: 30, color: AppColor.primaryColor),
                          //         8.sHeight,
                          //         Text('Direction', style: primaryTextStyle()),
                          //       ],
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                      16.sHeight,
                    ],
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
                        child: Text('About'.toUpperCase(),
                            style: primaryTextStyle(size: 13)),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Services'.toUpperCase(),
                            style: primaryTextStyle(size: 13)),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Offers'.toUpperCase(),
                            style: primaryTextStyle(size: 13)),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('PriceList'.toUpperCase(),
                            style: primaryTextStyle(size: 13)),
                      ),
                    ),
                  ],
                ),
              )
            ];
          },
          body: const TabBarView(
            children: [
              Center(
                child: Text("DATA 1"),
              ),
              Center(
                child: Text("DATA 2"),
              ),
              Center(
                child: Text("DATA 3"),
              ),
              Center(
                child: Text("DATA 4"),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: DecorationWidget.boxDecorationWithShadow(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor),
        padding: const EdgeInsets.all(8),
        child: AppButtonWidget(
          label: 'Schedule a pickup'.toUpperCase(),
          callback: () {
            context.pushNamed(AppRoute.bookAnAppointmentScreen.name);
          },
        ),
      ),
    );
  }
}
