import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarang_healthcare/features/appointment_list/presentation/appointment_list.dart';
import 'package:sarang_healthcare/features/appointments/presentation/appointments.dart';
import 'package:sarang_healthcare/features/change_pass/presentation/change_password.dart';
import 'package:sarang_healthcare/features/contact/presentation/contact.dart';
import 'package:sarang_healthcare/features/appointment_list/presentation/doc_appointment_list.dart';
import 'package:sarang_healthcare/features/doc_appointment/presentation/doc_appointment.dart';
import 'package:sarang_healthcare/features/lab_testing/presentation/lab_testing.dart';
import 'package:sarang_healthcare/features/lab_tests/presentation/lab_tests.dart';
import 'package:sarang_healthcare/features/login/application/cubit/login_cubit.dart';
import 'package:sarang_healthcare/features/payment/presentation/payment.dart';
import 'package:sarang_healthcare/features/preferred_doctor/domain/preferred_doctor_model.dart';
import 'package:sarang_healthcare/features/preferred_doctor/presentation/preferred_doctor.dart';
import 'package:sarang_healthcare/features/report/presentation/report.dart';

import '../../../features/doc_home/presentation/doc_home.dart';
import '../../../features/home/presentation/home_screen.dart';
import '../../../features/lab_testing_list/presentation/lab_testing_list.dart';
import '../../../features/lab_tests/domain/lab_tests_model.dart';
import '../../../features/login/presentation/login_screen.dart';
import '../../../features/profile/presentation/profile_screen.dart';
import '../../../features/signup/presentation/signup_screen.dart';
import '../../../features/splash/presentation/splash_screen.dart';
import '../widgets/doc_scaffold_with_bottom_nav_bar.dart';
import '../widgets/scaffold_with_bottom_nav_bar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _docShellNavigatorKey =
    GlobalKey<NavigatorState>();

const _unProtectedRoutes = [AppRoutes.signup];

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String contact = '/contact';
  static const String docappointment = '/docappointment';
  static const String labtesting = '/labtesting';
  static const String preferreddoc = '/preferreddoc';
  static const String labtests = '/labtests';
  static const String appointments = '/appointments';
  static const String appointmentlist = '/appointmentlist';
  static const String labtestinglist = '/labtestinglist';
  static const String payment = '/payment';
  static const String report = '/report';
  static const String dochome = '/dochome';
  static const String docappolist = '/docappolist';
  static const String changepass = '/changepass';
}

class AppRouter {
  late final LoginCubit loginCubit;

  AppRouter({required this.loginCubit});

  GoRouter get router => _router;

  late final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    refreshListenable: GoRouterRefreshStream(loginCubit.stream),
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => const SignUpScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (_, state, child) {
          return ScaffoldWithButtomNavbar(body: child);
        },
        routes: [
          GoRoute(
            path: AppRoutes.report,
            builder: (_, state) => const Report(),
          ),
          GoRoute(
            path: AppRoutes.home,
            builder: (_, state) => const HomeScreen(),
          ),
          GoRoute(
            path: AppRoutes.appointments,
            builder: (_, state) => const Appointments(),
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: _docShellNavigatorKey,
        builder: (_, state, child) {
          return DocScaffoldWithButtomNavbar(body: child);
        },
        routes: [
          // GoRoute(
          //   path: AppRoutes.report,
          //   builder: (_, state) => const Report(),
          // ),
          GoRoute(
            path: AppRoutes.dochome,
            builder: (_, state) => const DocHomeScreen(),
          ),
          GoRoute(
            path: AppRoutes.docappolist,
            builder: (_, state) => const DocAppointmentList(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.changepass,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, state) => const ChangePassword(),
      ),
      GoRoute(
        path: AppRoutes.appointmentlist,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, state) => const AppointmentList(),
      ),
      GoRoute(
        path: AppRoutes.labtestinglist,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, state) => const LabTestingList(),
      ),
      GoRoute(
        path: AppRoutes.profile,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.contact,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, state) => const Contact(),
      ),
      GoRoute(
        path: AppRoutes.docappointment,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, state) => DocAppointment(
            preferredDoctor: state.extra as PreferredDoctorModel),
      ),
      GoRoute(
        path: AppRoutes.preferreddoc,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, state) => const PreferredDoctor(),
      ),
      GoRoute(
        path: AppRoutes.labtests,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, state) => const LabTests(),
      ),
      GoRoute(
        path: AppRoutes.labtesting,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, state) =>
            LabTesting(selectedLabTests: state.extra as List<LabTestsModel>),
      ),
      GoRoute(
          path: AppRoutes.payment,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (_, state) {
            final a = state.extra as Map;

            final doctorId = a['doctorId'];
            final appointmentDate = a['appointmentDate'];
            final appointmentTime = a['appointmentTime'];
            final contact = a['contact'];
            final patientName = a['patientName'];
            final age = a['age'];
            final doctorName = a['doctorName'];
            final gender = a['gender'];
            final userPatientRelation = a['userPatientRelation'];
            final doctorImage = a['doctorImage'];
            final doctorCategory = a['doctorCategory'];
            final patientDescription = a['patientDescription'];
            final testName = a['testName'];
            final city = a['city'];
            final address = a['address'];
            final landmark = a['landmark'];
            final service = a['service'];
            final boolValue = a['boolValue'] as bool;
            final total = a['total'];
            return Payment(
              doctorId: doctorId,
              doctorName: doctorName,
              appointmentDate: appointmentDate,
              appointmentTime: appointmentTime,
              contact: contact,
              age: age,
              gender: gender,
              patientName: patientName,
              userPatientRelation: userPatientRelation,
              doctorCategory: doctorCategory,
              doctorImage: doctorImage,
              patientDescription: patientDescription,
              testName: testName,
              city: city,
              address: address,
              landmark: landmark,
              service: service,
              boolValue: boolValue,
              total: total,
            );
          }),
    ],
    redirect: (context, state) {
      LoginState authState = loginCubit.state;
      String location = state.location;

      log('location: $location');
      log(authState.toString());
      if (authState == const LoginState.initial()) {
        return AppRoutes.splash;
      }
      if (authState == const LoginState.loading()) {
        return null;
      }
      final bool isAuthenticated =
          authState == const LoginState.authenticated();

      final bool isDocAuthenticated =
          authState == const LoginState.docAuthenticated();

      if (isDocAuthenticated) {
        if (location == AppRoutes.login && isDocAuthenticated ||
            location == AppRoutes.splash && isDocAuthenticated) {
          return AppRoutes.dochome;
        }
      } else if (isAuthenticated) {
        if (location == AppRoutes.login && isAuthenticated ||
            location == AppRoutes.splash && isAuthenticated) {
          return AppRoutes.home;
        }
      } else if (!isAuthenticated && !isDocAuthenticated) {
        if (_unProtectedRoutes.contains(location)) {
          return null;
        }
        return AppRoutes.login;
      }

      // if (!isAuthenticated) {

      //   if (!isDocAuthenticated) {
      //     if (_unProtectedRoutes.contains(location)) {
      //       return null;
      //     }
      //   } else
      //   // return AppRoutes.login;
      // }

      return null;
    },
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

// {
//             final a = state.extra as Map;
//             final List<LabTestsModel>? selectedLabTests = a['selectedLabTests'];
//             final List<LabTestsModel>? newTestsList = a['newTestsList'];
//             return LabTesting(
//               selectedLabTests: selectedLabTests,
//               newTestsList: newTestsList,
//             );
//           }
