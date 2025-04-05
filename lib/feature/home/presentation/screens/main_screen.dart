import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_opd/feature/appointment/presentation/screens/appointment_history_screen.dart';
import 'package:quick_opd/feature/appointment/presentation/screens/my_appointment_screen.dart';
import 'package:quick_opd/feature/home/presentation/bloc_cubit/bottom_nav_cubit.dart';
import 'package:quick_opd/feature/home/presentation/screens/home_screen/home_screen.dart';
import 'package:quick_opd/feature/home/presentation/screens/search_screen.dart';
import 'package:quick_opd/feature/home/presentation/widgets/floating_bottom_navbar.dart';
import 'package:quick_opd/feature/profile/presentation/screens/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: IndexedStack(
            index: currentIndex,
            children: const [
              HomeScreen(),
              SearchScreen(),
              MyAppointmentScreen(),
              AppointmentHistoryScreen(),
              ProfileScreen()
            ],
          ),
          extendBody: true, // Ensures floating effect
          bottomNavigationBar: FloatingBottomNavBar(
            currentIndex: currentIndex,
            onTap: (index) => context.read<BottomNavCubit>().updateIndex(index),
            icons: const [
              CupertinoIcons.house_fill, // Home
              CupertinoIcons.search, // Search
              CupertinoIcons.calendar_today, // My Appointment
              CupertinoIcons.clock, // History
              CupertinoIcons.person_fill, // Profile
            ],
          ),
        );
      },
    );
  }
}
