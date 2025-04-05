import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';

class AppTheme {
  AppTheme._();

  static ThemeData data(BuildContext context, bool isDark) {
    // bool isLandscape = context.isLandscape;
    // double screenWidth = MediaQuery.of(context).size.width;

    return ThemeData(
      scaffoldBackgroundColor:
          isDark ? AppColor.appBackgroundColorDark : AppColor.whiteColor,
      highlightColor:
          isDark ? AppColor.appBackgroundColorDark : AppColor.whiteColor,
      cardColor:
          isDark ? AppColor.appBackgroundColorDark : AppColor.primaryColor,
      appBarTheme: AppBarTheme(
        color: isDark ? AppColor.appBackgroundColorDark : AppColor.whiteColor,
        iconTheme: IconThemeData(
            color: isDark ? AppColor.whiteColor : AppColor.blackColor),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light),
      ),
      primaryColor: isDark ? AppColor.colorPrimaryBlack : AppColor.whiteColor,
      dividerColor: const Color(0xFFDADADA).withOpacity(0.3),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isDark ? AppColor.cardDarkColor : AppColor.primaryColor,
          elevation: 2,
          disabledBackgroundColor: isDark
              ? Colors.grey[800]
              : Colors.grey[300], // Disabled color for dark/light mode

          overlayColor: AppColor.transparent,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(kToolbarHeight),
          // ),
        ),
      ),
      primaryColorDark:
          isDark ? AppColor.colorPrimaryBlack : AppColor.cardLightColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: isDark ? Colors.white : AppColor.colorPrimaryBlack,
      ),
      hoverColor: Colors.black12,
      fontFamily: GoogleFonts.openSans().fontFamily,
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColor.appBackgroundColorDark),
      primaryTextTheme: TextTheme(
          titleLarge: primaryTextStyle(color: Colors.white),
          labelSmall: primaryTextStyle(color: Colors.white)),
      cardTheme: CardTheme(
          color: isDark
              ? AppColor.cardBackgroundBlackDark
              : AppColor.cardLightColor),
      iconTheme: IconThemeData(
          color:
              isDark ? AppColor.whiteColor : AppColor.appBackgroundColorDark),
      textTheme: const TextTheme(
        labelLarge: TextStyle(color: AppColor.colorPrimaryBlack),
        titleLarge: TextStyle(color: AppColor.whiteColor),
        titleSmall: TextStyle(color: Colors.white54),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: const ColorScheme.light(
              primary: AppColor.whiteColor, onPrimary: AppColor.cardLightColor)
          .copyWith(secondary: AppColor.cardBackgroundBlackDark),
    )
        .copyWith(
          pageTransitionsTheme: const PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              }),
          colorScheme: const ColorScheme.dark(
                  primary: AppColor.appBackgroundColorDark,
                  onPrimary: AppColor.cardBackgroundBlackDark)
              .copyWith(secondary: AppColor.whiteColor),
        )
        .copyWith(
          pageTransitionsTheme: const PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              }),
        );

//     return ThemeData(
//       brightness: isDark ? Brightness.dark : Brightness.light,
//       splashColor: Colors.transparent,
//       highlightColor: Colors.transparent,
//       appBarTheme: AppBarTheme(
//         scrolledUnderElevation: 0,
//         titleSpacing: 8,
//         backgroundColor: isDark ? AppColor.primaryColor : AppColor.eLGreyColor,
//         iconTheme: IconThemeData(
//           color: isDark ? AppColor.whiteColor : Colors.black87,
//         ),
//         elevation: isDark ? 2.h : 0,
//       ),
//       scaffoldBackgroundColor: isDark ? AppColor.navy : AppColor.eLGreyColor,
//       floatingActionButtonTheme: FloatingActionButtonThemeData(
//         backgroundColor: isDark ? AppColor.blue : AppColor.primaryColor,
//         foregroundColor: isDark ? Colors.white : Colors.black,
//         elevation: 2.h,
//         extendedTextStyle: isLandscape ? AppFont.normal.s8 : AppFont.normal.s14,
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor:
//               isDark ? Colors.amber.shade700 : AppColor.primaryColor,
//           elevation: 2.h,
//           textStyle: isLandscape ? AppFont.medium.s8 : AppFont.medium.s16,
//           overlayColor: AppColor.transparent,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.r),
//           ),
//         ),
//       ),
//       bottomSheetTheme: const BottomSheetThemeData(
//         dragHandleColor: AppColor.whiteColor,
//       ),
//       cardTheme: CardTheme(
//         color: isDark ? AppColor.primaryColor : AppColor.whiteColor,
//         elevation: isDark ? 3.h : 2.h,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(14.r),
//         ),
//         surfaceTintColor: isDark ? AppColor.primaryColor : Colors.grey.shade300,
//       ),
//       visualDensity: VisualDensity.adaptivePlatformDensity,
//       fontFamily: GoogleFonts.poppins().fontFamily,

//       // App Text Theme
//       textTheme: AdaptiveTypography.getAdaptiveTextTheme(),

// //       Text(
// //   'Custom Text with Orientation',
// //   style: TextStyle(
// //     fontSize: AdaptiveTypography.getCustomFontSize(
// //       mobileSize: 13,
// //       tabletSize: 15,
// //       webSize: 17,
// //     ),
// //     fontWeight: FontWeight.w500,
// //   ),
// // );
// // CheckBox Theme
//       checkboxTheme: CheckboxThemeData(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(4.r),
//         ),
//         side: WidgetStateBorderSide.resolveWith(
//           (states) => BorderSide(
//             width: 2.0,
//             color: states.contains(WidgetState.selected)
//                 ? AppColor.primaryColor
//                 : AppColor.primaryColor,
//           ),
//         ),
//         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//         splashRadius: isLandscape ? 15.0 : 20.0,
//       ),

// // OutLine Button Theme
//       outlinedButtonTheme: OutlinedButtonThemeData(
//         style: ButtonStyle(
//           overlayColor: const WidgetStatePropertyAll(
//             Colors.transparent,
//           ),
//           padding: WidgetStatePropertyAll(
//             EdgeInsets.symmetric(
//               horizontal: 14.w,
//               vertical: isLandscape ? 5.h : 7.h,
//             ),
//           ),
//           side: WidgetStatePropertyAll(
//             BorderSide(
//               color: isDark ? AppColor.whiteColor : AppColor.primaryColor,
//             ),
//           ),
//           shape: const WidgetStatePropertyAll(
//             StadiumBorder(
//               side: BorderSide(),
//             ),
//           ),
//         ),
//       ),

// // Input Decoration Theme
//       inputDecorationTheme: InputDecorationTheme(
//         prefixIconColor: isDark ? AppColor.whiteColor : AppColor.textSecondaryColor,
//         labelStyle: AppFont.normal.s14.copyWith(
//           fontSize: isLandscape ? 7.sp : 15.sp,
//           color: isDark ? AppColor.whiteColor : AppColor.textSecondaryColor,
//         ),
//         contentPadding: EdgeInsets.all(14.r),
//         border: custInputBorder(isDark: isDark),
//         focusedBorder: custInputBorder(isDark: isDark),
//         enabledBorder: custInputBorder(isDark: isDark),
//         focusedErrorBorder: custInputBorder(isDark: isDark),
//         errorBorder: custInputBorder(
//           color: Colors.red.shade700,
//           isDark: isDark,
//         ),
//       ),
//     );
  }
}

OutlineInputBorder custInputBorder({Color? color, bool isDark = false}) {
  return OutlineInputBorder(
    gapPadding: 0,
    borderRadius: BorderRadius.circular(12.r),
    borderSide: BorderSide(
      color:
          color ?? (isDark ? AppColor.whiteColor : AppColor.textSecondaryColor),
    ),
  );
}



//============ SLICE ==========

// static final ThemeData darkTheme = ThemeData(
//     scaffoldBackgroundColor: appBackgroundColorDark,
//     highlightColor: appBackgroundColorDark,
//     cardColor: Color(0xFFCF6676),
//     appBarTheme: AppBarTheme(
//       color: appBackgroundColorDark,
//       iconTheme: IconThemeData(color: blackColor),
//       systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
//     ),
//     primaryColor: color_primary_black,
//     dividerColor: Color(0xFFDADADA).withOpacity(0.3),
//     primaryColorDark: color_primary_black,
//     textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
//     hoverColor: Colors.black12,
//     fontFamily: GoogleFonts.openSans().fontFamily,
//     bottomSheetTheme: BottomSheetThemeData(backgroundColor: appBackgroundColorDark),
//     primaryTextTheme: TextTheme(titleLarge: primaryTextStyle(color: Colors.white), labelSmall: primaryTextStyle(color: Colors.white)),
//     cardTheme: CardTheme(color: cardBackgroundBlackDark),
//     cardColor: appSecondaryBackgroundColor,
//     iconTheme: IconThemeData(color: whiteColor),
//     textTheme: TextTheme(
//       labelLarge: TextStyle(color: color_primary_black),
//       titleLarge: TextStyle(color: whiteColor),
//       titleSmall: TextStyle(color: Colors.white54),
//     ),
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//     colorScheme: ColorScheme.dark(primary: appBackgroundColorDark, onPrimary: cardBackgroundBlackDark).copyWith(secondary: whiteColor),
//   ).copyWith(
//     pageTransitionsTheme: PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
//       TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
//       TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//       TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
//       TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
//     }),
//   );