import 'package:flutter/material.dart';
import 'package:sarang_healthcare/features/splash/presentation/splash_screen.dart';

import 'core/presentation/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sarang Healthcare',
      theme: AppTheme.theme(context),
      home: const SplashScreen(),
    );
  }
}
