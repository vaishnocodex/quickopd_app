import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/feature/appointment/presentation/widgets/appointment_card_widget.dart';
import 'package:quick_opd/routes/app_route_path.dart';

class MyAppointmentScreen extends StatefulWidget {
  const MyAppointmentScreen({super.key});

  @override
  AppointmentsScreenState createState() => AppointmentsScreenState();
}

class AppointmentsScreenState extends State<MyAppointmentScreen> {
  List<Appointment> allAppointments = [
    Appointment(
      doctorName: "Dr. Ronald Richards",
      specialty: "Orthopedic",
      date: "2025-02-12T10:30:00",
      price: 90.00,
      status: "Cancelled",
      imageUrl: "https://randomuser.me/api/portraits/men/1.jpg",
    ),
    Appointment(
      doctorName: "Dr. Jenny Wilson",
      specialty: "Cardiology",
      date: "2025-02-13T18:15:00",
      price: 90.00,
      status: "Reschedule",
      imageUrl: "https://randomuser.me/api/portraits/women/2.jpg",
    ),
    Appointment(
      doctorName: "Dr. Esther Howard",
      specialty: "Neurologist",
      date: "2025-02-14T08:45:00",
      price: 90.00,
      status: "Cancelled",
      imageUrl: "https://randomuser.me/api/portraits/men/3.jpg",
    ),
    Appointment(
      doctorName: "Dr. Augustina Midgett",
      specialty: "Pulmonology",
      date: "2025-02-18T08:35:00",
      price: 90.00,
      status: "Upcoming",
      imageUrl: "https://randomuser.me/api/portraits/women/4.jpg",
    ),
  ];

  List<Appointment> filteredAppointments = [];
  String selectedFilter = "All";

  @override
  void initState() {
    super.initState();
    filteredAppointments = allAppointments;
  }

  void filterAppointments(String filter) {
    setState(() {
      selectedFilter = filter;
      if (filter == "All") {
        filteredAppointments = allAppointments;
      } else {
        filteredAppointments = allAppointments
            .where((appointment) => appointment.status == filter)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "My Appointments",
          style: boldTextStyle(size: 18),
        ),
      ),
      body: buildAppointmentList(),

      // Column(
      //   children: [
      //     // _buildFilterDropdown(),
      //     _buildAppointmentList(),
      //   ],
      // ),
    );
  }

  Widget _buildFilterDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButton<String>(
        isExpanded: true,
        value: selectedFilter,
        items: ["All", "Upcoming", "Cancelled", "Reschedule"]
            .map((filter) => DropdownMenuItem(
                  value: filter,
                  child: Text(filter),
                ))
            .toList(),
        onChanged: (filter) {
          if (filter != null) {
            filterAppointments(filter);
          }
        },
      ),
    );
  }

  Widget buildAppointmentList() {
    return ListView.builder(
      itemCount: filteredAppointments.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () =>
                context.pushNamed(AppRoute.bookedAppointmentDetails.name),
            child: AppointmentCardWidget(
                appointment: filteredAppointments[index]));
      },
    );
  }
}

class Appointment {
  final String doctorName;
  final String specialty;
  final String date;
  final double price;
  final String status;
  final String imageUrl;

  Appointment({
    required this.doctorName,
    required this.specialty,
    required this.date,
    required this.price,
    required this.status,
    required this.imageUrl,
  });
}
