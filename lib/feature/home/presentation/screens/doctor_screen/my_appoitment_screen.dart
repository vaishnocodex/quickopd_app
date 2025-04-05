import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_opd/core/themes/horizontal_list.dart';
import 'package:quick_opd/feature/home/presentation/widgets/appoitment_card_widget.dart';
import 'package:quick_opd/feature/home/presentation/widgets/heading_with_btn_widget.dart';
import 'package:quick_opd/routes/app_route_path.dart';

class MyAppoitmentScreen extends StatelessWidget {
  const MyAppoitmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadingWithBtnWidget(
          title: "My Appointment",
          buttonText: "View All",
          onButtonPressed: () => context.pushNamed(
            AppRoute.myAppointmentScreen.name,
          ),
        ),
        HorizontalList(
          itemCount: 8,
          itemBuilder: (context, index) => const AppointmentCardWidget(
            doctorName: "Dr. Bhupender Singh",
            specialty: "Heart",
            appointmentDate: "Today",
            appointmentTime: "11:58 am",
            doctorImage:
                "https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg",
          ),
        )
      ],
    );
  }
}
