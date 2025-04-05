import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_opd/core/common/common_list_wrapper.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/feature/home/presentation/screens/home_screen/home_screen.dart';
import 'package:quick_opd/feature/home/presentation/widgets/category_item_widget.dart';
import 'package:quick_opd/routes/app_route_path.dart';

class AllServicesList extends StatelessWidget {
  AllServicesList({super.key});
  final List<ImageModel> imageModels = [
    ImageModel(title: "Tooth Care", image: "assets/images/tooth.png"),
    ImageModel(title: "Doctor", image: "assets/images/doctor.png"),
    ImageModel(title: "Healthcare", image: "assets/images/healthcare.png"),
    ImageModel(
        title: "Medical Checkup", image: "assets/images/medical-checkup.png"),
    ImageModel(title: "Tooth Care", image: "assets/images/tooth.png"),
    ImageModel(title: "Doctor", image: "assets/images/doctor.png"),
    ImageModel(title: "Healthcare", image: "assets/images/healthcare.png"),
    ImageModel(
        title: "Medical Checkup", image: "assets/images/medical-checkup.png"),
    ImageModel(title: "Tooth Care", image: "assets/images/tooth.png"),
    ImageModel(title: "Doctor", image: "assets/images/doctor.png"),
    ImageModel(title: "Healthcare", image: "assets/images/healthcare.png"),
    ImageModel(
        title: "Medical Checkup", image: "assets/images/medical-checkup.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "All Services",
          style: boldTextStyle(size: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: CommonListWrapper<ImageModel>(
          padding: EdgeInsets.all(8),
          gridSpacing: 16,
          gridCrossAxisCount: 3,
          items: imageModels,
          listType: ListType.gridView,
          itemBuilder: (context, item) => CategoryItemWidget(
            item: item,
            titleExtractor: (data) => data.title,
            imageExtractor: (data) => data.image,
            onTap: () => context.pushNamed(AppRoute.doctorsListScreen.name),
          ),
        ),
      ),
    );
  }
}
