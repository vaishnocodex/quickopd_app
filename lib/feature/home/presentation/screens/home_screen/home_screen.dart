import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_opd/core/common/common_list_wrapper.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/app_string.dart';
import 'package:quick_opd/core/themes/app_theme_extension.dart';
import 'package:quick_opd/core/themes/decoration_widget.dart';
import 'package:quick_opd/core/utils/location_manager.dart';
import 'package:quick_opd/core/utils/remote_image.dart';
import 'package:quick_opd/feature/home/presentation/screens/doctor_screen/my_appoitment_screen.dart';
import 'package:quick_opd/feature/home/presentation/screens/doctor_screen/top_doctor_near_by_screen.dart';
import 'package:quick_opd/feature/home/presentation/screens/services_screen/top_services_component.dart';
import 'package:quick_opd/feature/home/presentation/widgets/category_item_widget.dart';
import 'package:quick_opd/feature/home/presentation/widgets/heading_with_btn_widget.dart';
import 'package:quick_opd/feature/home/presentation/widgets/service_card_widget.dart';
import 'package:quick_opd/routes/app_route_path.dart';
import 'package:quick_opd/widgets/dialog_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController carouselController = CarouselController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      LocationManager().checkAndRequestLocationPermission(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 216,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              pinned: true,
              automaticallyImplyLeading: false,
              titleSpacing: 0,
              backgroundColor: context.cardColor,
              // backgroundColor: appStore.isDarkModeOn ? context.cardColor : LSColorPrimary,
              actionsIconTheme: const IconThemeData(opacity: 0.0),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Text(
                      'Hello, Pavane',
                      style: boldTextStyle(
                        color: AppColor.whiteColor,
                        size: 24,
                      ),
                    ),
                  ),
                  IconButton(
                    // onPressed: () => context
                    //     .pushNamed(AppRoute.bookingAppointmentDetails.name),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      color: AppColor.whiteColor,
                    ),
                  )
                ],
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 8),
                        child: Text('Your Location',
                            style:
                                primaryTextStyle(color: AppColor.whiteColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RichText(
                              text: const TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 4),
                                      child: Icon(
                                        Icons.location_on,
                                        color: AppColor.whiteColor,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ValueListenableBuilder<String>(
                              valueListenable:
                                  LocationManager().addressNotifier,
                              builder: (context, address, child) {
                                return Expanded(
                                  child: Text(
                                    address,
                                    style: primaryTextStyle(
                                        color: AppColor.whiteColor),
                                  ),
                                );
                              },
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AppDialog(
                                    callback: () async {
                                      context.pop(false);
                                      await LocationManager()
                                          .checkAndRequestLocationPermission(
                                              context);
                                    },
                                    title: AppString.changeAddress,
                                    subTitle: AppString.locationSubtitleMsg,
                                    btnTitle: 'Change',
                                    icon: Icons.location_on,
                                  ),
                                );
                              },
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    const WidgetSpan(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 4.0),
                                        child: Icon(
                                            Icons.airplanemode_on_outlined,
                                            color: AppColor.whiteColor,
                                            size: 16),
                                      ),
                                      // .paddingRight(4),
                                    ),
                                    TextSpan(
                                      text: 'Change',
                                      style: primaryTextStyle(
                                        color: AppColor.whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(14),
                        decoration:
                            DecorationWidget.boxDecorationRoundedWithShadow(12),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: "Search Doctor by name...",
                            hintStyle: primaryTextStyle(
                                color: AppColor.textSecondaryColor),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ];
        },
        body: Container(
          color: AppColor.lightPrimaryColor.withOpacity(0.22),
          // color: context.scaffoldBackgroundColor,

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: DecorationWidget.boxDecorationDefault(),
                  padding: const EdgeInsets.fromLTRB(14, 24, 14, 24),
                  child: Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 16,
                      children: List.generate(services.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            if (services[index].title == "Hospital") {
                              context.pushNamed(
                                AppRoute.hospitalListScreen.name,
                              );
                            } else {
                              context.pushNamed(
                                AppRoute.doctorsListScreen.name,
                              );
                            }
                          },
                          child: ServiceCardWidget(
                            imageURl: services[index].imageUrl,
                            title: services[index].title,
                          ),
                        );
                      }),
                    ),
                  ),
                ),

                //======== Specialist By =======
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 24),
                  padding: const EdgeInsets.only(bottom: 24),
                  decoration: DecorationWidget.boxDecorationDefault(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      HeadingWithBtnWidget(
                        title: "Book Our Symptoms By",
                        buttonText: "View All",
                        onButtonPressed: () => context
                            .pushNamed(AppRoute.allServicesListScreen.name),
                      ),
                      5.sHeight,
                      CommonListWrapper<ImageModel>(
                        items: imageModels,
                        listType: ListType.gridView,
                        itemBuilder: (context, item) => CategoryItemWidget(
                          item: item,
                          titleExtractor: (data) => data.title,
                          imageExtractor: (data) => data.image,
                          onTap: () => context
                              .pushNamed(AppRoute.doctorsListScreen.name),
                        ),
                      ),
                    ],
                  ),
                ),

                //======================================
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 24),
                  padding: const EdgeInsets.only(bottom: 24),
                  decoration: DecorationWidget.boxDecorationDefault(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const HeadingWithBtnWidget(
                        title: "Book Our Specialist",
                        buttonText: "View All",
                      ),
                      5.sHeight,
                      CommonListWrapper<ImageModel>(
                        items: imageModels,
                        listType: ListType.gridView,
                        itemBuilder: (context, item) => CategoryItemWidget(
                          item: item,
                          titleExtractor: (data) => data.title,
                          imageExtractor: (data) => data.image,
                          onTap: () => context
                              .pushNamed(AppRoute.doctorsListScreen.name),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 24),
                  padding: const EdgeInsets.only(bottom: 24),
                  decoration: DecorationWidget.boxDecorationDefault(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const HeadingWithBtnWidget(
                        title: "Book Our Specialist",
                        buttonText: "View All",
                      ),
                      5.sHeight,
                      CommonListWrapper<ImageModel>(
                        items: imageModels,
                        listType: ListType.gridView,
                        itemBuilder: (context, item) => CategoryItemWidget(
                          item: item,
                          titleExtractor: (data) => data.title,
                          imageExtractor: (data) => data.image,
                          onTap: () => context
                              .pushNamed(AppRoute.doctorsListScreen.name),
                        ),
                      ),
                    ],
                  ),
                ),

                100.sHeight,
                // TopServicesComponent(),
                // ConstrainedBox(
                //   constraints: const BoxConstraints(maxHeight: 180),
                //   child: CarouselView(
                //     controller: carouselController,
                //     itemExtent: 330,
                //     shrinkExtent: 100,
                //     padding: const EdgeInsets.all(10.0),
                //     children: List.generate(
                //       images.length,
                //       (index) => remoteImageWidget(
                //         images[index],
                //         180,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                // ),
                // const TopDoctorNearByScreen(),
                // const MyAppoitmentScreen(),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Text(
                //           'Special Package & Offers',
                //           style: boldTextStyle(size: 18),
                //         ),
                //       ),
                //       TextButton(
                //           onPressed: () {
                //             // LSOfferAllScreen().launch(context);
                //           },
                //           child: Text('View All', style: secondaryTextStyle()))
                //     ],
                //   ),
                // ),
                // LSSOfferPackageComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List<String> images = [
    "https://www.shutterstock.com/image-vector/male-doctor-smiling-happy-face-600nw-2481032615.jpg",
    "https://www.shutterstock.com/image-vector/male-doctor-smiling-happy-face-600nw-2481032615.jpg",
    "https://www.shutterstock.com/image-vector/male-doctor-smiling-happy-face-600nw-2481032615.jpg",
    "https://www.shutterstock.com/image-vector/male-doctor-smiling-happy-face-600nw-2481032615.jpg",
    "https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg"
  ];

  List<Service> services = [
    Service(
      title: "Doctor",
      imageUrl:
          "https://img.freepik.com/premium-vector/smiling-doctor-person-concept-woman-medical-uniform-with-patients-card-health-care-medicine_1002658-3473.jpg",
    ),
    Service(
      title: "Hospital",
      imageUrl:
          "https://img.freepik.com/premium-vector/hospital-building-healthcare-cartoon-background-vector-illustration-with-ambulance-car-doctor-patient-nurses-medical-clinic-exterior_2175-1510.jpg",
    ),
    Service(
      title: "Laboratory",
      imageUrl:
          "https://img.freepik.com/premium-vector/white-gloss-realistic-microscope-composition-with-some-iron-shining-parts-white-background-vector-illustration_98292-277.jpg",
    ),
    Service(
      title: "Radiology",
      imageUrl:
          "https://img.freepik.com/premium-vector/radiologist-illustration-design-concept_108061-1005.jpg",
    ),
    Service(
      title: "Specialist",
      imageUrl:
          "https://img.freepik.com/premium-vector/doctor-with-stethoscope-neck-portrait-medical-worker-vector-illustration_811748-24.jpg",
    ),
    Service(
      title: "Symptoms",
      imageUrl:
          "https://img.freepik.com/free-vector/coughing-person-with-coronavirus_23-2148485525.jpg",
    ),
  ];

  final List<ImageModel> imageModels = [
    ImageModel(title: "Tooth Care", image: "assets/images/tooth.png"),
    ImageModel(title: "Doctor", image: "assets/images/doctor.png"),
    ImageModel(title: "Healthcare", image: "assets/images/healthcare.png"),
    ImageModel(
        title: "Medical Checkup", image: "assets/images/medical-checkup.png"),
    ImageModel(title: "Doctor", image: "assets/images/doctor.png"),
    ImageModel(title: "Healthcare", image: "assets/images/healthcare.png"),
  ];
}

class Service {
  final String title;
  final String imageUrl;

  Service({required this.title, required this.imageUrl});
}

class ImageModel {
  final String title;
  final String image;

  ImageModel({required this.title, required this.image});

  // Factory method to create an ImageModel from JSON
  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      title: json['title'] as String,
      image: json['image'] as String,
    );
  }

  // Method to convert an ImageModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
    };
  }
}
