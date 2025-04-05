import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/app_theme_extension.dart';
import 'package:quick_opd/routes/app_route_path.dart';
import 'package:quick_opd/widgets/button_widget.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  LandingScreenState createState() => LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> {
  late final PageController? pageController;
  int currentIndex = 0;
  bool isLastPage = false;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              itemCount: items.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    Container(
                      height: context.screenHeight * 0.68,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: NetworkImage(items[index].image),
                        ),
                      ),
                    ),
                    20.sHeight,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Text(
                            items[index].title,
                            textAlign: TextAlign.center,
                            style: boldTextStyle(size: 24),
                          ),
                          8.sHeight,
                          Text(
                            items[index].descriptions,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.center,
                            style: secondaryTextStyle(size: 16),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              bottom: 90,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: DotsIndicator(
                  dotsCount: items.length,
                  position: currentIndex,
                  decorator: DotsDecorator(
                    color: AppColor.primaryColor.withOpacity(0.5),
                    activeColor: AppColor.primaryColor,
                    size: const Size.square(9.0),
                    activeSize: const Size(24.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 12,
              right: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButtonWidget(
                    btnColor: AppColor.cardLightColor,
                    btnTextColor: AppColor.primaryColor,
                    callback: () {
                      context.pushNamed(AppRoute.mainScreen.name);
                    },
                    label: "Skip",
                  ),
                  AppButtonWidget(
                    callback: () {
                      if (currentIndex == items.length - 1) {
                        context.pushNamed(AppRoute.loginPage.name);
                      }
                      pageController?.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    },
                    label: currentIndex == items.length - 1
                        ? "Get Started"
                        : "Continue",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OnboardingInfo {
  final String title;
  final String descriptions;
  final String image;

  OnboardingInfo(
      {required this.title, required this.descriptions, required this.image});
}

final List<OnboardingInfo> items = [
  OnboardingInfo(
      title: "Connect with Expert Doctors",
      descriptions:
          "Book online consultations with qualified doctors anytime, anywhere.",
      image:
          "https://drmanemultispecilitysaswad.in/wp-content/uploads/2023/12/cta_1.png"),
  OnboardingInfo(
      title: "Appointment Booking",
      descriptions:
          "Easily schedule your doctor appointments with just a few taps.",
      image:
          "https://drmanemultispecilitysaswad.in/wp-content/uploads/2023/12/cta_1.png"),
  OnboardingInfo(
      title: "Track Your Health Journey",
      descriptions:
          "Monitor your health and follow up with your doctor as needed.",
      image:
          "https://drmanemultispecilitysaswad.in/wp-content/uploads/2023/12/cta_1.png"),
];
