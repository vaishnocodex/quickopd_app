import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/feature/appointment/presentation/screens/my_appointment_screen.dart';
import 'package:quick_opd/routes/app_route_path.dart';
import 'package:quick_opd/widgets/action_bottom_sheet.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAppBar(),

          // Profile image and user info
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.r),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 55.r,
                  backgroundImage: const NetworkImage(
                      'https://img.freepik.com/premium-vector/cute-baby-boy-profile-picture-kid-avatar_176411-4644.jpg'),
                ),
                Positioned(
                  bottom: 8.h,
                  right: 4.h,
                  child: GestureDetector(
                    onTap: () {
                      // Handle profile image edit action
                    },
                    child: Container(
                      padding: EdgeInsets.all(6.r),
                      decoration: const BoxDecoration(
                        color: AppColor.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.edit,
                        size: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0.r, vertical: 10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Halloween', style: primaryTextStyle()),
                Text('organizer@gmail.com', style: secondaryTextStyle()),
              ],
            ),
          ),
          SizedBox(height: 14.h),

          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.r),
              children: [
                listTileBuild(
                    leadingIcon: Icons.notifications,
                    title: "Notification",
                    onTap: () {}),
                SizedBox(height: 10.h),
                listTileBuild(
                    leadingIcon: Icons.privacy_tip,
                    title: "Privacy Policy",
                    onTap: () {}),
                SizedBox(height: 10.h),
                listTileBuild(
                    leadingIcon: Icons.description,
                    title: "Terms & Conditions",
                    onTap: () {}),
                SizedBox(height: 10.h),
                listTileBuild(
                    leadingIcon: Icons.contact_mail,
                    title: "Contact Us",
                    onTap: () {}),
                SizedBox(height: 10.h),
                listTileBuild(
                    leadingIcon: Icons.delete,
                    title: "Delete Account",
                    onTap: () {}),
                SizedBox(height: 10.h),
                listTileBuild(
                  leadingIcon: Icons.logout,
                  title: "Logout",
                  onTap: () {
                    showActionBottomSheet(context,
                        title: "Logout",
                        submitBtnTitle: "Yes, Logout",
                        eventWidget: Text(
                          "Are you sure you want to Logout?",
                          style: secondaryTextStyle(),
                        ), onPressed: () {
                      context.pushReplacementNamed(AppRoute.landingPage.name);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        "Profile",
        style: boldTextStyle(size: 20),
      ),
    );
  }

  Widget listTileBuild(
      {required IconData leadingIcon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      tileColor: AppColor.scaffoldLightColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 5.r),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      leading: Icon(
        leadingIcon,
        color: AppColor.blackk87,
      ),
      title: Text(
        title,
        style: primaryTextStyle(),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 14.h,
        color: AppColor.blackk87,
      ),
      onTap: onTap,
    );
  }
}
