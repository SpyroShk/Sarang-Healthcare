import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
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
      child: KhaltiScope(
        publicKey: "test_public_key_03f493ab98cb457cb942913c54b83d70",
        navigatorKey: getIt.get<AppRouter>().router.routerDelegate.navigatorKey,
        builder: (context, _) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: "Sarang Healthcare",
            theme: AppTheme.theme(context),
            routerConfig: getIt.get<AppRouter>().router,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
