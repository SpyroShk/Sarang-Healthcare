import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features/profile/application/cubit/profile_cubit.dart';
import '../route/app_router.dart';

class ScaffoldWithButtomNavbar extends StatefulWidget {
  const ScaffoldWithButtomNavbar({super.key, required this.body});

  final Widget body;

  @override
  State<ScaffoldWithButtomNavbar> createState() =>
      _ScaffoldWithButtomNavbarState();
}

class _ScaffoldWithButtomNavbarState extends State<ScaffoldWithButtomNavbar> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getUserDetails();
    // context.read<PushNotificationCubit>().getpushNotification();
  }

  @override
  Widget build(BuildContext context) {
    log('ScaffoldWithButtomNavbar build');

    return Scaffold(
      body: widget.body,
      extendBody: true,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 20.4,
        ),
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              spreadRadius: 4,
              blurRadius: 20,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            iconSize: 30,
            // selectedFontSize: 12,
            enableFeedback: true,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _calculateSelectedIndex(context),
            onTap: (value) => _onItemTapped(context, value),
            items: const [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.medical_information_rounded,
                  size: 40,
                ),
                icon: Icon(Icons.medical_information_outlined),
                label: 'Reports',
                tooltip: 'Reports',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home_rounded,
                  size: 40,
                ),
                icon: Icon(Icons.home_outlined),
                label: 'Home',
                tooltip: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.today_rounded,
                  size: 40,
                ),
                icon: Icon(Icons.today_outlined),
                label: 'Appointments',
                tooltip: 'Appointments',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String getTitle(BuildContext context) {
  final String location = GoRouterState.of(context).location;

  if (location.startsWith(AppRoutes.report)) {
    return 'Report';
  }
  if (location.startsWith(AppRoutes.home)) {
    return 'Home';
  }
  if (location.startsWith(AppRoutes.appointments)) {
    return 'Appointment';
  }

  return 'Sarang';
}

void _onItemTapped(BuildContext context, int index) {
  switch (index) {
    case 0:
      context.go(AppRoutes.report);
      break;
    case 1:
      context.go(AppRoutes.home);
      break;
    case 2:
      context.go(AppRoutes.appointments);
      break;
  }
}

int _calculateSelectedIndex(BuildContext context) {
  final String location = GoRouterState.of(context).location;
  if (location.startsWith(AppRoutes.report)) {
    return 0;
  }
  if (location.startsWith(AppRoutes.home)) {
    return 1;
  }
  if (location.startsWith(AppRoutes.appointments)) {
    return 2;
  }
  return 1;
}
