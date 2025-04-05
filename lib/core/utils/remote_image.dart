import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_opd/core/extensions/string_validator_extension.dart';

Widget remoteImageWidget(String? url, double height,
    {double? width, BoxFit? fit}) {
  if (url!.validateURLs && url.startsWith('http')) {
    return CachedNetworkImage(
      placeholder:
          placeholderWidgetFn() as Widget Function(BuildContext, String)?,
      imageUrl: url,
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      errorWidget: (_, __, ___) {
        return SizedBox(height: height, width: width);
      },
    );
  } else {
    return Image.asset(
      url,
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
    );
  }
}

Widget? Function(BuildContext, String) placeholderWidgetFn() =>
    (_, s) => placeholderWidget();

Widget placeholderWidget() =>
    Image.asset('assets/images/placeholder.jpg', fit: BoxFit.cover);

void changeStatusColor(Color color) async {
  setStatusBarColor(color);
}

Future<void> setStatusBarColor(
  Color statusBarColor, {
  Color? systemNavigationBarColor,
  Brightness? statusBarBrightness,
  Brightness? statusBarIconBrightness,
  int delayInMilliSeconds = 200,
}) async {
  await Future.delayed(Duration(milliseconds: delayInMilliSeconds));

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
      systemNavigationBarColor: systemNavigationBarColor,
      statusBarBrightness: statusBarBrightness,
      // statusBarIconBrightness: statusBarIconBrightness ??
      //     (statusBarColor.isDark() ? Brightness.light : Brightness.dark),
    ),
  );
}
