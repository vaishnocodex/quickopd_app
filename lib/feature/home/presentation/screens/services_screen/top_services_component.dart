import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/decoration_widget.dart';
import 'package:quick_opd/core/themes/horizontal_list.dart';
import 'package:quick_opd/routes/app_route_path.dart';

class TopServicesComponent extends StatelessWidget {
  TopServicesComponent({super.key});
  final List<ImageModel> imageModels = [
    ImageModel(title: "Tooth Care", image: "assets/images/tooth.png"),
    ImageModel(title: "Doctor", image: "assets/images/doctor.png"),
    ImageModel(title: "Healthcare", image: "assets/images/healthcare.png"),
    ImageModel(
        title: "Medical Checkup", image: "assets/images/medical-checkup.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        8.sHeight,
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'Top Services',
            style: boldTextStyle(size: 18),
          ),
        ),
        HorizontalList(
          itemCount: imageModels.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              context.pushNamed(AppRoute.doctorsListScreen.name);
            },
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(8),
                  decoration:
                      DecorationWidget.boxDecorationRoundedWithShadow(40),
                  child: Image.asset(imageModels[index].image,
                      height: 50, width: 50, fit: BoxFit.cover),
                  // child: remoteImageWidget(data.img.validate(), 50,
                  //     width: 50, fit: BoxFit.cover),
                ),
                8.sHeight,
                Text(
                  imageModels[index].title,
                  style: primaryTextStyle(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
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
