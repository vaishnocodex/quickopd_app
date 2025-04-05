import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/app_theme_extension.dart';
import 'package:quick_opd/routes/app_route_path.dart';
import 'package:quick_opd/widgets/button_widget.dart';

class BookAnAppointmentScreen extends StatefulWidget {
  const BookAnAppointmentScreen({super.key});

  @override
  BookAnAppointmentScreenState createState() => BookAnAppointmentScreenState();
}

class BookAnAppointmentScreenState extends State<BookAnAppointmentScreen> {
  int selectedScheduleIndex = 0;
  int selectedTimeSlotIndex = -1;

  final List<Map<String, String>> schedules = [
    {"date": "23 Jan to 26 Jan", "slots": "6 Slot available"},
    {"date": "28 Jan to 30 Jan", "slots": "2 Slot available"},
    {"date": "28 Jan to 30 Jan", "slots": "2 Slot available"},
    {"date": "26 Jan to 31 Jan", "slots": "3 Slot available"},
    {"date": "01 Feb to 06 Feb", "slots": "4 Slot available"},
  ];

  final List<String> morningSlots = [
    "08:00 AM",
    "10:00 AM",
    "12:00 AM",
    "10:00 AM",
    "12:00 AM"
  ];
  final List<String> afternoonSlots = [
    "04:00 PM",
    "06:00 PM",
    "08:00 PM",
    "04:00 PM",
    "06:00 PM",
    "08:00 PM"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Appointment", style: boldTextStyle(size: 20)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: context.scaffoldBackgroundColor,
        child: Column(
          children: [
            AppButtonWidget(
              label: "Continue",
              callback: () {
                context.pushNamed(
                  AppRoute.appointmentedPatientDetails.name,
                );
              },
              btnWidth: context.screenHeight * 0.9,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.sHeight,
              Text("Select schedule", style: boldTextStyle(size: 18)),
              10.sHeight,
              Wrap(
                spacing: 10,
                runSpacing: 16,
                children: List.generate(schedules.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedScheduleIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: selectedScheduleIndex == index
                            ? const Color(0xFFDFF3F9)
                            : AppColor.lightGreyColor,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: selectedScheduleIndex == index
                              ? AppColor.primaryColor
                              : Colors.transparent,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: Column(
                        children: [
                          Text(
                            schedules[index]["date"]!,
                            textAlign: TextAlign.center,
                            style: boldTextStyle(size: 14),
                          ),
                          4.sHeight,
                          Text(
                            schedules[index]["slots"]!,
                            textAlign: TextAlign.center,
                            style: secondaryTextStyle(size: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              30.sHeight,
              Center(
                child: Text(
                  "Today, 23 Jan",
                  style: boldTextStyle(
                    size: 14,
                  ),
                ),
              ),
              30.sHeight,
              Text("Available time slot", style: boldTextStyle(size: 18)),
              16.sHeight,
              Text("Morning slot", style: boldTextStyle(size: 14)),
              10.sHeight,
              Wrap(
                spacing: 24,
                runSpacing: 16,
                children:
                    morningSlots.map((slot) => _buildTimeSlot(slot)).toList(),
              ),
              20.sHeight,
              const Text("Afternoon slot",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children:
                    afternoonSlots.map((slot) => _buildTimeSlot(slot)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSlot(String time) {
    bool isSelected = selectedTimeSlotIndex == morningSlots.indexOf(time) ||
        selectedTimeSlotIndex == afternoonSlots.indexOf(time) + 3;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTimeSlotIndex = morningSlots.contains(time)
              ? morningSlots.indexOf(time)
              : afternoonSlots.indexOf(time) + 3;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryColor : AppColor.lightGreyColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          time,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
