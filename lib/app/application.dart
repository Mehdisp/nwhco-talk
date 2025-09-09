import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nwhco_app/core/values/colors.dart';
import 'package:nwhco_app/core/values/feature_light_theme.dart';

import 'package:nwhco_app/features/splash/splash_screen.dart';

class NwhcoApplication extends StatelessWidget {
  const NwhcoApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      themeMode: ThemeMode.light,
      builder: (context, child) => FeatureLightTheme(
        primaryColor: AppColors.talkPrimary,
        child: child!,
      ),
      home: const SplashScreen(),
    );
  }
}
