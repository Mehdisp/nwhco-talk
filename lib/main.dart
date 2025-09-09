import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nwhco_app/core/values/i18n.dart';
import 'package:path_provider/path_provider.dart';

import 'app/application.dart';
import 'core/database/initializer.dart';

void main() async {
  await initHiveDatabase();
  await EasyLocalization.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ],
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.white.withAlpha(0),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(EasyLocalization(
    supportedLocales: allSupportedLanguages.keys.toList(),
    path: 'assets/langs',
    useOnlyLangCode: true,
    useFallbackTranslations: true,
    useFallbackTranslationsForEmptyResources: true,
    fallbackLocale: const Locale('en', 'US'),
    child: const NwhcoApplication(),
  ));
}
