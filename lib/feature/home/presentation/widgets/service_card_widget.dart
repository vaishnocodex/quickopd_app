import 'package:flutter/material.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/decoration_widget.dart';
import 'package:quick_opd/core/utils/remote_image.dart';

class ServiceCardWidget extends StatelessWidget {
  final String imageURl;
  final String title;
  const ServiceCardWidget(
      {super.key, required this.imageURl, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 76,
            width: 80,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(8),
            decoration: DecorationWidget.boxDecorationRoundedWithShadow(10),
            // child: Image.asset(imageURl,
            //     // imageModels[index].image,
            //     height: 50,
            //     width: 50,
            //     fit: BoxFit.cover),
            child:
                remoteImageWidget(imageURl, 74, width: 70, fit: BoxFit.cover),
          ),
          5.sHeight,
          Text(
            // imageModels[index].title,
            title,
            style: primaryTextStyle(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
