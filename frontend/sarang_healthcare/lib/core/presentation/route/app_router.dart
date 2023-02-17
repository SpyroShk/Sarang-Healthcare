import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarang_healthcare/features/doc_appointment/presentation/doc_appointment.dart';
import 'package:sarang_healthcare/features/login/application/cubit/login_cubit.dart';
import 'package:sarang_healthcare/features/preferred_doctor/domain/preferred_doctor_model.dart';
import 'package:sarang_healthcare/features/preferred_doctor/presentation/preferred_doctor.dart';

import '../../../features/home/presentation/home_screen.dart';
import '../../../features/login/presentation/login_screen.dart';
import '../../../features/profile/presentation/profile_screen.dart';
import '../../../features/signup/presentation/signup_screen.dart';
import '../../../features/splash/presentation/splash_screen.dart';
import '../widgets/scaffold_with_bottom_nav_bar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

const _unProtectedRoutes = [AppRoutes.signup];

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String docappointment = '/docappointment';
  static const String preferreddoc = '/preferreddoc';
  static const String appointment = '/appointment';
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
          // return const Text('AAAA');
        },
        routes: [
          GoRoute(
            path: AppRoutes.home,
            builder: (_, state) => const HomeScreen(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.profile,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.docappointment,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, state) => DocAppointment(preferredDoctor: state.extra as PreferredDoctorModel),
      ),
      GoRoute(
        path: AppRoutes.preferreddoc,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, state) => const PreferredDoctor(),
      ),
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

      if (!isAuthenticated) {
        if (_unProtectedRoutes.contains(location)) {
          return null;
        }
        return AppRoutes.login;
      }

      if (location == AppRoutes.login && isAuthenticated ||
          location == AppRoutes.splash && isAuthenticated) {
        return AppRoutes.home;
      }
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
