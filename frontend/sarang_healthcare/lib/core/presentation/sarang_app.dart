import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sarang_healthcare/core/presentation/route/app_router.dart';
import 'package:sarang_healthcare/core/presentation/theme/app_theme.dart';
import 'package:sarang_healthcare/core/presentation/widgets/unfocus.dart';

import '../shared/get_it.dart';

class SarangApp extends StatelessWidget {
  const SarangApp({super.key});

  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return UnFocus(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "Sarang Healthcare",
        theme: AppTheme.theme(context),
        routerConfig: getIt.get<AppRouter>().router,
      ),
    );
  }
}